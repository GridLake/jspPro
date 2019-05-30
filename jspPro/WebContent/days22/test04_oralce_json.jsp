<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Using Oracle and JSON(JSP) with Google Maps</title>
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<html>
<body>
	<div id="map"></div>
	<script>
		var customLabel = {
			restaurant : {
				label : 'R'
			},
			bar : {
				label : 'B'
			}
		};

		function initMap() {
			// 1. 
			var map = new google.maps.Map(document.getElementById('map'), {
				center : new google.maps.LatLng(-33.863276, 151.207977),
				zoom : 12
			});
            // 2.
			var infoWindow = new google.maps.InfoWindow;
            // 3. 
			var params = null;
			$.ajax({
				url : "test04_oralce_json_data.jsp",
				dataType : "json",
				type : "get",
				data : params,
				cache : false,
				success : function(data) { //  []
					$(data).each(
							function(index, e) {
								// id, type,name, lng,lat,address
								var id = e.id;
								var name = e.name;
								var address = e.address;
								var type = e.type;
								var point = new google.maps.LatLng(
										parseFloat(e.lat), parseFloat(e.lng));

								var infowincontent = $("<div />");
								var strong = $("<strong />").html(name);
								infowincontent.append(strong).append($("<br>"));

								var text = document.createElement('text');
								text.textContent = address;
								infowincontent.append(text);
								var icon = customLabel[type] || {};

								var marker = new google.maps.Marker({
									map : map,
									position : point,
									label : icon.label
								});
								
								marker.addListener('click', function() {
									infoWindow.setContent(infowincontent.html());
									infoWindow.open(map, marker);
								});

							}); // each
				}
			}); // ajax 

		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-wVJDO3qCpzZKTO6MK-edZIA495LI0Cg&callback=initMap">
		
	</script>
</body>
</html>


<!-- 
create table googlemap
(
  id number primary key
   ,type varchar2(20)
   , name varchar2(30)
   , lng number
   , lat number
   , address varchar2(255)
);
 -->





