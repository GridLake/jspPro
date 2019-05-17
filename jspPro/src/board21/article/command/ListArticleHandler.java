package board21.article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board21.article.service.ArticlePage;
import board21.article.service.ListArticleService;
import board21.member.command.CommandHandler;

public class ListArticleHandler implements CommandHandler{

	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNoVal = request.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		ArticlePage articlePage = listService.getArticlePage(pageNo);
		request.setAttribute("articlePage", articlePage);
		return "/board21/listArticle";
	}

	
}
