package com.classicdeli.model;

public class Product {
	private int pId;
	private String pName,categrory;
	private int price;
	private String image;
	private int remain;
	
	public Product() {
		
	}

	public Product(int pId, String pName, String categrory, int price, String image, int remain) {
		this.pId = pId;
		this.pName = pName;
		this.categrory = categrory;
		this.price = price;
		this.image = image;
		this.remain = remain;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getCategrory() {
		return categrory;
	}

	public void setCategrory(String categrory) {
		this.categrory = categrory;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", categrory=" + categrory + ", price=" + price + ", image="
				+ image + ", remain=" + remain + "]";
	}
	
	
	
}
