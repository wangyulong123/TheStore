package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Product;

public interface ProductService {

	public int addProduct(Product product) throws Exception;
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	//��ѯ���к��ҳ
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;
	//ɾ��
	public int deleteProductById(String pid) throws Exception;
	//��1
	public Product getProductById(String pid) throws Exception;
	//�޸�
	public int updateProduct(Product product) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Product product) throws Exception;
	//����������ѯ Ȼ���ҳ
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo,OrderCondition orderCondition) throws Exception;
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo) throws Exception;
	//�ϼ�
	public void productUp(int pid) throws Exception;  
	//�¼�
	public void productDown(int pid) throws Exception;
	//�ϴ�ͼƬ
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;
	//�����ݿⱣ��ͼƬ����
	public void saveProductListImageNamesForOneProduct(String pid,
			List<String> fileNameList) throws Exception;
}
