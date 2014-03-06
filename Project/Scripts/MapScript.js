function initialize() {

    // center the map in Ruppin
    var ruppinPos = new Object();
    ruppinPos.lat = 32.343193;
    ruppinPos.long = 34.911908;
    var myLatlng = new google.maps.LatLng(ruppinPos.lat, ruppinPos.long);
    var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var marker1 = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'Ruppin'
    });

}

google.maps.event.addDomListener(window, 'load', initialize);




function findme(pathList2) {
    pos = new google.maps.LatLng(pathList2[0].Lat, pathList2[0].Lng);
    map.setCenter(pos);
}