package board21.member.model;

import java.util.Date;

public class Member {

	private String memberid;
	private String name;
	private String password;
	private Date regdate;
	
	public Member() {}
	
	public Member(String memberid, String name, String password, Date regdate) {
		this.memberid = memberid;
		this.name = name;
		this.password = password;
		this.regdate = regdate;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMemberid() {
		return memberid;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public Date getRegdate() {
		return regdate;
	}
	
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}
	
	public void changePassword(String newPwd) {
		this.password = newPwd;
	}
	
}
