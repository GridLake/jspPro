<%@ page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex01_cookieAuth.jsp" %>
<%
   /* 
   String auth = null;
   Cookies cookies = new Cookies(request);
   if(cookies.exists("auth")) {
	   auth = cookies.getValue("auth");
   }
   */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오전 10:04:04</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <a href="ex01_default.jsp">Home</a>
 <%
  if(auth != null) {
 %>
 <a href="ex01_default.jsp">글쓰기</a>
 <%
    if(auth.equals("관리자")) { 
 %>
 	  <a href="ex01_default.jsp">글수정</a>
  	  <a href="ex01_default.jsp">글삭제</a>
 <%
    }
  }
 %>
 <img src="/jspPro/days09/List.do.PNG" alt="" />
</body>
</html>