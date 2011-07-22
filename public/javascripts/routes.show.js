var directionDisplay;
var directionsService = new google.maps.DirectionsService();
var map;

$(document).ready(function(){	
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(37.7749295, -122.4194155);
    var myOptions = {
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: chicago
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));

	if (displayRoute) {
	    var request = {
	        origin: origin,
	        destination: destination,
	        waypoints: waypoints,
	        travelMode: google.maps.DirectionsTravelMode.DRIVING,
	        optimizeWaypoints: false,
	        avoidHighways: false,
	        avoidTolls: false
	    };
    
	    directionsService.route(request, function(response, status) {
	      if (status == google.maps.DirectionsStatus.OK) {
	        directionsDisplay.setDirections(response);
	      }
	    });
	}
});
