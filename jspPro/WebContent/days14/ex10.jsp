<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 2:02:22</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.308 URL 처리 태그 -->
 <!-- 
 c:url 태그
 c:redirect 태그
  -->
 <%-- 
 <%
  String url = "http://search.daum.net/search?w=blog&q=공원";
  response.sendRedirect(url);
 %>
  --%>
  <%-- 
 <c:url value="http://search.daum.net/search" var="searchUrl"/>
 
 <c:redirect url="${searchUrl}">
  <c:param name="w" value="blog"></c:param>
  <c:param name="q" value="공원"></c:param>
 </c:redirect>
  --%>
 <a href="ex11.jsp?path=/days14/ex01.jsp">/jspPro/days14/ex01.jsp</a>
</body>
</html>