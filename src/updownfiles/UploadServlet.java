package updownfiles;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import servlet.db.DB;

@WebServlet(name = "UploadServlet", urlPatterns = { "/UploadServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 1000, // 1 GB
		maxRequestSize = 1024 * 1024 * 1000) // 1 GB
public class UploadServlet extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;

	PrintWriter out = null;
	Connection con = null;
	PreparedStatement ps = null;
	HttpSession session = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/upfile.jsp");

		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			out = response.getWriter();
			session = request.getSession(false);
			String folderName = "resources";
			String uploadPath = request.getServletContext().getRealPath("") + folderName;
			File dir = new File(uploadPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			Part filePart = request.getPart("file");// Textbox value of name file.
			
			String description = request.getParameter("description");
			String ID_category = request.getParameter("ID_category");
			String filename = filePart.getSubmittedFileName();
			String path = folderName + File.separator + filename;
			Timestamp added_date = new Timestamp(System.currentTimeMillis());
			System.out.println("filename: " + filename);
			System.out.println("Path: " + uploadPath);
			InputStream is = filePart.getInputStream();
			Files.copy(is, Paths.get(uploadPath + File.separator + filename), StandardCopyOption.REPLACE_EXISTING);

			try {
				con = DB.getConnection();
				System.out.println("connection done");
				String sql = "insert into name(filename,description,ID_category,path,added_date) values(?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, filename);
				ps.setString(2, description);
				ps.setString(3, ID_category);
				ps.setString(4, path);
				ps.setTimestamp(5, added_date);
				int status = ps.executeUpdate();
				if (status > 0) {
					session.setAttribute("fileName", filename);
					String msg = "" + filename + " File uploaded successfully...";
					request.setAttribute("msg", msg);
					RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
					rd.forward(request, response);
					System.out.println("File uploaded successfully...");
					System.out.println("Uploaded Path: " + uploadPath);
				}
			} catch (SQLException e) {
				out.println("Exception: " + e);
				System.out.println("Exception1: " + e);
			} finally {
				try {
					if (ps != null) {
						ps.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					out.println(e);
				}
			}

		} catch (IOException | ServletException e) {
			out.println("Exception: " + e);
			System.out.println("Exception2: " + e);
		}
	}

}