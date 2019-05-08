<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 Date time = new Date();
 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오후 12:08:32</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 세선ID: <%= session.getId() %><br>
 <%
  time.setTime(session.getCreationTime());
 %>
 세션생성시간: <%= formatter.format(time) %><br>
 <%
  time.setTime(session.getLastAccessedTime());
 %>
 최근접속시간: <%= formatter.format(time) %><br>
 <!-- 
 p.232 세션 [상태 관리]
 - 쿠키와 다른 점은? 서버에 값을 저장
 - 로그인: 세션 처리
 
 1. 세션 생성하기
 	ㄱ. session="true" 기본값
 	ㄴ. session.setAttribute("세선명", "세션값");
 			   .getAttribute
 	 
  -->
 <%
  session.setAttribute("empno", "7566");
  session.setAttribute("ename", "SMITH");
 %>
 <a href="ex04.jsp">ex04.jsp</a><br>
 <a href="ex05.jsp">ex05.jsp</a><br>
</body>
</html>