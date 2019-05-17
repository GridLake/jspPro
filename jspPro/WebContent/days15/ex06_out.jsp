<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 16. - 오전 11:15:54</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <c:set var="dateEL" value="<%= new Date().toLocaleString() %>"/>
 <h3>${dateEL}</h3>
 <!-- tagdependent의 의미 -->
 <tf:out>
  <jsp:body><u>현재 시간</u>은 <b>${dateEL}</b> 입니다.</jsp:body>
 </tf:out>
 
 <br>
 
 <tf:out>
  <%= new Date() %><u>현재 시간</u>은 <b>${dateEL}</b> 입니다.</%>
 </tf:out>
</body>
</html>