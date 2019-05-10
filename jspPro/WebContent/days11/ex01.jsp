<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 10. - 오전 9:05:32</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.545 필터(Filter) -->	
 
 <a href="/jspPro/days11/board/ex01_list.jsp">게시판</a>
 <a href="/jspPro/days11/member/ex01_loginForm.jsp">로그인</a>
 
 <c:if test="${param.ok ne null}">
  로그인 후 메인 페이지로 이동...
 </c:if>
 
 <a href="/jspPro/days11/xml/bookList.jsp">XSLT 필터 테스트</a>
</body>
</html>