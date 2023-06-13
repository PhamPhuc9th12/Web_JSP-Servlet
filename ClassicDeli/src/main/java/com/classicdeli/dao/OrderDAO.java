package com.classicdeli.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.model.Order;
import com.classicdeli.model.Product;

public class OrderDAO {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	public OrderDAO(Connection con) {
		this.con = con;
	}
	
	public boolean insertOrder(Order model) {
		boolean result = false;
//		add pId,uId,quantity,date to the Orders table in database
		try {
			query = "insert into orders (pId,uId,oQuantity,oDate) values (?,?,?,?)";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, model.getpId());
			ps.setInt(2, model.getuId());
			ps.setInt(3, model.getoQuantity());
			ps.setString(4, model.getoDate());
			ps.executeUpdate();
			
			result = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	public List<Order> userOrder(int id){
		List<Order> listOrders = new ArrayList<>();
		
		try {
//			get a list of orders sorted by oId
			query = "select * from orders where uId=? order by orders.oId desc";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				ProductDAO pDao = new ProductDAO(this.con);
//				get name , price from product then save in order
				int pId = rs.getInt("pId");
				Product product = pDao.getSingleProduct(pId);
				order.setoId(rs.getInt("oId"));
				order.setPrice(product.getPrice() * rs.getInt("oQuantity"));
				order.setpId(pId);
				order.setpName(product.getpName());
				order.setoQuantity(rs.getInt("oQuantity"));
				order.setoDate(rs.getString("oDate"));
				listOrders.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listOrders;
	}
	
	public void cancelOrder(int id) {
		try {
//			delete product in order page
			query = "delete from orders where oId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
// get thong ke theo ngay
	public ArrayList<Order> adminOrderDate(String oDate){
		ArrayList<Order> listOrders = new ArrayList<>();
		
		try {
//			get a list of orders sorted by oId
			query = "select * from orders where oDate = ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, oDate);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				ProductDAO pDao = new ProductDAO(this.con);
//				get name , price from product then save in order
				int pId = rs.getInt("pId");
				Product product = pDao.getSingleProduct(pId);
				order.setoId(rs.getInt("oId"));
				order.setPrice(product.getPrice() * rs.getInt("oQuantity"));
				order.setpId(pId);
				order.setpName(product.getpName());
				order.setoQuantity(rs.getInt("oQuantity"));
				order.setoDate(rs.getString("oDate"));
				listOrders.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listOrders;
	}
// get thong ke theo thang
	public ArrayList<Order> adminOrderMonth(String oDate){
		ArrayList<Order> listOrders = new ArrayList<>();
		String year = oDate.substring(0,oDate.indexOf("-"));
		String month = oDate.substring(oDate.indexOf("-")+1,oDate.length());
		try {
//			get a list of orders sorted by oId
			query = "select * from orders where year(oDate) = ? and month(oDate) = ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, year);
			ps.setString(2, month);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				ProductDAO pDao = new ProductDAO(this.con);
//				get name , price from product then save in order
				int pId = rs.getInt("pId");
				Product product = pDao.getSingleProduct(pId);
				order.setoId(rs.getInt("oId"));
				order.setPrice(product.getPrice() * rs.getInt("oQuantity"));
				order.setpId(pId);
				order.setpName(product.getpName());
				order.setoQuantity(rs.getInt("oQuantity"));
				order.setoDate(rs.getString("oDate"));
				listOrders.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listOrders;
	}
// Thong ke theo khoang ngay
	public ArrayList<Order> adminOrderMonth(String startDay,String endDay){
		ArrayList<Order> listOrders = new ArrayList<>();
		try {
//			get a list of orders sorted by oId
			query = "select * from orders where oDate>= ? and oDate<= ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, startDay);
			ps.setString(2, endDay);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				ProductDAO pDao = new ProductDAO(this.con);
//				get name , price from product then save in order
				int pId = rs.getInt("pId");
				Product product = pDao.getSingleProduct(pId);
				order.setoId(rs.getInt("oId"));
				order.setPrice(product.getPrice() * rs.getInt("oQuantity"));
				order.setpId(pId);
				order.setpName(product.getpName());
				order.setoQuantity(rs.getInt("oQuantity"));
				order.setoDate(rs.getString("oDate"));
				listOrders.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return listOrders;
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OrderDAO oDao = new OrderDAO(ClassicDeliDB.getConnection());
		ArrayList<Order> listO= new ArrayList<>();
		listO = oDao.adminOrderMonth("2023-06");
		for(Order o: listO) {
			System.out.println(o);
		}
		
	}
}
