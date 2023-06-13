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
        <h3>Update Information Products</h3>
    <form action="admin-update-product" method ="post">
    	<input class = "add-field" type="text" name ="pId" readonly value = "<%= Integer.parseInt(String.valueOf(request.getAttribute("pId")))%>">
        <input class = "add-field"type= "text"name ="Pname"  placeholder="Name">
        <input class = "add-field"type="text" name ="Pprice" placeholder="Price">
        <input class = "add-field"type="text" name ="Premain"  placeholder="Remain">
        <input class = "add-field"type="text" name ="Pimage"  placeholder="Image">
        <select name="Pcategory" id="membership">
            <option value="B">BEVEREGE</option>
            <option value="D">DAIARY</option>
            <option value="G" >GROCERY</option>
            <option value="M">MEAT</option>
            <option value="P">PASTRY</option>
            <option value="S">SEAFOOD</option>
            <option value="V">VEGETABLES</option>
          </select>
	    <div class="button-register">
	        <button>Update</button>
	    </div>
    </form>
    </div>
</body>
</html>