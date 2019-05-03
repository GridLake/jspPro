<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오전 9:39:45</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
  HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
  
  JspWriter w = pageContext.getOut();
%>
<%= request == httpRequest %> <!-- true -->
<br>
<% 
  w.println("test");
%>
 <!-- 
 p.119 pageContext 객체
 1. JSP 페이지와 1:1로 연결된 객체(서블릿 클래스도 일종의 pageContext)
 2. 기능
    ㄱ. 기본 객체를 얻어올 수 있다
    request == pageContext.getRequest()
    response == getResponse()
    session == getSession()
    application == servletContext == servletContext() ***
    out == getOut()
    exception == getException()
    page 기본 객체 = Object getPage()   ***  모든 page들의 부모 객체(pageContext와 혼동하지 말것)
 	ㄴ. 속성 처리
 	ㄷ. 페이지 흐름 제어(7장)
 	ㄹ. 에러
  -->
 
 
</body>
</html>