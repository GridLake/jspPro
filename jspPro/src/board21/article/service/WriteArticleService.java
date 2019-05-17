package board21.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import board21.article.dao.ArticleDao;
import board21.article.model.Article;

public class WriteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	
	public int write(WriteRequest request) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false); // 이 코딩 주의
			
			Article article = toArticle(request);
			int savedArticle = articleDao.insert(conn, article);
			if (savedArticle == 0) {
				throw new RuntimeException("fail to insert content");
			}
			conn.commit();
			return savedArticle;
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (NamingException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

	private Article toArticle(WriteRequest request) {
		Date now = new Date();
		return new Article(request.getWriter(), request.getTitle(), request.getContent(), now, 0);
	}
}
