<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servlet Class - 2019. 5. 7. - 오전 11:47:06</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 $(document).ready(function(){
	
 });
</script>
<style>
</style>
</head>
<body>
<!-- 	205p 쿠키 -->
<!-- 
 jsp 에서 생성하는 쿠기는 웹서버 쿠키이다.
 1. 쿠키 ?
 2. 쿠키 (클라이언트 텍스트 파일 형태) <-	쿠키값 생성 - 전송 - 서버
	id/pwd 로그인  <->												서버
 -->
<%
 //	쿠키생성 -> 전송
 //	한글은 인코딩을 해줘야 한다.
 String name = "name";
 String value = "홍길동";
	
 // 서버 측에서 쿠키 생성 					// (기억)  한글 인코딩해서 쿠키값으로 사용
 Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
 cookie.setMaxAge(-1); // 음수일 경우 브라우저 닫으면 쿠키 제거
 //	응답데이터에 쿠키 추가   응답객체 + 쿠키 add  p.221
 response.addCookie(cookie);
%>

<!-- name : %ED%99%8D%EA%B8%B8%EB%8F%99 -->
<!-- 쿠키의 만기시점을 설정하지 않으면 브라우저 닫을시에 사라진다. -->
<%= cookie.getName() %> : <%= cookie.getValue() %>

<br>
 <a href="ex07_02.jsp">ex07_02.jsp</a>
</body>
</html>