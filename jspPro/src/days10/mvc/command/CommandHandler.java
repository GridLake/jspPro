package days10.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

	// request.setAttribute() 역할 외에도
	// String 형태의 뷰를 반환
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
