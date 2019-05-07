<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 7. - 오후 2:10:50</title>
</head>
<style>
 
</style>
<script>	
 $(document).ready(function() {
 	
 });
</script>
<body>
 <a href="ex08_setCookie.jsp">쿠키 생성</a><br>
 <a href="ex08_getCookie.jsp">쿠키 확인</a><br>
 <!-- p.210 쿠키 값 반경 및 쿠키 삭제
  1. 쿠키 값 변경
     ㄱ. 쿠키이름으로 쿠키를 찾아서
     ㄴ. 새로운 쿠키값을 가지는 Cookie 객체 생성
     ㄷ. response.addCookie()
  2. 쿠키 삭제
     ㄱ. 쿠키이름 찾아서
     ㄴ. 새로운 쿠키값을 가지는 Cookie 객체 생성
         .setMaxAge(0) 설정  
         // -1과 혼동 주의(의미 자체가 다름) 
         0 : 브라우저가 응답받는 즉시 쿠키 제거,
        -1 : 브라우저가 닫힐 때 쿠키 제거
  3. 쿠키의 도메인
        
  -->
</body>
</html>