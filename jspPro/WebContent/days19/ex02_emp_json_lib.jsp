<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = "select empno, ename, sal "
			   + " from emp "
			   + " order by sal desc";
   
   JSONObject jsonData = null;
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
     jsonData = new JSONObject();
     
     JSONArray jsonEmpArray = new JSONArray(); // 객체 배열 [{},{},{}]
     while( rs.next() ){
    	int empno = rs.getInt("empno");
    	String ename = rs.getString("ename");
    	double sal = rs.getDouble("sal");
    	JSONObject jsonEmp = new JSONObject();
    	jsonEmp.put("empno", empno);
    	jsonEmp.put("ename", ename);
    	jsonEmp.put("sal", sal);
    	
    	jsonEmpArray.add(jsonEmp);
    	
     }
     
     jsonData.put("emp", jsonEmpArray);
     // {"emp", [{empno:?,ename:?,sal:?},{},{}]
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   pstmt.close();
	   rs.close();
	   conn.close();
   }
%>
<%= jsonData %>