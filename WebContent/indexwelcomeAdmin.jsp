<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<center>
 
<h2>
    <%
    if(session.getAttribute("loginAdmin")==null || session.getAttribute("loginAdmin")=="") //check if condition for unauthorize user not direct access welcome.jsp page
    {
        response.sendRedirect("indexLogin.jsp");
    }
    %>
    
    Welcome, <%=session.getAttribute("loginAdmin")%> 
</h2>

<h3>
    <a href="${pageContext.request.contextPath}/BookController?action=listBookAdmin">Home</a>
</h3>
<h3>
    <a href="indexlogout.jsp">Logout</a>
</h3>


</center>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

