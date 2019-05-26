<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 5. 16. - 오후 12:17:35</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
<a href="/jspPro/days16/replyboard/write.do">답변형 게시판 글쓰기</a><br>

<a href="/jspPro/days16/replyboard/list.do">게시판 출력</a><br>

<!-- 
 web.xml 수정
 
 days16.replyboard.command
  ㄴ CommandHandler.java
  ㄴ NullHandler.java
  ㄴ WriteHandler   get/post
 days16.replyboard.controller
  ㄴ ControllerUsingURI 클래스
 days16.replyboard.dao
  ㄴ ReplyBoardDAO
 days16.replyboard.model
  ㄴ ReplyBoardDTO
 days16.replyboard.service
  -->
 [ 계층형( 답변형 ) 게시판 ]                                     thread (그룹컬럼+그룹순번컬럼) + 그룹깊이컬럼
                                                     thread     depth
    1		홍길동		첫번째게시글	(새글)      1000         0                    
    2		예나		두번째게시글 (새글)      2000         0
    3		지용	    세번째게시글(새글)       3000         0
    4      지용        예나의 답글(답글)        1998         1(부+1)
    5                  예나의 답글(답글)        1999         1 
  
    order by thread desc;
  
  3		지용	    세번째게시글(새글)       3000         0
  2		예나		두번째게시글 (새글)      2000         0
      ㄴ 6         예나의 답글(답글)        1999        1
      ㄴ 5         예나의 답글(답글)        1998        1
      ㄴ 4         예나의 답글(답글)        1997        1   
  1		홍길동		첫번째게시글	(새글)      1000         0
  
  
  
  order by ref desc , step asc
   3		지용	    세번째게시글(새글)             3				  1						0
      ㄴ 6       승연      아이스크림 이따구...(답글)    3				      2                    1
      ㄴ4       소민        나는 아이스크림..(답글)       3				  2                    1   
          ㄴ5       성현       자꾸 왜 나한테 질문(답글)     3        3                  2     
   2		예나		두번째게시글 (새글)            2				  1						0 
   1		홍길동		첫번째게시글	(새글)            1				  1						0
   
   
  (pk)
  글번호	작성자		글제목 .... 				+ 그룹(REF) + 그룹순번(STEP) + 그룹깊이(DEPTH)
   1		홍길동		첫번째게시글	(새글)            1				  1						0
   2		예나		두번째게시글 (새글)               2				  1						0
   3		지용	    세번째게시글(새글)                3				  1						0
   4        소민        나는 아이스크림..(답글)       	  3				  3                    1 
   5        성현       자꾸 왜 나한테 질문(답글)     	  3				  4	                    2
   6        승연      아이스크림 이따구...(답글)    	  3 		      2                    1 
   
  *** 답글인 경우에는    ref==부모ref
                                     같은 그룹(ref) 안에서  step(2) <= step 전부 1증가..
                                     , step=부모step+1
                               , depth=부모depth+1
  *** 새글인 경우에는    ref==seq, step=1, depth=0
  
  
 seq                                order by seq desc  
  3		지용	    세번째게시글(새글)                                      1
    ㄴ 6    승연        결석안하고 잘 왔네.(답글)                        2 
    ㄴ 4    소민        나는 아이스크림..(답글)                          3
       ㄴ 5    지용        나도 아이스크림..(답/답글)                   4
       
  2		예나		두번째게시글 (새글)                        1
    ㄴ 7    승연        결석안하고 잘 왔네.(답글)            2 
    
  1		홍길동		첫번째게시글	(새글)                         1
  
contet.jsp
[3]
[지용]
[세번째게시글]
[        내용                       ]
 [수정][삭제][목록][*답글*]                보고있는 글( 부모글 ) 부모글  그룹(REF) + 그룹순번(STEP) + 그룹깊이(DEPTH)
                                                                                            3				  1						0
</body>
</html>