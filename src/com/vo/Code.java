package com.vo;

public class Code {
     private Integer cid;
     private String phone;
     private String code;
	@Override
	public String toString() {
		return "Code [cid=" + cid + ", phone=" + phone + ", code=" + code + "]";
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
