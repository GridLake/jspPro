<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 2:01:34</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 
 p.139
 ㄱ. pageContext 영역: 주로 커스텀 태그에서 새로운 변수를 추가할 때 사용
     				   (custom tag: 사용자가 만든 태그)
 *** ㄴ. request 영역
 *** ㄷ. session 영역    : 예) 로그인 인증/권한
 ㄹ. application 영역: 웹 어플리케이션(웹사이트) 설정 정보
                       예) 임시 폴더 경로
 MVC 패턴(모델 2 방식)
  -->
  
 <!-- p.140 에러 처리 -->
 <!-- WebContent > error 폴더 추가 > viewErrorMessage.jsp -->
 
 <!-- viewErrorMessage.jsp로 포워딩 -->
 name 파라미터값: <%= request.getParameter("name").toUpperCase() %>
 <%-- 
 <%
   try {
 %>
 name 파라미터값: <%= request.getParameter("name").toUpperCase() %>
 <%   
   } catch(Exception e) {
 %>   
   에러 발생...
   에러 페이지로 이동...
 <%
   }
 %>
  --%>
</body>
</html>