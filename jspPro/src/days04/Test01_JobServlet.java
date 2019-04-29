package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

public class Test01_JobServlet extends HttpServlet{

	public String arrayJoin(String glue, String array[]) {
	    String result = "";
	    for (int i = 0; i < array.length; i++) {
	      result += array[i];
	      if (i < array.length - 1) result += glue;
	    }
	    return result; // "10,20"
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String job = request.getParameter("job");
		String empno = request.getParameter("empno");
		
		Connection con = null;
		Statement stmtEmp;
		
		try {
			// 1
			String sql = "update tbl_emp set job = '" + job + "'"
					   + " where empno = " + empno;	
			con = DBConn.getConnection();
			stmtEmp = con.createStatement();
			int result = stmtEmp.executeUpdate(sql);
			stmtEmp.close();
			
			if (result != 0) {
				
			}
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		} 
		
		String params = ""; 
		String[] deptnos = request.getParameterValues("deptno");
		for (int i = 0; i < deptnos.length; i++) {
			params += "deptno="+ deptnos[i]+"&";
		}
		params = params.substring(0, params.length()-1); 
		String location = "employees.do?"+params; 
		 
		response.sendRedirect(location);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
