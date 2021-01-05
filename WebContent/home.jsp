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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		<div class="container">
			<div class="form-group">
				<h2 style="text-align: center">Welcome to e-book</h2>
			</div>
			<jsp:include page="indexSearch.jsp"></jsp:include>
			<div class="row">
			<%!Connection con = null;
				PreparedStatement ps = null;
				ResultSet rs = null;%>
			<%
				con = DB.getConnection();
				String sql = "select * from name";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
			%>
				<div class="col-sm-3">
					<img class="card-img-top"
						src="https://langgo.edu.vn/public/files/upload/default/images/Theo-chu-de/langgo-download-mien-phi-bo-giao-trinh-tieng-anh-giao-tiep-cho-nguoi-di-lam.jpeg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center" >
							<a href="#"><%=rs.getString("filename")%> </a> 
						</h5>
						<p class="card-text" style="text-align: center">
							<%=rs.getString("description")%>
						</p>
						<div class="card-footer">
							<small class="text-muted"><%=rs.getTimestamp("added_date")%></small>
						</div>

					</div>
				</div>
			<%
				}
			%>
		</div>
			<jsp:include page="footer.jsp"></jsp:include>

		</div>

</body>
</html>