<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<title>JSP/Servlet Class - 2019. 4. 30. - 오후 12:06:34</title>
</head>
<style>
 table{
    border-spacing: 3px;
    border-collapse: separate;
 }
 table, tr, td {
 	/* border-radius: 3px; */
    padding:3px;
 }
 #tblContent {
 	width: 600px;
 }
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<!-- content는 링크 태그 -> GET 방식 -->
 <div align="center">
  <h2>내용보기</h2>
  <table id="tblContent">
   <tr>
       <td>이름</td>
       <td>${dto.name}</td>
       <td>등록일</td>
       <td>${dto.regDate}</td>
   </tr>
   <tr>
       <td>Email</td>
       <td><a href="mailto:${dto.email}">${dto.email}</a></td>
       <td>조회</td>
       <td>${dto.cnt}</td>
   </tr>
   <tr>
       <td>제목</td>
        <td colspan="3">${dto.subject}</td>
   </tr>
   <tr>
       <td colspan="4" style="padding:15px;">${dto.content}</td>
   </tr>
   <tr>
       <td colspan="4" align="center">
           <a href="/jspPro/board/edit?seq=${dto.seq}">수정하기</a>
           <a href="/jspPro/board/delete?seq=${dto.seq}">삭제하기</a>
           <a href="/jspPro/board/list" id="homeLink">Home</a>
           <input type="button" id="btnModalDelete" value="모달창으로 글 삭제">
       </td>
   </tr>
</table>
 </div>
<input type="hidden" name="password" value="${ dto.password }">
<c:if test="${  param.edit  eq 'success' }">
  <script>
    alert("글수정 완료!!!");
  </script>
</c:if>

 <script>
  $('#homeLink').click(function() {
	  $(this).attr("href", function(i, val) {
		  return val + "?currentPage=${empty param.currentPage ? 1 : param.currentPage}&searchCondition=${ param.searchCondition}&searchWord=${ param.searchWord}";
	  });
  });
  $('#deleteLink, #editLink').attr( "href", function( i, val ) {
	   return val + "&currentPage=${ param.currentPage }&searchCondition=${ param.searchCondition}&searchWord=${ param.searchWord}";
  });
 </script>
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width:350px">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">          
          <h4 class="modal-title">게시물 삭제</h4>
        </div>
        <div class="modal-body">
          <!-- Delete.jsp 복사 붙이기.  -->
          <div style="text-align: center">
			    <form id="form1" action="/jspPro/board/delete?seq=${ param.seq }" method="post">
			      <table width="300px" border="1" align="center">
			        <tr>
			          <td>비밀 번호 입력하세요?
			          </td>
			        </tr>
			        <tr>
			        	<td>
			        		<input type="password" name="password">
			        		<%-- <input type="hidden" name="seq"		value="${ param.seq }"> --%>
			        		<input type="hidden" name="searchCondition" value="${ param.searchCondition }">
							<input type="hidden" name="searchWord" value="${ param.searchWord }">
							<input type="hidden" name="currentPage" value="${ param.currentPage }">
			        	</td>
			        </tr>
			        <tr>
			        	<td>
			        		<input type="button" id="btnDelete" value="글삭제">
			        		<a href="#">글목록</a>
			        	</td>
			        </tr>
			      </table>
			    </form>
			 </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<script> 
$("#btnModalDelete").click(function (){
	$("#myModal").modal("show");
});

$("#btnDelete").click(function (){ 
	if( confirm("정말 삭제합니까? ")) {
		$("#form1").submit();
	}
});
</script>

<script>
  $("table, td, th").css("border","solid 1px gray");
</script> 
 
</body>
</html>