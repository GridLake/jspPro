<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
  String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 25. - 오전 9:04:23</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<h3>표현식</h3>
 이름: <%=name %><br>
 나이: <%=age %><br>
 이메일: <%=email %><br>
	
<h3>EL</h3>	
 이름: ${param.name}<br>
 나이: ${param.age}<br>
 이메일: ${param.email}<br>
</body>
</html>