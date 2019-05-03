<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 4:18:51</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.163 jsp:param -->
 Content 부분<br>
 Content 부분<br>
 Content 부분<br>
 <!-- 파라미터로 넘어온 것을 다시 파라미터로 넘기는 것도 가능 -->
 <jsp:include page="/days07/ex11_sub.jsp">
   <jsp:param value="${param.user}" name="user"/>
   <jsp:param value="홍길동" name="name"/>
 </jsp:include>
</body>
</html>