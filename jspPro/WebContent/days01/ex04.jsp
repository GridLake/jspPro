<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>JSP/Servlet Class - 2019. 4. 24. - 오후 12:06:40</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
	  
	 // ???
	  /* 	 
	  var url = location.href ;
	  console.log(url);
	  var index = url.indexOf("op");
	  //alert( url.substr(index+3, 1) );  + -
	  var op = url.substr(index+3, 1);
	  console.log()
	  alert( unescape('%2F') );
	  $("#op option").each(function (){
		  //alert( $(this).val()  )
		  if( $(this).val() == op ){
			  $(this).attr('selected', 'selected');
		      return false;
		  }
	  });
	  */
	  //$('option').attr('selected', 'selected');
	  //$('option').prop('selected', 'true');
	  
	   
	  // http://localhost/jspPro/days01/ex04.jsp
	  //?
	  // n1=100
	  // &
	  // op=-
	  // &
	  // n2=3
	  
 	$("#n2").on("keyup", function(event) {
		if (event.which == 13) {
			$("form").submit();
		}
	});
 });
</script>
<body>
<%
  int n1 = Integer.parseInt(request.getParameter("n1"));
  int n2 = Integer.parseInt(request.getParameter("n2"));
  String op = request.getParameter("op");
  
  double result = 0;
  switch(op) {
  case "+": result = n1 + n2; break;
  case "-": result = n1 - n2; break;
  case "*": result = n1 * n2; break;
  case "/": result = n1 / n2; break;
  }
%>

<form method="get">
 <input type="text" id="n1" name="n1" autofocus="autofocus" value="<%= n1 %>"/>
 <select name="op" id="op">
    <!-- ??? 
    <option>+</option>
    <option>-</option>
    <option>*</option>
    <option>/</option>
     -->
     
 	<option <% if ( op.equals("+"))  {%> selected <%} %> >+</option>
	<option <% if ( op.equals("-"))  {%> selected <%} %>>-</option>
	<option <% if ( op.equals("*"))  {%> selected <%} %>>*</option>
	<option <% if ( op.equals("/"))  {%> selected <%} %>>/</option>
	
 </select>
 <input type="text" id="n2" name="n2" value="<%= n2 %>"/>
</form>
<p><%= result %></p>
</body>
</html>