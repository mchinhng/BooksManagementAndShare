<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("indexwelcome.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        
        <script language="javascript">	
	function validate()
	{
            var user_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
            var name_valid= /^[a-z A-Z]+$/; 
            var password_valid=/^[A-Z a-z 0-9]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9 and 6 to 12 range
            var email_valid= /^[a-z A-Z]+$/; 
            
            
            var uname = document.getElementById("uname");
            var name_ = document.getElementById("name_"); //textbox id email
            var e_mail = document.getElementById("e_mail");
            var password = document.getElementById("password"); //textbox id password
				
          
            if(!user_name.test(uname.value) || uname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
            {
		alert("Enter Username Alphabet Only....!"); //alert message
                uname.focus();
                uname.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!name_valid.test(uname.value) || uname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
            {
		alert("Enter Username Alphabet Only....!"); //alert message
                uname.focus();
                uname.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!password_valid.test(password.value) || password.value=='') //apply if condition using test() method match the parameter for pattern passoword allow 6 to 12 range 
            {
		alert("Password Must Be 6 to 12 character"); //alert message
                password.focus();
                password.style.background = '#f08080'; //set textbox color
                return false;                    
            }
	}		
	</script>
    </head>

<body>
	<div class="container">
		<div class="regbox box">
			<center>
				<h1>Register</h1>

				<form method="post" action="RegisterController"
					onsubmit="return validate();">

					Username <input type="text" name="txt_username" id="uname"></br>
					</br> Name <input type="text" name="txt_name" id="name_"></br>
					</br> Password <input type="password" name="txt_password" id="password"></br>
					</br> Email <input type="text" name="txt_email" id="e_mail"></br>
					</br> <input type="submit" name="btn_register" value="Register">

					<h3>
						You have a account? <a href="indexLogin.jsp">Login</a>
					</h3>

				</form>

				<h3 style="color: red">
					<%
                    if(request.getAttribute("RegisterErrorMsg")!=null)
                    {
                        out.println(request.getAttribute("RegisterErrorMsg")); //get register fail error message from "RegisterController"
                    }
                %>
				</h3>
		</div>
	</div>
</body>

</html>
