package board21.auth.service;

public class User {

	private String memberid;
	private String name;
	
	public User(String memberid, String name) {
		this.memberid = memberid;
		this.name = name;
	}

	public String getMemberid() {
		return memberid;
	}

	public String getName() {
		return name;
	}
	
}
