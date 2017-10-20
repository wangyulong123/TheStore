package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;

public interface CategoryService {

	//���
	public int addCategory(Category category) throws Exception;
	//������
	public List<Category> getAllCategorys() throws Exception;
	//ɾ������һ����Ʒ����
	public int deleteCategoryById(String cid) throws Exception;
	//��1
	public Category getCategoryById(String cid) throws Exception;
	//�޸�
	public int updateCategory(Category category) throws Exception;
	//��ѯ���к��ҳ
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception;
	//��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	//����������ѯ Ȼ���ҳ
	public List<Category> getPageByQuery(Category category,PageInfo pageInfo) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Category category) throws Exception;
}
