package bean;

public class RegisterBean {
	private int id_user;
	private String username, name, password, email;

	public RegisterBean() {
		// TODO Auto-generated constructor stub
	}

	public RegisterBean(int id_user, String username, String name, String password, String email) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.name = name;
		this.password = password;
		this.email = email;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
