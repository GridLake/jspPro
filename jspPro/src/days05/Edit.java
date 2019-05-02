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


public class Edit extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Edit.doGet()...");
		// seq -> dto
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyBoardDTO dto = null;
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		try {
			con = DBConn.getConnection();
		
			// seq 게시글 -> dto
			String sql = "select seq, name, email, subject, content, cnt, regdate, password, tag "
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
			dto.setContent(rs.getString("content"));
			dto.setCnt(rs.getInt("cnt"));
			dto.setRegDate(rs.getDate("regdate"));
			dto.setPassword(rs.getString("password"));
			dto.setTag(rs.getString("tag").charAt(0));
			}        
						
			request.setAttribute("dto", dto); // ***
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		String path = "/days05/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Edit.doPost()...");
		
		// 한글 깨짐 처리 :(POST 방식)
		request.setCharacterEncoding("UTF-8");
		
		String seq = request.getParameter("seq");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		String password = request.getParameter("password");
		
		Connection con = null;
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		try {
			// 1
			String sql = "update tbl_myboard " 
			           + " set name = ?, email = ?, subject = ?, content = ?, tag = ?, userip=? "
					   + " where seq= ? and password = ?" ;
			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);
			
			// 바인딩 변수 값 설정
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setString(5, tag+"");
			pstmt.setString(6, request.getRemoteAddr() );
			pstmt.setString(7, seq);
			pstmt.setString(8, password);
			
			resultCnt = pstmt.executeUpdate();
			System.out.println("> resultCnt : " + resultCnt);
			pstmt.close();
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		// 글 목록 페이지로 이동
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		if( resultCnt == 1 ) {
			String location="/jspPro/board/content?seq="+seq+"&edit=success";
			response.sendRedirect(location);
		}
		else {
			request.setAttribute("error", "비밀번호가 틀립니다.");
			doGet(request, response);
			return;
		}	
	}
}
