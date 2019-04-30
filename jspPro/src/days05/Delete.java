package days05;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;


public class Delete extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Delete.doGet()...");
		String path = "/days05/delete.jsp";
		// response.sendRedirect(location);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Regist.doPost()...");
		
		// 한글 깨짐 처리 :(POST 방식)
		request.setCharacterEncoding("UTF-8");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println("----" + seq);
		// System.out.println(seq);
		String p_password = request.getParameter("password");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCnt = 0;
		
		try {
			// seq의 password select
			String sql = "select password "
					   + "from tbl_myboard "
					   + "where seq = ?";
			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String o_password = rs.getString("password");
			rs.close();
			pstmt.close();
			
			if(!o_password.equals(p_password)) {
				request.setAttribute("error", "비밀번호가 틀립니다");
				doGet(request, response);
				DBConn.close();
				return;
			}
			
			if (o_password.equals(p_password)) {
				sql = "delete from tbl_myboard " + " where seq = ?"; // and password = ?
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, seq);
				resultCnt = pstmt.executeUpdate();
				pstmt.close();
			}
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		// 글 목록 페이지로 이동
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		String location = "/jspPro/board/list";
		if(resultCnt == 1) {
			location += "?delete=success";
		}
		else {
			location = "/jspPro/board/delete?seq=" + seq;
		}
		response.sendRedirect(location);
	}
}
