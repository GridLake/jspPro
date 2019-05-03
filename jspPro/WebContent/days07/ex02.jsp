<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오전 10:06:16</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%
   String path = "/";
 %>
 <%= application.getServerInfo() %><br>
 <%= application.getMajorVersion() %><br>
 <%= application.getMinorVersion() %><br>
 <%= application.getRealPath(path) %><br> <!-- *** 실제 저장되어 있는 물리적 경로 -->
 <!-- 
 webapps 폴더
 ROOT
 jspPro 배포/개시
 url : http://localhost:80/jspPro/board/write
  -->
 <!-- 
 서버 정보 얻어온다
 getServerInfo()
 getMajorVersion()
 getMinorVersion()
  -->
 <!-- 
 p.121 application 기본 객체
 ㄱ. 웹 어플리케이션(웹 사이트)과 관련된 객체
 ㄴ. 웹 어플리케이션의 전반적인 정보를 담고 있는 객체
 ㄷ.                  초기화 설정: web.xml에 <context-param> 태그 추가
     설정값을 얻어와서 사용할 때는 getInitParameter(파라미터명), getInitParameterNames() 사용
 참고) web.xml
   <servlet>
      <init-param> 태그? 하나의 서블릿에 대해 초기화 매개변수 값을 설정해서 사용하도록
  -->
 <%
   // web.xml <context-param> 설정
   Enumeration<String> en = application.getInitParameterNames();
   
   while(en.hasMoreElements()) {
	   String pname = en.nextElement();
	   String pvalue = application.getInitParameter(pname);
 %>
	<%= pname %>/<%= pvalue %><br>
 <%
   // out.println(pname + "/" + pvalue + "<br>");
   }
 %>  
</body>
</html>