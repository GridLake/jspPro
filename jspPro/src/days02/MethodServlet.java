package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */
// @WebServlet(urlPatterns = "/days02/method", loadOnStartup = 2) //  / 조심
@WebServlet(urlPatterns = "/days02/method"
		  , initParams = {
				  @WebInitParam(name="user", value="scott")
				  ,@WebInitParam(name="password", value="tiger")
		  }) // 이 코딩은 이렇게도 할 수 있다는 것을 보여주기 위한 코딩, 원래는 모든 요소 다 적어야 함
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MethodServlet() {
    	super();
    	System.out.println("> MethodServlet init()");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    // doGet, doPost이 둘 다 같고, 뭐가 들어와도 처리할 거면 doPost 쓰면 되고,
    // doGet과 doPost의 기능을 분리해야 할 경우에는 service보다 doGet, doPost 나누는 것이 적절
    /*
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("> service()");
	}
    */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// System.out.println("> doGet()");
		String msg = request.getParameter("msg");
		PrintWriter out = response.getWriter();
		out.append(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// System.out.println("> doPost");
	}

}
