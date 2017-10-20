package com.dao.inter;

import java.util.List;

import com.vo.Category;
import com.vo.Category2;

public interface Category2Dao {

	//1.���
	public int addCategory2(Category2 category) throws Exception;
	
	//2.����sql��ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(String sql) throws Exception;
	
	//3.��SQL����
	public List<Category2> getPageByQuery(String sql) throws Exception;
	
	//4.��1
	public Category2 getCategoryById(Integer cid) throws Exception;
}
