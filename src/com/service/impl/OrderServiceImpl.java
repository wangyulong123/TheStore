package com.service.impl;

import java.util.List;

import com.dao.impl.OrderDaoImpl;
import com.service.inter.OrderService;
import com.vo.Order1;
import com.vo.User;

public class OrderServiceImpl implements OrderService{
	private OrderDaoImpl dao = new OrderDaoImpl();
	
	public User login(String username, String password) throws Exception{
		
		User user = null;
		
		String sql = "select * from user1 where username='" + username+ "' and password='" + password + "'";
		List<User> list = dao.getPageByQuery(sql);
		if(list.size()>0){
			//”√ªß¥Ê‘⁄
			user = list.get(0);
			
		}
		
		return user;
	}

	@Override
	public int addOrder(Order1 order) throws Exception {
		int count = dao.addOrder(order);
		return count;
	}

}
