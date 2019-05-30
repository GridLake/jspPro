<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 28.-오전 9:50:29)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<div id="map" style="width:100%;height:500px;"></div>

<script>
// 한독빌딩 중심... 지도
var lat = -33.863276;
var lng =  151.207977;

function myMap() {
   // 구글맵 설정 생성
  var mapCanvas = document.getElementById("map");
  var myCenter = new google.maps.LatLng(lat, lng); // 
  var mapOptions = {center: myCenter, zoom: 12};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  // 지도 클릭 이벤트 등록
  google.maps.event.addListener(map, 'click'
		  , function(event) {
	            // 위치 마커 생성
			    placeMarker(map, event.latLng);
	            
	            $('#h_lng').val(event.latLng.lng());
	            $('#h_lat').val(event.latLng.lat());	            
	            // 모달 창 띄우기
	            $("#myModal").modal("show");
	            //  Ajax 처리 DB 저장 모달 창 닫기
			}
  );
}

function placeMarker(map, location) {
	// 
  //var marker = new google.maps.Marker({
	marker = new google.maps.Marker({
    position: location,  // 클릭한 위도,경도
    map: map
  });
  // 
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
  });
  
  infowindow.open(map,marker);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-wVJDO3qCpzZKTO6MK-edZIA495LI0Cg&callback=myMap"></script>


<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" style="width: 350px">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">위치 정보 입력</h4>
				</div>
				<div class="modal-body"> 
					<div style="text-align: center">
						<form id="form1" action="test04_oracle_input_ok.jsp" method="post">
							<table width="300px" border="1" align="center">
								<tr><td>ID</td></tr>
								<tr><td><input type="text" name="id" value="100"></td></tr>
								<tr><td>TYPE</td></tr>
								<tr><td><input type="text" name="type" value="restaurant"></td></tr>
								<tr><td>NAME</td></tr>
								<tr><td><input type="text" name="name" value="admin"></td></tr>
								<tr><td>ADDRESS</td></tr>
								<tr><td><input type="text" name="address" value="seoul"></td></tr>
								<tr>
									<td><input type="button" id="btnSave" value="저장"></td>
								</tr>
							</table>
							<input type="hidden" id="h_lat" name="lat" value="" />
							<input type="hidden" id="h_lng" name="lng" value="" />
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" onclick="modal_close();" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
<!-- 마커 삭제 
if(typeof marker !== 'undefined'){
  marker.setMap(null);
 }
출처: https://sd23w.tistory.com/390 [그러냐]
 -->
<script>  
	  
	  // Delete.jsp 복사 붙이기 ㅋㅋ
	  $("#btnSave").click(function (){
		  // alert("test");
		  if( confirm("정말 저장합니까? ")){
			  $("#form1").submit();
		  }
	  });
	  
	  function modal_close(){
		  if(typeof marker !== 'undefined'){
			  marker.setMap(null);
			 }
	  }
 
</script>	
	
</body>
</html>