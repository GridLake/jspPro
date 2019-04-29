<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%
 // String id = (String)request.getAttribute("id");
 ArrayList<DeptDTO> list = (ArrayList<DeptDTO>)request.getAttribute("list");
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오전 11:34:17</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%-- id = <%= id %> --%>
 <%-- id = ${id} --%>
 <select name="deptno" id="deptno">
 <c:forEach items="${ list }" var="dto">
  <option value="${dto.deptno}">${dto.dname}</option>
 </c:forEach>
 <%-- 
 <%
  Iterator<DeptDTO> ir = list.iterator();
  while(ir.hasNext()) {
	  DeptDTO dto = ir.next();
 %>
  <option value="<%=dto.getDeptno() %>"><%= dto.getDname()%></option>
 <%
  }
 %>
  --%>
 
 </select>
 
 
 <ul>
 <c:forEach items="${ list }" var="dto">
  <li> ${ dto.dname } </li>
 </c:forEach>
 <%-- 
 <%
  ir = list.iterator();
  while(ir.hasNext()) {
	  DeptDTO dto = ir.next();
 %>
  <li><%= dto.getDname() %></li>
 <%
  }
 %>
  --%>
 </ul>
</body>
</html>