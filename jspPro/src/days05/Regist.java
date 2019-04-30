package days05;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;


public class Regist extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Regist.doGet()...");
		String path = "/days05/regist.jsp";
		// response.sendRedirect(location);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Regist.doPost()...");
		
		// 한글 깨짐 처리 :(POST 방식)
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		int resultCnt = 0;
		
		MyBoardDTO boardDto = new MyBoardDTO();
		boardDto.setName(name);
		boardDto.setPassword(password);
		boardDto.setEmail(email);
		boardDto.setSubject(subject);
		boardDto.setContent(content);
		boardDto.setTag(tag.charAt(0));

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1
			String sql = "insert into tbl_myboard " +
					" (seq, name, password, email, subject, content, tag, userip) " +
					" values (seq_myboard.nextval, ?, ?, ?, ?, ?, ?, '192.168.0.30')";
			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);
			
			// ?, ?, ?, ?, ?, ? 바인딩 변수 값 설정
			pstmt.setString(1, boardDto.getName());
			pstmt.setString(2, boardDto.getPassword());
			pstmt.setString(3, boardDto.getEmail());
			pstmt.setString(4, boardDto.getSubject());
			pstmt.setString(5, boardDto.getContent());
			pstmt.setString(6, boardDto.getTag()+"");
			
			resultCnt = pstmt.executeUpdate();
			System.out.println("> resultCnt : " + resultCnt);
			pstmt.close();
			DBConn.close();
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		// 글 목록 페이지로 이동
		// /board/list GET 요청 -> List.java -> days05/list.jsp 응답
		String location = "/jspPro/board/list";
		if(resultCnt == 1) {
			location += "?regist=success";
		}
		response.sendRedirect(location);
	}
}
