package com.page;

public class OrderCondition {
	private String orderBy;
	private String asc;
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getAsc() {
		return asc;
	}
	public void setAsc(String asc) {
		this.asc = asc;
	}
	@Override
	public String toString() {
		return "OrderCondition [orderBy=" + orderBy + ", asc=" + asc + "]";
	}
	
}
