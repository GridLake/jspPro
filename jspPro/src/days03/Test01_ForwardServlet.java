package days03;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test01_ForwardServlet
 */
@WebServlet("/days03/forward.jsp")
public class Test01_ForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test01_ForwardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식은 필요없음
		// request.setCharacterEncoding("utf-8");
		// response.setContentType("text/html; charset=UTF-8");
		String message = request.getParameter("message");
		String path = "test01_ok.jsp?message=" + URLEncoder.encode(message, "UTF-8");
		response.sendRedirect(path);
		
		/*
		String path = "test01_ok.jsp";
		RequestDispatcher  dispatcher =  request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
