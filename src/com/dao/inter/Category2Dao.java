package com.dao.inter;


import java.util.List;

import com.vo.Category;
import com.vo.Category2;

public interface Category2Dao {

	//1.���
	public int addCategory2(Category2 category) throws Exception;
	//2.��SQL��������1����Ʒ����
	public List<Category2> getPageByQuery(String sql) throws Exception;
	//3.����sql��ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(String sql) throws Exception;
	//4.��SQL����
	public List<Category2> getPage2ByQuery(String sql) throws Exception;
	//5.ɾ��
	public int deleteCategory2(Category2 category) throws Exception;
	//6.��1
	public Category2 getCategory2ById(int id) throws Exception;
	//7.�޸�
	public int updateCategory2(Category2 category) throws Exception;
	//8.������е�һ��������Ʒ����
	public List<Category> getAllCategorysBySql(String sql) throws Exception;
}
