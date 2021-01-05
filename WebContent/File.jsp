<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
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
								<option value="1">A</option>
								<option value="2">B</option>
								<option value="Other">Other</option>
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
			<br> <a href="homeLogin.jsp">View List</a>
		</center>
	</div>
</body>
</html>
