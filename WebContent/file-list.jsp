<%@page import="servlet.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
tr, td, th {
	padding: 20px;
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<h1 align="center">Wellcome to e-books</h1>
	<div class="container">
		<br> <br> <br>
		<center>
			<%!Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;%>
			<table border="2">
				<tr>
					<th>ID</th>
					<th>File Name</th>
					<th>Discription</th>
					<th>Category</th>
					<th>Added Date</th>
					<th>Download</th>
				</tr>
				<%
					con = DB.getConnection();
					String sql = "select name.id, name.filename, name.description, name.path, name.added_date, categor_y.category from name inner join categor_y on name.ID_category = categor_y.ID_category";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("id")%></td>
					<td><%=rs.getString("filename")%></td>
					<td><%=rs.getString("description")%></td>
					<td><%=rs.getString("category")%></td>
					<td><%=rs.getTimestamp("added_date")%></td>
					<td><a href="DownloadServlet?fileName=<%=rs.getString(4)%>">Download</a></td>

				</tr>
				<%
					}
				%>

			</table>
			<a href="upfile.jsp">Upload file</a>

		</center>
	</div>
</body>
</html>