<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="bean.Book"%>
<%@page import="dao.BookDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>List All Books</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<jsp:include page="headerUser.jsp"></jsp:include>
	<div class="container">
		<div class="form-group">
			<h2 style="text-align: center">List All Books</h2>
		</div>
		<jsp:include page="indexSearch.jsp"></jsp:include>

		<div class="row">
			<c:forEach items="${books}" var="book">
				<div class="col-sm-4">
					<img class="card-img-top"
						src="https://langgo.edu.vn/public/files/upload/default/images/Theo-chu-de/langgo-download-mien-phi-bo-giao-trinh-tieng-anh-giao-tiep-cho-nguoi-di-lam.jpeg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center">
							<a href="BookController?action=detail&id=<c:out value="${book.id}" />"><c:out
									value="${book.name}" /></a>
						</h5>
						<p class="card-text" style="text-align: center">
							<c:out value="${book.description}" />
						</p>
						<div class="card-footer">
							<small class="text-muted"><c:out
									value="${book.added_Date}" /></small>
						</div>
						<a style="align-content: center"
							href="DownloadServlet?fileName=<c:out value="${book.fileName}" />">Download</a>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>