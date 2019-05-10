package board21.auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import board21.member.dao.MemberDAO;
import board21.member.model.Member;

public class LoginService {

	private MemberDAO memberDAO = new MemberDAO();
	
	public User login(String memberid, String password) {
		try (Connection conn = ConnectionProvider.getConnection()){
			Member member = memberDAO.selectById(conn, memberid);
			if (member == null) {
				throw new LoginFailException();
			}
			if (!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			return new User(member.getMemberid(), member.getName());
		} catch (SQLException e) {
			throw new RuntimeException();
		} catch (NamingException e1) {
			throw new RuntimeException();
		}
	}
}
