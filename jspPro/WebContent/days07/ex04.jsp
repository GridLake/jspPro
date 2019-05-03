<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 12:07:43</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 
 p.129~131
  -->
 <%--  
 <%
   String resourcePath = "/days05/ex01.jsp";
 %>
 자원의 실제 경로: <br>
 <%= application.getRealPath(resourcePath) %>
 <br>
 ----------<br>
 <%= resourcePath %>의 내용<br>
 ----------<br>
 <%
   char[] buff = new char[128];
   int len = -1;
   
   try(InputStreamReader br = new InputStreamReader(
		   application.getResourceAsStream(resourcePath), "UTF-8")) {
	   while((len = br.read(buff)) != -1) {
		   out.print(new String(buff, 0, len));
	   }
   } catch(IOException e) {
	   out.println("익셉션 발생: " + e.getMessage());
   }
 %>
  --%>
 <%
   String resourcePath = "/days05/ex01.jsp";
   char[] buff = new char[128];
   int len = -1;
   URL url = application.getResource(resourcePath);
   try(InputStreamReader br = new InputStreamReader(url.openStream(), "UTF-8")) {
	   while((len = br.read(buff)) != -1) {
		   out.print(new String(buff, 0, len));
	   }
   } catch(IOException e) {
	   out.println("익셉션 발생: " + e.getMessage());
   }
 %>
</body>
</html>