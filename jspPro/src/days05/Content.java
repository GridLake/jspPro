package days05;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;


public class Content extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Content.doGet()/doPost()...");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyBoardDTO dto = null;
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		try {
			con = DBConn.getConnection();
			// 조회수 증가
			String sql =   "update tbl_myboard "
					 + " set cnt = cnt + 1 "
					 + " where seq = ?";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			int resultCnt = pstmt.executeUpdate();
			pstmt.close();
			// seq 게시글 -> dto
			sql =   "select seq, name, email, subject, content, cnt, regdate, password, tag "
					 + " from tbl_myboard "
				 	 + " where seq = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
		
			rs = pstmt.executeQuery();

			if(rs.next()) {
			
			dto = new MyBoardDTO();
			dto.setSeq(rs.getInt("seq"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setTag(rs.getString("tag").charAt(0));  // char
			String content = rs.getString("content").replace("\r\n", "<br>");
			if(dto.getTag() == 'n') { // 비적용
				content.replaceAll("<", "&lt;");
				content.replaceAll(">", "&gt;");
			}
			dto.setContent(content);
			dto.setCnt(rs.getInt("cnt"));
			dto.setRegDate(rs.getDate("regdate"));
			dto.setPassword(rs.getString("password"));
			}        
						
			request.setAttribute("dto", dto); // ***
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		String path = "/days05/content.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
