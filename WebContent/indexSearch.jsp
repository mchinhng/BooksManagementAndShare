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
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

 -->
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