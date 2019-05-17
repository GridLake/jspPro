package days15.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
