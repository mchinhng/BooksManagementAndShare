package bean;

import java.util.ArrayList;
import java.util.List;

public class LoginBean {
	private String username, password;
	private List<String> roles;

	public LoginBean() {
		// TODO Auto-generated constructor stub
	}

	public LoginBean(String username, String password, String... roles) {
		super();
		this.username = username;
		this.password = password;
		this.roles = new ArrayList<String>();
		if (roles != null) {
			for (String r : roles) {
				this.roles.add(r);
			}
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public List<String> getRoles() {
	      return roles;
	   }
	 
	   public void setRoles(List<String> roles) {
	      this.roles = roles;
	   }
}
