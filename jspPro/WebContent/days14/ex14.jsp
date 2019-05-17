<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 3:14:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>

 <%
  Date now = new Date();
 %>
 now: <%= now %>

 <hr>
 <c:set var="now" value="<%= now %>"/>
 <fmt:formatDate value="${now}" dateStyle="full"/><br>
 <fmt:formatDate value="${now}" dateStyle="short"/><br>
 <fmt:formatDate value="${now}" type="time"/><br>
 <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/><br>
 <hr>
 <c:set value="2019년05월15일" var="d"/>
 <!-- 날짜형 변환 -->
 <fmt:parseDate value="${d}" pattern="yyyy년MM월dd일" var="date"/>
 변환된 날짜: ${date}
 <% %>
</body>
</html>