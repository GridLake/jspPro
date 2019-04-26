<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오전 8:59:29</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
	 $('a').click(function (){
		   var msg = $('#message').val();
		   $(this).attr('href', function (i, val){
			   return val +"?message="+msg;			   
		   });
		   
		   // $(this).submit();
	 }); 
 });
</script>
<body>
 message : <input type="text" id="message" name="message" value="안녕하세요. 홍길동 입니다." /><br>
 <!-- 브라우저에서 엔터 치거나 a태그 => get방식  -->
 <a href="jspPro/days03/forward.jsp"></a>
</body>
</html>