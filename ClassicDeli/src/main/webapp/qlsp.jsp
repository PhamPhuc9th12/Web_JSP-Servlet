<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@page import="com.classicdeli.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String cate_id = request.getParameter("categrory");
String title_header = request.getParameter("cate");
ProductDAO pd = new ProductDAO(ClassicDeliDB.getConnection());
List<Product> products = pd.getProducts(cate_id);
;

DecimalFormat df = new DecimalFormat("#,###.###");
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
<link rel="stylesheet"
	href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
<title>Management Products</title>
<link rel="stylesheet" href="assets/css/adminStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div id="main">
		<div class="container">
			<div class="name">
				<h2>Products Management</h2>
				<a href="mainpage_admin.jsp"> <i class="ti-home"></i>
				</a>
			</div>
			<form action="admin-add-product" class="inforNV" method="get">
				<h3>Add more products for website</h3>
				<div class="inforNV-1-2">
					<span>Remain: </span><input type="text" name="Remain" value=""
						placeholder="Number"> <select name="categro"
						id="membership">
						<option value="B">BEVEREGE</option>
						<option value="D">DAIARY</option>
						<option value="G" selected>GROCERY</option>
						<option value="M">MEAT</option>
						<option value="P">PASTRY</option>
						<option value="S">SEAFOOD</option>
						<option value="V">VEGETABLES</option>
					</select>
					<div class="add-btn">
						<button>Add Product</button>
					</div>
				</div>
				<div class="inforNV-2-2 ">

					<span>Name: </span><input type="text" name="pName" value=""
						placeholder="Name"> <span>Prices: </span><input
						type="text" name="Price" value="" placeholder="Prices"> <span>Image:
					</span><input type="text" name="Image" value="" placeholder="Image">
				</div>
				<div class="clear"></div>
			</form>
			<h3 class="text">Genarel Products Information</h3>

			<div class="sort-buy">
				<span>Choose category</span> <i class="ti-angle-down"></i>
				<div class="dropdown-content">
					<a href="category-product?categrory=B&cate = BEVEREGE">BEVEREGE</a>
					<a href="category-product?categrory=D&cate = DIARY">DAIARY</a> <a
						href="category-product?categrory=G&cate = GROCERY">GROCERY</a> <a
						href="category-product?categrory=M&cate = MEAT">MEAT</a> <a
						href="category-product?categrory=P&cate = PASTRY">PASTRY</a> <a
						href="category-product?categrory=S&cate = SEAFOOD">SEAFOOD</a> <a
						href="category-product?categrory=V&cate = VEGETABLES">VEGETABLES</a>
				</div>
			</div>
			<table class="table table-Light">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Price</th>
						<th scope="col" class="colImg">Image</th>
						<th scope="col">Remain</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (!products.isEmpty()) {
						for (Product p : products) {
							String formattedPrice = df.format(p.getPrice());
					%>
					<tr>
						<td><%=p.getpId()%></td>
						<td><%=p.getpName()%></td>
						<td><%=p.getPrice()%></td>
						<td><img src="<%=p.getImage()%>" alt="products-image"></td>
						<td><%=p.getRemain()%></td>
						<td><a href="admin-update-product?pId=<%=p.getpId()%>"><button
									class="update-btn">Update</button> </a></td>
						<td><a href="remove-product-admin?pName=<%=p.getpName()%>">
								<button class="remove-btn">Delete</button>
						</a></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>



</body>
</html>