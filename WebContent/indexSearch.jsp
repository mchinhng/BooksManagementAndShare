<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
<head>
<title>Search Book</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<center>
	<div class="container">
		<div class="form-group">
		</div>
		<br>
		<div class="form-group">
			<form method="get" action="Search">
				<div class="form-group">
					<%
						Connection con;
						PreparedStatement pst;
						ResultSet rs;
						try {
							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_upload", "root", "123456789");
							 pst = con.prepareStatement("select category from file_upload.categor_y");
							rs = pst.executeQuery();

							if (rs.next()) {
								out.println("<tr>");
								out.println("<td>Choose category</td>");
								out.println("<td>");
								out.println("<select name='combo'>");
								do {
									String category = rs.getString("category");
									out.println("<option value='" + category + "'>" + category + "</option>");
								} while (rs.next());
								out.println("</select>");
								rs.close();
								out.println("</td></tr>");
								out.println("</tr><td colspan=2 align=center><input type=submit  value=Search></td></tr>");

							} else {
								out.println("<tr>");
								out.println("<td colspan=2 align=right>");
								out.println("Sorry table is Empty");
								out.println("</td>");
							}
							out.println("</form>");
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</div>
			</form>
		</div>
		</div>
		</center>
</body>
</html>