<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오전 9:08:04</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<!-- 모든 요청은 서블릿 거친 후 JSP 페이지로 이동 -->
<!-- eclipse의 context route(path) - http://localhost/jspPro -->
<!-- http://localhost/jspPro -> GET 방식 -> Regist.java 서블릿 -->
 <a href="/jspPro/board/regist">글쓰기</a><br>
 <a href="/jspPro/board/list">글목록</a><br>
 
</body>
</html>