<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  
  // response.sendRedirect(location);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 26. - 오전 9:07:26</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
	
	   <%-- $('form').append($('<input type="text" name="name" value="'+ <%= name %> +'">')); --%>
	   $('form').append($('<input>').attr({ type:'text',name:'name', value:'<%= name %>'}));
	   $('form').append($('<input>').attr({ type:'hidden',name:'age', value:'<%= age %>'}));
	   
	   $('#prev').click(function (){
		   //history.back();
		   location.href = "test02.jsp";
	   });
 });
</script>
<body>
 <form action="test02_03.jsp" method="post">
 address : <input type="text" name="addr" value="서울시 강남구 역삼동" /><br>
 tel : <input type="text" name="tel" value="02-0000-0000" /><br>
 <input type="submit" value="다음"/>
 <input type="button" id="prev" value="이전"/>
 <!-- 
 <a href="test02.jsp">이전</a>
 <a href="test02_03.jsp">다음</a>
  -->
 </form>
</body>
</html>