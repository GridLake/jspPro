<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 16. - 오전 10:04:21</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- 
 p.469 커스텀 태그
 1. [개발자가 필요에 의해서 새로운 태그]를 만들어서 사용할 수 있도록 JSP는 지원
 2. 스크립트 요소 많이 사용하면 복잡함 -> 유지보수, 확장 어려움
 3. 많은 개발자들이 공통적으로 새로 만드는 태그 + 표준화 = JSTL

 커스텀 태그의 종류
 1. JSP 1.2 스타일로 구현한 커스텀 태그
 2. JSP 2.0 또는 그 이상 버전의 SimpleTag를 사용한 커스텀 태그
 3. JSP 2.0 또는 그 이상 버전의 태그파일을 사용한 커스텀 태그  ***
 
 환경설정
 1. WEB-INF/tags 폴더 추가
 
 p.474 표 16.1, 표 16.2
 1. 태그 파일에서 사용할 수 있는 디렉티브
 2. tag 디렉티브의 속성
 
 [태그 파일]
 1. WEB-INF/tags 폴더나 그 하위 폴더에 위치한다
 2. 확장자: .tag, .tagx 확장자명...
 3. 태그파일의 파일명이 커스텀 태그의 이름이 된다
 예)
 	/WEB-INF/tags/util 폴더 안에 removeHtml.tag 태그파일
 	<%-- 
 	<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/util" %>
 	
 	JSP 파일에서
 	<tf:removeHtml>...</tf:removeHtml>
 	 --%>
  태그 파일에서 사용 가능한 기본 객체
      tag			jsp
  1. jspContext == pageContext가 제공하는 getAttribute(), setAttribute() 메소드를 그대로 제공
  2. request == request
  3. response == response
  4. session == session
  5. application == application
  6. out == out
  
  ex03_now.jsp
  
  p.477 태그 파일의 속성 설정 방법
 
  p.481 JSP 파일 -> 태그 파일에게 동적으로 속성 전달
  
  p.484 몸체 내용 처리
  <tf:header>
   몸체 내용... 입력
  </tf:header>
  [EL과 태그를 처리한 몸체 내용 사용하기]
  1. body-content 속성 = scriptless
  2. jsp:doBody 액션태그를 이용해서 몸체 내용을 출력하거나 EL변수를 저장한다
  
  p.487 몸체 내용 자체를 데이터로 사용하기
  
  -->
  
</body>
</html>