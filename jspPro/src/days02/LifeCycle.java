package days02;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycle extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get 방식으로 url 요청 -> mapping -> LifeCycle 서블릿 객체를 
		System.out.println("> doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("> doPost()");
	}

	@Override
	public void destroy() {
		// 서블릿 객체가 소멸할 때
		System.out.println("> destroy()");
	}

	@Override
	// 서블릿 객체가 생성될 때 서블릿 관련 설정...
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	public void init() throws ServletException {
		// 서블릿 객체를 생성할 때
		System.out.println("> init()");
	}

	
}
