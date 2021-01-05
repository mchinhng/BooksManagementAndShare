package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import bean.RegisterBean;

public class RegisterDao {
	private Connection con;

	public RegisterDao() {
		con = servlet.db.DB.getConnection();
	}
	
	public String authorizeRegister(RegisterBean registerBean) 
	{
		String username = registerBean.getUsername(); 
														
		String name = registerBean.getName();
		String password = registerBean.getPassword();
		String email = registerBean.getEmail();

		String url = "jdbc:mysql://localhost:3306/"; 
		String uname = "root";
		String pass = "123456789"; 

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, uname, pass); 

			PreparedStatement pstmt = null;

			pstmt = con.prepareStatement("insert into file_upload.user(username,name,password,email) values(?,?,?,?)"); 
			pstmt.setString(1, username);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.executeUpdate(); 

			pstmt.close(); 

			con.close(); 

			return "SUCCESS REGISTER"; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "FAIL REGISTER"; 
	}
}
