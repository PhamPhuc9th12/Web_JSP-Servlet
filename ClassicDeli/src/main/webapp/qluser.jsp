<%@page import="com.classicdeli.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.classicdeli.connect.ClassicDeliDB"%>
<%@page import="com.classicdeli.dao.ProductDAO"%>
<%@page import="com.classicdeli.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ProductDAO pd = new ProductDAO(ClassicDeliDB.getConnection());
UserDAO udao = new UserDAO(ClassicDeliDB.getConnection());
List<Users> users = udao.getUsers();
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
<title>Manage User</title>
<link rel="stylesheet" href="assets/css/adminStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div id="main">
		<div class="container">
			<div class="name">
				<h2>Users Management</h2>
				<a href="mainpage_admin.jsp">
					<i class="ti-home"></i>
				</a>
			</div>
			<h3 class="text">General Users Information</h3>
			<table class="table table-Light">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Phone number</th>
						<!-- <th scope="col">Password</th> -->
						<th scope="col">Address</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (!users.isEmpty()) {
						for (Users u : users) {
					%>
					<tr>
						<td><%=u.getuId()%></td>
						<td><%=u.getuName()%></td>
						<td><%=u.getPhone()%></td>
						<%-- <td><%=u.getuPass()%></td> --%>
						<td><%=u.getAddress()%></td>
						<td><a href="admin-update-user?uId=<%=u.getuId()%>"><button
									class="update-btn">Update</button> </a></td>
						<td><a href="remove-user-admin?uId=<%=u.getuId()%>">
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