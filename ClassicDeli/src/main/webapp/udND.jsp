<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@page import="com.classicdeli.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
  <link rel="stylesheet" href="assets/css/adminStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<div id="main2">
       <h3>Update User</h3>
   <form action="admin-update-user" method ="post">
   	<input class = "add-field" type="text" name ="uId" readonly value = "<%= Integer.parseInt(String.valueOf(request.getAttribute("uId")))%>">
       <input class = "add-field"type= "text"name ="Uname"  placeholder="Name">
       <input class = "add-field"type="text" name ="Uphone" placeholder="Phone number">
       <!-- <input class = "add-field"type="text" name ="Upass"  placeholder="Password"> -->
       <input class = "add-field"type="text" name ="Uaddress"  placeholder="Address">
	    <div class="button-register">
	        <button>Update</button>
	    </div>
   </form>
   </div>
</body>
</html>



