<%@page import="java.util.Date"%>
<%@page import="days08.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> jsp/servlet class - Ljm (2019. 5. 7.-오전 10:35:35)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){ 
		
	});
</script>
<style>
</style>
</head>
<body>
<!-- 190p 자바빈과 jsp:useBean 액션 태그 -->
<!-- 
	자바빈(javabeans) : jsp 기반 웹 애플리케이션에서 정보를 표현하기 위한 클래스(객체);
	 ex) 회원 정보, 게시판 글 정보 출력.
	 	boradDTO (== 자바빈)
	 	
	 jsp:useBean 액션태그 == 자바빈
	 DTO/VO
	 
	  속성(데이터), 변경 이벤트, 객체 직렬화 를 위한 표준. ( 서블릿 규약, 자바빈 규약 )
	  JSP에서는 속성을 표현하기 위한 용도로 사용된다. => 자바빈
	  
	  1. 직렬화 : implements Serializable			
	  2. 값을 저정하는 private 필드
	  3.				get~, set~
 -->
<!--  scope = page(d) , request, session, application -->
<%--  <jsp:useBean id="빈(bean) 이동 class="자바빈클래스이름(풀클래스)"scope="page"></jsp:useBean> --%>
<jsp:useBean id="info" class="days08.MemberInfo"></jsp:useBean>
<!-- set 기본 내장 -->
<jsp:setProperty property="id" name="info" value="admin"/>
<jsp:setProperty property="password" name="info" value="1234"/>
<jsp:setProperty property="name" name="info" value="관리자"/>
<jsp:setProperty property="email" name="info" value="admin@naver.com"/>
<jsp:setProperty property="registerDate" name="info" value="<%=new Date() %>"/>

아이디 : <jsp:getProperty property="id" name="info"/> <br>
 이름 : <jsp:getProperty property="name" name="info"/>  <br>
 비밀번호 : <jsp:getProperty property="password" name="info"/> <br>
 이메일 : <jsp:getProperty property="email" name="info"/> <br>
 등록일 : <jsp:getProperty property="registerDate" name="info"/> <br>
 
 <%-- 
<!--  MemberInfo.java 사용 -->
 	MemberInfo info = new MemberInfo();
 	info.setId("admin");
 	info.setPassword("1234");
 	info.setName("관리자");
 	info.setEmail("admin@naver.com");
 	info.setRegisterDate(new Date() );
 %>
 
 아이디 : <%=info.getName() %> <br>
 이름 : <%=info.getName() %> <br>
 비밀번호 : <%=info.getPassword() %> <br>
 이메일 : <%=info.getEmail() %> <br>
 등록일 : <%=info.getRegisterDate() %> <br>
  --%>
  
</body>
</html>