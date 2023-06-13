package com.classicdeli.model;

public class Position {
	private int id;
	private int uId;
	private String position;
	
	public Position() {

	}

	public Position(int id, int uId, String position) {
		this.id = id;
		this.uId = uId;
		this.position = position;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
}