<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 12:23:46</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%
   String name = "admin";
   pageContext.setAttribute("pc_name", name); // EL 태그를 사용하기 위해서 필요한 코드
   request.setAttribute("age", 20);
   session.setAttribute("addr", "강남구");
   application.setAttribute("tel", "010-1111-2222");
   
   RequestDispatcher rd = request.getRequestDispatcher("ex06.jsp");
   rd.forward(request, response);
   // 브라우저가 다른데도 유지됨-> 확인 필요
 %>
 
 <!-- 아무런 언급 없어도 4 영역을 다 확인함 -->
 이름 : <%= name %> / ${pc_name}<br>
 나이 : <%= request.getAttribute("age") %> / ${age}<br>
 주소 : ${addr}<br>
 연락처 : ${tel}<br>
 
 <a href="ex06.jsp">ex06.jsp</a>
 <!-- 
 p.132~ JSP 영역(Scope)
  -->
 <!-- 
   웹 어플리케이션의 영역: (4가지 영역 구성)
   1. page 영역		   : 하나의 [JSP 페이지]만 사용하는 영역	 - [pageContext 객체]
   2. request 영역	   : 하나의 [요청]을 처리할 때 사용하는 영역 - request 객체
   3. session 영역	   : 하나의 [웹 브라우저]와 관련된 영역		 - response 객체
   4. application 영역 : 하나의 [웹 어플리케이션]과 관련된 영역  - application 객체
   
   범위 : 1 < 2 < 3 < 4
  -->
</body>
</html>