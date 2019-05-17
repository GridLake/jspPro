<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 2:09:51</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.312 -->
 <%
  FileReader reader = null;
  try {
	  String path = request.getParameter("path");
	  reader = new FileReader(getServletContext().getRealPath(path));
 %>
 <pre>
 소스 코드 = <%= path %>
 <c:out value="<%= reader %>" escapeXml="true"/>
 </pre>
 <%
  } catch(IOException e) {
 %>
 에러: <%= e.getMessage() %>
 <%  
  } finally {
	  if(reader != null) {
		  try {
			  reader.close();
		  } catch(IOException e) {
			  
		  }
	  }
  }
 %>
 
 <!-- p.311 c:out 태그 -> 출력 -->
 <%
  // JSP 기본 객체: out 객체
  // out.print()
  // out.append();
 
  // 서블릿
  // PrintWriter out = response.getWriter()
  // out.print();
  // out.append();
 %>
 <!-- out 태그는 JSPWriter에 데이터를 출력할 때 사용하는 태그 -->
 <%-- 
 <c:out value="출력할값" default="" escapeXml=""></c:out>
 default 속성? value 속성에 출력할 값을 설정하지 않았을 경우 기본 출력값 설정
 escapeXml 속성? true로 설정되면 	(기본값 true)
 				<  &lt;
 				>  &gt;
 				&  &amp;
 				'  &#139;
 				"  &#034;
 				자동 변환
  --%>				
</body>
</html>