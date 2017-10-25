package com.service.inter;

import java.util.List;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Order1;
import com.vo.Product;

public interface OrderService {
	//��Ӷ���
	public int addOrder(Order1 order) throws Exception;
	public int addOrder(String orderid, List<Product> shoppingCar) throws Exception;
	//��ö���
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	//��ѯ���к��ҳ
	public List<Order1> getAllByPage(PageInfo pageInfo) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Order1 order) throws Exception;
	//����������ѯ Ȼ���ҳ
	public List<Order1> getPageByQuery(Order1 order,PageInfo pageInfo) throws Exception;
	//ɾ��
	public int deleteOrderById(String orderid) throws Exception;
	//��1
	public Order1 getOrderById(String orderid) throws Exception;
	//�޸�
	public int updateOrder(Order1 order) throws Exception;
}
