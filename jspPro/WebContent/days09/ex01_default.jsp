<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex01_cookieAuth.jsp" %>
<%
   // [ 인증과 권한 ]
   // 권한(등급) : 우수회원, 일반회원 ...
   // 로그인 인증을 거치면 auth 쿠키이름 Id 쿠키값 저장
   // auth 쿠키 존재 X : 로그인 인증 X
   
   /* 공통 변수를 하나의 파일로 관리해보자 
   String auth = null; // 로그인 인증받은 ID 저장하는 문자열 변수
   Cookies cookies = new Cookies(request); // 생성자 hashmap (k: 쿠키이름, v: 쿠키값)
   if(cookies.exists("auth")) {
	   auth = cookies.getValue("auth");
   }
   */
   
   // ex01_default.jsp?error
   String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오전 9:21:25</title>
</head>
<style>
 div {
 	border: solid 1px gray;
 	width: 300px;
 	height: 100px;
 	padding: 20px;
 }
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <h3>default(main) page</h3>
  <%
   if(auth == null) { // 로그인 안한 상태
  %>
   <div id="logon">
      <form action="ex01_logon.jsp">
      아이디 : <input type="text" name="id" value="admin"/><br>
      비밀번호 : <input type="password" name="pass" value="1234" /><br>
   <br>
      <input type="submit" value="로그인" />
      <input type="button" value="회원가입" />
      <br>
   <%
     if(error != null) {
   %>
      <span style="color:red">로그인 실패 했습니다.</span>
   <%
     }
   %>
     </form>
   </div>
  <%
   } else { // 로그인 한 상태
  %>
  <div id="logout">
      [<%= auth %>]님 환영합니다.<br>
   <a href="ex01_logout.jsp">로그아웃</a>
   </div>
  <%
  }
  %>
   <a href="ex01_board.jsp">게시판</a><br>
   <a href="ex01_notice.jsp">공지사항</a><br>
  <%
   if(auth != null) {
  %>
   <a href="#">일정관리</a><br>
   <a href="#">자료실</a><br>
  <%
   }
  %>
   <a href="#">도움말</a><br>
  
  <script>
   $("#logon span").fadeOut(5000);
  </script>
</body>
</html>