<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex06_sessionAuth.jsp" %>
<%
   if(auth == null) {
	   out.println("<script>");
	   out.println("alert(\"로그인 후 사용 가능합니다\")");
	   out.println("location.href = \"ex01_default.jsp\"");
	   out.println("</script>");
	   out.close();
   } 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 8. - 오전 10:09:00</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <h3>공지사항</h3>
 <ol>
 	<li>Lorem ipsum dolor sit amet, consectetur adipisicing.</li>
 	<li>Non rerum eveniet recusandae ratione optio vero!</li>
 	<li>Esse commodi fugiat laboriosam doloremque laudantium reprehenderit.</li>
 	<li>Debitis eaque ex explicabo fugiat vitae hic!</li>
 	<li>Suscipit unde quod assumenda officia explicabo quis.</li>
 	<li>Suscipit fugiat natus aliquam rerum voluptates distinctio.</li>
 	<li>Laboriosam qui repudiandae eos explicabo quisquam eveniet.</li>
 	<li>Esse architecto eligendi eos impedit cum mollitia!</li>
 	<li>Aperiam aspernatur accusamus non totam incidunt adipisci.</li>
 	<li>Provident dicta delectus doloremque vero nostrum quo?</li>
 	<li>Vitae natus quod eos amet nobis enim.</li>
 	<li>Hic laudantium assumenda ad exercitationem inventore totam.</li>
 	<li>Fugiat blanditiis non esse similique animi totam.</li>
 	<li>Perspiciatis esse autem sit excepturi aut adipisci.</li>
 	<li>Inventore expedita doloribus reprehenderit neque unde totam!</li>
 	<li>Perspiciatis enim error voluptas reiciendis ipsum animi.</li>
 	<li>Quidem ratione molestias repellendus fuga soluta rem?</li>
 	<li>Deserunt sapiente obcaecati laudantium praesentium repellendus eveniet!</li>
 	<li>Beatae libero tempora magnam eligendi eius hic.</li>
 	<li>Sit omnis fugit minus quod nisi quia.</li>
 </ol>
</body>
</html>

<!-- 
@지시자  include     ex06_sessionAuth.jsp  session  string  auth
main 페이지 -- ex06_default.jsp
[      ]
[][   ]    id/pass   로그인 버튼 클릭 / 로그아웃
[      ]
-> Ex06_Logout.java 서블릿 클래스
  auth  세션값 제거...  p 245    경고창 +  ex06_default.jsp
  

-> Ex06_Logon.java 서블릿 클래스
    doGet(){
       id/pass
       // hashMap
       // if       관리자            session.setAttribute("auth","관리자"); ex06_default.jsp
       // else if   홍길동
       // else if    김지수
       // else  로그인실패  ex06_default.jsp?error
    }
 -->