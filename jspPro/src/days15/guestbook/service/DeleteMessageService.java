package days15.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days15.guestbook.dao.MessageDao;
import days15.guestbook.model.Message;

public class DeleteMessageService {

	private static DeleteMessageService instance = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	public DeleteMessageService() {}
	
	public void deleteMessage(int messageId, String password) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false); //
			
			MessageDao messageDao = MessageDao.getInstance();
			Message message = messageDao.select(conn, messageId);
			if (message == null) {
				throw new MessageNotFoundException("메시지 없음");
			}
			if (!message.matchPassword(password)) {
				throw new InvalidPasswordException("bad password");
			}
			messageDao.delete(conn, messageId);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.close(conn);
			throw new ServiceException("삭제 실패: " + e.getMessage(), e);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (InvalidPasswordException | MessageNotFoundException e) {
			JdbcUtil.close(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
