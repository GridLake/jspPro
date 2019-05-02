<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 2. - 오후 3:44:19</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <!-- autoFlush="false" -> java.io.IOException: Error: JSP Buffer overflow -->
 <%
  for(int i = 0; i < 1000; i++) {
 %>
    1234
 <%
    if(i % 20 == 0) {
    	out.flush();  // 보내고 비움
    	out.clear();  // 그냥 비움
    }
  }
 %>
</body>
</html>