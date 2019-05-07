<%@page import="java.net.URLEncoder"%>
<%@page import="com.util.Cookies"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
 // 쿠키이름, 쿠키값 ?a=x&c=y
 Cookies cookies = new Cookies(request);
 
 Enumeration<String> en = request.getParameterNames();
 while(en.hasMoreElements()) {
	 String cname = en.nextElement();
	 String cvalue = request.getParameter(cname);
	 
	 Cookie cookie = new Cookie(cname, URLEncoder.encode(cvalue, "UTF-8"));
	 cookie.setPath("/");
	 // Cookie cookie = cookies.createCookie(cname, cvalue, "/", -1);
	 response.addCookie(cookie);
 }
%>

<script>
 alert("쿠키 수정 완료");
 location.href = "ex08_getCookie.jsp";
</script>