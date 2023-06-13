<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.classicdeli.model.*"%>
 <%@page import="java.text.DecimalFormat"%> 

<%
DecimalFormat df = new DecimalFormat("#,###.###");
List<Order> listO = (ArrayList<Order>) (request.getAttribute("listO"));

%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Statistic</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!-- datatable -->
		<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
		<link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
		<link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
		<link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
		<link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="./assets/css/reset.css">
	   <link rel="stylesheet" href="./assets/css/base.css">
	   <link rel="stylesheet" href="./assets/css/adminStyle.css">
	    <link rel="stylesheet" href="./assets/css/style.css">
	   <link rel="stylesheet" href="./assets/icon_font3/themify-icons-font/themify-icons/themify-icons.css">
	</head>
	<body>
		<div class="container">
		  <div class="name">
            <h2 style = "margin-top: 0px;">Thống kê doanh thu </h2>
            <a href="mainpage_admin.jsp">
					<i class="ti-home"></i>
			</a>
            </div>
		<div class="col-sm-3">
			<h1 style = "font-size:25px;">Mời chọn ngày:</h1>
			<form  method="post" action = "thong-ke-ngay?action=theoNgay">
			<input type="date" name="ngay">
			<button class="btn btn-sm btn-defaut" >Thống kê</button>
			</form>
		</div>
		
		<div class="col-sm-3">
			<h1 style = "font-size:25px;">Mời chọn tháng:</h1>
			<form  method="post" action = "thong-ke-ngay?action=theoThang">
			<input type="month" name="thang">
			<button class="btn btn-sm btn-defaut" >Thống kê</button>
			</form>
		</div>
		
		<div class="col-sm-3">
			<h1 style = "font-size:25px;">Từ ngày:</h1>
			<form  method="post" action = "thong-ke-ngay?action=theoKhoangNgay">
			<input type="date" name="startDay">
			<div class = "theoNgay">
				<h1 style = "font-size:25px;">Đến ngày:</h1>
				<input type="date" name="endDay">
			<button class="btn btn-sm btn-defaut" >Thống kê</button>
			</div>
			</form>
		</div>
		<br>
		<div class="row ">
		
		<table id="datatable-buttons" class="table table-striped table-bordered">
		<thead>
		<tr>
		<th>STT</th>
		<th>Tên sản phẩm</th>
		<th>Giá </th>
		<th>Số lượng bán ra</th>
		<th>Doanh thu</th>
		<th>Ngày</th>
		</tr>
		</thead>
		<tbody>
		<%if(listO != null){
			for(Order o :listO){ 
			%>
				<TR>
				<TD><%= o.getoId() %> </td>
				<TD><%= o.getpName() %> </TD>
				<TD><%= df.format(o.getPrice()) %>.vnd </TD>
				<TD><%= o.getoQuantity() %> </TD>
				<TD> <%= df.format(o.getoQuantity()*o.getPrice()) %>.vnd</TD>
				<TD><%=o.getoDate() %></TD>
				</TR>
			<%}
		}
		%>
		
		</tbody>
		</table>
		</div>
		</div>
		
	</body>
	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- datatable -->
	<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="vendors/jszip/dist/jszip.min.js"></script>
	<script src="vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="vendors/pdfmake/build/vfs_fonts.js"></script>
	
	
	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>
</html>