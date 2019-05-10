<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String referer = request.getHeader("Referer");

 String memberId = request.getParameter("memberId");
 session.setAttribute("MEMBER", memberId);
 
 if(referer.indexOf("ex01_loginForm.jsp") != -1)
	 referer = "http://localhost/jspPro/days11/ex01.jsp?ok";
%>

로그인 처리
