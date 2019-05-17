package board21.auth.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board21.auth.service.LoginFailException;
import board21.auth.service.LoginService;
import board21.auth.service.User;
import board21.member.command.CommandHandler;

public class LoginHandler implements CommandHandler{

	private static final String FORM_VIEW = "/board21/loginForm";
	private LoginService loginService = new LoginService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberid = trim(request.getParameter("memberid"));
		String password = trim(request.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		if (memberid == null || memberid.isEmpty())
			errors.put("memberid", Boolean.TRUE);
		if (password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			User user = loginService.login(memberid, password);
			request.getSession().setAttribute("authUser", user);
			
			// http://localhost/jspPro/WEB-INF/view/board21/loginForm.jsp
			// response.sendRedirect("WEB-INF/view/board21/index.jsp");
			// /jspPro
			// System.out.println(request.getContextPath());
			
			// redirect 방식으로 WEB-INF 접근하고 싶으면... ".do"와 같이 패턴으로
			HttpSession session = request.getSession(false);
			if (session.getAttribute("referer") != null) {
				response.sendRedirect((String)session.getAttribute("referer"));
			} else {
				response.sendRedirect(request.getContextPath() + "/index.do");
			}
			return null;
			
			// 포워딩으로 하면 DB 연동할 때 누락될 수 있음
			// return "/board21/index";
			
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}
	
}
