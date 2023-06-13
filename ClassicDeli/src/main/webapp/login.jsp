<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Cart> cartList =(ArrayList<Cart> )session.getAttribute("cart-list");
	if(cartList != null){
	request.setAttribute("cart_list", cartList);
}
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
    <title>Login</title>
</head>

<body>
	<input type="hidden" id = "status" value="<%=request.getAttribute("status")%>">
    <div class="loginpage">
        <%@ include file="/includes/header.jsp" %>

	    <div class="form-wrapper">
	        <header>
	            <h1>LOG IN TO ACCOUNT</h1>
	        </header>
	        <form action="users-login" method="post">
	            <input type="text" name="contact" placeholder="Phone number" size="60" required id="phoneNumber">
	            <input type="password" name="password" placeholder="Password" size="60" required id="userPass">
	            <div class="forgot-create">
	                <div class="forgot-password">
	                    <a href="">Forgot your password?</a>
	                </div>
	                <div class="create-account">
	                    <a href="./signup.jsp">No account? Create one here</a>
	                </div>
	            </div>
	            <button type="submit" class="submit-btn">SIGN IN</button>
	        </form>
	    </div>

    <%@ include file="/includes/footer.jsp" %>\
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type = "text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed"){
		swal("Sorry", "Phone number or password is incorrect", "./assets/Img/status/incorrect.jpg")
	}
</script>
</body>
</html>
