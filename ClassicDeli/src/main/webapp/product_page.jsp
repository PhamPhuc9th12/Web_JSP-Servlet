
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String cate_id = request.getParameter("category");
String title_header = request.getParameter("cate");
String sort = request.getParameter("sort");
ProductDAO pd = new ProductDAO(ClassicDeliDB.getConnection());
List<Product> products = null;
if (sort == null) {
	products = pd.getProducts(cate_id);
	;
} else {
	if (sort.equals("AtoZ")) {
		products = pd.getProductsAtoZ(cate_id);
	}
	if (sort.equals("ZtoA")) {
		products = pd.getProductsZtoA(cate_id);
	}
	if (sort.equals("lowToHigh")) {
		products = pd.getProductsPriceAsc(cate_id);
	}
	if (sort.equals("highToLow")) {
		products = pd.getProductsPriceDesc(cate_id);
	}
}

DecimalFormat df = new DecimalFormat("#,###.###");

ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cartList != null) {
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
<link rel="stylesheet"
	href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
<title>Classic Deli</title>
</head>
<body>
	<%@ include file="/includes/header.jsp"%>
	<!-- products page -->
	<div class="bread-wrapper">
		<a href="./mainpage.jsp">HOME</a>
		<p>/</p>
		<a href=""><%=title_header%></a>
	</div>
	<div class="container-products">
		<h1><%=title_header%></h1>
		<div class="products-selection">
			<p>
				There are
				<%=products.size()%>
				products
			</p>
			<div class="sort-buy">
				<span>Sort by:</span> <i class="ti-angle-down"></i>
				<div class="dropdown-content">
					<a
						href="./product_page.jsp?category=<%=cate_id%>&cate=<%=title_header%>&sort=AtoZ">Name,A
						to Z</a> <a
						href="./product_page.jsp?category=<%=cate_id%>&cate=<%=title_header%>&sort=ZtoA">Name,Z
						to A</a> <a
						href="./product_page.jsp?category=<%=cate_id%>&cate=<%=title_header%>&sort=lowToHigh">Price,low
						to high</a> <a
						href="./product_page.jsp?category=<%=cate_id%>&cate=<%=title_header%>&sort=highToLow">Price,high
						to low</a>
				</div>
			</div>
		</div>
		<div class="product-session">
			<div class="product-content">
				<%
				if (!products.isEmpty()) {
					for (Product p : products) {
						String formattedPrice = df.format(p.getPrice());
				%>
				<div class="product-content-1-4">
					<div class="product-img">
						<a href="detail?pid=<%=p.getpId()%>"><img
							src="<%=p.getImage()%>" alt="products-image"></a>
					</div>
					<div class="product-infor">
						<h3><%=p.getpName()%></h3>
						<div class="product-about">
							<p>
								Remain:
								<%=p.getRemain()%></p>
							<p class="price"><%=formattedPrice%>
								vnd
							</p>
						</div>
						<div class="product-buy">
							<a
								href="add-to-cart?category=<%=cate_id%>&cate=<%=title_header%>&id=<%=p.getpId()%>">
								<button class="product-addToCart">Add To Cart</button>
							</a> <a href="buy-now?quantity=1&id=<%=p.getpId()%>">
								<button class="product-buyNow">Buy Now</button>
							</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
		<%@ include file="/includes/footer.jsp"%>
		<script src="./assets/JS/main.js"></script>
</body>
</html>
