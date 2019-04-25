<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 2:30:08</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <form action="ex05_ok.jsp" method="post">
 이름 : <input type="text" name="name" autofocus="autofocus" value="홍길동"/><br>
 성별 : <input type="radio" name="gender" value="m" checked="checked"/>남자
        <input type="radio" name="gender" value="w"/>여자
        <br>
 좋아하는 동물 : <input type="checkbox" name="pet" value="dog" checked="checked"/>개
                 <input type="checkbox" name="pet" value="pig" checked="checked"/>돼지
                 <input type="checkbox" name="pet" value="cat"/>고양이
                 <br>
 기타 : <textarea cols="30" rows="10" name="etc">기타 사항 없음</textarea><br>
  <input type="submit" />
  <input type="reset" />
 </form>
</body>
</html>