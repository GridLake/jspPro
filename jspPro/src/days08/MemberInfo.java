package days08;

import java.io.Serializable;
import java.util.Date;

//jsp 에서는 아니지만 원래 직렬화를 할 수 있어야 한다.
public class MemberInfo implements Serializable{
	
//	JavaBeans
	
	private String id;
	private String password;
	private String name;
	private String email;
	private Date registerDate;
	
//	defalut 생성자
	public MemberInfo() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	
	
}
