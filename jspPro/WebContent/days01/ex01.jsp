<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 23. - 오후 4:40:20</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
  String contextPath = request.getContextPath();
%>
 Hello World
 <br>
 <!-- get 방식 -->
 <a href="ex05.jsp?n1=10&n2=20">ex05.jsp</a>
 <br>
 <a href="<%=contextPath %>/hello">HelloServlet.java</a>
</body>
</html>