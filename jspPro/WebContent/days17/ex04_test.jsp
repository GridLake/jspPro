<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="httpRequest.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 21. - 오전 10:40:47</title>
</head>
<style>
 
</style>
<script>
 var timer;
 // 4초마다 비동기처리 Ajax를 읽어와서 callback이 처리
 function getEmpTopFive() {
	 // MVC 패턴 사용 시 .do
	 var url = "ex04_empTopFive.jsp";
	 var params = null;
	 var method = "GET";
	 
	 sendRequest(url, params, callback, method);
	 
	 timer = setTimeout(getEmpTopFive, 4000);
 }
 
 function callback() {
	 if (httpRequest.readyState == 4) {
		 if (httpRequest.status == 200) {
			 document.getElementById("demo").innerHTML = httpRequest.responseText;
		 } else {
			 alert("> Ajax 요청 실패 " + httpRequest.status);
		 }
	 }
 }
</script>
<body>
 <input type="button" value="emp Top 5" onclick="getEmpTopFive();"/>
 <hr>
 <div id="demo"></div>
 
 <!-- httpRequest.js -->
</body>
</html>