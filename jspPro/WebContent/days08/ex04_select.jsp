<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jsp/servlet class - Ljm (2019. 5. 7.-오전 10:20:51)</title>
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
<!-- include.jspf 를 미리 해놨기 때문에 가능 -->
<form action="<%= contextPath %>/days08/ex04_view.jsp">

보고 싶은 페이지 선택:
	<select name="code">
		<option value="A">A페이지</option>
		<option value="B">B페이지</option>
		<option value="C">C페이지</option>
	</select>
	
	<input type="submit" value="이동"/>

</form>

</body>
</html>