package com.service.impl;

import java.util.List;

import com.dao.impl.UserDaoImpl;
import com.service.inter.UserService;
import com.vo.User;

public class UserServiceImpl implements UserService{
	private UserDaoImpl dao = new UserDaoImpl();
	
	
	/**
	 * 
	 *@return ��������û����������ҵ����û� ���ظ��û�����  û�ҵ��Ļ� ����null
	 */
	public User login(String username, String password) throws Exception{
		
		User user = null;
		
		String sql = "select * from user1 where username='" + username+ "' and password='" + password + "'";
		List<User> list = dao.getPageByQuery(sql);
		if(list.size()>0){
			//�û�����
			user = list.get(0);
			
		}
		
		return user;
	}

}
