<%@page import="days05.PageBlock"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  // PageBlock pageBlock = (PageBlock) request.getAttribute("pageBlock");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 30. - 오전 11:10:14</title>
</head>
<style>
 table, td, th {
 	border: solid 1px gray;
 }
 table{
    border-spacing: 3px;
    border-collapse: separate;
 }
 table,  tr, td {
    /* border-radius: 3px; */
    padding:3px; 
 }
 tbody tr  td:nth-of-type(2){
    text-align: left;
 }
 a {
    text-decoration: none;
    color:black;
 }
 a:hover{
    color:red;
 }
</style>
<!-- 페이징 처리 style -->
<style>
 .pagination{
    margin: 0 auto;
    display: flex;
    justify-content: center;
 }
 .pagination a {
    color: black;
    float: left;
    padding: 4px 8px;
    text-decoration: none;
    transition: background-color .3s;
 }

 .pagination a.active {
    background-color: dodgerblue;
    color: white;
 }

 .pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<style>
 .searchWord {
 	background-color: yellow;
 	color: red;
 }
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <div align="center">
<h2>목록보기</h2>
<table style="width: 600px;">
 <thead>
   <tr align="center">
    <td>번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>등록일</td>
    <td>조회</td>
   </tr>
 </thead>
 <tbody>
  <c:if test="${empty list }">
   <tr align="center">
     <td colspan="5" height="300px" align="center">등록된 게시가 없습니다</td>
   </tr>
  </c:if>
  <c:if test="${not empty list}">
   <c:forEach items="${list}" var="dto">
    <tr align="center">
   <td>${dto.seq}</td>
    <td align="left">
       <a href="/jspPro/board/content?seq=${dto.seq}" class="subjectLink">${dto.subject}</a>
    </td>
    <td>
       <%-- 이름 옆에 아이콘 표시 코딩
       <c:if test="${ dto.name eq '홍길동' }">
	     <img alt="" src="/jspPro/images/kenik.gif" width="15px" height="">
	   </c:if>
	    --%>
       <a href="mailto:${dto.email}">${dto.name}</a>
    </td> 
    <td>${dto.regDate}</td>
    <td>${dto.cnt}</td>
  </tr>
  </c:forEach>
  </c:if>
 </tbody>
 <tfoot>
    <tr>
      <td colspan="5" align="center">
        <div class="pagination">
        <c:if test="${pageBlock.prev}"> <!-- pageBlock.prev는 pageBlock.getPrev()를 호출한다는 의미 -->
          <a href="/jspPro/board/list?currentPage=${pageBlock.start - 1}&searchCondition=${searchCondition}&searchWord=${searchWord}">&laquo;</a>
        </c:if>
        <!-- for문과 동일한 JSTL, step은 1이 default -->
        <c:forEach begin="${pageBlock.start}" end="${pageBlock.end}" step="1" var="i"> 
           <c:if test="${i eq pageBlock.currentPage}">
             <a class="active" href="#">${i}</a>
           </c:if>
           <c:if test="${i ne pageBlock.currentPage}">
             <a href="/jspPro/board/list?currentPage=${i}&searchCondition=${searchCondition}&searchWord=${searchWord}">${i}</a>
           </c:if>
        </c:forEach>
        <c:if test="${pageBlock.next}">
          <a href="/jspPro/board/list?currentPage=${pageBlock.end + 1}&searchCondition=${searchCondition}&searchWord=${searchWord}">&raquo;</a>
        </c:if>
        
         <%-- 
         <%
          if(pageBlock.prev) {
        	  %>
        	  <a href="/jspPro/board/list?currentPage=<%= pageBlock.start - 1 %>">&laquo;</a>
        	  <%
          }
         %>
         <%
          for(int i = pageBlock.start; i <= pageBlock.end; i++) {
        	  if(i == pageBlock.currentPage) {
        		  %>
        		  <a class="active" href="#"><%= i%></a>
        		  <%
        	  }
        	  else { %>
        	  	  <a href="/jspPro/board/list?currentPage=<%= i %>"><%= i %></a>
        	  	  <%
        	  }
          }
        %>
        <%
          if(pageBlock.next) {
        	  %>
        	  <a href="/jspPro/board/list?currentPage=<%= pageBlock.end + 1 %>">&raquo;</a>
        	  <%
          }
         %>
       --%>
        <!--  
		  <a class="active" href="#">1</a>
		  <a href="/jspPro/board/list?currentPage=2">2</a>
		  <a href="/jspPro/board/list?currentPage=3">3</a>
		  <a href="/jspPro/board/list?currentPage=4">4</a>
		  <a href="/jspPro/board/list?currentPage=5">5</a>
		  <a href="/jspPro/board/list/6">6</a>
		  <a href="#">7</a>
		  <a href="#">8</a>
		  <a href="#">9</a>
		  <a href="#">10</a>
		  <a href="#">&raquo;</a>
 		-->
		</div>
      </td>
    </tr>
  	<tr>
  	 <td colspan="5" align="center">
  	   <form action="/jspPro/board/list">
  	     <select name="searchCondition" id="searchCondition">
  	       <option value="1">Subject</option>
  	       <option value="2">Content</option>
  	       <option value="3">Name</option>
  	       <option value="4">Subject + Content</option>
  	     </select>
  	    <input type="text" name="searchWord" id="searchWord" value="${searchWord}" />
  	    <input type="submit" value="search"/>
  	   </form>
  	 </td>
  	</tr>
  </tfoot>
</table>
<a href="/jspPro/board/regist.do">글쓰기</a><br>
</div>

<c:if test="${param.regist eq 'success'}">
 <script>
  alert("글쓰기 완료");
 </script>
</c:if>

<c:if test="${param.delete eq 'success'}">
 <script>
  alert("삭제 완료");
 </script>
</c:if>

<script>
 $("#searchCondition").val("${searchCondition}");
 
 $(".subjectLink").attr( "href", function( i, val ) {
	 return val + "&currentPage=${empty param.currentPage ? 1 : param.currentPage}&searchCondition=${ param.searchCondition}&searchWord=${ param.searchWord}";
 });
</script>
</body>
</html>