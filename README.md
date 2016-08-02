 README
#WagMe
![Build Status](https://codeship.com/projects/4e19db40-2f36-0134-7384-4a25dba64f1f/status?branch=master)
![Code Climate](https://codeclimate.com/github/MiaFay/breakable-toy.png)
[![Coverage Status](https://coveralls.io/repos/github/MiaFay/breakable-toy/badge.svg?branch=master)

I created WagMe, an application for dog owners to find other dog owners.

It uses Rails Active Record, Devise user registration Gem and google Maps Javascript API, Google Places API, and Google Geocoding API as well as Foundation for some of the formatting.

As it is currently implemented you can register, log in, create meetups and see them on the map.  You can also see other meetups for other dog owners.

If you are adding or editing a meetup you can drag “Wags” to a new meetup location and the form is filled in for you including the location.  The location is fetched from Google reverse geocoding (which takes a latitude and longitude from the map and turns it into a street address).

You can also click on a pre-existing “park” location, which were fetched from Google Places API.  So you can click on Danehy dog park like this “click” and you will have your form pre-filled to create a meetup there.

The application is fully functional but there are always ideas for more functionality, and I think I would like owners to be able to add dogs database to the database.  I would like meetups to prompt for time of meetup, which right now has to be entered in description. I also would like to add pictures of the users, or dogs, and change the icon for meetups so they are not confused with google places.  I also would like to allow dog owners to join meetups.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
