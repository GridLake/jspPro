<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 // ?ckb_cookie = [a]&ckb_cookie=[admin]
 String[] delete_cnames = request.getParameterValues("ckb_cookie");
 // 1. 삭제할 쿠키 존재 확인
 Cookies cookies = new Cookies(request);
 for(int i = 0; i < delete_cnames.length; i++) {
	 String cname = delete_cnames[i];
	 if(cookies.exists(cname)) {
		// 2. 쿠키 객체 새로 생성 + setMaxAge(0)
		Cookie cookie = new Cookie(cname, "");
		cookie.setPath("/"); // 줬던 대로 추가해줘야 제대로 찾아감
		cookie.setMaxAge(0);
		// 3. response.addCookie()
		// 서버에서 브라우저로 쿠키 삭제하라는 "명령" 전달(삭제는 브라우저가 한다)
		response.addCookie(cookie);
	 }
 }
 // response.sendRedirect("ex08_getCookie.jsp"); // 브라우저 상관없이 서버에서 명령 전달
%>
<script>
 alert("쿠키 삭제 완료");
 location.href="ex08_getCookie.jsp"; // 스크립트로 브라우저한테 넘겨줌
</script>