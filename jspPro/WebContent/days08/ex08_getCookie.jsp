<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 7. - 오후 2:43:59</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- ex08_getCookie.jsp -->
 <h3>쿠키 목록</h3>
 <form id="form1">
  <%
   Cookies cookies = new Cookies(request);
   Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
   Iterator <Entry<String, Cookie>> ir = set.iterator();
   while(ir.hasNext()) {
	   Entry<String, Cookie> entry = ir.next();
	   String cname = entry.getKey();
	                        // 쿠키의     value
	   String cvalue = entry.getValue().getValue();
  %>
   <input type="checkbox" name="ckb_cookie" value="<%= cname %>"/>
   <%= cname %>=<%= cvalue %><br>
  <%
   }
  %>
  <a href="ex08.jsp">Home</a>
  <a href="ex08_editCookie.jsp" id="editLink">쿠키 수정</a>
  <a href="ex08_deleteCookie.jsp" id="deleteLink">쿠키 삭제</a>
 </form>
 
 <script>
  $("#deleteLink, #editLink").click(function (event) {
	  
	  // 기본 이벤트 막아놓고, 클릭하는 링크에 따라 동적으로 이벤트 발생시킨다
	  // 그러려면 클릭한 놈의 href를 attr로 넘겨준다
	  event.preventDefault(); 
	  var queryString = $("#form1").serialize(); // ***** 반드시 기억
	  location.href = $(this).attr("href") + "?" + queryString;
	  // ckb_cookie=a&ckb_cookie=c&ckb_cookie=JSESSIONID  => 뒤에 붙일 파라미터를 자동으로 생성한다
	  
	  // location.href = $(this).attr("href") + "?ckb_cookie=???&ckb_cookie=???";
	  
	  
	  /* 
	  $("#form1").attr("action", $(this).attr("href"));
	  $("#form1").submit();
	  */
	  
  });
 </script>
</body>
</html>