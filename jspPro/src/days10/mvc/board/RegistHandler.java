package days10.mvc.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days05.MyBoardDTO;
import days10.mvc.command.CommandHandler;

public class RegistHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equalsIgnoreCase("GET")) { 
			System.out.println("> Regist.doGet()...");
			return "/board/regist";
		}
		
		else if(request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("> Regist.doPost()...");
			
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
			
			response.sendRedirect("/jspPro/board/list.do"); // list.do를 다시 요청하도록
			return null;
			// return "/board/list"; // 이렇게 코딩하면 list.jsp 껍데기 페이지만 요청
			
		} else return null;
	}

	
}
