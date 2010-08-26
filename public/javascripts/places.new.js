var geocoder;
var map;
var marker = null;
var location = null;

function setMap() {
	map.setCenter(location);
	if (marker) {
		marker.setMap(null);
	}
	marker = new google.maps.Marker({
		map: map, 
		position: location
	});
}

$(document).ready(function(){
	geocoder = new google.maps.Geocoder();

	var myOptions = {
		zoom: 8,
		center: new google.maps.LatLng(0.0, 0.0),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	$("#map_canvas").hide();
	
	$('#showmap').click(function() {
		var ready = false;
		
		$('#map_canvas').show(500, function() {
			google.maps.event.trigger(map, 'resize');
			if (ready) {
				setMap()
			} else {
				ready = true;
			}
		});

		var address = $("#place_direction").val();
		geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				location = results[0].geometry.location;
				if (ready) {
					setMap()
				} else {
					ready = true;
				}
				
			} else {
				alert("Geocode was not successful for the following reason: " + status);
			}
		});
	});

	$("#hidemap").click(function () {
		$("#map_canvas").hide(500);
	});
	
	$("#new_place_form").submit(function() {
		
	});
});
