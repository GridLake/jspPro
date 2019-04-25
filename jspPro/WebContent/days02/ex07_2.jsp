<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
  
  // DB
  String location = "ex07.jsp";
  if(id.equals("admin") && pwd.equals("1234")) {
	  location += "?ok";
  }
  else {
	  location += "?error";
  }
  response.sendRedirect(location);
%>
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 3:40:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <h3>ex07_2.jsp</h3>
</body>
</html> 
 -->