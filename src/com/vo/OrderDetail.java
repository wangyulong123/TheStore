package com.vo;

public class OrderDetail {
	private int detailid;
	private int orderid;
	private int pid;
	private double buyPrice;
	private int buySum;
	private Product product;

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	public double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getBuySum() {
		return buySum;
	}
	public void setBuySum(int buySum) {
		this.buySum = buySum;
	}
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "Orderdetail [detailid=" + detailid + ", orderid=" + orderid
				+ ", pid=" + pid + "]";
	}
	
}
