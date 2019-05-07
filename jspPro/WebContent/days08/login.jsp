<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String id = request.getParameter("id");
 String password = request.getParameter("password");
 
 if(id.equals(password)) {
	 // ID와 암호가 같으면 로그인에 성공한 것으로 판단
	 response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 7. - 오후 6:51:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 로그인에 성공했습니다
</body>
</html>

<% 
 } else { // 로그인 실패시
%>
<script>
 alert("로그인에 실패하였습니다");
 history.go(-1);
</script>
<%
 }
%>