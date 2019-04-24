<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
?num=10  URL 뒤에 넘어오는 문자열 : 쿼리문자열(QueryString)
 -->
 <%
   // request 요청 객체
   int n = 5;
   String num = request.getParameter("num");
   if(num != null) n = Integer.parseInt(num);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 24. - 오전 10:33:26</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
	 
	 $("input:first").focus().select();
	 
	 /* $("button").click(function (){
	   //alert("test")
	   //$("form:first").submit();
        }); */
 
 
 $( "form" ).submit(function( event ) {
	   
	   var pattern = /^\d+$/
	   //	alert(   pattern.test( $( "input:first" ).val() ) );
	   if (  pattern.test( $( "input:first" ).val() ) ) { 		     return;		   }
	  
	   $( "span" )
	   .text( "Not valid!" )
	   .css("color","red")
	   .show()
	   .fadeOut( 3000 );
	   
	   event.preventDefault();
	 });
});
 });
</script>
<body>
<!-- action 속성 비워두면 자기자신 요청 -->
<form action="">
정수 입력: <input type="text" id="num" value="<%= n %>"/>
<button type="button">제출</button>
</form>
<br>
<span></span>
<%-- 
 <%
   // 1 + 2 + 3 +...+ 10 = 55
   int sum = 0;
   for(int i = 1; i <= 10; i++) {
	   sum += i;
 %> <!-- 코드가 끊어져도 알아서 작동? -->
 <%= i%>+
 <%
	   System.out.print(i + "+");
   }
 
   System.out.printf("= %d\n", sum);
 %>
 =<%= sum %>
  --%>
  
 <%--  
 <%
   int sum = 0;
   for(int i = 1; i <= 10; i++) {
	   sum += i;
 %><%if(i != 10) System.out.print(i + "+");else System.out.print(i);%><%
   }
   System.out.printf("=%d\n", sum);%>
  --%>  
 
   
 <%
   int sum = 0;
   for(int i = 1; i <= n; i++) {
	   sum += i;
 %><%= i%><% if(i != n){%>+<%}%><%
		 System.out.print(i + "+");
   }
   System.out.printf("=%d\n", sum);
 %>=<%=sum %>
</body>
</html>