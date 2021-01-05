<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>List All Users</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%
		int first = 0, last = 0, pages = 0;
		if (request.getParameter("pages") != null) {
			pages = (int) Integer.parseInt(request.getParameter("pages"));
		}
		int total = new UserDao().getCount();
		if (total <= 3) {
			first = 0;
			last = total;
		} else {
			first = (pages - 1) * 3;
			last = 3;
		}

		List<User> list = new UserDao().getUser(first, last);
	%>
	<jsp:include page="headerAdmin.jsp"></jsp:include>
	<center>
		<div class="container">
			<div class="form-group">
				<h2>List All Users</h2>
			</div>
			<center>
				<table border=2>
					<thead>
						<tr>
							<th>User Id</th>
							<th>User name</th>
							<th>Name</th>
							<th>PassWord</th>
							<th>Email</th>
							<th colspan=2>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td><c:out value="${user.user_id}" /></td>
								<td><c:out value="${user.username}" /></td>
								<td><c:out value="${user.name}" /></td>
								<td><c:out value="${user.password}" /></td>
								<td><c:out value="${user.email}" /></td>
								<td><a
									href="UserController?action=edit&user_id=<c:out value="${user.user_id}"/>">Update</a></td>
								<td><a
									href="UserController?action=delete&user_id=<c:out value="${user.user_id}"/>">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div id="pages">
					<ul id="pagination-flickr">
						<a href="listUser?pages=2">Previous</a>
						<%
							for (int i = 1; i < (total / 3) + 1; i++) {
								if (pages == i) {
						%>
						<a id="cool" href="index.jsp?pages=<%=i%>"><%=i%></a>
						<%
							} else {
						%>
						<a href="index.jsp?pages=<%=i%>"><%=i%></a>
						<%
							}
							}
						%>
						<a href="listUser?pages=2">Next</a>
					</ul>
				</div>
				<p>
					<a href="UserController?action=insert">Add User</a>
				</p>
			</center>
		</div>
</body>
</html>