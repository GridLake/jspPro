<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP/Servlet Class - 2019. 5. 7. - 오전 11:33:27</title>
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
<h3>ex06_last.jsp</h3>

아이디: ${ info.id } <br>
<%-- 
 이름     : <jsp:getProperty property="name" name="info"/>  <br>
 비밀번호 : <jsp:getProperty property="password" name="info"/> <br>
 이메일   : <jsp:getProperty property="email" name="info"/> <br>
 등록일   : <jsp:getProperty property="registerDate" name="info"/> <br>
 --%>
</body>
</html>