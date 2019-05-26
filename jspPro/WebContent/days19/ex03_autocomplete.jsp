<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP/Servlet Class - 2019. 5. 23. - 오전 9:50:42</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function() {
	/*   
    var availableTags = ???; // ajax js array
    $( "#tags" ).autocomplete({
      source: availableTags
    });
    */
    // ?searchWord=s
    var params = $("#form1").serialize();
    		
    $("#tags").keyup(function () {
    	$.ajax({
			url:"ex03_autocomplete_json.jsp"
			,dataType:"json"
			,type:"get"
			,data:params //
			,cache:false
			,success:function(data){ // data => ["","",""]
				console.log(data);
				$( "#tags" ).autocomplete({
				      source: availableTags
				});
			}
		    ,error:function(){
		    	alert("에러~~~~")
		    } 
		});
	});
  });
  </script>
</head>
<body>
 <form id="form1">
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags" name="searchWord">
</div>
</form>
</body>
</html>