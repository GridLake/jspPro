<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 22. - 오전 11:03:03</title>
</head>
<style>
 
</style>
<script>
$(document).ready(function(){
	// jquery.ajax()
	$("#jsontest").click(function (){
	 
		$.ajax({
			url:"ex02_emp_json.jsp"
			,dataType:"json"
			,type:"get"
			,cache:false // 변화가 있어도 응답이 안되는 경우가 있으므로, cache는 웬만하면 false로 쓰자
			,success:function(data){ // callback 기능
				$(data.emp).each(function (index, e){
					var info =  e.empno+" / " + e.ename ;
					$("#demo").append("<div>"+ info +"</div>");
				});
			}
		    ,error:function(){
		    	alert("에러~~~~")
		    } 
		});
	});
	
});
</script>
<body>
 <%
    Date now = new Date();
 %>
<h3><%= now.toLocaleString() %></h3>
<hr>
<input type="button" id="jsontest" value="jquery+ajax+json" />
<div id="demo"></div>
</body>
</html>