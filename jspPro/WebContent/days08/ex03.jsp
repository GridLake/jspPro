<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servlet Class - 2019. 5. 7. - 오전 10:07:05</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	});
</script>
<style>
</style>
</head>
<body>
<!-- p.177 jsp:forward 액션 태그 -->
<%
 String name = request.getParameter("name");
 //	response.sendRedirect(arg0);
 
 //	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
 //	dispatcher.forward(request, response)
	
 int age = 20;

 request.setAttribute("tel", "010-4490-0989");
%>

<jsp:forward page="ex03_02.jsp">
	<jsp:param value="seoul" name="addr"/>
	<jsp:param value="<%= age %>" name="age"/>
</jsp:forward>

</body>
</html>