package com.vo;

public class Order1 {
	private int orderid;
	private String ordertime;
	private double orderprice;
	private String orderdesc;
	private String shouhuorenname;
	private int tel;
	private int userid;
	private int orderstatus;//0��ʾδ���1��ʾ�Ѹ��2��ʾ�ѷ�����3��ʾ�����
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public double getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(double orderprice) {
		this.orderprice = orderprice;
	}
	public String getOrderdesc() {
		return orderdesc;
	}
	public void setOrderdesc(String orderdesc) {
		this.orderdesc = orderdesc;
	}
	public String getShouhuorenname() {
		return shouhuorenname;
	}
	public void setShouhuorenname(String shouhuorenname) {
		this.shouhuorenname = shouhuorenname;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(int orderstatus) {
		this.orderstatus = orderstatus;
	}
	@Override
	public String toString() {
		return "Order1 [orderid=" + orderid + ", ordertime=" + ordertime
				+ ", orderprice=" + orderprice + ", orderdesc=" + orderdesc
				+ ", shouhuorenname=" + shouhuorenname + ", userid=" + userid
				+ ", orderstatus=" + orderstatus + "]";
	}
	
}
