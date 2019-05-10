<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 10. - 오후 3:14:34</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <c:if test="${!empty authUser}">
  ${authUser.name}님, 안녕하세요.
  <a href="logout.do">[로그아웃하기]</a>
  <a href="changePwd.do">[암호변경하기]</a>
 </c:if>
 <c:if test="${empty authUser}">
  <a href="join.do">[회원가입하기]</a>
  <a href="join.do">[로그인하기]</a>
 </c:if>
 <br>
</body>
</html>