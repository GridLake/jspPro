<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 28. - 오전 9:03:01</title>
</head>
<style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
</style>
    
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- ex01~02 : Adding a map with a marker -->
 <a href="ex02.jsp?lat=37.499327&lng=127.033162">한독빌딩</a>
 <h3>My Google Maps Demo</h3>
 <!--The div element for the map -->
 <div id="map"></div>
 
 <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  // var uluru = {lat: 37.499273, lng: 127.033195};
  
  var latitude = '${ empty param.lat ? -25.344 : param.lat }';
  var longitude = '${ empty  param.lng ? 131.036 : param.lng}';
  var uluru = {lat: parseFloat(latitude), lng: parseFloat(longitude) };
    
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker(
		  {
			  position: uluru
			  // , map: map
			  // , animation: google.maps.Animation.BOUNCE
			  // , icon: "https://www.w3schools.com/graphics/pinkball.png"
		  });
  marker.setMap(map);
  
  var info = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
  var infowindow = new google.maps.InfoWindow({
	  // content: "Hello world" // 디자인
	  content:info
  });
  infowindow.open(map, marker);
  
  // 클릭 이벤트 등록 및 처리
  google.maps.event.addListener(marker, "click", function() {
	  // map.setZoom(4);
	  // map.setCenter(marker.getPosition());
	  
	  infowindow.open(map, marker);
	  window.setTimeout(function () {
		  infowindow.close();
	  }, 3000);
  });
 }
 </script>
 
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD22gGuJambID4g4M2bHWgxOCmWCArzTzM&callback=initMap">
 </script>
</body>
</html>