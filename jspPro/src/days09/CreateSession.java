package days09;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateSession extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// name, age   세션에 저장한 후 ex05_ok.jsp 리디렉션.. 출력
		// *****
		// ㄱ. request.getSession(); == request.getSession(true);
		//     세션 객체가 있으면 있는 걸 반환하고, 없으면 새로 세션 생성해서 반환하는 메소드
		//     if (session != null) {}   X
		
		// ㄴ. 세션 객체가 없으면 null 반환하는 메소드
		/*
		boolean create = false;
		HttpSession session = request.getSession(create);
		if (session != null) {
			
		}
		*/
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("age", age);
		
		response.sendRedirect("ex05_ok.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
