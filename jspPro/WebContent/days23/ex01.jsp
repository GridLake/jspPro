<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - (2019. 5. 30.-오전 9:20:44)</title>
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
<form action="ex01_03.jsp" method="post" enctype="multipart/form-data">
	이름: <input type="text" name="name" value="홍길동" /><br />
	파일: <input type="file" name="upload"/><br />
<input type="submit" />
</form>



</body>
</html>