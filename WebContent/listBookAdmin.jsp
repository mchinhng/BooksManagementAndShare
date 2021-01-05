<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>List All Books</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<jsp:include page="headerAdmin.jsp"></jsp:include>
	<center>
		<div class="container">
			<div class="form-group">
				<h2>List All Books</h2>
			</div>
			<center>
				<table border=2>
					<thead>
						<tr>
							<th>ID</th>
							<th>File Name</th>
							<th>Description</th>
							<th>Category</th>
							<th>Added Date</th>
							<th colspan=2>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${books}" var="book">
							<tr>
								<td><c:out value="${book.id}" /></td>
								<td><a href="BookController?action=detail&id=<c:out value="${book.id}" />"><c:out
									value="${book.name}" /></a></td>
								<td><c:out value="${book.description}" /></td>
								<td><c:out value="${book.ID_category}" /></td>
								<td><c:out value="${book.added_Date}" /></td>
								<!-- <td><a
									href="BookController?action=edit&id=<c:out value="${book.id}"/>">Update</a></td>-->

								 <td><a
									href="BookController?action=delete&id=<c:out value="${book.id}" />">Delete</a></td>
									<td><a href="DownloadServlet?fileName=<c:out value="${book.fileName}" />">Download</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p>
					<a href="upfile.jsp">Add Book</a>
				</p>
			</center>
		</div>
</body>
</html>