<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
 <%@page import="java.text.DecimalFormat"%> 
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@ page import="com.classicdeli.model.Product" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	
	List<Product> products = (List<Product>) request.getSession().getAttribute("products");
	
	DecimalFormat df = new DecimalFormat("#,###.###");
	ArrayList<Cart> cartList =(ArrayList<Cart> )request.getSession().getAttribute("cart-list");
	if(cartList != null){
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
    <title>Classic Deli</title>
</head>
<body>
	<%@ include file="/includes/header.jsp"%>
	 <!-- search page -->
    <div class="bread-wrapper">
		<a href="./mainpage.jsp">HOME</a>
		<p> /</p>
		<a href="#">Search</a>
	</div>
    <div class="container-products">
        <h1>'${txt}'</h1>
        <div class="products-selection">
            <p>The result for '${txt}' is ${count} products </p>
			
    </div>

  <div class="product-session">
  	<div class="product-content">
 	<%
    	if(!products.isEmpty()){
    		for(Product p:products){
    			  String formattedPrice = df.format(p.getPrice());
    		%>
    			<div class="product-content-1-4">
                 <div class="product-img">
                 	<a href="#"><img src="<%=p.getImage() %>" alt="products-image"></a>
                 </div>
                 <div class="product-infor">
                     <h3><%=p.getpName()%></h3>
                     <div class="product-about">
                         <p>Remain: <%=p.getRemain() %></p>
                         <p class = "price"><%= formattedPrice %> vnd</p>
                     </div>
                     <% 
                     	if(isAdmin){%>
                     		
                     <% 	
                     }else{%>
                    	  <div class="product-buy">
	                         <a href="add-to-cart?&id=<%= p.getpId()%>"> <button class="product-addToCart">Add To Cart</button></a>
	                         <a href="buy-now?quantity=1&id=<%=p.getpId()%>"> <button class="product-buyNow">Buy Now</button></a>
                     	</div>
                     <%
                     }
                     %>
                    
                 </div>
             </div>
    		<%
    		}
    	}
    %> 
    	
     	</div>

		 <div class="paging">
	    <%
		    int n = (int) request.getSession().getAttribute("end");
		    String txt = (String) request.getSession().getAttribute("txt");
		    for (int i = 1; i <= n; i++) {
		    %>
		        <form action="search-control" method="post" style="display: inline;">
		            <input type="hidden" name="index" value="<%=i%>">
		            <input type="hidden" name="txtSearch" value="<%=txt%>">
		             <button type="submit"><%=i%></button>
		        </form>
		    <%
		    }
	    %>
	</div>
      </div>     
       
	  <%@ include file="/includes/footer.jsp" %>
	   <script src="./assets/JS/main.js"></script>
	   <script type="text/javascript">
	   
	   </script>
</body>
</html>