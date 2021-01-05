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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="headerAdmin.jsp"></jsp:include>
	<center>
		<div class="container">
			<div class="form-group">
				<h2>List All Books</h2>
			</div>
			<div class="card-group">
				<c:forEach items="${books}" var="book">
					<div class="card">
						<img class="card-img-top"
							src="https://langgo.edu.vn/public/files/upload/default/images/Theo-chu-de/langgo-download-mien-phi-bo-giao-trinh-tieng-anh-giao-tiep-cho-nguoi-di-lam.jpeg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<a href="#"><c:out value="${book.fileName}" /></a>
							</h5>
							<p class="card-text">
								<c:out value="${book.description}" />
							</p>
							<p class="card-text">
								<small class="text-muted"><c:out
										value="${book.added_Date}" /></small>
							</p>
						</div>
						<a
							href="BookController?action=edit&id=<c:out value="${book.id}"/>">Update</a>

						<a
							href="BookController?action=delete&id=<c:out value="${book.id}" />">Delete</a>
						<a
							href="DownloadServlet?fileName=<c:out value="${book.fileName}" />">Download</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>