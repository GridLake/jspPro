package board21.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// p.597
public interface CommandHandler {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
