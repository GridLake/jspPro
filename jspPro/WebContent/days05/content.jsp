<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오후 12:06:34</title>
</head>
<style>
 table, td, th {
 	border: solid 1px gray;
 }
 table {
 	width: 600px;
 }
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<!-- content는 링크 태그 -> GET 방식 -->
 <div align="center">
  <h2>내용보기</h2>
  <table>
   <tr>
       <td>이름</td>
       <td>${dto.name}</td>
       <td>등록일</td>
       <td>${dto.regDate}</td>
   </tr>
   <tr>
       <td>Email</td>
       <td><a href="mailto:${dto.email}">${dto.email}</a></td>
       <td>조회</td>
       <td>${dto.cnt}</td>
   </tr>
   <tr>
       <td>제목</td>
        <td colspan="3">${dto.subject}</td>
   </tr>
   <tr>
       <td colspan="4" style="padding:15px;">${dto.content}</td>
   </tr>
   <tr>
       <td colspan="4" align="center">
           <a href="/jspPro/board/edit?seq=${dto.seq}">수정하기</a>
           <a href="/jspPro/board/delete?seq=${dto.seq}">삭제하기</a>
           <a href="/jspPro/board/list">Home</a>
       </td>
   </tr>
</table>
 </div>
</body>
</html>