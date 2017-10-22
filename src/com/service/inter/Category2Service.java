package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public interface Category2Service {
	//������
	public List<Category2> getAllCategorys() throws Exception;
	//���
	public int addCategory2(Category2 category) throws Exception;
	//��ѯһ����Ʒ�����¶�Ӧ�Ķ�����Ʒ����
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception;
	//��ѯһ����Ʒ�����µĶ�����Ʒ��������
	public int getCategory2SumByCategory1(int cid) throws Exception;
	//������
	public List<Category2> getAllCategorys2() throws Exception;
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	//��ѯ���к��ҳ
	public List<Category2> getAllByPage(PageInfo pageInfo) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Category2 category) throws Exception;
	//����������ѯ Ȼ���ҳ
	public List<Category2> getPageByQuery(Category2 category,PageInfo pageInfo) throws Exception;
	//ɾ������������Ʒ����
	public int deleteCategory2ById(String cid) throws Exception;
	//��1
	public Category2 getCategory2ById(String cid) throws Exception;
	//�޸�
	public int updateCategory(Category2 category) throws Exception;
	//�����е�һ��������Ʒ����
	public List<Category> getAllCategorysName() throws Exception;

	//��ѯָ����������ĸ���һ�������cid  
	//�β�: cid ���������cid
	//����ֵ: ����һ�������cid
	public int getParentCategoryById(int cid) throws Exception;
}
