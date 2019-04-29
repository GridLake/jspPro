<%@page import="days04.DeptEmpDTO"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP/Servlet Class - 2019. 4. 29. - 오전 9:04:28</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
</head>
<style>
#employees {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#employees td, #employees th {
  border: 1px solid #ddd;
  padding: 8px;
}

#employees tr:nth-child(even){background-color: #f2f2f2;}

#employees tr:hover {background-color: #ddd;}

#employees th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<body>
<h3>부서 선택 :</h3>  

<div id="tabs">
  <ul>
   <c:forEach items="${deptList}" var="dto">
    <li><a href="#tabs-${dto.deptno}">${dto.dname}</a></li>
   </c:forEach>
  </ul>
  
  <c:forEach items="${deptList}" var="d_dto">
   <div id="tabs-${d_dto.deptno}">
     <table id="employees">
  <thead>
  <tr>
    <th>no</th>
    <th>deptno</th>
    <th>dname</th>
    <th>empno</th>
    <th>ename</th>
    <th>mgr</th>
    <th>job</th>
    <th>hiredate</th>
    <th>sal</th>
    <th>comm</th>
    <th>pay</th>
  </tr>
  </thead>
  <tbody>
  
       <c:forEach items="${ empList }" var="dto"  varStatus="status">
        <%-- <c:if test="${dto.deptno == d_dto.deptno}"> --%>
        <c:if test="${dto.deptno eq d_dto.deptno}">
         <tr>
		   <td>${ status.count }</td>
		   <td>${ dto.deptno }</td>
		   <td>${ dto.dname }</td>
		   <td>${ dto.empno }</td>
		   <td>${ dto.ename }</td>
		   <td>${ dto.mgr }</td>
		   <td>${ dto.job }</td>   
		   <td>${ dto.hiredate }</td>
		   <td>${ dto.sal }</td>
		   <td>
		   <%-- 
		   <select>
		     <c:forEach items="${ jobList }" var="job">
		       <option value="${ job }">${ job }</option>
		     </c:forEach>
		   </select>
		    --%>
		   ${ dto.comm }
		   </td>
		   <td>${ dto.pay }</td>
		 </tr>
		</c:if>
       </c:forEach>
      
     </tbody>
    </table>
   </div>
  </c:forEach>
  
</body>
</html>