<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 12:02:28</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
 session.setAttribute("auth", "hong");
%>
<a href="ex02_ok.jsp?name=admin">ex02_ok.jsp</a>
 <!-- 
 p.254 표11.1 (EL에서 사용할 수 있는 기본 객체) 
 1. pageContext == JSP pageContext 동일  (page 객체와 구분 == Object)
 2. pageScope, requestScope, sessionScope, applicationScope
 3. param 요청 파라미터의 <파라미터명, 값> 매핑을 저장한 Map 객체
 	  -> request.getParameter("이름") 과 동일
 	     String 반환
 -->
 
</body>
</html>