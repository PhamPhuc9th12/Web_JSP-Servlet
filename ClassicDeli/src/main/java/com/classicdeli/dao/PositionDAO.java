
package com.classicdeli.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classicdeli.model.*;

public class PositionDAO {
	private Connection con;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	public PositionDAO(Connection con) {
		this.con = con;
	}
	
	public Position checkPositions(int id) {
		Position pos = null;
		
		try {
			query = "select * from positions where uId = ?";
			ps =  this.con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			
			if (rs.next()) {
				pos = new Position();
				pos.setuId(rs.getInt("uId"));
				pos.setPosition(rs.getString("position"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		return pos;
	}
	
	public Position setPositions(int uId) {
		Position users = null;
			query = "insert into positions(uId,position) values (?,?)";
			try {
				ps =  this.con.prepareStatement(query);
				ps.setInt(1, uId);
				ps.setString(2, "user");
				int result = ps.executeUpdate();
		        if (result > 0) {
		            users = new Position();
		            users.setuId(uId);
		            users.setPosition("user");
		        }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return users;
	}	
}