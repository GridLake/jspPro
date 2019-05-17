<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 12:05:51</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- ?name=admin -->
 <%
  String name = request.getParameter("name");
  String uri = request.getRequestURI();
  String auth = (String)session.getAttribute("auth");
 %>
 name 파라미터: <%= name %><br>
 name 파라미터: ${param.name}<br>
 
 uri: <%= uri %><br>
 uri: ${pageContext.request.requestURI}<br>
 
 auth: <%= auth %><br>
 auth: ${sessionScope.auth}<br>
 <%-- auth: ${sessionScope["auth"]}<br> --%>
</body>
</html>