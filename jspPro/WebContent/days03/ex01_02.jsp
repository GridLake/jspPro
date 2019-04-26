<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 /* 1. Redirect(리다이렉트)
 String name = request.getParameter("name");
 int age = Integer.parseInt(request.getParameter("age"));
 String location = String.format("ex01_03.jsp?name=%s&age=%d", name, age);
 response.sendRedirect(location);
 */
 
 // 2. Forward(포워드) ***
 
 /* 
 리다이렉트와의 차이점
 1. 서버 안에서 이동이 일어난다(클라이언트가 다시 요청하지 않음)
 2. 클라이언트는 변경되는 것을 알 수 없다
 3. 이동하더라도 파라미터가 유지된다
 */
 String path = "ex01_03.jsp";
 RequestDispatcher dispatcher = request.getRequestDispatcher(path);
 dispatcher.forward(request, response);
%>