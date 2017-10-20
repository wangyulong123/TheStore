package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Product;

public interface ProductService {

	// �����Ʒ
	public int addProduct(Product product) throws Exception;

	// ɾ����Ʒ
	public int deleteProductById(String pid) throws Exception;

	// �޸�
	public int updateProduct(Product product) throws Exception;

	public int getTotalRecordSum() throws Exception;

	// �����а���ҳ
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;

	// ����ѯ������ѯ ��ѯ���ܹ��ж�������¼
	public int getTotalRecordSumBySearchCondition(Product product)
			throws Exception;

	// ����ѯ������ѯ�� ��ҳ
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo)
			throws Exception;

	// ��1
	public Product getProductById(String pid) throws Exception;

	// ��Ʒ�ϼ�
	public void productUp(Integer pid) throws Exception;

	// ��Ʒ�¼�
	public void productDown(Integer pid) throws Exception;

	// �ϴ�ͼƬ
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	//����ͼƬ��·������Ʒ��
	public void saveImagePathInTable(String pid, List<String> fileNameList) throws Exception;
}
