package com.service.inter;

import java.util.List;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Order1;
import com.vo.Product;

public interface OrderService {
	//添加订单
	public int addOrder(Order1 order) throws Exception;
	public int addOrder(String orderid, List<Product> shoppingCar) throws Exception;
	//获得订单
	//查询总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	//查询所有后分页
	public List<Order1> getAllByPage(PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Order1 order) throws Exception;
	//根据条件查询 然后分页
	public List<Order1> getPageByQuery(Order1 order,PageInfo pageInfo) throws Exception;
	//删除
	public int deleteOrderById(String orderid) throws Exception;
	//查1
	public Order1 getOrderById(String orderid) throws Exception;
	//修改
	public int updateOrder(Order1 order) throws Exception;
}
