package com.vo;

import java.util.List;

//java     数据库
//1.类		表
//2.属性	        字段
public class Category {

	private int cid;
	private String cname;
	private String cdesc;
	private List<Category2> list;
	
	public List<Category2> getList() {
		return list;
	}

	public void setList(List<Category2> list) {
		this.list = list;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCdesc() {
		return cdesc;
	}

	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", cdesc=" + cdesc
				+ ", list=" + list + "]";
	}

}
