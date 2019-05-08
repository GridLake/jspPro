<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오전 10:37:19</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 
 p.145 커넥션 풀(Connection Pool)
 > 책 - 자카르타 프로젝트 DBCP 사용하는 방법
 > 톰캣(WAS) 서버가 제공하는 커넥션 풀 사용
   1. tomcat-dbcp.jar   WEB-INF/lib 폴더에 추가
   2. META-INF 폴더   context.xml 파일 추가
   3. web.xml  설정 추가
   
  com.util.
  ConnectionProvider 클래스
  -->
 <%
 Context initContext = new InitialContext();
 Context envContext  = (Context)initContext.lookup("java:/comp/env");
 DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
 Connection conn = ds.getConnection();
 %>
 <%= conn %><br>
 <%
  Connection conn2 = ConnectionProvider.getConnection();
 %>
 <%= conn2 %><br>
 <%
     // 커넥션 풀에 다시 반환
     if( conn != null )  conn.close();
     if( conn2 != null ) conn2.close();
 %>
</body>
</html>