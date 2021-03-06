package days15.guestbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.util.JdbcUtil;

import days15.guestbook.model.Message;

public class MessageDao {

	private static MessageDao messageDao = new MessageDao();
	
	public static MessageDao getInstance() {
		return messageDao;
	}
	
	private MessageDao() {};
	
	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into guestbook_message_15 "
										+ "(message_id, guest_name, password, message) "
										+ "values(seq_guestbook_message_15.nextval,?,?,?)");
			pstmt.setString(1, message.getGuest_name());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public Message select(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message_15 where message_id = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException{
		Message message = new Message();
		message.setMessage_id(rs.getInt("message_id"));
		message.setGuest_name(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		
		return message;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message_15");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			/*
			pstmt = conn.prepareStatement("select * from guestbook_message_15 "
										+ "order by message_id desc");
			pstmt.setInt(1, firstRow -1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			*/
			String sql = " select *                                                     ";
			sql+=     " from (                                                       ";
			sql+=   "     select rownum no, t.*                                    ";
			sql+=   "     from (                                                   ";
			sql+=   "         select  *      ";
			sql+=   "         from guestbook_message_15                                     ";
			sql+=   "         order by message_id desc                                    ";
			sql+=   "     ) t                                                      ";
			sql+=   " ) b                                                          ";
			sql+=   " where b.no between ? and ?                  ";	
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow - 1);
			// pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow - firstRow + 1);
			// pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				List<Message> messageList = new ArrayList<Message>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int delete(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from guestbook_message_15 where message_id = ?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
