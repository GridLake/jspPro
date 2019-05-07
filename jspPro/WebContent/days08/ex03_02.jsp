<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jsp/servlet class - Ljm (2019. 5. 7.-오전 10:08:11)</title>
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
<!-- X -->
<h3>name: ${ name }</h3>
<!-- O -->
<h3>name: <%= request.getParameter("name") %></h3>
<h3>name: ${ param.name }</h3>
<h3>addr : <%= request.getParameter("addr") %></h3>
<h3>addr: ${ param.addr }</h3>
<h3>age : <%= request.getParameter("age") %></h3>
<h3>age: ${ param.age }</h3>
<h3>tel : ${tel }</h3>
</body>
</html>