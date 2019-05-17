<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 12:17:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <h3>ex03_ok.jsp</h3>
 <%
  String referer = request.getHeader("referer");
  Cookie[] cookies = request.getCookies();
  /* 
  Cookies cookies = new Cookies(request);
  String user = cookies.getCookie("user").getValue();
  String id = cookies.getCookie("id").getValue();
  String name = cookies.getCookie("name").getValue();
  */
 %>
 
 이전 페이지: <%= referer %><br>
 이전 페이지: ${header.referer}<br>
 <hr>
 <%-- 
 user : <%= user %><br>
 id   : <%= id %><br>
 name : <%= name %><br>
  --%>
 user : <%= cookies[0].getValue() %><br>
 id   : <%= cookies[1].getValue() %><br>
 name : <%= cookies[2].getValue() %><br>
 <hr>
 user : ${cookie.user.value }<br>
 id   : ${cookie.id.value }<br>
 name : ${cookie.name.value }<br>
 
 <h3>쿠키 목록 출력</h3>
 <c:forEach items="${cookie}" var="ok">
  <li>${ck.key} - ${URLDecoder.decode(ck.value.value)}</li>
 </c:forEach>
</body>
</html>