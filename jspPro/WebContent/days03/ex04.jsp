<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오후 2:01:16</title>
</head>
<style>
/* 
 .chip {
   display: inline-block;
   padding: 0 25px;
   height: 50px;
   font-size: 16px;
   line-height: 50px;
   border-radius: 25px;
   background-color: #f1f1f1;
 }

 .chip img {
   float: left;
   margin: 0 10px 0 -25px;
   height: 50px;
   width: 50px;
   border-radius: 50%;
 }
  */
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>

<!-- 주로 value = "pk" -->
<form action="get">
 <select id="deptno" name="deptno">
  <option value="">선택하세요</option> <!-- 첫번째 방법, 두번째는 클릭이벤트로 할 순 있으나 스킵 -->
  <option value="10">ACCOUNTING</option>
  <option value="20">RESEARCH</option>
  <option value="30">SALES</option>
  <option value="40">OPERATIONS</option>
 </select>
</form>

 <script>
  $("#deptno").change(function() {
	  // console.log($(this).val()); // deptno
	  // var deptno = $(this).val();
	  
	  // 서블릿의 url-pattern: /days03/ex04_emp
	  $("form")
	  .attr("action", "ex04_emp")
	  .submit();
  });
 </script>
</body>
</html>