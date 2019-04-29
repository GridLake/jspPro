<%@page import="days04.DeptEmpDTO"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
     ArrayList<DeptDTO> deptList = (ArrayList<DeptDTO>) request.getAttribute("deptList");
     ArrayList<DeptEmpDTO> empList = (ArrayList<DeptEmpDTO>) request.getAttribute("empList");
     // String [] deptnos =  request.getAttribute("deptnos");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 29. - 오전 9:04:28</title>
</head>
<style>
  /* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
<!-- table style -->
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
<!-- exec style -->
<style>
.exec {
  display: block;
  width: 100%;
  border: none;
  background-color: #4CAF50;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

.exec:hover {
  background-color: #ddd;
  color: black;
}
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>

 <h3>부서 선택 :</h3>
 <form action="/jspPro/employees.do" method="get">
<label class="container">ACCOUNTING
  <input type="checkbox" name="deptno" value="10" checked="checked">
  <span class="checkmark"></span>
</label>
<label class="container">RESEARCH
  <input type="checkbox" name="deptno" value="20" checked="checked">
  <span class="checkmark"></span>
</label>
<label class="container">SALES
  <input type="checkbox" name="deptno" value="30">
  <span class="checkmark"></span>
</label>
<label class="container">OPERATIONS
  <input type="checkbox" name="deptno" value="40">
  <span class="checkmark"></span>
</label>
<button class="exec">확인 버튼</button>
</form>
<h3>사원 출력</h3>
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
  <c:forEach items="${ list }" var="dto">
  <%
   int no = 1;
  %>
  <tr><td><%=no++ %></td><td>${dto.deptno}</td><td>${dto.dname}</td><td>${dto.empno}</td><td>${dto.ename}</td><td>${dto.mgr}</td><td>${dto.job}</td><td>${dto.hiredate}</td><td>${dto.sal}</td><td>${dto.comm}</td><td>${dto.pay}</td></tr>
  </c:forEach>
  </tbody>
</table>

 <%-- 
<form action="/jspPro/employees.do">
<h3>부서 선택 :</h3>  
<%
   Iterator<DeptDTO> ir = deptList.iterator();
   while(ir.hasNext()){
	   DeptDTO dto = ir.next();	   
%>
<label class="container"><%= dto.getDname() %>
  <input type="checkbox" name="deptno"  value="<%=  dto.getDeptno()  %>">
  <span class="checkmark"></span>
</label>
<%
   }
%> 
<button type="submit" class="exec">확인 버튼</button>
</form>
<script>
  // alert(  location.href );
  //var url = "http://localhost/jspPro/employees.do?deptno=10&deptno=30";  
  var url = location.href;  
  var pattern = /[?&]/
  var result =  url.split(pattern);
  for (var i = 0; i < result.length; i++) {
	  if( result[i].indexOf("deptno=") != -1)	     
	     var v = result[i].replace("deptno=", "");
	  $(':checkbox[value='+ v +']').prop('checked','true');
  }
  
  /*
  var values = [];
  for (var i = 0; i < result.length; i++) {
	  if( result[i].indexOf("deptno=") != -1)
	      //console.log ( result[i].replace("deptno=", "") );
	     values.push(result[i].replace("deptno=", ""));
   }
  // alert( values.toString() )
  for (var i = 0; i < values.length; i++) {
	  $(':checkbox[value='+ values[i] +']').prop('checked','true');
  }
   */
  
</script>

<h3>사원 출력</h3>
<table id="employees">
  <thead>
  <tr>
    <th>no</th>
    <th>deptno</th>
    <th>dname</th>
    <th>empno</th>
    <th>ename</th>
    <th>job</th>
    <th>mgr</th>
    <th>hiredate</th>
    <th>sal</th>
    <th>comm</th>
    <th>pay</th>
  </tr>
  </thead>
  <tbody>

<%
  if( empList == null ){
 %>
   <tr>
     <td colspan="11" style="height: 100px;text-align: center;">사원이 존재하지 않습니다.</td>
   </tr>
 <%  
  }else{
%>
<%
   int no = 1;
   Iterator<DeptEmpDTO> ir2 = empList.iterator();   
   while(ir2.hasNext()){
	   DeptEmpDTO dto = ir2.next();
%>
 <tr>
   <td><%= no++ %></td>
   <td><%= dto.getDeptno() %></td>
   <td><%= dto.getDname() %></td>
   <td><%= dto.getEmpno() %></td>
   <td><%= dto.getEname() %></td>
   <td><%= dto.getMgr() %></td>
   <td><%= dto.getJob() %></td>   
   <td><%= dto.getHiredate() %></td>
   <td><%= dto.getSal() %></td>
   <td><%= dto.getComm() %></td>
   <td><%= dto.getPay() %></td>
</tr>
<%	   
   }
 %> 
<%	   
 }
 %>   
  </tbody>
</table>



<h3>types of  job</h3>
<select id="job">
  <option>ANALYST</option>
  <option>ARTIST</option>
  <option>CLERK</option>
  <option>MANAGER</option>
  <option>PRESIDENT</option>
  <option>SALESMAN</option>
</select>

<script>
    /* 
	$("#employees tbody tr").each(function (){
		$('td:eq(4)',this).prepend(   $('#job').clone()  );
	}); 
	 */
   /* 
   $("#employees tbody tr").each(function (){
	   $(this).find("td:eq(4)").append($('#job').clone());
   });
   */
   //$( "#job" ).clone().prependTo( );
</script>
 --%>
</body>
</html>