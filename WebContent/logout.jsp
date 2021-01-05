<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form action="Logout" method="post">
		<tr>
			<div class="container">
				<div class="regbox box">
					<td><h3>Login</h3></td>
		</tr>
		<tr>
			<td>User Name</td>
			<td><input type="text" placeholder="username" name="username"></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" placeholder="password" name="password"></td>
		</tr>
		<tr>
			<td><input type="submit" name="submit" value="login"></td>
			<td><a href="register.jsp">Registration</a></td>
		</tr>
		</div>
		</div>
	</form>
</body>
</html>