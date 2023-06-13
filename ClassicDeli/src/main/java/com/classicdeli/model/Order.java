package com.classicdeli.model;

public class Order extends Product {
	private int oId;
	private int uId;
	private int oQuantity;
	private String oDate;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int oId, int uId, int oQuantity, String oDate) {
		this.oId = oId;
		this.uId = uId;
		this.oQuantity = oQuantity;
		this.oDate = oDate;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getoQuantity() {
		return oQuantity;
	}

	public void setoQuantity(int oQuantity) {
		this.oQuantity = oQuantity;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", uId=" + uId + ", oQuantity=" + oQuantity + ", oDate="
				+ oDate + "]";
	}

	
	
}
