package com.service.impl;

import java.util.List;

import com.dao.impl.AdminDaoImpl;
import com.service.inter.AdminService;
import com.vo.Admin;

public class AdminServiceImpl implements AdminService{
	private AdminDaoImpl dao = new AdminDaoImpl();
	
	
	/**
	 * 
	 *@return 如果根据用户名和密码找到该用户 返回该用户对象  没找到的话 返回null
	 */
	public Admin login(String adminname, String adminpwd) throws Exception{
		
		Admin admin = null;
		
		String sql = "select * from admin1 where adminname='" + adminname+ "' and adminpwd='" + adminpwd + "'";
		List<Admin> list = dao.getPageByQuery(sql);
		if(list.size()>0){
			//用户存在
			admin = list.get(0);
			
		}
		
		return admin;
	}

}
