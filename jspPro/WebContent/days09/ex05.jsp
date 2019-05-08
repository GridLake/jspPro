<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 // 세션 타임아웃: 단위(초)
 // session.setMaxInactiveInterval(30 * 60);

 // <session-timeout> 값을 0 또는 음수로 설정하면 유효시간 갖지 않음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오후 2:12:43</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%
  session.invalidate();
 %>
 세션 종료하였습니다
 <!-- p.237 세션 종료 -->
 <!-- 
 세션을 유지할 필요가 없으면 session.invalidate() 메소드를 사용해서 세션을 종료한다
 ㄱ. session 기본 객체에 저장된 모든 속성 목록도 삭제
 ㄴ. session 기본 객체 그 자체도 삭제
  -->
 
 <!-- p.239 세션 유효 시간 -->
 <!-- p.241 request.getSession()을 이용한 세션 생성 -->
 JSP 페이지에서는 session 객체로 세션 사용
 <form action="ex05.do">
  name = <input type="text" name="name" value="admin"/><br>
  age = <input type="text" name="age" value="20"/><br>
  <input type="submit" />
 </form>
</body>
</html>