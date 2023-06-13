package com.classicdeli.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.model.*;

public class ProductDAO {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductDAO(Connection con) {
		this.con = con;
	}
	
	public List<Product> getProducts(String categrory){
		List<Product> products = new ArrayList<Product>();
//		get products by categrory
		try {
			query = "select * from products where categrory = ?";
			ps = this.con.prepareStatement(query);
			ps.setString(1, categrory);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
//sort A to Z	
	public List<Product> getProductsAtoZ(String categrory){
		List<Product> products = new ArrayList<Product>();
//		get products by categrory
		try {
			query = "select * from products where categrory = ? order by pName ASC";
			ps = this.con.prepareStatement(query);
			ps.setString(1, categrory);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
//sort Z to A	
	public List<Product> getProductsZtoA(String categrory){
		List<Product> products = new ArrayList<Product>();
//		get products by categrory
		try {
			query = "select * from products where categrory = ? order by pName desc";
			ps = this.con.prepareStatement(query);
			ps.setString(1, categrory);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
// sort by price low to high
	public List<Product> getProductsPriceAsc(String categrory){
		List<Product> products = new ArrayList<Product>();
//		get products by categrory
		try {
			query = "SELECT * FROM products WHERE categrory = ? ORDER BY price ASC";
			ps = this.con.prepareStatement(query);
			ps.setString(1, categrory);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
// sort by price high to low	
	public List<Product> getProductsPriceDesc(String categrory){
		List<Product> products = new ArrayList<Product>();
//		get products by categrory
		try {
			query = "SELECT * FROM products WHERE categrory = ? ORDER BY price DESC";
			ps = this.con.prepareStatement(query);
			ps.setString(1, categrory);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<>();
		
		try {
//			check size of cart if > 0 this mean : event add to cart sucess
			if (cartList.size() > 0) {
				for(Cart item:cartList) {
//					browse all data (pId) in cartList , get product by pId
					query = "select * from products where pId = ?";
					ps = this.con.prepareStatement(query);
					ps.setInt(1,item.getpId());
					rs = ps.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setpId(rs.getInt("pId"));
						row.setRemain(rs.getInt("remain"));
						row.setpName(rs.getString("pName"));
						row.setPrice(rs.getInt("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						row.setImage(rs.getString("image"));
						products.add(row);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println(e.getMessage());
		}		
		return products;
	}
	
	public long getTotalCartPrice(ArrayList<Cart> cartList){
		long sum = 0;
		try {
			if (cartList.size() > 0) {
				for(Cart item:cartList) {
//					browse all id in cartList 
					query = "select price from products where pId = ?";
					ps=this.con.prepareStatement(query);
					ps.setInt(1,item.getpId());
					rs = ps.executeQuery();
					while(rs.next()) {
//						get price and quantity , total = price * quantity , sum += total
						sum += (long)rs.getInt("price")*item.getQuantity();
					}
				}
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sum;
		
	}
	
	public void updateRemain(int id , int quantity) {
		try {
//			update remain product by subtracting the current quantity from the purchased quantity
			query = "update products set remain = remain - ? where pId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, quantity);
			ps.setInt(2, id);
			ps.executeUpdate();
	     
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public Product getSingleProduct(int id){
		Product row = null;
		
		try {
//			get product by id
			query = "select * from products where pId=?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				row = new Product();
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;
	}
// count the number of products after searching	
	public int countSearch(String txtSearch) {
		try {
			query = "select count(*) from products where LOWER(pName) LIKE LOWER(?)";
			ps = this.con.prepareStatement(query);
			ps.setString(1,"%" + txtSearch + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public List<Product> search(String txtSearch , int index){
		List<Product> list = new ArrayList<>();
		try {
			query = "with ResultSearch as (select row_number() over (order by pId desc) as stt ,pId,pName,categrory,price,image,remain from products where lower(pName) like lower(?))\r\n"
					+ " select * from ResultSearch where stt between ?*12-11 and ?*12; \r\n"
					+ "";
			ps = this.con.prepareStatement(query);
			ps.setString(1,"%" + txtSearch + "%");
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Product row = new Product();
				row.setpId(rs.getInt("pId"));
				row.setpName(rs.getString("pName"));
				row.setCategrory(rs.getString("categrory"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				row.setRemain(rs.getInt("remain"));
				list.add(row);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
		
	}
	
	// remove product in admin
		public void deleteProduct(String name) {
				try {
					query = "delete from products where pName = ?";
					ps = this.con.prepareStatement(query);
					ps.setString(1, name);
					ps.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		
		// add product in admin
		public boolean addProductAdmin(String pName, String category,String image,int price,int remain) {
			boolean check = false;
			try {
				query = "insert into orderfood.products(pName,categrory,price,image,remain) values (?, ?, ?, ?, ?);";
				ps = this.con.prepareStatement(query);
				ps.setString(1,pName);
				ps.setString(2,category);
				ps.setInt(3, price);
				ps.setString(4,image);
				ps.setInt(5,remain);
				int result = ps.executeUpdate();
				
				if(result > 0) {
					check = true;
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
			return check;
		}
	// Update Product
		public void UpdateProduct (int pId,String pName, String category,String image,int price,int remain) {
			try {
		     query = "UPDATE orderfood.products SET pName = ?, categrory = ?,price = ?, image = ?, remain = ? WHERE pId = ?;";
		        ps = this.con.prepareStatement(query);
		        ps.setString(1,pName);
		        ps.setString(2,category);
		        ps.setInt(3,price);
		        ps.setString(4,image);
		        ps.setInt(5,remain);
		        ps.setInt(6, pId);
		        ps.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
			
			
		}
	
}
