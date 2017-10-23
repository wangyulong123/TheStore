package com.service.inter;

import java.util.List;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Product;

public interface UserProductService {
	// ָ�������µ�������Ʒ������
	public int getTotalRecordSumByCategory(String cid) throws Exception;

	// ����ѯ������ѯ ��ѯ���ܹ��ж�������¼
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception;
	
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception;

	//��ѯָ����Ʒ�����µ�������Ʒ  + ���� Ȼ���ҳ
	public List<Product> getAllByPageByCategory(PageInfo pageInfo,String cid,OrderCondition orderConditionObj) throws Exception;
	
	// ��1
	public Product getProductById(String pid) throws Exception;
	
	//������Ʒ�۸������ȡ��Ʒ����
	public int getPhonesSumBySearchCondition(Product product,String low,String high)throws Exception;
	
	//���ݶ�Ӧ�۸������ȡ��Ʒ�б�
	public List<Product> getPhonesPageByQuery(Product product,String low,String high,PageInfo pageInfo)throws Exception;

}
