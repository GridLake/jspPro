<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jsp/servlet class - Ljm (2019. 5. 7.-오전 11:17:16)</title>
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
<!-- 201 ~ 203p -->
<form action="ex06_ok.jsp">
<!-- 
아이디 : admin 
이름 : 1234 
비밀번호 : 관리자 
이메일 : admin@naver.com 
 -->
<table border="1" style="width:400px">
<!-- 	name 값이 property와 같아야한다. -->
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="admin" /></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="관리자" /></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="password" value="1234" /></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="admin@naver.com " /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" />
			<input type="reset" />
		</td>
	</tr>
</table>

</form>
</body>
</html>