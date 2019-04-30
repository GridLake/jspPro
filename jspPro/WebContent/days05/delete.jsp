<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오후 2:25:01</title>
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
 <div align="center">
  <h2>삭제하기</h2>
  <form name="deleteForm" method="post">
<table>
  <tr>
    <td colspan="2" align="center"><b>글을 삭제합니다</b></td>
  </tr>
  <tr>
    <td align="center">비밀번호</td>
    <td>
      <input type="password" name="password" size="15" autofocus="autofocus">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="삭제">&nbsp;&nbsp;
      <input type="button" onClick="javascript:history.back();" value="취소">
    </td>
  </tr>
</table>
<input type="hidden" name="seq" value="${param.seq}"/>
</form>
 </div>
 
 <c:if test="${not empty error}">
  <script>
    alert('${error}');
  </script>
 </c:if>
</body>
</html>