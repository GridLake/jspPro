<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 9. - 오전 10:14:28</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <a href="<%= request.getContextPath() %>/simple">/simple</a><br>
 <a href="<%= request.getContextPath() %>/simple?type=greeting">/simple?type=greeting</a><br>
 <a href="<%= request.getContextPath() %>/simple?type=date">/simple?type=date</a><br>
 <a href="<%= request.getContextPath() %>/simple?type=admin">/simple?type=admin</a><br>
 
 
 <br>
 <a href="<%= request.getContextPath() %>/controllerUsingFile?cmd=hello">특정 이름의 파일</a>
 <br>
 <a href="<%= request.getContextPath() %>/controllerUsingFIle">Null</a>
 <br>
 
 <a href="/jspPro/hello.do">hello.do</a><br>
 <a href="/jspPro/board/list.do">/board/list.do</a>
</body>
</html>