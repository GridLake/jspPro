<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 3. - 오전 10:38:55</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<%
    String f = request.getParameter("f") == null? "content.jsp" : request.getParameter("f") ;
    String d = request.getParameter("d")== null? "days05" : request.getParameter("d");    
    String path = String.format("/%s", d ) ;
    
    String realPath = application.getRealPath(path);
	File dir = new File(realPath);
	File[]  files = dir.listFiles();
%>	
<form id="form1">
<select id="f" name="f">
<%	
	for (int i = 0; i < files.length; i++) {
%> 
    <%-- <option value="<%= files[i] %>"><%= files[i].getName() %></option> --%>
    <option><%= files[i].getName() %></option>
<%		
	}
%> 
</select>
</form>
<script>
    $("#f").val('<%=f %>');
</script>
<br>
<%
    StringBuffer  sb = new StringBuffer();
	String fileName = "C:\\D\\Class\\JspClass\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jspPro\\"+d+"\\"+ f;
	FileReader in = null;
	BufferedReader br = null;	
	try {
		in = new FileReader(fileName);
		br = new BufferedReader(in);
		String  line = null;
		while(  (line=br.readLine()) != null ) {
			sb.append(line+"\r\n");
		}
	} catch (FileNotFoundException e) { 
		e.printStackTrace();
	} catch (IOException e) { 
		e.printStackTrace();
	}
	
	try {
		in.close();
		br.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	String content = sb.toString();
	content = content
			          .replaceAll("<", "&lt;")
			          .replaceAll(">", "&gt;")
			          .replaceAll("\r\n","<br>");
%>
<div>
  <code>
    <%= content %>
  </code>
</div>


<script>
  $("#f").change(function (){
	  //alert( $(this).val() );
	  $("#form1").submit();
  });
</script>

</body>
</html>