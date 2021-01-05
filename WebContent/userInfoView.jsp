<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>User Info</title>
   </head>
   <body>
 
     <jsp:include page="headerUser.jsp"></jsp:include>
 
      <h3>Hello: ${loginedUser.username}</h3>
 
      User Name: <b>${loginedUser.username}</b>
      <br />
   </body>
</html>