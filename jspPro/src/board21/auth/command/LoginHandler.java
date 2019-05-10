package board21.auth.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			return "/board21/index";
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}
	
}
