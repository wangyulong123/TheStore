package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.ConnOracle;
import com.vo.User;

public class UserParaDao {
  //首先判断用户名和密码是否匹配
	Connection conn=null;
	 public UserParaDao(){
		 conn=ConnOracle.getConnection();
	 }
	   public boolean checkNameAndPsw(User user) throws Exception {
		   PreparedStatement pstmt = null;
			 ResultSet rs = null;
		  /* SELECT PASSWORD FROM user1 WHERE username='chaoleshan'*/
	        String sql = "SELECT PASSWORD FROM user1 WHERE username=?\n";
	    
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, user.getUsername());
	    	rs = pstmt.executeQuery();
	    	  if (rs != null) {
		            while (rs.next()) {
		                if (user.getPassword().equals(rs.getString("PASSWORD"))) {
		                    return true;
		                }
		            }
	    	  }
	    	   return false;
	    	  }
	   //判断用户是否存在
	   public boolean checkUser(String username) throws Exception {
		   /*SELECT userNAME FROM user1 WHERE username='chaoleshan'*/
		  /* String sql = "SELECT username FROM user1 WHERE username="+"'"+username+"'"*/
		   String sql = "SELECT username FROM user1 WHERE username="+"'"+username+"'"+"\n";
	
	        System.out.println(sql);
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
		    	rs = pstmt.executeQuery();
	        if (rs != null) {
	            while (rs.next()) {
	                return true;
	            }
	        }
	        return false;
	    }
  //根据用户名判断是否有过登录
	   public boolean checkLoginRecord(String userName) throws Exception {
	        String sql = "SELECT COUNT(*) num FROM C_LOGIN_RECORD WHERE USERNAME="+"'"+userName+"'"+"\n";
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
	     
			  rs = pstmt.executeQuery();
	        if (rs != null) {
	            while (rs.next()) {
	                if ("0".equals(rs.getString("num"))) {
	                    return false;
	                }
	            }
	        }
	        return true;
	    }
	 //删除用户所有的登记记录
	   public void deleteLoginRecord(String userName) throws Exception {
	        String sql = "DELETE FROM C_LOGIN_RECORD WHERE USERNAME="+"'"+userName+"'"+"\n";
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
			  rs = pstmt.executeQuery();
	        
	    }
	   
	 //获取最近登录的一条记录  
	   public ResultSet getLatestLoginRecord(String userName) throws Exception {
	        String sql = "SELECT USERNAME, LOCK_FLAG, FAILURE_NUM, LOGIN_DATE "
	                + " FROM C_LOGIN_RECORD WHERE  LOGIN_DATE=(SELECT MAX(LOGIN_DATE)"
	                + "FROM C_LOGIN_RECORD WHERE USERNAME=? GROUP BY USERNAME)";
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, userName);
			  rs = pstmt.executeQuery();
	        return rs;

	    }
	  //获取用户登录失败次数为2的登录时间
	   public String getFaNum2Record(String userName) throws Exception {
	        String sql = "SELECT USERNAME,LOGIN_DATE FROM C_LOGIN_RECORD "
	                + "  WHERE USERNAME=? AND FAILURE_NUM=2";
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, userName);
			  rs = pstmt.executeQuery();
	        if (rs != null) {
	            while (rs.next()) {
	                return rs.getString("LOGIN_DATE").replace("T", " ");
	            }
	        }
	        return "";
	    }
	  //插入登录记录
	   public void insertLoginRecord(String userName, String lockFlag, String failureNum) throws SQLException {
	        List<String> list=new ArrayList<String>();
	        String sql="INSERT INTO C_LOGIN_RECORD(USERNAME,LOCK_FLAG,FAILURE_NUM," +
	        "LOGIN_DATE) values("+"'"+userName+"',"+"'"+lockFlag+"',"+"'"+failureNum+"'," +" sysdate) ";
	        System.out.println(sql);
	        list.add(userName);
	        list.add(lockFlag);
	        list.add(failureNum);
	        PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  System.out.println(lockFlag);
			  pstmt = conn.prepareStatement(sql);
			
			  rs = pstmt.executeQuery();
			  list.toArray();
			
	    }
	   //根据username得到user所有的信息
	   public User getuserall(String username) throws Exception{
		   String sql="select * from user1 where username="+"'"+username+"'";
		   User user=new User();
		   PreparedStatement pstmt = null;
			 ResultSet rs = null;
			  pstmt = conn.prepareStatement(sql);
			  rs = pstmt.executeQuery();
			  while (rs.next()) {
			  user.setUserid(rs.getInt(1));
			  user.setUsername(rs.getString(2));
		      user.setPassword(rs.getString(3));
		      user.setIsActive(rs.getInt(4));
		      user.setNickname(rs.getString(5));
		      user.setAddress(rs.getString(6));
		      user.setTelphone(rs.getString(7));
			  }
		   
		   
		   return user;
	   }
	   public static void main(String[] args) throws Exception {
		UserParaDao dao=new UserParaDao();
		String username="zzy";
		User user=dao.getuserall(username);
		System.out.println(user.getAddress());
	}
}
