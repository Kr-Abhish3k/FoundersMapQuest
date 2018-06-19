function initMap() {
  // The location of Uluru
  var delhi = {lat: 28.7041, lng: 77.1025
  };

  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 2, center: delhi
      });

  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: delhi, map: map});
}

