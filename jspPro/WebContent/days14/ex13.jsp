<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<%
 // request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 15. - 오후 2:38:07</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.324 숫자 및 날짜 포맷팅 처리 태그 -->
 <%-- 
 숫자 출력, 파싱 태그
 <fmt:formatNumber></fmt:formatNumber>
 <fmt:parseNumber></fmt:parseNumber>
 
 날짜 출력, 파싱 태그
 <fmt:formatDate value=""/>
 <fmt:parseDate></fmt:parseDate>
 
 시간대 설정 태그
 <fmt:setTimeZone value=""/>
 <fmt:timeZone value=""></fmt:timeZone>
  --%>
 <c:set var="price" value="10000"></c:set>
 <!-- 세자리 마다 콤마 찍어서 출력 10,000 -->
 <fmt:formatNumber value="${price}" type="number" var="numberType"></fmt:formatNumber>
 숫자: ${numberType}
 <br>
 통화: <fmt:formatNumber value="${price}" type="currency" currencySymbol="\\"/>
 <br>
 퍼센트: <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/>
 <br>
 패턴 지정: <fmt:formatNumber value="${price}" pattern="00000000.00"/>
 <hr>
 <c:set value="1,100.12" var="money"/>
 <!-- "1,100.12" -> 1,100.12  문자열->숫자(.) 변환 -->
 <fmt:parseNumber value="${money}" pattern="0,000.00" var="n"/>
 ${n}
</body>
</html>