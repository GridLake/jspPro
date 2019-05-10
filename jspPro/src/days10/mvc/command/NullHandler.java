package days10.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 요청한 페이지가 있을지라도 404 에러 메시지로 응답하겠다
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
		return null;
	}

}
