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

function showMap() {
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
}

function getCountry() {
	if ($(!isLatlngValid || "#place_coordinates_lat").val().length == 0 || $("#place_coordinates_long").val().length == 0) {
		if (isLatlngValid) {				
			geocoder.geocode( { 'latlng': marker.getPosition()}, function(results, status) {
				var country;
				if (status == google.maps.GeocoderStatus.OK) {
					for (i=0;i<results[0].address_components.length;i++){
						for (j=0;j<results[0].address_components[i].types.length;j++){
							if(results[0].address_components[i].types[j]=='country')
							country = results[0].address_components[i].long_name
						}
					}
					$("#place_country_id").val(country);
				} else {
					alert("Geocode was not successful for the following reason: " + status);
				}
			});
			return true;
		} else {
			var address = $("#place_direction").val();
			geocoder.geocode( { 'address': address}, function(results, status) {
				var country;
				if (status == google.maps.GeocoderStatus.OK) {
					for (i=0;i<results[0].address_components.length;i++){
						for (j=0;j<results[0].address_components[i].types.length;j++){
							if(results[0].address_components[i].types[j]=='country')
							country = results[0].address_components[i].long_name
						}
					}
					$("#place_country_id").val(country);

				} else {
					alert("Geocode was not successful for the following reason: " + status);
				}
			});
			return false;
		}
	}
	return true;
	
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

	$("#getcoordinates").click(function() {
		if ($(!isLatlngValid || "#place_coordinates_lat").val().length == 0 || $("#place_coordinates_long").val().length == 0) {
			if (isLatlngValid) {
				$("#place_coordinates_lat").val(latlng.lat());
				$("#place_coordinates_long").val(latlng.lng());
				showMap();
				getCountry();
				
				return true;
			} else {
				var address = $("#place_direction").val();
				geocoder.geocode( { 'address': address}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						latlng = results[0].geometry.location;

						$("#place_coordinates_lat").val(latlng.lat());
						$("#place_coordinates_long").val(latlng.lng());
						showMap();
						getCountry();

					} else {
						alert("Geocode was not successful for the following reason: " + status);
					}
				});
				return false;
			}
		}

		return true;
	});


	// $("#get_country_button").click(function() {
	// 	if ($(!isLatlngValid || "#place_coordinates_lat").val().length == 0 || $("#place_coordinates_long").val().length == 0) {
	// 		if (isLatlngValid) {				
	// 			geocoder.geocode( { 'latlng': marker.getPosition()}, function(results, status) {
	// 				var country;
	// 				if (status == google.maps.GeocoderStatus.OK) {
	// 					for (i=0;i<results[0].address_components.length;i++){
	// 						for (j=0;j<results[0].address_components[i].types.length;j++){
	// 							if(results[0].address_components[i].types[j]=='country')
	// 							country = results[0].address_components[i].long_name
	// 						}
	// 					}
	// 					$("#place_country_id").val(country);
	// 				} else {
	// 					alert("Geocode was not successful for the following reason: " + status);
	// 				}
	// 			});
	// 			return true;
	// 		} else {
	// 			var address = $("#place_direction").val();
	// 			geocoder.geocode( { 'address': address}, function(results, status) {
	// 				var country;
	// 				if (status == google.maps.GeocoderStatus.OK) {
	// 					for (i=0;i<results[0].address_components.length;i++){
	// 						for (j=0;j<results[0].address_components[i].types.length;j++){
	// 							if(results[0].address_components[i].types[j]=='country')
	// 							country = results[0].address_components[i].long_name
	// 						}
	// 					}
	// 					$("#place_country_id").val(country);
	// 
	// 				} else {
	// 					alert("Geocode was not successful for the following reason: " + status);
	// 				}
	// 			});
	// 			return false;
	// 		}
	// 	}
	// 	return true;
	// });
	
	

	// $('#set_coordinates_button').click(function() {
	// 	var ready = false;
	// 
	// 	$('#map_canvas').show(500, function() {
	// 		google.maps.event.trigger(map, 'resize');
	// 		if (ready) {
	// 			setMap()
	// 		} else {
	// 			ready = true;
	// 		}
	// 	});
	// 
	// 	if ($(!isLatlngValid || "#place_coordinates_lat").val().length == 0 || $("#place_coordinates_long").val().length == 0) {
	// 		if (isLatlngValid) {
	// 			var latLng;
	// 			
	// 			latLng.lat = $("#place_coordinates_lat");
	// 			latLng.lng = $("#place_coordinates_long");
	// 
	// 			geocoder.geocode( { 'latLng': marker.getPosition()}, function(status, results) {
	// 				if (status == google.maps.GeocoderStatus.OK) {
	// 					var address = results[0].formatted_address;
	// 					if (ready) {
	// 						setMap()
	// 					} else {
	// 						ready = true;
	// 					}
	// 
	// 				} else {
	// 					alert("Geocode was not successful for the following reason: " + status);
	// 				}
	// 			});
	// 		}
	// 	}
	// });
	
	
});
