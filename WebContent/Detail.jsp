<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="bean.Book"%>
<%@page import="dao.BookDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="BookController">
		<div class="card">
			<img class="card-img-top"
				src="https://langgo.edu.vn/public/files/upload/default/images/Theo-chu-de/langgo-download-mien-phi-bo-giao-trinh-tieng-anh-giao-tiep-cho-nguoi-di-lam.jpeg"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">
					<a href="#"><c:out value="${book.name}" /></a>
				</h5>
				<p class="card-text">
					<c:out value="${book.description}" />
				</p>
				<p class="card-text">
					<small class="text-muted"><c:out value="${book.added_Date}" /></small>
				</p>
			</div>
			
			<a href="DownloadServlet?fileName=<c:out value="${book.fileName}" />">Download</a>
		</div>
	</form>
</body>
</html>