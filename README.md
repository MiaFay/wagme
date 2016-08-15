 README
#WagMe!

![Build Status](https://codeship.com/projects/4e19db40-2f36-0134-7384-4a25dba64f1f/status?branch=master)
![Code Climate](https://codeclimate.com/github/MiaFay/breakable-toy.png)


###### I created WagMe!, an application for dog owners to find other dog owners.
![screen shot 2016-08-14 at 8 40 41 pm](https://cloud.githubusercontent.com/assets/18152057/17653659/dbe126e8-6266-11e6-80c9-a1a5475041dd.png)

It uses Rails Active Record, Devise for user authentication, Google Maps Javascript API, Google Places API, and Google Geocoding API. I also used Foundation for some of the rudimentary site layout.

As it is currently implemented you can register, log in, create meetups and see them on the map.  You can also see other meetups for other dog owners.

![screen shot 2016-08-14 at 8 43 02 pm](https://cloud.githubusercontent.com/assets/18152057/17653631/7e33e8c8-6266-11e6-822c-bbbf01328dbf.png)

If you are adding or editing a meetup you can drag “Wags” to a new meetup location and the form is filled in for you including the location.  The location is fetched from a Google Geocoder API (which takes a latitude and longitude from the map and turns it into a street address).
![screen shot 2016-08-14 at 8 41 22 pm](https://cloud.githubusercontent.com/assets/18152057/17653646/b9419550-6266-11e6-9f33-b33d4043fc9b.png)

You can also click on a pre-existing “park” location, which were fetched from Google Places API to create a meetup.
