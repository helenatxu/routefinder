var geocoder;
var map;
var marker = null;
var latlng = null;
var isLatlngValid = false;

function setMap() {
	map.setCenter(latlng);
	if (marker) {
		marker.setMap(null);
	}
	marker = new google.maps.Marker({
		map: map, 
		position: latlng
	});
	
	isLatlngValid = true;
}

$(document).ready(function(){
	geocoder = new google.maps.Geocoder();

	var myOptions = {
		zoom: 8,
		center: new google.maps.LatLng(0.0, 0.0),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	$("#place_direction").change(function() {
		isLatlngValid = false;
	});

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
				latlng = results[0].geometry.location;
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
	
	$("#place_form").submit(function() {
		if ($(!isLatlngValid || "#place_coordinates_lat").val().length == 0 || $("#place_coordinates_long").val().length == 0) {
			if (isLatlngValid) {
				$("#place_coordinates_lat").val(latlng.lat());
				$("#place_coordinates_long").val(latlng.lng());
				
				return true;
			} else {
				var address = $("#place_direction").val();
				geocoder.geocode( { 'address': address}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						latlng = results[0].geometry.location;
						
						$("#place_coordinates_lat").val(latlng.lat());
						$("#place_coordinates_long").val(latlng.lng());
						
						$("#place_form").submit();
					} else {
						alert("Geocode was not successful for the following reason: " + status);
					}
				});
				return false;
			}
		}
		
		return true;
	});
});
