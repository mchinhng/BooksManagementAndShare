<%
    session.invalidate(); //session destroy
    response.sendRedirect("home.jsp"); //after destroy redirect to index.jsp page
%>