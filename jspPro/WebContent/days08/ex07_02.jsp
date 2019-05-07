<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jsp/servlet class - Ljm (2019. 5. 7.-오후 12:28:06)</title>
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
<!--첫시작시에 쿠키값 생성하는 코딩이 없기에 쿠키값이 유지되고 있어야 목록을 볼 수 있음. -->

쿠키 목록<br>
<%
	Cookie[] cookies = request.getCookies();
// 	null 여부 확인해야 NullPointException이 발생하지 않는다.
	if(cookies != null && cookies.length > 0){	
		for(int i = 0; i<cookies.length; i++){
%>
<%=cookies[i].getName() %> = <%=URLDecoder.decode(cookies[i].getValue(),"utf-8") %><br>
<%
		}
	}else{
%>
쿠기가 존재하지 않습니다.
<%
	}
%>
</body>
</html>