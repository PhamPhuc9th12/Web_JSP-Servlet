<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.classicdeli.model.*"%>
<%
 Users info_User = (Users)request.getSession().getAttribute("info_User");
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
         <form class="signup">
            <div class="signup_item">
                <label for="phoneNumber">Phone number</label>
               <input type="text" id="phoneNumber" name="phone" size="60" placeholder="Phone number"value = "<%= info_User.getPhone()%>" readonly>
            </div>
            <div class="signup_item">
                <label for="fullName">Full name</label>
                <input type="text" id="fullName" name="name" size="60" placeholder="Full name" readonly value = "<%= info_User.getuName()%>" >
            </div>
        
            <div class="signup_item">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" size="60" value = "<%= info_User.getAddress()%>" readonly>
            </div>
           
        </form>
         <div class = "btn-user">
            	<a href = "ud-user?IdUser=<%= info_User.getuId()%>"><button class = "ud_user">Update</button></a>
            	<a href = "change-pw?IdUser=<%= info_User.getuId()%>"><button class = "change_pw">Change PassWord</button></a>
            </div>
    </div>	
	    <!--login-footer same signup-footer  -->
	    <%@ include file="/includes/footer.jsp" %>
    </div>
</body>
</html>