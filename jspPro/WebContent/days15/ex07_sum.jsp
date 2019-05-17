<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 16. - 오전 11:37:55</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 1~n 까지의 정수의 합을 출력 -->
 <%-- 
 <c:set var="sum" value="0"/>
 <c:forEach begin="1" end="10" step="1" var="i">
  ${i}+
  <c:set var="sum" value="${sum + i}"/>
 </c:forEach>
 =${sum}
  --%>
 <tf:sum begin="1" end="10">
  1~10까지의 합: ${sum}
 </tf:sum>
</body>
</html>