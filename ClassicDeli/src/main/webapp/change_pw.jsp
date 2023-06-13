
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.classicdeli.model.*"%>
<%
 Users info_User = (Users)request.getSession().getAttribute("info_Users");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
     <link rel="stylesheet" href="./assets/css/adminStyle.css">
    <title>Document</title>
</head>
<body>
    <!-- header of signup same header of mainpage -->
    <div class="signup-page">
        <%@ include file="/includes/header.jsp" %>

	    <!-- registration form -->
	    <div class="form-signup">
        <h1>YOUR INFORMATION</h1>
        <p>You wanna shopping now?
            <span>
                <a href="./mainpage.jsp">Return to HomePage!</a>
            </span>
        </p>
         <form class="signup" method ="post" >
            <div class="signup_item">
                <label for="phoneNumber">Phone number</label>
               <input type="tel" id="phoneNumber" name="phone" size="60" readonly value = "<%= info_User.getPhone()%>" >
            </div>
                 <div class="signup_item password">
                <label for="usePass">Password</label>
                 <div class = "validate">
                 	<input type="password" id="usePass" name="passWord" size="60" placeholder="Password" required>
                	 <i class="ti-eye" id="togglePassword" onclick="togglePasswordVisibility()"></i>
                	<%
                		String msg1 = (String) request.getAttribute("msg1");
                		String msg2 = (String) request.getAttribute("msg2");
                		if(msg1 != null){%>
                			<style>
                				.password i{
                					top: 38%;
                				}
                			</style>
                			<p>
                				<%out.print(msg1); %>
                			
                			</p>
                			<p>
                				<%out.print(msg2); %>
                			
                			</p>
                		
                		<% }%>            	
                </div>
            </div>
         <div class = "btn-user">
            	<button class = "btn-save">Save</button>
            </div>
        </form>
    </div>	
	    <!--login-footer same signup-footer  -->
	    <%@ include file="/includes/footer.jsp" %>
    </div>
      <script type="text/javascript">
    	function togglePasswordVisibility() {
    	  var passwordField = document.getElementById("usePass");
    	  var togglePassword = document.getElementById("togglePassword");

    	  if (passwordField.type === "password") {
    	    passwordField.type = "text";
    	    
    	  } else {
    	    passwordField.type = "password";
    	   
    	  }
    	}

    </script>
</body>
</html>



