package board21.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.member.service.DuplicateIdException;
import board21.member.service.JoinRequest;
import board21.member.service.JoinService;

// p.597
public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/board21/joinForm";
	private JoinService joinService = new JoinService();
	
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
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		JoinRequest joinReq = new JoinRequest();
		joinReq.setMemberid(request.getParameter("memberid"));
		joinReq.setName(request.getParameter("name"));
		joinReq.setPassword(request.getParameter("password"));
		joinReq.setConfirmPassword(request.getParameter("confirmPassword"));
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			return "/board21/joinSuccess";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	
	
	
}
