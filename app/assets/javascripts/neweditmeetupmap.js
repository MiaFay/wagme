


// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.


var map
var infoWindow
var geocoder

function newEditMeetupMap() {
  your_location_label = 'Your Location'  // label at your location (not a marker)
  default_center = {lat: 42.360, lng: -71.062} // center on Boston if no GPS
  initial_map_zoom_level = 15 // the higher the number the closer you are
  search_radius = 1800 // in meters, for google places search nearby places
  search_for_type = 'park' // see google places api doc for legal "types"
  search_for_other_type = '' // add another type for 20 more locations

  // drag-able marker to indicate meetup location
  drag_marker_offset = 0.003 // how far in degrees to put the dragable marker from me
  drag_marker_label = "Wags says - Don't see your favorite spot? Drag me to where you want to meet!"


  map = new google.maps.Map(document.getElementById('map'), {
    center: default_center,
    zoom: initial_map_zoom_level
  });
  infoWindow = new google.maps.InfoWindow({map: map});
  geocoder = new google.maps.Geocoder;

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      createDragableMarker({
        lat: pos.lat - drag_marker_offset ,
        lng: pos.lng + drag_marker_offset
      });


      // make a small blue dot at your location.
      infoWindow.setPosition(pos);
      infoWindow.setContent(your_location_label);
      map.setCenter(pos);
      var marker = new google.maps.Marker({
        map: map,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 7,
          strokeColor: 'blue',
          strokeOpacity: 0.8,
          strokeWeight: 6,
          fillColor: '#3D57FF',
          fillOpacity: 1.0
        },
        position: pos,
        title: your_location_label
      });



      var service = new google.maps.places.PlacesService(map);
      // search for places twice
      service.nearbySearch({
        location: pos,
        radius: search_radius,
        type: [search_for_type]
      }, callback);

      // if you want more markers on the map, optionally you can search
      if (search_for_other_type != '' ) { // for a second type
        service.nearbySearch({
          location: pos,
          radius: search_radius,
          type: [search_for_other_type]
        }, callback);
      }

    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation or user unwilling to allow
    handleLocationError(false, infoWindow, map.getCenter());
    createDragableMarker({
      lat: default_center.lat - drag_marker_offset ,
      lng: default_center.lng + drag_marker_offset
    });
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
    'Error: The Geolocation service failed.' :
    'Error: Your browser doesn\'t support geolocation.');
  }
  // this function is called via callback when the nearby locations are found
  function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location,
      title: place.name
    });

    google.maps.event.addListener(marker, 'click', function() {
      //  infoWindow.setContent(place.name);
      // upon a click - the listener will prepopulate the field

      updateForm(place.name,place.geometry.location,place.vicinity)
      var contentString
      if (editable()) {
        contentString = '<div id="content">'+
        '<div id="siteNotice"></div>'+
        '<h4 id="firstHeading" class="firstHeading">' + place.name + '</h4>'+
        '<div id="bodyContent">'+ place.vicinity +
        '</div>' ;
      } else {
        contentString = "Click on 'Edit' or 'Create Meetup' to adjust this location!."
      }


      infoWindow.setContent(contentString)
      infoWindow.open(map, this);
    });


  }

  function createDragableMarker(coordinates) {
    // set a drag marker
    var image = images_url + "roundwags76.png" ;
    var marker = new google.maps.Marker({
      position: coordinates,
      map: map,
      draggable: true,
      title: drag_marker_label,
      icon: image
    });
    google.maps.event.addListener(marker, 'click', function() {

      contentString =
      '<h4 id="firstHeading" class="firstHeading">I\'m Wags, drag me to choose a Meetup location</h4>';

      infoWindow.setContent(contentString)
      infoWindow.open(map, this);
      setTimeout(function () { infoWindow.close(); }, 3000);
    });
    google.maps.event.addListener(marker, 'dragend', function() {
      var contentString = "(Looking up location)"  // default value before callback

      geocoder.geocode({'location': marker.position}, function(results, status) {
        var wags_name
        var wags_description

        if (status === 'OK') {
          if (results[0]) {
            wags_name = username + " Wags Meetup at " +
            results[0].address_components[0].long_name + ' ' +
            results[0].address_components[1].long_name

            wags_description = "Wags Meetup at " + results[0].formatted_address
          } else {
            wags_name = username + " Wags Meetup" ;
            wags_description = ''
          }
        } else {
          window.alert('Geocoder failed due to: ' + status);
          wags_name = username + " Wags Meetup" ;
          wags_description = ''
        }

        updateForm(wags_name,marker.position,wags_description)

        if (editable()) {

          contentString = '<div id="content">'+
          '<h4 id="firstHeading" class="firstHeading">' + wags_name + '</h4>';

        } else {
          contentString = "Click on Edit or Create Meetup to set a new meetup location."
        }


        infoWindow.setContent(contentString)
      });
      infoWindow.setContent(contentString)
      infoWindow.open(map, this);
      setTimeout(function () { infoWindow.close(); }, 3000);
    });


  }

  // update form has to be sensitive to the state of the application
  // this is determined by the class used in the div for the form
  function updateForm(name,location,description) {
    var doc
    if (editable()) {

      if (document.getElementsByClassName('new_meetup').length != 0 ) {
        doc = document.getElementsByClassName("new_meetup")[0]
      } else if (document.getElementsByClassName('edit_meetup').length != 0 ) {
        doc = document.getElementsByClassName("edit_meetup")[0]
      }

      doc.elements["meetup_name"].value = name
      doc.elements["meetup_location"].value = location
      doc.elements["meetup_description"].value = description
    }

  }

  function editable() {
    if (document.getElementsByClassName("form").length == 0) { // not form, cant update
      return false
    } else {
      return true
    }
  }
