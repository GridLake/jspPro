<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오전 9:07:32</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<!-- 
 상태 관리를 할 줄 아는가?
 1. 태그    ***
 2. DB
 3. Session
 4. Cookie
 -->
 <form action="test02_02.jsp" method="post">

 name : <input type="text" name="name" value="홍길동" /><br>
 age : <input type="text" name="age" value="20" /><br>

<input type="submit" value="다음" />

</form>
</body>
</html>