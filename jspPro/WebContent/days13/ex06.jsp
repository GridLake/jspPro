<%@page import="days13.Thermometer"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Thermometer thermometer = new Thermometer();
   request.setAttribute("t", thermometer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 14.-오후 2:44:51)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<!-- EL 안에서 메서드 호출 사용 -->
${ t.setCelsius('서울', 27.3) }
서울 온도 : 섭씨 ${ t.getCelsius('서울') }도 / 화씨 ${ t.getFahrenheit('서울') }

<br>
정보 : ${ t.getInfo() } == ${ t.info } 
</body>
</html>











