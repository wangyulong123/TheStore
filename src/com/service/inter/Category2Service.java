package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public interface Category2Service {
	//查所有
	public List<Category2> getAllCategorys() throws Exception;
	//添加
	public int addCategory2(Category2 category) throws Exception;
	//查询一级商品种类下对应的二级商品种类
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception;
	//查询一级商品种类下的二级商品种类数量
	public int getCategory2SumByCategory1(int cid) throws Exception;
	//查所有
	public List<Category2> getAllCategorys2() throws Exception;
	//查询总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	//查询所有后分页
	public List<Category2> getAllByPage(PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Category2 category) throws Exception;
	//根据条件查询 然后分页
	public List<Category2> getPageByQuery(Category2 category,PageInfo pageInfo) throws Exception;
	//删除单个二级商品种类
	public int deleteCategory2ById(String cid) throws Exception;
	//查1
	public Category2 getCategory2ById(String cid) throws Exception;
	//修改
	public int updateCategory(Category2 category) throws Exception;
	//查所有的一级二级商品名称
	public List<Category> getAllCategorysName() throws Exception;

	//查询指定二级种类的父亲一级种类的cid  
	//形参: cid 二级种类的cid
	//返回值: 所属一级种类的cid
	public int getParentCategoryById(int cid) throws Exception;
}
