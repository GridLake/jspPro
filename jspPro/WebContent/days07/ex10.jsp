<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 3:05:34</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 main.jsp에서 생성한 내용<br>
 
 content 출력 부분...<br>
 content 출력 부분...<br>
 content 출력 부분...<br>
 content 출력 부분...<br>
 content 출력 부분...<br>
 
 <jsp:include page="ex10_sub.jsp" flush="false"></jsp:include>
 
 <a href="ex11.jsp?user=admin">ex11.jsp</a>
 <a href="ex11.jsp?user=hong">ex11.jsp</a>
 <%-- 
 layout 관련
 
 p.155 [페이지 모듈화]와 [요청 흐름 제어]
 ㄱ. include 액션 태그 <jsp:???> 액션태그
 ㄴ. include 지시자
     (※ 지시자는 3개 : page, taglib, include)
  --%>
 
</body>
</html>