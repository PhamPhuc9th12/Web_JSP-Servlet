package com.classicdeli.model;

public class Users {
	private int uId;
	private String uName, phone, uPass, address;
	
	public Users() {
		// TODO Auto-generated constructor stub
	}

	public Users(int uId, String uName, String phone, String uPass, String address) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.phone = phone;
		this.uPass = uPass;
		this.address = address;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getuPass() {
		return uPass;
	}

	public void setuPass(String uPass) {
		this.uPass = uPass;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Users [uId=" + uId + ", uName=" + uName + ", phone=" + phone + ", uPass=" + uPass + ", address="
				+ address + "]";
	}
	
	
	
}
