<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String code = request.getParameter("code");
	String viewPageUrl = null;
	
	if(code.equals("a") ){
		viewPageUrl = "/days08/ex04_a.jsp";
	} else if(code.equals("b") ){
		viewPageUrl = "/days08/ex04_b.jsp";
	} else if(code.equals("C") ){
		viewPageUrl = "/days08/ex04_c.jsp";
	}
%>
<jsp:forward page="<%= viewPageUrl %>"/>