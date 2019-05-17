package days16.replyboard.command;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.replyboard.model.ReplyBoardDTO;
import days16.replyboard.service.WriteService;

public class WriteHandler implements CommandHandler {

	private static final String FORM_VIEW = "/days16/write";
	private WriteService writeService = new WriteService();

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
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

		// 1. 새글
		// 2. 답글(부모글 정보 ref, step, depth)
		ReplyBoardDTO dto = new ReplyBoardDTO();
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));
		dto.setIp(request.getRemoteAddr()); // ip address
		
		String p_num = request.getParameter("p_num");
		if(p_num == null) {
			dto.setStep(0);
			dto.setDepth(0);
		} else {
			dto.setRef(Integer.parseInt(request.getParameter("p_ref")));
			dto.setStep(Integer.parseInt(request.getParameter("p_step")));
			dto.setDepth(Integer.parseInt(request.getParameter("p_depth")));
		}
		
		// int newArticleNo = writeService.write(writeReq);
		// request.setAttribute("newArticleNo", newArticleNo);

		try {
			WriteService service = new WriteService();
			int result = service.write(dto);
			if(result == 1) response.sendRedirect("list.do"); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
