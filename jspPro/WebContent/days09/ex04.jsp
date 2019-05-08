<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 // String empno = (String)session.getAttribute("empno");
 // String ename = (String)session.getAttribute("ename");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오후 2:05:10</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%-- 
 <li>empno: <%= empno %></li>
 <li>ename: <%= ename %></li>
  --%>
 <h3>EL (표현 언어)수정</h3>
 <li>empno: ${sessionScope.empno}</li>
 <li>ename: ${ename}</li>
</body>
</html>