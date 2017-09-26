var latitude=lat;
var longitude=lng;
var map = null;
var geocoder = null;
var marker = null;
var BOUND = mybonds;
var markersArray = [];

function initialize() {
	geocoder = new google.maps.Geocoder();
	var mapOptions = {
		//zoom : 15,
		//zoomControl: false,
		scaleControl: false,
		scrollwheel: false,		
		center : new google.maps.LatLng(latitude,longitude),
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
	setBounds(latitude,longitude);
	addMainMarker(latitude,lng,"Your position");
	addRandomMarkers(latitude,longitude);
}

function setBounds(latitude,longitude) {
	var southWest = new google.maps.LatLng(parseFloat(latitude)-BOUND,parseFloat(longitude)-BOUND);
	var northEast = new google.maps.LatLng(parseFloat(latitude)+BOUND,parseFloat(longitude)+BOUND);
	var bounds = new google.maps.LatLngBounds(southWest,northEast);
	map.fitBounds(bounds);
}

function addMainMarker(latitude,lng,message) {
	var location = new google.maps.LatLng(latitude,longitude);
	marker = new google.maps.Marker({
	    map: map,
	    position: location,
	    draggable: true
	});
	iconFile = 'http://maps.google.com/mapfiles/ms/icons/red-dot.png';
	marker.setIcon(iconFile);
	var infowindow = new google.maps.InfoWindow(
	{content: message,
	 size: new google.maps.Size(5,5)
	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map,marker);
	});
    google.maps.event.addListener(marker, 'dragend', function(){
        // updatePosition(marker.getPosition());
    });
}

function addRandomMarkers(latitude,longitude) {
	var southWest = new google.maps.LatLng(parseFloat(latitude)-BOUND,parseFloat(longitude)-BOUND);
	var northEast = new google.maps.LatLng(parseFloat(latitude)+BOUND,parseFloat(longitude)+BOUND);
	var lngSpan = northEast.lng() - southWest.lng();
	var latSpan = northEast.lat() - southWest.lat();
	for (var i = 0; i < 5; i++) {
		var location = new google.maps.LatLng(southWest.lat() + latSpan * Math.random(),southWest.lng() + lngSpan * Math.random());
		var randomMarker = new google.maps.Marker({
			position: location,
			map: map
		});
		var j = i + 1;
		randomMarker.setTitle(j.toString());
		iconFile = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png';
		randomMarker.setIcon(iconFile); 
		attachSecretMessage(randomMarker, i);
		markersArray.push(randomMarker);
	}
}
function setPositionMarker(latitude,longitude) {
	var location = new google.maps.LatLng(latitude,longitude);
	marker.setPosition(location);
}

function setPositionRandomMarkers(latitude,longitude) {
	var southWest = new google.maps.LatLng(parseFloat(latitude)-BOUND,parseFloat(longitude)-BOUND);
	var northEast = new google.maps.LatLng(parseFloat(latitude)+BOUND,parseFloat(longitude)+BOUND);
	var lngSpan = northEast.lng() - southWest.lng();
	var latSpan = northEast.lat() - southWest.lat();
	if (markersArray) {
		for (i in markersArray) {
			var location = new google.maps.LatLng(southWest.lat() + latSpan * Math.random(),southWest.lng() + lngSpan * Math.random());
			markersArray[i].setPosition(location);
		}
	}	
}

function attachSecretMessage(marker, number) {
	var message = ["Hair Cuttery","Shop","Store","Will house","Boris House"];
	var infowindow = new google.maps.InfoWindow(
	{content: message[number],
	 size: new google.maps.Size(5,5)
	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map,marker);
	});
}
     
function codeAddress() {
    var address = document.getElementById("home_adress").value;
	var geoposition = new google.maps.LatLng(latitude,longitude);
    geocoder.geocode({'address': address}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	        map.setCenter(results[0].geometry.location);
	        marker.setPosition(results[0].geometry.location);
	        setPositionRandomMarkers(results[0].geometry.location.lat(),results[0].geometry.location.lng());
	        updatePosition(results[0].geometry.location);
	        geoposition = results[0].geometry.location;
		} else {
			alert("We can't find the address");
			var location = new google.maps.LatLng(latitude,longitude);
	        map.setCenter(location);
	        marker.setPosition(location);
	        setPositionRandomMarkers(latitude,longitude);
		}
    });
    return geoposition;
 }
   
 // funcion que simplemente actualiza los campos del formulario
function updatePosition(latLng){
	$('#lat').val(latLng.lat());
	$('#long').val(latLng.lng());
}

function showAddress(address) {
	var map = new GMap2(document.getElementById("map"));
	map.addControl(new GSmallMapControl());
	map.addControl(new GMapTypeControl());
	if (geocoder) {
		geocoder.getLatLng(address, function(point) {
			if (!point) {
				alert(address + " not found");
			} else {document.getElementById("lat").innerHTML = point.lat().toFixed(5);
				document.getElementById("lng").innerHTML = point.lng().toFixed(5);
				map.clearOverlays();
				map.setCenter(point, 14);
				var marker = new GMarker(point, {
					draggable : true
				});
				map.addOverlay(marker);
				GEvent.addListener(marker, "dragend", function() {
					var pt = marker.getPoint();
					map.panTo(pt);
					document.getElementById("lat").innerHTML = pt.lat().toFixed(5);
					document.getElementById("lng").innerHTML = pt.lng().toFixed(5);
				});
				GEvent.addListener(map, "moveend", function() {
					map.clearOverlays();
					var center = map.getCenter();
					var marker = new GMarker(center, {
						draggable : true
					});
					map.addOverlay(marker);
					document.getElementById("lat").innerHTML = center.lat().toFixed(5);
					document.getElementById("lng").innerHTML = center.lng().toFixed(5);
					GEvent.addListener(marker, "dragend", function() {
						var pt = marker.getPoint();
						map.panTo(pt);
						document.getElementById("lat").innerHTML = pt.lat().toFixed(5);
						document.getElementById("lng").innerHTML = pt.lng().toFixed(5);
					});
				});
			}
		});
	}
}
	    	 