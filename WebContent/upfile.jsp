<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="headerUser.jsp"></jsp:include>
	<div class="container">
		<br> <br> <br> <br>

			<form action="UploadServlet" method="post"
				enctype="multipart/form-data">
				<table width="400px" align="center" border=2>
					<tr>
						<td align="center" colspan="2">Files</td>
					</tr>
					<tr>
						<td>File Name</td>
						<td><input type="text" required="" name="name"></td>
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

	</div>
</body>
</html>
