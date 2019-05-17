<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오전 11:25:21</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.303 c:forEach 흐름제어 태그 -->
 <!-- 
 c:forEach 태그는 배열, 컬렉션 또는 Map에 저장되어 있는 값들을
 순차적으로 처리할 때 사용하는 태그
 
 Java의 while, for문과 동일
  -->
 
 <!-- Java for문 for(int i=1; i<=10; i++) {} -->
 <c:set var="sum" value="0"/>
 <c:forEach begin="1" end="10" step="1" var="i">
  <c:set var="sum" value="${sum + i}"/>
  <c:choose>
   <c:when test="${i < 10}">
    ${i}+
   </c:when>
   <c:otherwise>
    ${i}
   </c:otherwise>
  </c:choose>
 </c:forEach>
 =${sum}
</body>
</html>