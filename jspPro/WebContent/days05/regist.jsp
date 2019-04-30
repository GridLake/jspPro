<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오전 9:20:16</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 업로드는 post방식만 가능 -->
 <!-- 중요사항 : action 속성 없음 -> url 요청 페이지가 현재 url로 표시  -->
 <form name="registForm" method= "post">
   <table style="border:solid 1px gray;padding:2px;width:500px;">
      <tr>
         <td colspan="2" align="center"><b>글을 적어주세요</b></td>
      </tr>
      <tr>
         <td align="center">이름</td>
         <td><input type="text" name="name" size="15"></td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="password" size="15"></td>
      </tr>
      <tr>
         <td align="center">Email</td>
         <td><input type="text" name="email" size="50"></td>
      </tr>
      <tr>
         <td align="center">제목</td>
         <td><input type="text" name="subject" size="50"></td>
      </tr>
      <tr>
         <td align="center">내용</td>
         <td><textarea name="content" cols="50" rows="10"></textarea></td>
      </tr>
      <tr>
         <td align="center">HTML</td>
         <td>
            <input type="radio" name="tag" value="y" checked>적용
            <input type="radio" name="tag" value= "n">비적용
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="작성 완료">&nbsp;&nbsp;&nbsp;
            <input type="reset" value="다시 작성">
            <a href="/jspPro/board/list">Home</a>
         </td>
      </tr>
   </table>
   </form>
</body>
</html>