<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 2:20:10</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <a href="ex100.jsp">ex100.jsp</a>
 
 <%
   String msg = request.getParameter("message").toUpperCase();
 %>
 <!-- 
 p.146 [응답 상태 코드]별로 에러 페이지 지정하기
 - 400, 500, 404... 응답 상태 코드별로 에러 지정
 ㄱ. web.xml 설정
    <error-page> 태그 사용해서 설정
 
 404: 요청한 URL을 처리하기 위한 자원이 존재하지 않음
 500: 서버 내부 로직 에러(Java 코딩)
 
 p.149 주요 응답 상태 코드
 
  -->
 
</body>
</html>