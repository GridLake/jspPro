<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 4:29:45</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
 String name = "admin";
 int age = 20;
 String params = String.format("name=%s&age=%d", name, age);
%>
 								<!-- EL 표기에서 \ 붙이면 EL 아님 -->
 <a href="ex01_ok.jsp?<%= params %>">\${param.name}</a>
 <br>
 <a href="ex01_02.jsp?<%= params %>">\${param.name}</a>
</body>
</html>