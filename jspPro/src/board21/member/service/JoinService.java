package board21.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import board21.member.dao.MemberDAO;
import board21.member.model.Member;

public class JoinService {

	private MemberDAO memberDAO = new MemberDAO();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDAO.selectById(conn, joinReq.getMemberid());
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicatedIdException();
			}
			
			memberDAO.insert(conn
					, new Member(
							 joinReq.getMemberid()
							,joinReq.getName()
							,joinReq.getPassword()
							,new Date())
					 );
			conn.commit();
		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
