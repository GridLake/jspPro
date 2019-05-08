<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오전 9:21:17</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!--    
   226p [쿠키]를 사용하는 로그인 [상태관리]
   ex01_default.jsp
   ㄱ. 메인페이지
   ㄴ.               로그인[id/pwd]
                  로그아웃
   ex01_login.jsp
   ㄱ. 로그인 시 입력받은 ID/PWD 인증
      auth 쿠키 이름으로 인증정보 (ID) 저장
      로그인 실패시 default.jsp 이동 (?error 쿼리스트링 가지고 이동할 것이다.)
      
   ex01_logout.jsp
   ㄱ. 로그 아웃 처리 후에 default.jsp 이동
   ㄴ. auth 쿠키 삭제
   
   ex01_board.jsp
   ㄱ. 로그인 하지 않은 사용자는 : 게시글 보기
   ㄴ. 일반 사용자로 로그인     : 글쓰기
   ㄷ. 관리자(글쓴이) 로그인 인증 : 글쓰기, 수정 삭제
 -->
</body>
</html>