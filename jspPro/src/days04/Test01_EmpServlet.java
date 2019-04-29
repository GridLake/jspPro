package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

public class Test01_EmpServlet extends HttpServlet{

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
		
		String[] deptnos = request.getParameterValues("deptno");
		// request.setAttribute("deptnos", deptnos);
		String result =  deptnos == null ? "10,20,30,40" : arrayJoin(",", deptnos);
		//
		Connection con = null;
		Statement stmtDept , stmtEmp, stmtJob;
		ResultSet rsDept, rsEmp, rsJob;
		ArrayList<DeptDTO> deptList = null;
		ArrayList<DeptEmpDTO> empList = null;
		ArrayList<String> jobList = null;
		
		try {
			// 1
			String sql = "select deptno, dname from dept";	
			con = DBConn.getConnection();
			stmtDept = con.createStatement();
			rsDept = stmtDept.executeQuery(sql);
			if( rsDept.next()){
				deptList = new ArrayList<>();
				do{					
					DeptDTO dto = new DeptDTO(); 
						dto.setDeptno( rsDept.getInt("deptno") );
						dto.setDname( rsDept.getString("dname") );
						deptList.add(dto);
				}while(rsDept.next());
			}
			rsDept.close();
			stmtDept.close();
			
			request.setAttribute("deptList", deptList);
			//
			// 2
			sql = "select d.deptno, d.dname,  e.empno, e.ename, e.mgr , job " 
				     +" ,to_char( e.hiredate, 'yyyy/MM/dd') hiredate,  sal, comm , sal+nvl(comm, 0) pay " 
				     +"  from tbl_emp e join dept d on e.deptno = d.deptno "
				     //+" where d.deptno in (10,20,30,40) "
				     +" where d.deptno in (" + result + ")"
				     +" order by d.deptno asc ";
			stmtEmp = con.createStatement();
			rsEmp = stmtEmp.executeQuery(sql);
			if( rsEmp.next()){
				empList = new ArrayList<>();
				do{					
					DeptEmpDTO dto = new DeptEmpDTO(); 
						dto.setEmpno( rsEmp.getInt("empno") );
						dto.setEname( rsEmp.getString("ename") );
						dto.setMgr( rsEmp.getInt("mgr") );
						dto.setJob( rsEmp.getString("job"));
						dto.setHiredate(rsEmp.getString("hiredate"));
						dto.setSal(rsEmp.getDouble("sal"));
						dto.setComm(rsEmp.getDouble("comm"));
						dto.setPay(rsEmp.getDouble("pay"));
						
						dto.setDeptno( rsEmp.getInt("deptno") );
						dto.setDname( rsEmp.getString("dname") );	
					
					empList.add(dto);
				}while(rsEmp.next());
			}
			
			request.setAttribute("empList", empList);
			
			rsEmp.close();
			stmtEmp.close();
			
			// 3
			sql  = "select  distinct job from emp order by job asc";
			stmtJob = con.createStatement();
			rsJob = stmtJob.executeQuery(sql);
			
			if( rsJob.next()){
				jobList = new ArrayList<>();
				do{	 
					String job = rsJob.getString("job") ; 
					jobList.add(job);
				}while(rsJob.next());
			}
			
			request.setAttribute("jobList", jobList);
			
			stmtJob.close();
			rsJob.close();
			DBConn.close();	 
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 
		
		String path = "/days04/test01_02.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		
		/*
		String [] deptno = request.getParameterValues("deptno");
		String result = deptno == null ? "10,20,30,40" : arrayJoin(",", deptno);
		String sql = "select d.deptno, dname, empno, ename, mgr, job, hiredate, sal, nvl(comm,0) comm, sal+nvl(comm,0) pay " 
				   + " from dept d, emp e  where e.deptno = d.deptno ";
		
		if( deptno != null )    sql +=" and  d.deptno in(" + result + ")";
		
		System.out.println(sql);
		Connection con = null;
		Statement stmtEmp;
		ResultSet rsEmp;
		ArrayList<EmpDTO> list = null;
		
		try {
			con = DBConn.getConnection();
			stmtEmp = con.createStatement();
			rsEmp = stmtEmp.executeQuery(sql);
			if( rsEmp.next()){
				list = new ArrayList<>();
				do{
					EmpDTO dto = new EmpDTO();
						dto.setDeptno( rsEmp.getInt("deptno") );
						dto.setDname(rsEmp.getString("dname"));
						dto.setEmpno( rsEmp.getInt("empno") );
						dto.setEname( rsEmp.getString("ename") );
						dto.setMgr(rsEmp.getInt("mgr"));
						dto.setJob(rsEmp.getString("job"));
						dto.setHiredate(rsEmp.getDate("hiredate"));
						dto.setSal(rsEmp.getInt("sal"));
						dto.setComm(rsEmp.getInt("comm"));
						dto.setPay(rsEmp.getInt("pay"));
					list.add(dto);
				}while(rsEmp.next());
			} 
			
			rsEmp.close();
			stmtEmp.close();
			DBConn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
		String path = "/days04/test01_03.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		*/
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}

	
}
