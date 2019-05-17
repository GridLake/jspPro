<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 14. - 오전 11:08:49</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <%-- 
 p.251 표현 언어(Expression Language): EL
      1. 다른 형태의 스크립트 언어
      2. 스크립트 요소 중의 하나이다
      3. 표현식보다 간결하고 편리하기 때문에 많이 사용한다
      4. EL 3.0
      5. EL의 기능
         ㄱ. JSP의 4가지 기본 객체가 제공하는 영역의 속성 사용
             pageScope, requestScope, SessionScope, ApplicationScope
             .setAttribute()
             ${requestScope.cp}
             ${cp}
         ㄴ. 수치 연산, 관계 연산, 논리 연산자 제공
         	 request.setAttribute("list", list);
         	 ${not empty list} not ! empty 연산자
         	 ${writer != "홍길동"}
         	 ${writer ne "홍길동"}
         ㄷ. 자바 클래스 메소드 호출 기능 제공
         	 예)
         	 ${articlePage.hasNoArticles()}
         ㄹ. 쿠키, 기본 객체의 속성 등 JSP를 위한 [EL의 기본 객체 제공]
             ${쿠키}
         ㅁ. 람다식을 이용한 함수 정의와 실행(EL 3.0)
         ㅂ. 스트림 API를 통한 컬렉션 처리(EL 3.0)
         ㅅ. 정적(static) 메소드 실행(EL 3.0)
         
         예)
         <%= member.getAddress().getZipcode() %>
         ${member.address.zipcode}
        
       6. 형식: ${EL 표현식}
  --%>
 
 <!-- 
 p.253 EL 기초 
 1. EL의 데이터 타입(자료형)과 리터럴
    1) boolean: true / false
    2) 정수   : 0~9, 음수,  EL 정수 == java.lang.Long
    3) 실수   : java.lang.Double
    4) 문자열 : \'홍길동\', "홍길동" java.lang.String
    5) 널 타입: null
 -->
 ${100}<br>
 ${3.14}<br>
 ${"홍길동"}<br>
 ${true}<br>
 ${null}<br>
</body>
</html>