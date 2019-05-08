<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String auth = null;
 Cookies cookies = new Cookies(request);
 if(cookies.exists("auth")) {
	   auth = cookies.getValue("auth");
 }
%>