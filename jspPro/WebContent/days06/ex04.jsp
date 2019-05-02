<%@ page autoFlush="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 2. - 오후 4:40:23</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 버퍼 크기: <%= out.getBufferSize() %><br>
 남은 크기: <%= out.getRemaining() %><br>
 auto flush: <%= out.isAutoFlush() %><br>
 <% out.flush(); %>
 <% out.clearBuffer(); %>
 <hr>
 남은 크기: <%= out.getRemaining() %><br>
</body>
</html>