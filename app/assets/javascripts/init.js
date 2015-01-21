$(document).ready(function(){

  // Define some variables so we can access them from anywhere
  var map;
  var userLatLng;
  var circle;
  var marker;
  var drawCircle;
  var e;
  var valPar;
  var stHelier;
  var updateRadius;
  var delayedUpdateRadius;

  
  geolocateUser();

  function writeAddressName(latLng) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
      "location": latLng
    },
    function(results, status) {
      if (status == google.maps.GeocoderStatus.OK)
        document.getElementById("address").innerHTML = results[0].formatted_address;
      else
        document.getElementById("error").innerHTML += "Unable to retrieve your address" + "<br />";
    });
  }

  function geolocationSuccess(position) {
    userLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

    // Write the formatted address
    writeAddressName(userLatLng);

    // var mapObject = new google.maps.Map(document.getElementById("map"));
    // console.log(mapObject);
    // console.log(handler);

   usermap = handler.map.serviceObject;

    // Place the marker
    marker = new google.maps.Marker({
      map: usermap,
      position: userLatLng,
      title: 'Drag Me!',
      draggable: true,
      animation: google.maps.Animation.DROP,
    });

    drawCircle = function(){
    // Draw a circle around the user position to have an idea of the current localization accuracy
    var options = {
      center: userLatLng,
      // radius: position.coords.accuracy,
      radius: newRadius * 1000,
      map: usermap,
      fillColor: '#333',
      fillOpacity: 0.5,
      strokeColor: '#0000',
      strokeOpacity: 1.0
    };

    circle = new google.maps.Circle(options);
    usermap.fitBounds(circle.getBounds());
    circle.bindTo('center', marker, 'position');
    };

      drawCircle();


  google.maps.event.addDomListener(filter1, 'click', updateRadius);
  };

  updateRadius = function () {
    newRadius = range.innerHTML;
    circle.setRadius(newRadius *= 1000);
    usermap.fitBounds(circle.getBounds());
  }

  delayedUpdateRadius = function () {
    setTimeout(function() {updateRadius();}, 6000);
  }

  //Removing location marker and circle if user don't want it
    function setAllMap(map) {
      marker.setMap(map);
    }
    function clearMarker() {
      circle.setMap(null);
      setAllMap(null);
    }
    function showMarker() {
      setAllMap(handler.map.serviceObject);
      circle.setMap(handler.map.serviceObject);
    }
      function deleteMarker() {
      clearMarker();
      marker = [];
      circle = 0;
    }



  function geolocationError(positionError) {
    document.getElementById("error").innerHTML += "Error: " + positionError.message + "<br />";
  }

  function geolocateUser() {
    // If the browser supports the Geolocation API
    if (navigator.geolocation)
    {
      var positionOptions = {
        enableHighAccuracy: true,
        timeout: 10 * 1000 // 10 seconds
      };
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError, positionOptions);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      }
    else
      document.getElementById("error").innerHTML += "Your browser doesn't support the Geolocation API";
  }
      
});