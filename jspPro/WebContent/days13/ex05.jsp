<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 2:24:25</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
  ${3 % 5} - ${3 mod 5}<br>
 
 <hr>
 m 변수에 배열값만 할당 + 출력 X( ;''의 의미)
 ${m === [1, 2, 3];''}
 ${m[0]}<br>
 <!-- EL 할당 연산자 age 변수에 20 값을 할당 -> 출력 -->
 ${age = 20}
 <hr>
 <%
  String name = "admin";
  request.setAttribute("name", name);
 %>
 ${name}
 <!-- EL 세미콜론 연산자 -->
 ${ 1 + 1; 10 + 10 }<br>
 
</body>
</html>