<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.classicdeli.model.*"%>
<%
/*session auth to save user in browser  */
	Users auth = (Users) request.getSession().getAttribute("auth");
	UserDAO uDao = new UserDAO(ClassicDeliDB.getConnection());
	PositionDAO pDao = new PositionDAO(ClassicDeliDB.getConnection());
	Boolean isAdmin = false;
	List<Order> orders = null;
	if(auth != null){
		request.setAttribute("auth", auth);
		/*get id from user logged in browser  */
		orders = new OrderDAO(ClassicDeliDB.getConnection()).userOrder(auth.getuId());
		int id = auth.getuId();
		Position pos = pDao.checkPositions(id);
		if(pos.getPosition().equals("admin")== true ) {
			isAdmin = true;
		}
	}
%>

<div class="header">
            <h1 class="header__text font">Order today, delivery tomorrow (closed on Saturday afternoon & Sunday)</h1>
        </div>

        <div class="navbar">
            <a href="index.jsp"><img src="./assets/Img/homepage_logo/homepage-logo.png" alt="Classic Deli" class="navbar__logo"></a>
           <form action="search-control?index=1" method="post">   
	            <div class="navbar__search">
	                <i class="search__icon ti-search"></i>
	                <input type="text" class="search__input" name="txtSearch" required>
	                <button class="btn search__btn" type="submit">Search</button>
	            </div>
			</form> 
            <%	if(auth != null){%>
            		<a href="log-out" class="btn navbar__signin">
                    	<span class="signin__text fs15">Log out <i class = "ti-shift-right fs15"></i></span>
                	</a>
                	   <a href="info-user?idU=<%=auth.getuId()%>" class="btn navbar__signin">
                    	<span class="signin__text fs15"> <i class = "ti-user fs15"></i>User</span>
                    	
                	</a>
            	<% }else{%>
            		 <a href="./login.jsp" class="btn navbar__signin">
                		<span class="signin__text fs15">Sign in <i class = "ti-shift-right fs15"></i></span>
           			 </a>
            	<%}%>
			
			<%
				if(isAdmin) {
					%>
					<a href="./qlsp.jsp" class="btn navbar__signin">
            			<span class="signin__text fs15" id="manage_products">Manage Product</span>
       			 	</a>
       			 	<a href="./qluser.jsp" class="btn navbar__signin">
            			<span class="signin__text fs15">Manage User</span>
       			 	</a>
       			 	<a href="./thongke.jsp" class="btn navbar__signin">
            			<span class="signin__text fs15">Statistic</span>
       			 	</a>
				<%
				}else{
					%>
					<a href="./order.jsp" class="btn navbar__signin">
                		<span class="signin__text fs15">Order</span>
           			 </a>
		            <a href="./cart.jsp" class="btn navbar__cart">
		                <i class="navbar__cart-icon ti-shopping-cart"></i>
		                <span class="cart__text fs15">   <i class = "ti-shopping-cart-full fs15"></i> Cart: </span>
		              
		                <span class="cart__count fs15">${cart_list.size()}</span>
		            </a>
		         
			<%	
				}
			%>
			
			
        </div>

        <div class="content">
            <div class="content__category">
                <div class="catefory-list">
                    <a class="category-item" id="B" href="./product_page.jsp?category=B&cate=BEVERGE">BEVERGE</a>
                    <a class="category-item" id="D" href="./product_page.jsp?category=D&cate=DAIRY">DAIRY</a>
                    <a class="category-item" id="G" href="./product_page.jsp?category=G&cate=GROCERY">GROCERY</a>
                    <a class="category-item" id="M" href="./product_page.jsp?category=M&cate=MEAT">MEAT</a>
                    <a class="category-item" id="P" href="./product_page.jsp?category=P&cate=PASTRY">PASTRY</a>
                    <a class="category-item" id="S" href="./product_page.jsp?category=S&cate=SEAFOOD">SEAFOOD</a>
                    <a class="category-item" id="V" href="./product_page.jsp?category=V&cate=VEGETABLE">VEGETABLE</a>
                </div>

                <div class="category__aside-list">
                    <a class="category__aside-item" href="">Flash Sales</a>
                    <a class="category__aside-item" href="">New Arrival</a>
                    <a class="category__aside-item" href="">Pack Deals</a>
                    <a class="category__aside-item" href="">Best Sellers</a>
                </div>
            </div>
        </div>
        
         <script src="./assets/JS/main.js"></script>
