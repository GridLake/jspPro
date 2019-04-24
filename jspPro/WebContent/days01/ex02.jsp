<%@ page import="java.time.LocalDateTime"%>
<%@ page trimDirectiveWhitespaces="true" import="java.util.Date" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
  // 스크립트릿: JAVA 코딩
  Date now = new Date();
  int age = 20;
  
  String today = getNow();
%>
<%!
  // 선언문: 필드, 메소드
  String name = "홍길동";

  public String getNow() {
	  return LocalDateTime.now().toString();
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 24. - 오전 10:04:07</title>
</head>
<style>
 
</style>
<script>
   $(document).ready(function(){
      
   });
</script>
<body>
 날짜: <input type="text" value="<%= now.toLocaleString() %>" /><br>
 이름: <input type="text" value="<%= name %>" /><br>
 나이: <input type="text" value="<%= age %>" /><br>
 today: <span><%= today %></span><br>
</body>
</html>