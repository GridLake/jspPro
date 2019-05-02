<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 2. - 오후 4:05:10</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 안녕하세요<br>
 오늘 수업 여기까지<br>
 <%
  out.print("안녕하세요<br>");
  out.newLine(); // print + newLine = println
  out.println("오늘 수업 여기까지<br>");
  // ln을 붙여도 개행 안되는 이유? 브라우저에서의 개행은 \r\n 아님, <br>이 개행
 %>
 
 <%= "안녕하세요" %><br>
 <%= "오늘 수업 여기까지" %><br>
 <!-- p.106~ 웹 어플리케이션 폴더 구성, url 매핑 -->
 <!-- /jspPro -->
 <%-- 웹 어플리케이션 컨텍스트 경로: "<%= request.getContextPath() %>" --%>
 
 <!-- p.114 -->
 <!-- 
 [jsp 기본 내장 객체와 영역(scope)]
 1. request	   : javax.servlet.http.[HttpServletRequest] ***
 2. response   : javax.servlet.http.[HttpServletResponse] ***
 3. out		   : javax.servlet.jsp.JspWriter
         		 jsp 페이지가 생성하는 결과를 출력할 때 사용하는 출력 스트림
         		 
 4. application: javax.servlet.[ServletContext]
                 웹 어플리케이션(웹사이트)에 대한 정보를 저장하는 객체
 5. session	   : javax.servlet.http.[HttpSession]
 				 [http 세션]에 대한 정보를 저장하는 객체
 6. pageContext: javax.servlet.jsp.PageContext
 				 jsp 페이지에 대한 정보를 저장하는 객체
 				 
 ※ 범위 : application(전체 사용자) > session(사용자 세션) > pageContext(페이지)
 				 
 7. config	   : javax.servlet.ServletConfig  설정정보
 8. page	   : java.lang.Object  jsp 페이지를 구현한 자바 클래스 인스턴스
 9. exception  : java.lang.Throwable  예외 페이지에서만 사용하는 익셉션 객체
  -->
</body>
</html>