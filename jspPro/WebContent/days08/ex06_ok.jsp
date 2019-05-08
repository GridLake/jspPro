<%@page import="days08.MemberInfo"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jsp:action 태그 사용 -->

<%-- 
<% 
 String id = request.getParameter("id");
 String name = request.getParameter("name");
 String password = request.getParameter("password");
 String email = request.getParameter("email");
%>
 --%>

<jsp:useBean id="info" class="days08.MemberInfo" scope="request"></jsp:useBean>
<!-- 조건 : name 속성값이 useBean 에있는 변수명과 같아야 한다. -->
<jsp:setProperty property="*" name="info"/>

<%--  
<jsp:setProperty property="id" name="info" value="<%= id %>"/>
<jsp:setProperty property="name" name="info" value="<%= name %>"/>
<jsp:setProperty property="password" name="info" value="<%= password %>"/>
<jsp:setProperty property="email" name="info" value="<%= email %>"/>
 --%>
<jsp:setProperty property="registerDate" name="info" value="<%= new Date() %>"/>

<!-- 담은 값을 ex06_last.jsp 로 넘기는 역할 -->
<jsp:forward page="ex06_last.jsp"></jsp:forward>
<%-- 
 아이디   : <jsp:getProperty property="id" name="info"/> <br>
 이름     : <jsp:getProperty property="name" name="info"/>  <br>
 비밀번호 : <jsp:getProperty property="password" name="info"/> <br>
 이메일   : <jsp:getProperty property="email" name="info"/> <br>
 등록일   : <jsp:getProperty property="registerDate" name="info"/> <br>
 --%>
<%-- 
<% 	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	MemberInfo info = new MemberInfo();
 	info.setId(id);
 	info.setName(name);
 	info.setPassword(password);
 	info.setEmail(email);
 	info.setRegisterDate(new Date());
 %>
 
 아이디   : <%= info.getId() %> <br>
 이름     : <%= info.getName() %> <br>
 비밀번호 : <%= info.getPassword() %> <br>
 이메일   : <%= info.getEmail() %> <br>
 등록일   : <%= info.getRegisterDate() %> <br>
  --%>