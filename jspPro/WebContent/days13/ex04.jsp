<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오후 2:07:09</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%
  String title = "jsp & servlet";
  request.setAttribute("title", title);
 %>
 <%-- 
 ${"책제목: " += title += "입니다"}<br>
 
 <hr>
 <!-- 
 비교 선택 연산자(삼항 연산자)     수식 ? 참값 : 거짓값 
 -->
 ${ 4 > 6 ? 100 : 200 }<br>

 <!-- p.261 empty 연산자 -->
 ${ empty null } - true<br>
 ${ empty "" } - true<br>
 ${ empty 0 } - false<br>
 ${ empty 빈맵 또는 빈컬렉션 } - true<br>
 이 외에는 전부 empty 연산자 사용하면 false


 <hr>
 <%
  request.setAttribute("name", "admin");
 %>
 ${requestScope.name == "admin"}<br>
 
 <hr>
 ${null + 100} == 100<br> 
 
 <!-- EL 산술 연산자 -->
 ${3 + 5}<br>
 ${3 - 5}<br>
 ${3 * 5}<br>
 ${3 / 5}<br>
 ${3 % 5} - ${3 mod 5}<br>
 ${-3}<br>

 ${A + B}, ${A - B}, ${A * B}
 A, B null 이면 Long 0 반환

 <!-- p.260 EL 비교 연산자(6가지) -->
 ${3 == 3} - ${3 eq 3}<br>
 ${3 != 3} - ${3 ne 3}<br>
 ${3 > 3} - ${3 gt 3}<br>
 ${3 < 3} - ${3 lt 3}<br>
 ${3 >= 3} - ${3 ge 3}<br>
 ${3 <= 3} - ${3 le 3}<br>
 
 <!-- EL 논리 연산자(3가지) -->
 ${true && true} - ${true and true}<br>  
 ${true || true} - ${true or true}<br>  
 ${!true} - ${not true}<br>
   --%> 
</body>
</html>