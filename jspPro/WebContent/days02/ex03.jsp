<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 12:02:21</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- p.509 초기화 파라미터 -->
 <!-- p.514 URL 패턴 매핑 규칙 -->
 <!-- 
 [~/ex.jsp]         -> 요청 ->       ex.jsp
   [ URL요청 ]               ->           서블릿클래스
   
   url 요청 패턴 정하기
   
   /days/*.htm  X     경로 + 확장 
  -->
 
 <!-- 
 [패턴 규칙]
 4. 그 외 패턴 일치
    <servlet-class>days01.BasicServlet</servlet-class>
    <url-pattern>/days02</url-pattern>  경로패턴 X , 확장자 패턴 X, 기본 매핑 X
    http://localhost/jspPro/days02
 3. 오직 '/'만 포함하는 경우 어플리케이션의 기본 서블릿으로 매핑
    <servlet-class>days01.BasicServlet</servlet-class>
    <url-pattern>/</url-pattern>
 2. 확장자에 대한 매핑 :   '*.' 시작
    <servlet-class>days01.SiStServlet</servlet-class>
    <url-pattern>*.sist</url-pattern>
    http://localhost/ex10.sist
    http://localhost/jspPro/foo/bar/ex01.sist
 1. 경로 패턴 for 경로 매핑: '/'로 시작  ~~~~ '/*'
    예)          /   foo/bar      /*
    
    <servlet-class>days01.NowServlet</servlet-class>
    <url-pattern>/foo/bar/*</url-pattern>
    => /foo/bar/*  이렇게만 패턴 들어가면 나머지는 뭐든 상관없이 호출
    
    http://localhost/jspPro/foo/bar/ex01.jsp
    http://localhost/jspPro/foo/bar/ex01.html
    http://localhost/jspPro/foo/bar/ex01.do
    http://localhost/jspPro/foo/bar/ex01
    http://localhost/jspPro/foo/bar/test/ex01.jsp 
 -->
</body>
</html>