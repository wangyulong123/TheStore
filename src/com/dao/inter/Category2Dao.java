package com.dao.inter;


import java.util.List;

import com.vo.Category;
import com.vo.Category2;

public interface Category2Dao {

	//1.添加
	public int addCategory2(Category2 category) throws Exception;
	//2.按SQL语句查所有1级商品种类
	public List<Category2> getPageByQuery(String sql) throws Exception;
	//3.根据sql查询 总共有多少条记录
	public int getTotalRecordCount(String sql) throws Exception;
	//4.按SQL语句查
	public List<Category2> getPage2ByQuery(String sql) throws Exception;
	//5.删除
	public int deleteCategory2(Category2 category) throws Exception;
	//6.查1
	public Category2 getCategory2ById(int id) throws Exception;
	//7.修改
	public int updateCategory2(Category2 category) throws Exception;
	//8.获得所有的一级二级商品名字
	public List<Category> getAllCategorysBySql(String sql) throws Exception;
}
