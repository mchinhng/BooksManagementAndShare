<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Update user</title>
</head>
<body>
	<jsp:include page="headerAdmin.jsp"></jsp:include>
	<div class="container">
		<br> <br> <br> <br>
		<center>
				<form action="UploadServlet" method="post"
					enctype="multipart/form-data">
					<table width="400px" align="center" border=2>
						<tr>
							<td align="center" colspan="2">Files</td>
						</tr>
						<tr>
							<td>File Name</td>
							<td><input type="text" required="" name="filename"></td>
						</tr>

						<tr>
							<td>Category</td>
							<td><select name="ID_category">
									<option value="1">Dictionary</option>
									<option value="2">Short story</option>
									<option value="3">Nonfiction</option>
									<option value="4">Novel</option>
									<option value="5">Romance</option>
									<option value="6">Horror</option>

							</select></td>
						</tr>
						<tr>
							<td>Description</td>
							<td><input type="text" required="" name="description"></td>
						</tr>
						<tr>
							<td>Select File</td>
							<td><input type="file" required="" name="file"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Submit"></td>
						</tr>
					</table>

				</form>
			<br> <a href="${pageContext.request.contextPath}/">Home</a>
		</center>
	</div>
</body>
</html>
