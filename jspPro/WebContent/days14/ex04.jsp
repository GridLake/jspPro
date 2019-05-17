<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오전 10:14:12</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <form action="">
 정수: <input type="text" name="num" value="10"/>
 </form>
 <div id="demo">
 
 <!-- p.299 흐름 제어 -->
 <%-- <c:if test="<%= 표현식 %>, ${EL}"></c:if> --%>
 <c:if test="${param.num % 2 == 0}">
  짝수
 </c:if>
 <c:if test="${param.num mod 2 ne 0}">
  홀수
 </c:if>
 <%-- 
 <%
  int n = Integer.parseInt(request.getParameter("num") == null ? "10" : request.getParameter("num"));
  if(n % 2 == 0) {
 %>짝수<%
  } else {
 %>홀수<%
  }
 %>
  --%>
 <%-- <c:if test="조건식" scope="page" var="변수명"></c:if> --%>
 </div>
</body>
</html>