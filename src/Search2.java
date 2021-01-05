import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search2")
public class Search2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int i;
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			i++;
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			String filename = request.getParameter("filename");

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_upload", "root", "123456789");
			pst = con.prepareStatement(
					"select name.id, name.filename, name.description , categor_y.category from name inner join categor_y on name.ID_category = categor_y.ID_category where filename =?");
			pst.setString(1, filename);
			rs = pst.executeQuery();

			out.println("<table width=60% border= 1   >");
			out.println("<tr><td colspan=5 ");
			out.println("<center><h2>Result of Search</h2></center>");
			out.println("</td></tr>");
			out.println("<tr>");
			out.println("<th>ID</th>");
			out.println("<th>filename</th>");
			out.println("<th>description</th>");
			out.println("<th>category</th>");
			out.println("<th>Download</th>");
			out.println("</tr>");

			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("id") + "</td> ");
				out.println("<td>" + rs.getString("filename") + "</td> ");
				out.println("<td>" + rs.getString("description") + "</td> ");
				out.println("<td>" + rs.getString("category") + "</td> ");
				out.print("<td>" + "<a href=\"DownloadServlet?fileName=\" =rs.getString(\"path\")>" + "Download"
						+ "</a>" + "</td>");
				out.println("</tr>");

			}
			out.println("</table>");

		} catch (ClassNotFoundException ex) {

		} catch (Exception e) {
			throw new ServletException("error", e);
		}
	}

	public void destory() {
		i = 0;
	}

}