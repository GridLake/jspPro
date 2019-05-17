<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 12:06:51</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <c:set var="k" value="apple"/>
 
 <c:set var="m" value="<%= new int[]{1,5,3,2,4} %>"/>
 <c:forEach items="${m}" var="n" varStatus="status">
  m[${status.index}] = ${n}<br>
  
 </c:forEach>
 배열 크기 : ${fn:length(m)}
 글자 크기 : ${fn:length(k)}
</body>
</html>