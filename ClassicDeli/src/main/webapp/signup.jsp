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
    <title>Document</title>
</head>
<body>
    <!-- header of signup same header of mainpage -->
    <div class="signup-page">
        <%@ include file="/includes/header.jsp" %>

	    <!-- registration form -->
	    <div class="form-signup">
        <h1>CREATE AN ACCOUNT</h1>
        <p>Already have an account?
            <span>
                <a href="./login.jsp">Log in instead!</a>
            </span>
        </p>
        <form method = "post" action="user-signup" class="signup">
            <div class="signup_item">
                <label for="phoneNumber">Phone number</label>
                <div class = "validate">
                	 <input type="tel" id="phoneNumber" name="phone" size="60" placeholder="Phone number" required>
                	 <%
                		String msg = (String) request.getAttribute("msg");
                		if(msg != null){%>
                			<p>
                				<%out.print(msg); %>
                			</p>
                		
                		<% }%>
                	<%
                		String msg4 = (String) request.getAttribute("msg4");
                		if(msg4 != null){%>
                			<p>
                				<%out.print(msg4); %>
                			</p>
                		
                		<% }%>
                </div>
               
            </div>
            <div class="signup_item">
                <label for="fullName">Full name</label>
                <input type="text" id="fullName" name="name" size="60" placeholder="Full name" required>
            </div>
            <div class="signup_item password">
                <label for="usePass">Password</label>
                 <div class = "validate">
                 	<input type="password" id="usePass" name="pass" size="60" placeholder="Password" required>
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
            <div class="signup_item">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" size="60" placeholder="Address" required>
            </div>
            <button type="submit" class="save">Save</button>
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













