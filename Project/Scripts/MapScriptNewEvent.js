
var map = null;
var geocoder = null;

function initialize() {
   
    if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.setCenter(new GLatLng(37.4419, -122.1419), 1);
        map.setUIToDefault();
        geocoder = new GClientGeocoder();
    }
}

function showAddress(address) {
    alert("showAddress");
    alert(address)
    if (geocoder) {
        geocoder.getLatLng(
          address,
          function (point) {
              if (!point) {
                  alert(address + " not found");
              } else {
                  map.setCenter(point, 15);
                  var marker = new GMarker(point, { draggable: true });
                  map.addOverlay(marker);
                  GEvent.addListener(marker, "dragend", function () {
                      marker.openInfoWindowHtml(marker.getLatLng().toUrlValue(6));
                  });
                  GEvent.addListener(marker, "click", function () {
                      marker.openInfoWindowHtml(marker.getLatLng().toUrlValue(6));
                  });
                  GEvent.trigger(marker, "click");
              }
          }
        );
    }
  }

  google.maps.event.addDomListener(window, 'load', initialize);



//  function showTown() {
//      alert("showtown");
//      var e = document.getElementById("address");
//      var address = e.value;
//      alert(address);
//      geocoder.geocode({ 'address': address }, function (results, status) {
//          alert("gecode");
//          if (status == google.maps.GeocoderStatus.OK) {
//              map.setCenter(results[0].geometry.location);
//              var marker = new google.maps.Marker({
//                  map: map,
//                  position: results[0].geometry.location

//              });
//          } else {
//              alert('Geocode was not successful for the following reason: ' + status);
//          }
//      });
//  }