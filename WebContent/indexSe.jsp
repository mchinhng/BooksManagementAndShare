<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<title>Search Book</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<center>
	<div class="container">
		<div class="form-group">
			<h2>Search</h2>
		<div class="container">
		<form method="get" action="Search2">
			<%
			Connection con;
			PreparedStatement pst;
			ResultSet rs;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_upload", "root", "123456789");
				String filename = request.getParameter("filename");
				out.print("<h3>Details</h3>");
				if (filename == null || filename.isEmpty()) {
					pst = con.prepareStatement("select name.id,name.username, name.filename, name.description , name.path, categor_y.category from name inner join categor_y on name.ID_category = categor_y.ID_category where filename =?");
					rs = pst.executeQuery();

					out.println("<table width=60% border= 1   >");
					out.println("<tr><td colspan=6 ");
					out.println("<center><h2>Book</h2></center>");
					out.println("</td></tr>");
					out.println("<tr>");
					out.println("<th>ID</th>");
					out.println("<th>username</th>");
					out.println("<th>filename</th>");
					out.println("<th>category</th>");
					out.println("<th>added_date</th>");
					out.println("<th>Download</th>");
					out.println("</tr>");

					while (rs.next()) {
						out.println("<tr>");
		                  out.println("<td>" + rs.getString("id") + "</td> ");
		                  out.println("<td>" + rs.getString("username") + "</td> ");
		                  out.println("<td>" + rs.getString("filename") + "</td> ");
		                  out.println("<td>" + rs.getString("description") + "</td> ");
		                  out.println("<td>" + rs.getString("category") + "</td> ");
		                  out.print("<td>" + "<a href=\"DownloadServlet?fileName=\" =rs.getString(\"path\")>" + "Download"+ "</a>" + "</td>");
		                  out.println("</tr>");
					}

				} else {
					pst = con.prepareStatement("select name.id,name.username, name.filename, name.description , name.path, categor_y.category from name inner join categor_y on name.ID_category = categor_y.ID_category where filename =?");
					pst.setString(1, filename);
					rs = pst.executeQuery();
					while (rs.next()) {
						
						out.println("<table width=60% border= 1   >");
						out.println("<tr><td colspan=6 ");
						 out.println("<tr>");
		                  out.println("<td>" + rs.getString("id") + "</td> ");
		                  out.println("<td>" + rs.getString("username") + "</td> ");
		                  out.println("<td>" + rs.getString("filename") + "</td> ");
		                  out.println("<td>" + rs.getString("description") + "</td> ");
		                  out.println("<td>" + rs.getString("category") + "</td> ");
		                  out.print("<td>" + "<a href=\"DownloadServlet?fileName=\" =rs.getString(\"path\")>" + "Download"+ "</a>" + "</td>");
		                  out.println("</tr>");
						out.print("</Table>");
					}
				}
				out.println("</table>");
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			<div class="form-group col-6 p-0">
				<form id="form" method="post" action="indexSearch.jsp"
					class="form-horizontal">
					<div class="form-group col-md-6">
						<label>File Name</label> <input type="text" name="filename"
							class="form-control" id="username" placeholder="File name">
					</div>
					<div class="form-group col-md-6" align="center">

						<input type=submit value=Search>
						</td>
						</tr>

					</div>

				</form>

			</div>
			
			</form>
		</div>
		</center>
</body>
</html>