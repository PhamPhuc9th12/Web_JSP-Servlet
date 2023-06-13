package com.classicdeli.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;

import com.classicdeli.connect.ClassicDeliDB;
import com.classicdeli.model.Users;

public class UserDAO {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;

	public UserDAO(Connection con) {
		this.con = con;
	}

	public Users userLogin(String phone, String password) {
		Users users = null;

		try {
			query = "select * from users where phone = ? and uPass = ?";
			ps = this.con.prepareStatement(query);
			ps.setString(1, phone);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				users = new Users();
				users.setuId(rs.getInt("uId"));
				users.setuName(rs.getString("uName"));
				users.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}

		return users;
	}

	public Users userSignup(String name, String phone, String password, String address) {
		Users users = null;

		try {

			query = "insert into users (uName,phone,uPass,uAddress) values (?,?,?,?);";
			ps = this.con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, password);
			ps.setString(4, address);
			int result = ps.executeUpdate();
			if (result > 0) {
				users = new Users();
				users.setuName(name);
				users.setPhone(phone);
				users.setuPass(password);
				users.setAddress(address);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// System.out.print(e.getMessage());
		}

		return users;
	}

	// get uId from phone number
	public Users getIdUser(String phoneNumber) {
		Users users = null;
		try {
			query = "select uId from users where phone = ?";
			ps = this.con.prepareStatement(query);
			ps.setString(1, phoneNumber);
			rs = ps.executeQuery();

			if (rs.next()) {
				users = new Users();
				users.setuId(rs.getInt("uId"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return users;
	}

// Get singer User
	public Users getSingleUsers(int idUser) {
		Users users = null;
		try {
			query = "select * from users where uId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, idUser);
			rs = ps.executeQuery();
			while (rs.next()) {
				users = new Users();
				users.setuId(rs.getInt("uId"));
				users.setuName(rs.getString("uName"));
				users.setPhone(rs.getString("phone"));
				users.setAddress(rs.getString("uAddress"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return users;
	}

	public List<Users> getUsers() {
		List<Users> Users = new ArrayList<Users>();
		try {
			query = "select * from users";
			ps = this.con.prepareStatement(query);
			rs = ps.executeQuery();
//			browse data in ResultSet if still return true otherwise return false
			while (rs.next()) {
				Users row = new Users();
				row.setuId(rs.getInt("uId"));
				row.setuName(rs.getString("uName"));
				row.setPhone(rs.getString("phone"));
				row.setuPass(rs.getString("uPass"));
				row.setAddress(rs.getString("uAddress"));
				Users.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Users;
	}

	public void deleteUser(int id) {
		try {
			query = "delete from users where uId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deleteUser_Position(int id) {
		try {
			query = "delete from positions where uId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public void deleteUser_Order(int id) {
		try {
			query = "delete from orders where uId = ?";
			ps = this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Update User admin
	public void UpdateUser(int uId, String uName, String uPhone, String uAddress) {
		try {
			query = "UPDATE orderfood.users SET uName = ?, phone = ?, uAddress = ? WHERE uId = ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, uName);
			ps.setString(2, uPhone);
			/* ps.setString(3, uPass); */
			ps.setString(3, uAddress);
			ps.setInt(4, uId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

// change password user
	public void ChangePassword(int id, String password) {
		try {
			query = "update orderfood.users set uPass = ? where uId = ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, password);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

// update information user
	public void UpdateInforUser(int uId, String name, String address) {
		try {
			query = "UPDATE orderfood.users SET uName = ?, uAddress = ? WHERE uId = ?;";
			ps = this.con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, address);
			ps.setInt(3, uId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		UserDAO uDao = new UserDAO(ClassicDeliDB.getConnection());
		System.out.print(uDao.getSingleUsers(18));
	}
}
