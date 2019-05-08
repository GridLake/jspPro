<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex01_cookieAuth.jsp" %>
<%
 // 1. 쿠키 삭제
 
 //   ㄱ. 쿠키 새로 생성
        Cookie cookie = Cookies.createCookie("auth", "", "/", -1);
 //   ㄴ. setMaxAge(0)
 		cookie.setMaxAge(0);
 //   ㄷ. response.addCookie()
 		response.addCookie(cookie);
 
 // 2. 로그아웃되었다 경고창 + default.jsp 이동
%>

<script>
 alert("[<%= auth %>]님 로그아웃 되었습니다");
 location.href = "ex01_default.jsp";
</script>