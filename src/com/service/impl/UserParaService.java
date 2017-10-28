package com.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dao.impl.UserParaDao;
import com.vo.User;

public class UserParaService {
	UserParaDao dao=new UserParaDao();
  //�жϵ�ǰʱ�������ʱ����Ƿ����5����  ��������ӷ���true
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
 //�жϵ�ǰʱ���������ʱ����Ƿ����һ��  ����һ�췵�� true
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
	//��������Ƿ����
	  public boolean checkUser(String userName)throws Exception{
		
		 
		  return  dao.checkUser(userName);
	  } 
	//�ж��û��Ƿ��¼
	  public boolean checkLoginRecord(String userName)throws Exception{
		  
		   return  dao.checkLoginRecord(userName); 
	  }
	 //��ȡ�����¼��һ����¼  
	  public ResultSet getLatestLoginRecord(String userName) throws Exception{
		  ResultSet rs=null;
		 rs= dao.getLatestLoginRecord(userName);
		  
		  return rs;
	  }
	  //ɾ����½��¼
	  public void deleteLoginRecord(String userName) throws Exception{
		   dao.deleteLoginRecord(userName);
		  
	  }
	  //�˶��˺ź�����
	  public boolean checkNameAndPsw(User user) throws Exception {
		  
		  return dao.checkNameAndPsw(user);
		  
	  }
	  //�����¼��¼
	   public void insertLoginRecord(String userName, String lockFlag, String failureNum) throws SQLException{
		   
		  dao.insertLoginRecord(userName, lockFlag, failureNum); 
	   }
	   ////��ȡ�û���¼ʧ�ܴ���Ϊ2�ĵ�¼ʱ��
	   public String getFaNum2Record(String userName) throws Exception{
		   return dao.getFaNum2Record(userName);
		   
	   }
	   //����username�õ�user��ȫ����Ϣ
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
