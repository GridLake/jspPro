<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오후 3:48:51</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<div style="text-align: center">
<table width="600px" border="1" align="center">
  <tr>
    <td colspan="2">
        <jsp:include page="/layout/top.jsp"></jsp:include>
    </td>
  </tr>
  <tr height="300px">
    <td width="150px" valign="top"  style="background-color: aqua">
        <jsp:include page="/days06/layout/left.jsp"></jsp:include>
    </td>
    <td>
         게시판 내용 부분
    </td>
  </tr>
  <tr>
    <td colspan="2">
        <jsp:include page="/layout/bottom.jsp"></jsp:include>
    </td>
  </tr>
</table>
</div>
</body>
</html>