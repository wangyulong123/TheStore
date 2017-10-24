package com.vo;

public class Admin {
	private int adminid;
	private String adminName;
	private String adminpwd;
	
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminName=" + adminName
				+ ", adminpwd=" + adminpwd + "]";
	}
	
	
}
