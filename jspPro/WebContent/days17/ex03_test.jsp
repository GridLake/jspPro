<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 21. - 오전 10:24:45</title>
</head>
<style>
 
</style>
<script>
 
	var httpRequest; // 변수 선언
	function getXMLHttpRequest() { // 함수
		if (window.ActiveXObject) { // IE
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					return null;
				}
			}
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}
	}
	
	// 비동기적으로 서버의 자원(sample.txt)을 요청
	function jsajax_click() {
		var name = document.getElementById("name").value;
		var url = "ex03_ajax.jsp?name=" + name;
		
		// 1. XMLHttpRequest 요청 객체
		httpRequest = getXMLHttpRequest();
		// 2. 설정 open()
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET", url, true);
		// 3. 요청 send()
		httpRequest.send(null);
	}
	
	// 콜백함수(callback function)
	function callback() {
		// 400, 500   200
		if (httpRequest.readyState == 4) { // 데이터 얻어왔다
			if (httpRequest.status == 200) {
				// responseText 문자열
				// responseXML XML
				// responseBody 이진코드문자열
				alert(httpRequest.responseText);
				document.getElementById("demo").innerHTML = httpRequest.responseText;
			}
			else {
				alert("> Ajax 요청 실패 " + httpRequest.status);
			}
		}
	}
 
</script>
<body>
 <%
  Date now = new Date();
 %>
 현재 = <%= now.toLocaleString() %>
 <br>
 <form action="" id="form1" name="form1">
  name: <input type="text" id="name" name="name" value="홍길동"/>
  <br>
  <input type="button" value="javascript ajax" onclick="jsajax_click();"/>
 </form>
 <div id="demo"></div>
</body>
</html>