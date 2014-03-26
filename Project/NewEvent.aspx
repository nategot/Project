﻿<%@ Page Title="New Event" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="NewEvent.aspx.cs" Inherits="NewEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="http://maps.google.com/maps/api/js?sensor=false&language=he"></script>
    <script src="Scripts/MapScriptNewEvent2.js" type="text/javascript"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        Create New Event</h1>
    <br />
    <br />
    <table style="float: left">
        <tr>
            <td>
                Category:
            </td>
            <td>
                <asp:DropDownList ID="categoryDDL" runat="server">
                    <asp:ListItem Value="1">Soccer</asp:ListItem>
                    <asp:ListItem Value="2">Basketball</asp:ListItem>
                    <asp:ListItem Value="3">Tennis</asp:ListItem>
                    <asp:ListItem Value="4">Running</asp:ListItem>
                    <asp:ListItem Value="5">Cycling</asp:ListItem>
                    <asp:ListItem Value="6">Swimming</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Number of Participants:
            </td>
            <td>
                <asp:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="NOP"
                    Minimum="0" Maximum="100" TargetButtonDownID="downArrow" TargetButtonUpID="upArrow">
                </asp:NumericUpDownExtender>
                <asp:TextBox ID="NOP" Text="8" runat="server" Width="40"></asp:TextBox>
                <input type="image" id="downArrow" src="Images/down.gif" style="height: 15px; width: 15px;" />
                <input type="image" id="upArrow" src="Images/up.gif" style="height: 15px; width: 15px;" />
            </td>
        </tr>
        <tr>
            <td>
                Location:
            </td>
            <td>
                <input type="text" value="" id="locationTB" />
                <input type="button" id="getPosition" class="myButton" value="Find" />
            </td>
        </tr>
        <tr>
            <td>
                Date & Time:
            </td>
            <td>
                <asp:TextBox ID="timeTB" runat="server" Width="40" Text="18:00"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dateTB"
                    PopupButtonID="calanderBTN" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                <asp:TextBox ID="dateTB" runat="server"></asp:TextBox>
                <asp:ImageButton ID="calanderBTN" runat="server" ImageUrl="Images/Calendar.png" Width="16px" />
            </td>
        </tr>
        <tr>
            <td>
                Age Range:
            </td>
            <td>
                <asp:TextBox ID="AgeTxt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AgeValidator" runat="server" 
                    ErrorMessage="Age Range is a Required Filed" ControlToValidate="AgeTxt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Event Type:
            </td>
            <td>
                <asp:RadioButtonList ID="EventTypeRBL" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="false" Selected>Public</asp:ListItem>
                    <asp:ListItem Value="true">Private</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Frequency:
            </td>
            <td>
                <asp:RadioButtonList ID="FrequRBL" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected>Once</asp:ListItem>
                    <asp:ListItem Value="2">Every Week</asp:ListItem>
                    <asp:ListItem Value="3">Every Month</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Comment:
            </td>
            <td>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="commentsTB"
                    WatermarkText="Add your comment here">
                </asp:TextBoxWatermarkExtender>
                <asp:TextBox ID="commentsTB" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:Button ID="confirmBTN" CssClass="myButton" runat="server" Text="Confirm & Publish"
                    OnClick="confirmBTN_Click" />
            </td>
            <td>
                <br />
                <asp:HiddenField ID="CityHIde" runat="server" />
                <asp:HiddenField ID="LatLOngHIde" runat="server" />
                <asp:Button ID="inviteBTN" CssClass="myButton" runat="server" Text="Invite from list" />
            </td>
        </tr>
    </table>
<%-- <body>--%>
     <body onload="start()">
   
        <div id="mapholder" style="border: 1px ridge #999999; height: 300px; width: 433px;">
        </div>
    </body>
    <%--<script> 
        var geocoder;
        var map;
        var marker;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var watchGeoMarkerProcess;
        var routeStatus = 0;
        var routePointA;
        var routePointB;
        var markers = [];
        var FinalPositon;
        var addressTXT;
        var flag = true;
        window.onload = start();

        function start() {
            showMap();
            document.getElementById("getPosition").addEventListener("click", showTown);
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
                placeMarker(e.latLng, map, true);
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

        function placeMarker(position, map, flag) {

            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }

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
            });

            FinalPositon = position;
            markers.push(marker);
            map.panTo(position);

            var address = "???";
            geocoder.geocode({ 'latLng': position }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        address = results[0].formatted_address;
                        if (flag) {
                            FinalPositon = address;             
                        }

                    } else {

                        address = "No address found";
                    }
                    var contentStr =
                    '<div id="markerDiv" style="color:blue;font-family:Aharoni;font-weight:700">' +

                    //  '<div id="latlongMarkerDiv" style="color:red;font-family:david;font-weight:500;width:120px;">' + position + '</div>' +
                        '<div id="addressMarkerDiv" style="color:black;font-family:Arial;font-weight:800;width:120px;">' + address + '</div>' +
                    '</div>'
                      var b = document.getElementById("MainContent_CityHIde");
                      b.value = address;
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
            var a = document.getElementById("MainContent_LatLOngHIde");
            a.value = FinalPositon;
        }

        function showTown() {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
            var e = document.getElementById("locationTB");
            addressTXT = e.value;

            geocoder.geocode({ 'address': addressTXT }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    placeMarker(results[0].geometry.location, map, false);
                } else {
                    alert('insert an Address or click on the map ');
                }
            });
        }

        function startRoute() {
            routeStatus++;
        }
    </script>--%>
</asp:Content>
