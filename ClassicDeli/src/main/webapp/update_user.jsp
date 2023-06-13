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
                <a href="./login.jsp">Return to HomePage!</a>
            </span>
        </p>
         <form class="signup" method = "post">
            <div class="signup_item">
                <label for="fullName">Full name</label>
                <input type="text" id="fullName" name="name" size="60"  value = "<%= info_User.getuName()%>" >
            </div>
        
            <div class="signup_item">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" size="60" value = "<%= info_User.getAddress()%>" >
            </div>
           
         <div class = "btn-user">
            	<button class = "btn-save">Save</button>
            </div>
        </form>
    </div>	
	    <!--login-footer same signup-footer  -->
	    <%@ include file="/includes/footer.jsp" %>
    </div>
</body>
</html>