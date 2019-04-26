package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days02.DeptDTO;

/**
 * Servlet implementation class Ex02_Deptinfo
 */
@WebServlet("/days03/ex02_info.do")
public class Ex02_Deptinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ex02_Deptinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer sb = new StringBuffer();
		sb.append("select deptno, dname, loc ");
		sb.append(" from dept ");

		ArrayList<DeptDTO> list = new ArrayList<>();
		Connection conn = DBConn.getConnection();

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sb.toString());
			int deptno;
			String dname, loc;
			while (rs.next()) {
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

		request.setAttribute("list", list); // 한 줄 추가

		String path = "ex02_info_ok.jsp";
		// request.setAttribute("id", "kenik"); // request 객체에 저장(request가 유지되는 한 계속 저장되어 있음) => requestScope
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
