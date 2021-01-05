package controller;

import bean.LoginBean;
import dao.LoginDao;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("btn_login") != null) // kiem tra su kien tu btn_login
		{
			String username = request.getParameter("txt_username"); // lay du lieu tu txt_
			String password = request.getParameter("txt_password");

			LoginBean loginBean = new LoginBean(); 

			loginBean.setUsername(username); 
			loginBean.setPassword(password); 

			LoginDao loginDao = new LoginDao();

			String authorize = loginDao.authorizeLogin(loginBean); 


			if (authorize.equals("SUCCESS LOGIN ADMIN")) {
				HttpSession session = request.getSession(); 
				session.setAttribute("loginAdmin", loginBean.getUsername()); 
																				
				RequestDispatcher rd = request.getRequestDispatcher("indexwelcomeAdmin.jsp"); 
																								
				rd.forward(request, response);
			} else if (authorize.equals("SUCCESS LOGIN")) {
				HttpSession session = request.getSession(); // tao session
				session.setAttribute("login", loginBean.getUsername()); // session ten "login" and lay du lieu username tu getUsername()
				RequestDispatcher rd = request.getRequestDispatcher("indexwelcome.jsp"); // chuyen trang
				rd.forward(request, response);
			}

			else {
				request.setAttribute("WrongLoginMsg", authorize); 
				RequestDispatcher rd = request.getRequestDispatcher("indexLogin.jsp");
				rd.include(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("indexLogin.jsp");

		dispatcher.forward(request, response);
	}

}
