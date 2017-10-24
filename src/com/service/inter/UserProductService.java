package com.service.inter;

import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.Product;

public interface UserProductService {

	// 添加商品
	public void addProduct(Product product) throws Exception;

	// 查询所有一级商品种类
	public List<Product> getAllProduct() throws Exception;

	// 删除一级商品种类
	public void deleteProductById(String pid) throws Exception;

	// 查1
	public Product getProductById(String pid) throws Exception;
	
	//根据商品价格区间获取商品总数
	public int getPhonesSumBySearchCondition(Product product,String low,String high)throws Exception;
	
	//根据对应价格区间获取商品列表
	public List<Product> getPhonesPageByQuery(Product product,String low,String high,PageInfo pageInfo)throws Exception;


	// 修改
	public void updateProduct(Product product) throws Exception;

	// 查所有按分页
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;

	
	// 查总共有多少条记录
	public int getTotalRecordSum() throws Exception;

	//按查询条件查询 查询后总共有多少条记录
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception;

	//按查询条件查询后 分页 
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception;

	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	public void saveProductListImageNamesForOneProduct(String pid,
			List<String> fileNameList) throws Exception;
	
	//产品下架
	public void productDown(Integer pid) throws Exception;
	
	//根据商品种类 查询商品
	public List<Product> getProductListByCategory(String cid) throws Exception;
	
	
	//指定种类下的所有商品的数量
	public int getTotalRecordSumByCategory(String cid) throws Exception;
	//getPageByQuery改写
	public List<Product> getPageByQuery1(Product product, PageInfo pageInfo) throws Exception;
}
