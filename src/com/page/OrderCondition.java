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
	// ����
		private String orderCondition = "price";// Ĭ�ϰ���Ʒ��������
		private String ascOrDesc = "asc";// Ĭ������
		
		public String getOrderCondition() {
			return orderCondition;
		}
		public void setOrderCondition(String orderCondition) {
			this.orderCondition = orderCondition;
		}
		public String getAscOrDesc() {
			return ascOrDesc;
		}
		public void setAscOrDesc(String ascOrDesc) {
			this.ascOrDesc = ascOrDesc;
		}
		
		
	}
