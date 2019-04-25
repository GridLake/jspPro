<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // 리다이렉트
  // response.sendRedirect("ex07_2.jsp");

  String err = request.getParameter("error");
  String ok = request.getParameter("ok");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 3:35:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.90 response(응답) 기본 객체 -->
 <!-- 클라이언트(브라우저)에게 보내는 응답 객체 -->
 <!-- 
 1. 헤더 정보 입력
 2. 리다이렉트 하기(Redirect)
  -->
 <h3>ex07.jsp</h3>
 
 <!-- <form action="ex07_2.jsp"> -->
 <form action="redirect">
 id : <input type="text" name="id" value="admin"/><br>
 pwd : <input type="text" name="pwd" value="1234"/><br>
 <input type="submit" />
 <p>
 <!-- 같은 페이지지만 요청이 두번 일어남 -->
 <%
  if(err != null) {
	  %>로그인 실패<%
  }
  else if(ok != null) {
	  %>로그인 성공<%
  }
 %>
 </p>
 </form>
</body>
</html>