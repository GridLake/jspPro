<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 12:17:34</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <h3>ex03.jsp</h3>
 <%-- String[] paramValues: <% request.getParameterValues(name); %> --%>
 <!-- header: request.getHeader(이름) -->
 <a href="ex03_ok.jsp">ex03_ok.jsp</a>
 <!-- headerValues: request.getHeaders(이름) 동일 -->
 <!-- 쿠키 -->
 <%
  Cookie cookie = Cookies.createCookie("user", "admin");
  response.addCookie(cookie);
  
  cookie = Cookies.createCookie("id", "hong");
  response.addCookie(cookie);
  
  cookie = Cookies.createCookie("name", "park");
  response.addCookie(cookie);
 %>
</body>
</html>