package dao;

import bean.LoginBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class LoginDao {
	private static final Map<String, LoginBean> mapUsers = new HashMap<String, LoginBean>();

	public String authorizeLogin(LoginBean loginBean) 
	{
		String username = loginBean.getUsername(); 
		String password = loginBean.getPassword(); 

		String dbusername = ""; 
		String dbpassword = "";

		String url = "jdbc:mysql://localhost:3306/file_upload"; 
		String uname = "root"; 
		String pass = "123456789"; 

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(url, uname, pass);

			PreparedStatement pstmt = null; 

			pstmt = con.prepareStatement("select * from user where username=? and password=?"); 
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery(); 

			if (username.equals("admin") && password.equals("admin123")) {
				return "SUCCESS LOGIN ADMIN";
			} else {
				while (rs.next()) {
					dbusername = rs.getString("username"); 
					dbpassword = rs.getString("password");

					if (username.equals(dbusername) && password.equals(dbpassword)) 
					{
						return "SUCCESS LOGIN"; 
					}
				}
			}

			pstmt.close();
			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "WRONG USERNAME AND PASSWORD"; 
	}

	public static LoginBean findUser(String userName, String password) {
		LoginBean u = mapUsers.get(userName);
		if (u != null && u.getPassword().equals(password)) {
			return u;
		}
		return null;
	}
}
