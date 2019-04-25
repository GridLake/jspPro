<%@page import="java.util.Map.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 2:30:32</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
  String name = request.getParameter("name");
  String gender = request.getParameter("gender").equals("m") ? "남자" : "여자";
  // checkbox 하나의 이름(pet)으로 여러 개 값이 넘겨질 때...
  String [] pets = request.getParameterValues("pet");
    
%>
이름 : <%= name %><br>
성별 : <%= gender %><br>
동물 :
<%
  for(int i = 0; i < pets.length; i++) {
%>
<%=pets[i] %> / 
<%	  
  }
%>
<br>
<h3>파라미터명 모두 출력</h3>
<ul>
<%
  // 파라미터 이름 반환 메소드
  Enumeration<String> en = request.getParameterNames();

  while(en.hasMoreElements()) {
	  String pname = en.nextElement();
%>
<li><%= pname %></li>
<%
  }
%>
</ul>
<!-- 
 http://localhost/jspPro/days02/ex05.jsp
 ?
 name=%ED%95%A8%EC%B9%98%EC%98%81
 &
 gender=m
 &
 pet=dog
 &
 pet=cat
 &
 etc=%EC%97%86%EC%9D%8C
  -->
<%
  // Map   entry(key, value)
  Map<String, String[]> map = request.getParameterMap();
  Set<Entry<String, String[]>> set = map.entrySet();
  Iterator<Entry<String, String[]>> ir = set.iterator();
  while(ir.hasNext()) {
	  Entry<String, String[]> entry = ir.next();
	  String pname = entry.getKey();
	  String [] pvalues = entry.getValue();
%>
<li>
 <%= pname %>
 -
 <%  
   for(int i = 0; i < pvalues.length; i++) {
	   String pvalue = pvalues[i];
 %>
 <%= pvalue %> /
 <%
   }
 %>
 </li>
<%
  }
%>
</body>
</html>