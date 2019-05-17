package days16.replyboard.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.replyboard.command.CommandHandler;
import days16.replyboard.command.NullHandler;


public class ControllerUsingURI extends HttpServlet{

	// <커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

	public void init() throws ServletException {

		// configFile 통해서 /WEB-INF/commandHandler.properties 경로를 읽어옴
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();

		// jspPro/WEB-INF/commandHandler.properties와 같이 물리적 경로 가져옴
		String configFilePath = getServletContext().getRealPath(configFile);

		try (FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}

		Iterator keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);

			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String command = request.getRequestURI();
		System.out.println(command);
		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		
		CommandHandler handler = commandHandlerMap.get(command);
		
		if (handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;

		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}

		if (viewPage != null) {
			//  viewPage =  "/WEB-INF/view/WEB-INF/view/board21/joinForm.jsp.jsp
			// 추가한 코딩
			String prefix = "/WEB-INF/view";
			viewPage = prefix + viewPage + ".jsp"; // 유지보수 목적
			// System.out.println("viewpage:" +viewPage);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
