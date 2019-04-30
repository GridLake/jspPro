<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오전 11:10:14</title>
</head>
<style>
 table, td, th {
 	border: solid 1px gray;
 }
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <div align="center">
<h2>목록보기</h2>
<table style="border: solid 1px gray; width: 600px;">
   <tr align="center">
    <td>번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>등록일</td>
    <td>조회</td>
   </tr>
  <c:if test="${empty list }">
   <tr align="center">
     <td colspan="5" height="300px" align="center">등록된 게시가 없습니다</td>
   </tr>
  </c:if>
  <c:if test="${not empty list}">
   <c:forEach items="${list}" var="dto">
    <tr align="center">
   <td>${dto.seq}</td>
    <td align="left">
       <a href="/jspPro/board/content?seq=${dto.seq}">${dto.subject}</a>
    </td>
    <td> 
       <a href="mailto:${dto.email}">${dto.name}</a>
    </td> 
    <td>${dto.regDate}</td>
    <td>${dto.cnt}</td>
  </tr>
  </c:forEach>
  </c:if>
</table>
<a href="/jspPro/board/regist">글쓰기</a><br>
</div>

<c:if test="${param.regist eq 'success'}">
 <script>
  alert("글쓰기 완료");
 </script>
</c:if>

<c:if test="${param.delete eq 'success'}">
 <script>
  alert("삭제 완료");
 </script>
</c:if>
</body>
</html>