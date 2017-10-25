package com.service.inter;

import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Product;

public interface UserProductService {

	// �����Ʒ
	public void addProduct(Product product) throws Exception;

	// ��ѯ����һ����Ʒ����
	public List<Product> getAllProduct() throws Exception;

	// ɾ��һ����Ʒ����
	public void deleteProductById(String pid) throws Exception;

	// ��1
	public Product getProductById(String pid) throws Exception;
	
	//������Ʒ�۸������ȡ��Ʒ����
	public int getPhonesSumBySearchCondition(Product product,String low,String high)throws Exception;
	
	//���ݶ�Ӧ�۸������ȡ��Ʒ�б�
	public List<Product> getPhonesPageByQuery(Product product,String low,String high,PageInfo pageInfo)throws Exception;


	// �޸�
	public void updateProduct(Product product) throws Exception;

	// �����а���ҳ
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;

	
	// ���ܹ��ж�������¼
	public int getTotalRecordSum() throws Exception;

	//����ѯ������ѯ ��ѯ���ܹ��ж�������¼
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception;

	//����ѯ������ѯ�� ��ҳ 
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception;

	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	public void saveProductListImageNamesForOneProduct(String pid,
			List<String> fileNameList) throws Exception;
	
	//��Ʒ�¼�
	public void productDown(Integer pid) throws Exception;
	
	//������Ʒ���� ��ѯ��Ʒ
	public List<Product> getProductListByCategory(String cid) throws Exception;
	
	
	//ָ�������µ�������Ʒ������
	public int getTotalRecordSumByCategory(String cid) throws Exception;
	//getPageByQuery��д
	public List<Product> getPageByQuery1(Product product, PageInfo pageInfo) throws Exception;
}
