<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Search</title>
</head>
<body>
<h1>index</h1>
<form action="Controller">
Name <input type ="text" name = "txtName" value = ""/><br/>
	<input type ="submit" name = "action" value = "Search">
<jsp:forward page="/UserController?action=listUser" />
</form>
</body>
</html>