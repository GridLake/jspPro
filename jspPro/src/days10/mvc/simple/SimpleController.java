package days10.mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1단계: http 요청 분석
		String type = request.getParameter("type");
		
		// 2단계: 요청을 처리할 모델을 찾아서 결과물 반환(여기에는 모델 없음)
		Object resultObject = null;
		
		if (type == null || type.equals("greeting")) {
			resultObject = "안녕하세요";
		} else if (type.equals("date")){
			resultObject = new java.util.Date();
		} else {
			resultObject = "Invalid Type";
		}
		
		// 3단계: 결과물을 request나 session에 저장
		request.setAttribute("result", resultObject);
		
		// 4단계: RequestDispatcher를 사용하여 알맞은 뷰(jsp 페이지)로 포워딩 or 리다이렉트
		RequestDispatcher dispatcher = request.getRequestDispatcher("/days10/simpleView.jsp");
		dispatcher.forward(request, response);
	}
	
}
