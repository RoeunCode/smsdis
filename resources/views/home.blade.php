{{--Googel sigin --}}
{{--@extends('layouts.app')--}}

{{--@section('content')--}}
    {{--<script src="https://apis.google.com/js/platform.js" async defer></script>--}}
    {{--<meta name="google-signin-client_id" content="940837385979-u1074kjg4ar0d4e9sahrqjmhd9v70d02.apps.googleusercontent.com">--}}
{{--<div class="container">--}}
    {{--<div class="row justify-content-center">--}}
        {{--<div class="col-md-8">--}}
            {{--<div class="card">--}}
                {{--<div class="card-header">Dashboard</div>--}}

                {{--<div class="card-body">--}}
                    {{--<div class="g-signin2" data-onsuccess="onSignIn">Sign In</div>--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
    {{--<script>--}}
        {{--function onSignIn(googleUser) {--}}
            {{--var profile = googleUser.getBasicProfile();--}}
            {{--console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.--}}
            {{--console.log('Name: ' + profile.getName());--}}
            {{--console.log('Image URL: ' + profile.getImageUrl());--}}
            {{--console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.--}}
        {{--}--}}
    {{--</script>--}}
{{--@endsection--}}

        {{--Google Map--}}
        <!DOCTYPE html>
<html>
<head>
    <title>Lat/Lng Object Literal</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
         .swal2-popup {
      font-size: 12px !important;

    }

        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
    padding: 0;
    }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDlHkmIBN0M61-rMXrWxpll_zsuFedkBm4"></script>
    <script>
        // In this example, we center the map, and add a marker, using a LatLng object
        // literal instead of a google.maps.LatLng object. LatLng object literals are
        // a convenient way to add a LatLng coordinate and, in most cases, can be used
        // in place of a google.maps.LatLng object.

        var map;
        function initialize() {
            var mapOptions = {
                zoom: 8,
                center: {lat: -34.397, lng: 150.644}
            };
            map = new google.maps.Map(document.getElementById('map'),
                mapOptions);

            var marker = new google.maps.Marker({
                // The below line is equivalent to writing:
            // You can use a LatLng literal in place of a google.maps.LatLng object when
            // creating the Marker object. Once the Marker object is
            // position: new google.maps.LatLng(-34.397, 150.644)
            position: {lat: -34.397, lng: 150.644},
            map: map
        });
        instantiated, its
            // position will be available as a google.maps.LatLn0.g object. In this case,
            // we retrieve the marker's position using the
            // google.maps.LatLng.getPosition() method.
            var infowindow = new google.maps.InfoWindow({
                content: '<p>Marker Location:' + marker.getPosition() + '</p>'
            });

            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map, marker);
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body>
<div id="map">

</div>
</body>
</html>
