
        var geocoder;
        var map;
        var marker;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var watchGeoMarkerProcess;
        var routeStatus = 0;
        var routePointA;
        var routePointB;
       
       
        function start() {
            alert("asd");
                        document.getElementById("getPosition").addEventListener("click", getLocation);
                        document.getElementById("watchPosition").addEventListener("click", watchPosition);
                        document.getElementById("watchPositionStop").addEventListener("click", watchPositionStop);
            showMap();
        }

        function watchPositionStop() {
            if (navigator.geolocation) {
                navigator.geolocation.clearWatch(watchGeoMarkerProcess);
            }
            else { alert("Geolocation is not supported by this browser."); }
        }

        function watchPosition() {
            var myOptions = {
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: false,
                navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
            };
            //to create only once! and not inside the changePostion() function!
            map = new google.maps.Map(document.getElementById("mapholder"), myOptions);

            if (navigator.geolocation) {
                watchGeoMarkerProcess = navigator.geolocation.watchPosition(changePostion, showError);
            }
            else { alert("Geolocation is not supported by this browser."); }
        }

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            }
            else { alert("Geolocation is not supported by this browser."); }
        }

        //use in the ripple. need the var map definition inside the function!
        function showPosition(position) {
            lat = position.coords.latitude;
            lon = position.coords.longitude;
            latlon = new google.maps.LatLng(lat, lon)
            var myOptions = {
                center: latlon,
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: false,
                navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
            };
            var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
            var marker = new google.maps.Marker({ position: latlon, map: map, title: "You are here!" });
        }

        //only to set the center and marker not to create the map obejct again and again!
        function changePostion(position) {
            if (marker != null) {
                marker.setMap(null);
            }
            var pos = new google.maps.LatLng(position.coords.latitude,
                                                position.coords.longitude);
            map.setCenter(pos);
            marker = new google.maps.Marker({ position: pos, map: map, title: "You are here!" });
        }

        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("Location information is unavailable.");
                    break;
                case error.TIMEOUT:
                    alert("The request to get user location timed out.");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.");
                    break;
                default:
                    alert("An unknown error occurred.(default)");
                    break;
            }
        }

        function showLat() {
            var lat = document.getElementById("latRange").value;
            var long = document.getElementById("longRange").value;
            LatValue.innerText = lat;
            ShowPositionLatLong(lat, long);
        }

        function showLong() {
            var lat = document.getElementById("latRange").value;
            var long = document.getElementById("longRange").value;
            LongValue.innerText = long;
            ShowPositionLatLong(lat, long);
        }

        function showMap() {
            directionsDisplay = new google.maps.DirectionsRenderer({
                suppressMarkers: true
            });

            latlon = new google.maps.LatLng(32.10896916880329, 34.784860610961914);
            var myOptions = {
                center: latlon, zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                mapTypeControl: false,
                navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
            };
            map = new google.maps.Map(document.getElementById("mapholder"), myOptions);

            google.maps.event.addListener(map, 'click', function (e) {
                placeMarker(e.latLng, map);
            });

            geocoder = new google.maps.Geocoder();
            directionsDisplay.setMap(map);
        }

        //dont use in the ripple
        function ShowPositionLatLong(lat, lon) {
            latlon = new google.maps.LatLng(lat, lon);
            map.setCenter(latlon);
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }

        function placeMarker(position, map) {
            var iconImage = "Israel.png";
            if (routeStatus == 1) {
                iconImage = "a.png";
                routePointA = position;
                routeStatus++;
            }
            else if (routeStatus == 2) {
                iconImage = "b.png";
                routePointB = position;
                routeStatus = 0;
                var request = {
                    origin: routePointA,
                    destination: routePointB,
                    travelMode: google.maps.DirectionsTravelMode.DRIVING
                };
                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                    }
                });
            }

            var marker = new google.maps.Marker({
                position: position,
                map: map,
                title: "You are here!",
                icon: iconImage
            });
            map.panTo(position);

            var address = "???";
            geocoder.geocode({ 'latLng': position }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        address = results[0].formatted_address;
                    } else {
                        //alert('No results found');
                        address = "No address found";
                    }
                    var contentStr =
                    '<div id="markerDiv" style="color:blue;font-family:Aharoni;font-weight:700">' +
                        'shalom!' +
                        '<div id="latlongMarkerDiv" style="color:red;font-family:david;font-weight:500;width:120px;">' + position + '</div>' +
                        '<div id="addressMarkerDiv" style="color:darkgrey;font-family:david;font-weight:500;width:120px;">' + address + '</div>' +
                    '</div>'
                    var infowindow = new google.maps.InfoWindow({
                        content: contentStr
                    });
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                } else {
                    alert('Geocoder failed due to: ' + status);
                }
            });
        }

        function showTown() {
            var e = document.getElementById("locationTB");
            // var address = e.options[e.selectedIndex].value;
            var address = e.text;
            alert(address);
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

        function startRoute() {
            routeStatus++;
        }
