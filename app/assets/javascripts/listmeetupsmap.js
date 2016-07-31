// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.

var map
var infoWindow

function listMeetupsMap() {
  your_location_label = 'You Are Here!'  // label at your location (not a marker)
  default_center = {lat: 42.360, lng: -71.062} // center on Boston if no GPS
  initial_map_zoom_level = 14// the higher the number the closer you are

  // drag-able marker to indicate meetup location
  lat_offset = -0.002 // how far in degrees to put the dragable marker from me
  lng_offset = 0.024 // how far in degrees to put the dragable marker from me
  drag_marker_label = "Woof! Lets go for a walk!"

  map = new google.maps.Map(document.getElementById('map'), {
    center: default_center,
    zoom: initial_map_zoom_level
  });
  infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };


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

      // go through the meetups listed in views/index.html.erb
      if (meetup_array.length > 0 ) {
        for (var i = 0; i < meetup_array.length; i++) {
          if (meetup_array[i].location != "illegal") { // never false
            listMarker(getLatLngFromString(meetup_array[i].location),
            meetup_array[i].name,
            meetup_array[i].description,
            meetup_array[i].link);
          }
        }
      }


    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation or user unwilling to allow
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

// recreate the location from the string stored

function getLatLngFromString(location) {
  var latlng = location.replace(/[()]/g,'').split(',');
  locate = new google.maps.LatLng(parseFloat(latlng[0]) , parseFloat(latlng[1]));
  return locate;
}

function listMarker(location,name,description,link) {
  var marker = new google.maps.Marker({
    map: map,
    position: location,
    title: name
  });

  google.maps.event.addListener(marker, 'click', function() {
    var contentString = '<div id="content">'+
    '<div id="siteNotice"></div>'+
    '<h4 id="firstHeading" class="firstHeading">' + name + '</h4>'+
    '<div id="bodyContent">'+ description + "  <b>" + link + "</b>" +
    '</div>' ;


    infoWindow.setContent(contentString)
    infoWindow.open(map, this);
  });
}
