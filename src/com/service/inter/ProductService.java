package com.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Product;

public interface ProductService {

	public int addProduct(Product product) throws Exception;
	//查询总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	//查询所有后分页
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;
	//删除
	public int deleteProductById(String pid) throws Exception;
	//查1
	public Product getProductById(String pid) throws Exception;
	//修改
	public int updateProduct(Product product) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Product product) throws Exception;
	//根据条件查询 然后分页
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo,OrderCondition orderCondition) throws Exception;
	public List<Product> getPageByQuery(Product product,PageInfo pageInfo) throws Exception;
	//上架
	public void productUp(int pid) throws Exception;  
	//下架
	public void productDown(int pid) throws Exception;
	//上传图片
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;
	//在数据库保存图片名称
	public void saveProductListImageNamesForOneProduct(String pid,
			List<String> fileNameList) throws Exception;
}
