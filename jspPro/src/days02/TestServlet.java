package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); // 서블릿에서 한글 인코딩할 때 꼭 필요한 코딩
		int n = Integer.parseInt(request.getParameter("num"));
		//System.out.printf("> param.num = %d\n", n);
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>"                                                                           );
		out.println("<html>"																					);
		out.println("<head>"																					);
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>"					);
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>"  );
		out.println("<meta charset='UTF-8'>"																	);
		out.println("<title>HTML Class - 2019. 4. 25. - 오전 9:04:13</title>"									);
		out.println("<script>"																				    );
		out.println("   $(document).ready(function (){"													     	);
		out.println("   "																						);
		out.println("   });"																					);
		out.println("</script>"																				    );
		out.println("</head>"																					);
		out.println("<body>"    																				);
		
		int sum = 0;

		for (int i = 1; i <= n; i++) {
			sum += i;
			if(i != n) out.print(i + "+");
			else out.print(i);
		}
		out.printf("=%d\n", sum);
		out.println("<a href='/jspPro/days02/test01.html'>한글 다시</a>");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);
	}

	
}
