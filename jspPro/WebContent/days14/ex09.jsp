<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 12:21:16</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%
  HashMap<String, String> map = new HashMap<>();
  map.put("id", "admin");
  map.put("name", "홍길동");
  map.put("tel", "010-0000-0000");
  map.put("addr", "서울시 강남구");
  
  // request.setAttribute("map", map);
 %>
  <!-- 주의 -->
 <c:set var="map" value="<%= map %>"/>
 
 <c:forEach items="${map}" var="entry">
  <li>
   ${entry.key} - ${entry.value}
  </li>
 </c:forEach>
</body>
</html>