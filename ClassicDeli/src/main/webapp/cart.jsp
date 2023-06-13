<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <%@page import="java.text.DecimalFormat"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	ArrayList<Cart> cartList =(ArrayList<Cart> )session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	DecimalFormat df = new DecimalFormat("#,###.###");
	if(cartList != null){
		ProductDAO pDao = new ProductDAO(ClassicDeliDB.getConnection());
		cartProduct = pDao.getCartProducts(cartList);
		long total = pDao.getTotalCartPrice(cartList);
		String total_price = df.format(total);
		request.setAttribute("total_price", total_price);
		request.setAttribute("cart_list", cartList);
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
    <title>Cart</title>
</head>
<body>
	 <%@ include file="/includes/header.jsp" %>
	  <div class="cart-container">
            <div class="cart-gird">
                <div class="cart-content-left Col-l">
                    <h1 class="h1">Shopping cart</h1>
                    <hr class="gach">
                    <a class="cart-continue" href="./mainpage.jsp">
                        <i class="ti-angle-left"></i>
                        Continue shopping
                    </a>
                </div>
               
               
                <% if(cartList != null){
                	 	for(Cart c : cartProduct){ 
                	 		String formattedPrice = df.format(c.getPrice());
                	 	%>
                	 		<div class="show-product-cart">
                         		<img alt="" src="<%=c.getImage()%>">
                         		<div class="name-in-cart">
                         			<h3><%=c.getpName()%></h3>
                         		</div>
                         	<form action="" method="post" class="form-inline">
                         		<input type="hidden" name="id" value="<%=c.getpId()%>" class="form-input">
                         		<input type="text" name="quality" class="form-control" value="<%=c.getQuantity() %>" readonly>
                         		<div class="icre-reduce">		
                         			<a class="increase" href="quantity-inc-dec?action=inc&id=<%=c.getpId()%>"><i class="ti-plus"></i></a>
                         			<a class="reduce" href="quantity-inc-dec?action=dec&id=<%=c.getpId()%>"><i class="ti-minus"></i></a>
                         		</div>              
                         	</form>
                         	<div class="cart_price">
                         		<h3><%=formattedPrice%><span> VND</span></h3>
                         	</div>
                         	<div class="remove">
                         		<a class="remove-product" href="remove-from-cart?id=<%=c.getpId()%>">Remove</a>
                         	</div>
                         </div>
                <% 	 	}
                	}
                %> 
                
               
                
                <div class="cart-content-right Col-r">
                    <div class="cart-summary">
                        <div class="cart-block"></div>
                        <div class="cart-totals-product">
                            <div class="cart-block">
                                <div class="cart-summary-line">
                                    <span class="label">0 items</span>
                                </div>
                                <div class="cart-summary-line">
                                    <span class="label">Shipping</span>
                                    <span class="value">Calculated at checkout</span>
                                </div>
                            </div>
                            <div class="cart-block">
                                <div class="cart-summary-line">
                                    <span class="label"></span>
                                    <span class="value"></span>
                                </div>
                            </div>
                            <hr class="gach">
                            <div class="cart-block">
                                <div class="cart-summary-line cart-total">
                                    <span class="label">Total (tax incl.)</span>
                                    <span class="value">${total_price} VND</span>
                                </div>
                            </div>
                            <div class="cart-block checkouts">
                            	<a href="check-out"> <button type="button" class="checkout-btn">CHECKOUT</button></a>
                            </div>
                            </div>
                        </div>
                        <div class="anthemeblock-ressurance">
                            <ul>
                                <li>
                                    <div class="anthemeblock-item">
                                        <figure>
                                            <a href="#">
                                                <img src="./assets/Img/reassurance/secure.jpg" alt="">
                                                <span>secure bayment</span>
                                            </a>
                                        </figure>
                                    </div>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <div class="anthemeblock-item">
                                        <figure>
                                            <a href="#">
                                                <img src="./assets/Img/reassurance/high_quality.jpg" alt="">
                                                <span>High quality products</span>
                                            </a>
                                        </figure>
                                    </div>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <div class="anthemeblock-item">
                                        <figure>
                                            <a href="#">
                                                <img src="./assets/Img/reassurance/shipping.jpg" alt="">
                                                <span>EXPRESS SHIPPING</span>
                                            </a>
                                        </figure>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>        
                </div>
            </div>
        </div>
	  <%@ include file="/includes/footer.jsp" %>
</body>
</html>