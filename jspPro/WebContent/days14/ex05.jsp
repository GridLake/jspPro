<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오전 10:26:21</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <form action="">
 국어점수: <input type="text" name="kor"/>
 </form>
 <div id="demo">
 <%-- 
 <%
  int score = Integer.parseInt(request.getParameter("kor") == null ? "100" : request.getParameter("kor"));
  if(score / 10 == 9 || score == 100) {
 %>수<%
  } else if(score / 10 == 8) {
 %>우<%
  } else if(score / 10 == 7) {
 %>미<%	  
  } else if(score / 10 == 6) {
 %>양<%	  
  } else if(score / 10 >= 0 && score / 10 <= 5) {
 %>가<%
  } else
 %>잘못 입력하셨습니다<%
 %>
  --%>
 
 <%-- EL 태그에서는 ${97/10} -> 9.7로 나옴 --%>
 
 <c:choose>
  <c:when test="${param.kor / 10 >= 9 || param.kor == 100}">
   수
  </c:when>
  <c:when test="${param.kor / 10 >= 8}">
   우
  </c:when>
  <c:when test="${param.kor / 10 >= 7}">
   미
  </c:when>
  <c:when test="${param.kor / 10 >= 6}">
   양
  </c:when>
  <c:when test="${param.kor / 10 >= 0 && param.kor / 10 < 6}">
   가
  </c:when>
 </c:choose>
 </div>
</body>
</html>



<%-- 
	<%
	    String grade ="";
	    String pKor = request.getParameter("kor");
	    if( pKor == null ) return;
	    int kor = Integer.parseInt( pKor );
	    switch(kor/10){
		     case 10: case 9: grade="수"; break;
		     case 8: grade="우"; break;
		     case 7: grade="미"; break;
		     case 6: grade="양"; break;
		     default: grade="가"; break;
	    }
	%>
	<%= grade %>
 --%>
<%-- 
<c:choose>
  <c:when test="${ 90 le param.kor && 100 ge param.kor  }">수</c:when>
  <c:when test="${ 80 <= param.kor }">우</c:when>
  <c:when test="${ 70 le param.kor }">미</c:when>
  <c:when test="${ 60 le param.kor }">양</c:when>
  <c:otherwise>가</c:otherwise>
</c:choose>
 --%> 
<%--   
<c:choose>
  <c:when test="${ 90 le param.kor && 100 ge param.kor  }"><c:set var="grade" value="수" /></c:when>
  <c:when test="${ 80 <= param.kor }"><c:set var="grade" value="우" /></c:when>
  <c:when test="${ 70 le param.kor }"><c:set var="grade" value="미" /></c:when>
  <c:when test="${ 60 le param.kor }"><c:set var="grade" value="양" /></c:when>
  <c:otherwise><c:set var="grade" value="가" /></c:otherwise>  
</c:choose>

${ grade }
 --%>
