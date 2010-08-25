var geocoder;

$(document).ready(function(){
	geocoder = new google.maps.Geocoder();
	
	var myOptions = {
		zoom: 16,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	$("#map_canvas").hide();
	$('#showmap').click(function() {
		$('#map_canvas').show(800);
		codeAddress();
	});

	$("#hidemap").click(function () {
		$("#map_canvas").hide(1000);
	});
});
