<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>

</style>

</head>
<body>
	<div style="height: 60px">
		<div>
			<ul style="list-style: none; padding-top: 12px">
				<li style="float: left; margin-top: -13px"><a
					href="${pageContext.request.contextPath}/BookController?action=listBookAdmin""> <img alt=""
						src="https://i.pinimg.com/originals/34/6a/1f/346a1f4363e1b59f6860fdce6abc1082.jpg"
						style="width: 50px; height: 50px;">
				</a></li>
				<li style="float: left"><a
					href="${pageContext.request.contextPath}/UserController?action=listUser">List
						Users</a> &nbsp;</li>
				<li style="float: left"><a
					href="${pageContext.request.contextPath}/BookController?action=listBookAdmin">List
						Books</a> &nbsp;</li>
				<li style="float: left"><a href="indexLogin.jsp">Profile</a>
					&nbsp;</li>

				<li style="float: left"><a
					href="${pageContext.request.contextPath}/logout">Logout</a> &nbsp;
				</li>

				<li style="float: left"><a
					href="${pageContext.request.contextPath}/UploadServlet">Upload
						book</a> &nbsp;</li>

				<li style="float: left"><span style="color: red">[
						${user.username} ]</span> &nbsp;</li>
				<form id="form" method="get" action="Search2"
					class="form-horizontal">
					<span class="icon"><i class="fa fa-search"></i></span> <input
						type="search" name="filename" placeholder="Search book..." />
					<button type="submit" value="Search">Search</button>
				</form>

			</ul>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>




