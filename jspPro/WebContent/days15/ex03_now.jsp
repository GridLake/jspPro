<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%
 Calendar cal = Calendar.getInstance();
 int year = cal.get(Calendar.YEAR);
 int month = cal.get(Calendar.MONTH) + 1;
 int day = cal.get(Calendar.DATE);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 16. - 오전 10:16:23</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 오늘은 <b><%= year %>년 <%= month %>월 <%= day %>일</b> 입니다.
 <br>
 오늘은 <b><tf:now/></b> 입니다.
</body>
</html>