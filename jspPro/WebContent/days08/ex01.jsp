<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf" %>
<%-- 
<%
	//지역변수 개념
	String title = "include 지시자 테스트";
%>	
 --%>
<%!
//	전역변수 개념
	String title = "include 지시자 테스트";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servlet Class - 2019. 5. 7. - 오전 9:07:54</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
<style>
</style>
</head>
<body>

<!-- 
p.168 include 지시자
공통적으로 선언한 include.jspf 파일 사용하기
 -->
	context path = <%= contextPath %><br>
	download path = <%= downloadPath %><br>
</body>
</html>