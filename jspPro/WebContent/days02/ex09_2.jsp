<%@page import="java.util.Iterator"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 // Arraylist에 담아서 iterator로 출력하는 방법
 StringBuffer sb = new StringBuffer();
 sb.append("select deptno, dname, loc ");
 sb.append(" from dept ");

 ArrayList<DeptDTO> list = new ArrayList<>();
 Connection conn =  DBConn.getConnection();

 try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		int deptno;
		String dname, loc;
		while ( rs.next()   ) {
			 deptno = rs.getInt("deptno");
			 dname = rs.getString("dname");
			 loc = rs.getString("loc");		
			 
			 DeptDTO dto = new DeptDTO();
			 dto.setDeptno(deptno);
			 dto.setDname(dname);
			 dto.setLoc(loc);
			 
			 list.add(dto);
		} // while
		rs.close();
		stmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<title>JSP/Servlet Class - 2019. 4. 25. - 오후 4:27:50</title>
</head>
<style>
 
</style>
<script>
 $(document).ready(function() {
 	
 });
</script>
<body>
 <select name="deptno" id="deptno">
 <%
  Iterator<DeptDTO> ir = list.iterator();
  while(ir.hasNext()) {
	  DeptDTO dto = ir.next();
 %>
  <option value="<%=dto.getDeptno() %>"><%= dto.getDname()%></option>
 <%
  }
 %>
 <%-- syso 사용해서 바로 출력하는 방법
 <%
 StringBuffer sb = new StringBuffer();
 sb.append("select deptno, dname, loc ");
 sb.append(" from dept ");
 
 Connection conn =  DBConn.getConnection();
 
 try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sb.toString());
		int deptno;
		String dname, loc;
		while ( rs.next()   ) {
			 deptno = rs.getInt("deptno");
			 dname = rs.getString("dname");
			 loc = rs.getString("loc");		
			 
			 System.out.printf(
					 "%d\t%s\t%s\n"
					 , deptno
					 , dname
					 , loc
					 ); 
%>
 <option value="<%= deptno %>"><%= dname %></option>
<%		}
		
		rs.close();
		stmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	DBConn.close();
%>
 --%>
 </select>
</body>
</html>