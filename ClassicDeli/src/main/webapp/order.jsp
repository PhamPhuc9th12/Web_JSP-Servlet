<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%
  ArrayList<Cart> cartList =(ArrayList<Cart> )session.getAttribute("cart-list");
  DecimalFormat df = new DecimalFormat("#,###.###");
  if(cartList != null){
	  request.setAttribute("cart_list",cartList);
  }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
    <title>Classic Deli</title>
</head>
<body>
	<%@ include file="/includes/header.jsp" %>
	<%
		if(auth == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="container-order">
		<div class="header-order">
			<h3>ALL ORDERS</h3>
		</div>
		<div class="table-order">
			<p>Date</p>
			<p>Name</p>
			<p>Quantity</p>
			<p class="price-menu">Price</p>
			<p>Cancel</p>
		</div>
		<div class="show-order-list">
			<%if(orders != null){
				for(Order o : orders){
					String formattedPrice = df.format(o.getPrice());
				%>
					<p><%=o.getoDate() %></p>
					<p><%=o.getpName() %></p>
					<p class="quantity-show"><%=o.getoQuantity()%></p>
					<p class="price-show"><%=formattedPrice %></p>
					<a class="cancel-from-order" href="cancel-order?id=<%=o.getoId()%>&pId=<%=o.getpId() %>&quantity=<%=o.getoQuantity() %>">Cancel</a>
			<% 	}	
			}
			
			%>
		</div>
	</div>
</body>
</html>