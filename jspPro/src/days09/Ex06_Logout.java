package days09;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex06_Logout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		// 1. 세션 auth 값 가져오기
		String auth = (String)session.getAttribute("auth");
		// 2. 세션 auth 삭제
		session.invalidate();
		// 3. 로그아웃 경고창 + default.jsp 이동
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert(\"[" +  auth + "]님 로그아웃 되었습니다\");");
		out.println("location.href = \"ex06_default.jsp\";");
		out.println("</script>");
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
