<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - (2019. 5. 30.-오전 9:22:11)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<%
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
%>
>전송된이름 : <%=name %> <br />
>전송된파일 : <%=upload %> <br />
<hr />
${param.name } <br />
${param.upload } <br />
</body>
</html>