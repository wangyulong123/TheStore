package com.vo;

import java.sql.Date;

public class User {
	private Integer userid;    
	private String  username;
	private String  password;
	private Integer isActive;	  
	private String	nickname;
	private String  address;
	private String  telphone;
	private int  c_id;
	private int  lock_flag;
	private int  falure_num;
	private Date   date;

public User(){
	
}
public User(String username, String password){
	this.username=username;
	this.password=password;
	
}
	

	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", isActive=" + isActive
				+ ", nickname=" + nickname + ", address=" + address
				+ ", telphone=" + telphone + ", c_id=" + c_id + ", lock_flag="
				+ lock_flag + ", falure_num=" + falure_num + ", date=" + date
				+ "]";
	}



	public int getC_id() {
		return c_id;
	}



	public void setC_id(int c_id) {
		this.c_id = c_id;
	}



	public int getLock_flag() {
		return lock_flag;
	}

	public void setLock_flag(int lock_flag) {
		this.lock_flag = lock_flag;
	}

	public int getFalure_num() {
		return falure_num;
	}

	public void setFalure_num(int falure_num) {
		this.falure_num = falure_num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsActive() {
		return isActive;
	}
	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
