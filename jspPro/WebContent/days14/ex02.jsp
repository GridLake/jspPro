<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board21.member.model.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오전 9:29:36</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.296 변수 지원 태그 -->
 <!-- 
 set 태그    : EL 변수의 값이나 EL 변수의 프로퍼티 값을 지정할 때 사용
 remove 태그 :
  -->
 <%--  
 <c:set var="변수명" value="<%= 표현식 %>, ${EL}, 정적텍스트" scope="기본영역 page, request, session, application"></c:set>
 <c:set var="변수명" scope="기본영역 page, request, session, application">
 "<%= 표현식 %>, ${EL}, 정적텍스트"
 </c:set>
 
 <c:set var="name" value="홍길동" scope="request"></c:set>
 <%
  request.setAttribute("name", "홍길동");
 %>
  --%>
 <%-- (사용 예) 
 <c:set var="name" value="홍길동"></c:set>
 <c:set var="name">홍길동</c:set>
 <c:set var="name" value="<%= request.getParameter("name") %>"></c:set>
 <c:set var="name" value="${param.name}"></c:set>
  --%>
 
 <!-- p.297 -->
 <%-- 
 <c:set target="대상객체(자바빈객체, Map 객체만 가능), <%= 표현식 %>, ${EL}"
 property="속성명==set메소드(자바빈객체), 키(Map)" value="값"></c:set>
  --%>
 
 <%
  Member m = new Member();
  m.setMemberid("admin");
  // m.setName("관리자");
  
  request.setAttribute("m", m);
 %>
 <%= m.getMemberid() %> / ${m.memberid}<br>
 <c:set target="<%= m %>" property="name" value="관리자"></c:set> <!-- Line 54 == Line 59 -->
 <%= m.getName() %>
 
 <!-- 대상 객체 Map 사용하는 예 -->
 <%
  Map<String, String> prop = new HashMap<>();
  prop.put("id", "admin");
 %>
 <c:set target="<%= prop %>" property="name" value="관리자"></c:set>
 <!-- 잘못된 사용 예시  -->
 <%-- 
 <c:set target="${prop}"></c:set>
 <c:set target="prop"></c:set>
  --%>
 <br>
 <%= prop.get("name") %>
 
</body>
</html>