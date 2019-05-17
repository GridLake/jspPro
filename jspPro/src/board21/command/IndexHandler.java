package board21.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.member.command.CommandHandler;

public class IndexHandler implements CommandHandler{

	private static final String FORM_VIEW = "/index"; 
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return FORM_VIEW;
	}

	
}
