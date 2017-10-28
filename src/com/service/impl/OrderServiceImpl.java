package com.service.impl;

import java.util.List;

import com.dao.impl.OrderDaoImpl;
import com.dao.impl.OrderDetailDaoImpl;
import com.dao.impl.ProductDaoImpl;
import com.dao.inter.OrderDetailDao;
import com.dao.inter.ProductDao;
import com.page.PageInfo;
import com.service.inter.OrderService;
import com.util.ConnOracleDataSourceTransaction;
import com.vo.Order1;
import com.vo.OrderDetail;
import com.vo.Product;
import com.vo.User;

public class OrderServiceImpl implements OrderService{
	private OrderDaoImpl dao = new OrderDaoImpl();
	
	public User login(String username, String password) throws Exception{
		
		User user = null;
		
		String sql = "select * from user1 where username='" + username+ "' and password='" + password + "'";
		List<User> list = dao.getPageByQuery(sql);
		if(list.size()>0){
			//用户存在
			user = list.get(0);
			
		}
		
		return user;
	}

	@Override
	public int addOrder(Order1 order) throws Exception {
		// 开启事务
		ConnOracleDataSourceTransaction.beginTransaction();
		int orderId;
		try {
			 orderId = dao.addOrder(order);
		} catch (Exception e) {
			ConnOracleDataSourceTransaction.rollbackTransaction();
			e.printStackTrace();
			throw new Exception("下单失败");
		}
		return orderId;
	}

	public int addOrder(String orderId,List<Product> shoppingCart)
			throws Exception {
		int success = 0;
		for (Product product : shoppingCart) {

			int pid = product.getPid();

			int shoppingCarSum = product.getShoppingSum();
			double buyPrice = product.getPrice();
			System.out.println("订单明细orderId"+orderId);
			System.out.println("添加订单明细----订单id"+product);
			// 添加订单明细
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderid(Integer.parseInt(orderId));
			orderDetail.setPid(pid);
			orderDetail.setBuyPrice(buyPrice);
			orderDetail.setBuySum(shoppingCarSum);

			OrderDetailDao orderDetailDao = new OrderDetailDaoImpl();
			try {
				orderDetailDao.addOrderDetail(orderDetail);
				success = 1;
			} catch (Exception e) {
				ConnOracleDataSourceTransaction.rollbackTransaction();
				e.printStackTrace();
				break;
			}

			// 修改商品库存数量
			ProductDao productDao = new ProductDaoImpl();

			int productSum = product.getProductSum();

			if (shoppingCarSum <= productSum) {
				productSum = productSum - shoppingCarSum;
				product.setProductSum(productSum);
				try {
					productDao.updateProduct(product);
					success = 2;
				} catch (Exception e) {
					ConnOracleDataSourceTransaction.rollbackTransaction();
					e.printStackTrace();
				}
			} else {
				ConnOracleDataSourceTransaction.rollbackTransaction();
				throw new Exception(product.getPname() + "库存不足,请暂时选择其他商品,谢谢!");

			}

			ConnOracleDataSourceTransaction.commitTransaction();
		}
		return success;
	}
	
	// 查询总共有多少条记录
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "SELECT COUNT(*) FROM order1";
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	
	// 查询所有后分页
	public List<Order1> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "SELECT * FROM (SELECT o.*,ROWNUM r FROM order1 o)  WHERE "+
" r>= "+pageInfo.getBegin()+" AND r<="+pageInfo.getEnd();
		System.out.println(sql);

		List<Order1> list = null;

		list = dao.getOrderPageByQuery(sql);
		return list;
	}
	
	public int getTotalRecordCount(Order1 order) throws Exception{
		
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer(
				"SELECT count(*) FROM (SELECT o.*,ROWNUM r FROM order1 o WHERE 1=1 AND o.shouhuorenname = '");
		String name = order.getShouhuorenname();
		String address = order.getAddress();
		String desc = order.getOrderdesc();
		
		if (name != null && !name.trim().equals("")) {

			sb.append(name);
		}

		if(desc != null && !desc.trim().equals("")){
			
			sb.append("' OR o.orderdesc LIKE '%");
			sb.append(desc);
		}
		
		if (address != null && !address.trim().equals("")) {
			sb.append("%' OR o.address LIKE '%");
			sb.append(address);
			
		}
		
		sb.append("%' )");	
		String sql = sb.toString();
		System.out.println(sql);
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}

	public List<Order1> getPageByQuery(Order1 order, PageInfo pageInfo)
		throws Exception {
	
	List<Order1> list = null;
	
	// String sql =
//	SELECT COUNT(*) FROM (SELECT o.*,ROWNUM r FROM order1 o) t WHERE 1=1 AND t.shouhuorenname = '李' OR t.orderdesc LIKE '%满%' OR t.address LIKE '%%'
	StringBuffer sb = new StringBuffer(
			"SELECT * FROM (SELECT o.*,ROWNUM r FROM order1 o WHERE 1=1 AND o.shouhuorenname = '");
	String name = order.getShouhuorenname();
	String address = order.getAddress();
	String desc = order.getOrderdesc();
	
	if (name != null && !name.trim().equals("")) {

		sb.append(name);
	}

	if(desc != null && !desc.trim().equals("")){
		
		sb.append("' OR o.orderdesc LIKE '%");
		sb.append(desc);
	}
	
	if (address != null && !address.trim().equals("")) {
		sb.append("%' OR o.address LIKE '%");
		sb.append(address);
		
	}
	
	sb.append("%') ");		
	sb.append(" where r>=");
	sb.append(pageInfo.getBegin());
	sb.append(" and r<=");
	sb.append(pageInfo.getEnd());
	
	String sql = sb.toString();
	System.out.println(sql);

	list = dao.getOrderPageByQuery(sql);
	return list;
	}
	
	// 删除单个商品
	public int deleteOrderById(String orderid) throws Exception {
		Order1 order = new Order1();
		order.setOrderid(Integer.parseInt(orderid));
		int count = dao.deleteOrder(order);
		return count;
	}
	
	// 查1
	public Order1 getOrderById(String orderid) throws Exception {

		Order1 order = null;

		order = dao.getOrderById(Integer.parseInt(orderid));
		return order;
	}
	
	// 修改
	public int updateOrder(Order1 order) throws Exception {
		int count = dao.updateOrder(order);
		return count;
	}
}
