package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Book;
import dao.BookDao;

public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/File.jsp";
	private static String LIST_BOOK = "/listBookUser.jsp";
	private static String LIST_BOOK_ADMIN = "/listBookAdmin2.jsp";

	private BookDao dao;

	public BookController() {
		super();
		dao = new BookDao();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			dao.deleteBook(id);
			forward = LIST_BOOK;
			request.setAttribute("books", dao.listAllBooks());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int id = Integer.parseInt(request.getParameter("id"));
			Book book = dao.getBook(id);
			request.setAttribute("book", book);
		} else if (action.equalsIgnoreCase("listBookUser")) {
			forward = LIST_BOOK;
			request.setAttribute("books", dao.listAllBooks());
		} else if (action.equalsIgnoreCase("listBookAdmin")) {
			forward = LIST_BOOK_ADMIN;
			request.setAttribute("books", dao.listAllBooks());
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Book book = new Book();
		book.setFileName(request.getParameter("filename"));
		book.setDescription(request.getParameter("description"));
		book.setID_category(request.getParameter("ID_category"));
		book.setPath(request.getParameter("path"));
		String id = request.getParameter("id");
		if (id == null || id.isEmpty()) {
			dao.addBook(book);
		} else {
			book.setId((Integer.parseInt(id)));
			dao.updateBook(book);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_BOOK);

		request.setAttribute("books", dao.listAllBooks());

		view.forward(request, response);
	}
}