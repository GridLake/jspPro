<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 25. - 오전 8:57:35</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <form action="method" method="get">
  메시지 : <input type="text" name="msg" value="한글로 메시지..."/>
  <input type="submit" /> 
 </form>
 <form action="method" method="post">
  메시지 : <input type="text" name="msg" value="한글로 메시지..."/>
  <input type="submit" /> 
 </form>
<!-- 
  web.xml 서블릿 설정

  src>days02 패키지 추가
  TestServlet.java

  WebContent>days02 폴더 추가
  test01.html
  test01_ok.jsp  
  
  서블릿   url-pattern=
  http://localhost/jspPro/days02/call
-->
</body>
</html>