<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
     ArrayList<DeptDTO> list = (ArrayList<DeptDTO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오후 4:18:43</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 스크립트릿, 표현식,html  -> JSTL -->
<%
   Iterator<DeptDTO> ir = list.iterator();
   while(ir.hasNext()){
	   DeptDTO dto = ir.next();
%>
<li> <%= dto.getDeptno() %>/<%= dto.getDname() %>/<%= dto.getLoc() %>  </li> 
<%	   
   }
 %> 
</body>
</html>