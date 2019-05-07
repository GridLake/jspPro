<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A") ){
		viewPageURI = "/days08/a.jsp";
	}else if(code.equals("B") ){
		viewPageURI = "/days08/b.jsp";
	}else if(code.equals("C") ){
		viewPageURI = "/days08/c.jsp";
	}
%>
<jsp:forward page="<%=viewPageURI %>"/>