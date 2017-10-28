package com.dao.inter;

import java.util.List;

import com.vo.Order1;

public interface Order1Dao {
	//查询订单详情
	public List<Order1> getPageByQuery(String shouhuorenname) throws Exception;
	//查询订单页所有订单的数量
	public int GetRecordCount(String sql) throws Exception;
	//按照传入的sql查
	public List<Order1> getFenyeXx(String sql) throws Exception;
	
}

