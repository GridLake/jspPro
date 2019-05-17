package days16.replyboard.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.replyboard.model.ReplyBoardDTO;
import days16.replyboard.service.ListService;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNumberVal = request.getParameter("pageNo");
		
		// 1. 서비스 호출 답변형게시글 ArrayList request.setAttribute
		try {
			ListService service = new ListService();
			List<ReplyBoardDTO> list = service.select();
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/days16/list";
	}

}
