package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RegisterBean;
import dao.RegisterDao;

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btn_register") != null)
		{
			String username = request.getParameter("txt_username"); 
			String name = request.getParameter("txt_name");
			String password = request.getParameter("txt_password");
			String email = request.getParameter("txt_email");

			RegisterBean registerBean = new RegisterBean(); 

			registerBean.setUsername(username); 
			registerBean.setName(name);
			registerBean.setPassword(password);
			registerBean.setEmail(email);

			RegisterDao registerdao = new RegisterDao(); 

			String registerValidate = registerdao.authorizeRegister(registerBean); 

			if (registerValidate.equals("SUCCESS REGISTER")) 
			{
				request.setAttribute("RegiseterSuccessMsg", registerValidate); 
				RequestDispatcher rd = request.getRequestDispatcher("indexwelcome.jsp"); 
				rd.forward(request, response);
			} else {
				request.setAttribute("RegisterErrorMsg", registerValidate); 
				RequestDispatcher rd = request.getRequestDispatcher("indexregister.jsp"); 
				rd.include(request, response);
			}
		}
	}

}
