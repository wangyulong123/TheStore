package com.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dao.impl.UserParaDao;
import com.vo.User;

public class UserParaService {
	UserParaDao dao=new UserParaDao();
  //判断当前时间与给定时间差是否大于5分钟  大于五分钟返回true
	  public boolean localdateLtDate(String date) throws Exception{
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
               System.out.println(date);
	        Date date1=sdf.parse(date);
	        Date now=sdf.parse(sdf.format(new Date()));
	        if(now.getTime()-date1.getTime()>5*60*1000){
	            return true;
	        }
	        else{
	            return false;
	        }
	    }
 //判断当前时间与给定的时间差是否大于一天  大于一天返回 true
	  public boolean localdateLtDate2(String date) throws Exception{
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date1=sdf.parse(date);
	        Date now=sdf.parse(sdf.format(new Date()));
	        if(now.getTime()-date1.getTime()>24*60*60*1000){
	            return true;
	        }
	        else{
	            return false;
	        }
	    }
	//检查名字是否存在
	  public boolean checkUser(String userName)throws Exception{
		
		 
		  return  dao.checkUser(userName);
	  } 
	//判断用户是否登录
	  public boolean checkLoginRecord(String userName)throws Exception{
		  
		   return  dao.checkLoginRecord(userName); 
	  }
	 //获取最近登录的一条记录  
	  public ResultSet getLatestLoginRecord(String userName) throws Exception{
		  ResultSet rs=null;
		 rs= dao.getLatestLoginRecord(userName);
		  
		  return rs;
	  }
	  //删除登陆记录
	  public void deleteLoginRecord(String userName) throws Exception{
		   dao.deleteLoginRecord(userName);
		  
	  }
	  //核对账号和密码
	  public boolean checkNameAndPsw(User user) throws Exception {
		  
		  return dao.checkNameAndPsw(user);
		  
	  }
	  //插入登录纪录
	   public void insertLoginRecord(String userName, String lockFlag, String failureNum) throws SQLException{
		   
		  dao.insertLoginRecord(userName, lockFlag, failureNum); 
	   }
	   ////获取用户登录失败次数为2的登录时间
	   public String getFaNum2Record(String userName) throws Exception{
		   return dao.getFaNum2Record(userName);
		   
	   }
	   //根据username得到user的全部信息
	   public User getuserall(String username) {
		   User user=new User();
		   try {
			 user= dao.getuserall(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;   
	   }
	   public static void main(String[] args) throws Exception {
		UserParaService dao=new UserParaService();
			String username="zzy";
			User user=dao.getuserall(username);
			System.out.println(user.getAddress());
		}
}
