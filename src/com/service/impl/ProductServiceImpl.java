package com.service.impl;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.impl.ProductDaoImpl;
import com.dao.inter.ProductDao;
import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.inter.ProductService;
import com.util.SQLUtil;
import com.vo.Category2;
import com.vo.Product;

public class ProductServiceImpl implements ProductService{

	private ProductDao dao;
	int a ;
	
	public ProductServiceImpl(){
		
		dao = new ProductDaoImpl();	
	}
	
	public int addProduct(Product product) throws Exception{
		
		int count = dao.addProduct(product);
		return count;
	}
	
	// 查询总共有多少条记录
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "SELECT COUNT(*) FROM product p INNER JOIN category2 c ON (p.cid = c.cid)";
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	
	// 查询所有后分页
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) order by p.pid) t) WHERE "+
" r>= "+pageInfo.getBegin()+" AND r<="+pageInfo.getEnd();
		System.out.println(sql);

		List<Product> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	// 删除单个商品
	public int deleteProductById(String pid) throws Exception {
	
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		int count = dao.deleteProduct(product);
		return count;
	}
	
	// 查1
	public Product getProductById(String pid) throws Exception {

		Product product = null;

		product = dao.getProductById(Integer.parseInt(pid));
		return product;
	}
	
	// 修改
	public int updateProduct(Product product) throws Exception {
		int count = dao.updateProduct(product);
		return count;
	}
	
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Product product) throws Exception{
		
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer(
				"SELECT count(*) FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE 1=1 AND p.pname like '%");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		String cname = product.getCategory2().getCname();

		if (pname != null && !pname.trim().equals("")) {

			sb.append(pname);
		}

		if(dianpuName != null && !dianpuName.trim().equals("")){
			
			sb.append("%' OR p.dianpuname LIKE '%");
			sb.append(dianpuName);
		}
		
		if (cname != null && !cname.trim().equals("")) {
			sb.append("%' OR c.cname LIKE '%");
			sb.append(cname);
			
		}
		
		sb.append("%' ORDER BY p.pid ) t)");		
		String sql = sb.toString();
		System.out.println(sql);
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}
	
	// 根据条件查询 然后分页
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo,OrderCondition orderCondition)
			throws Exception {
		
		List<Product> list = null;
		String asc ="";
		
		// String sql =
//		SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE 1=1 AND p.pname like '%
//				手机%' OR p.dianpuname LIKE '%手机%' OR c.cname LIKE '%手机%' 
//		ORDER BY p.pid ) t)
//		WHERE r>=1 AND r<=5 
		
		StringBuffer sb = new StringBuffer(
				"SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE 1=1 AND p.pname like '%");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		String cname = product.getCategory2().getCname();

		if (pname != null && !pname.trim().equals("")) {

			sb.append(pname);
		}

		if(dianpuName != null && !dianpuName.trim().equals("")){
			
			sb.append("%' OR p.dianpuname LIKE '%");
			sb.append(dianpuName);
		}
		
		if (cname != null && !cname.trim().equals("")) {
			sb.append("%' OR c.cname LIKE '%");
			sb.append(cname);
			
		}
		System.out.println("根据这个条件排序-------"+orderCondition.getOrderBy());
		if(orderCondition.getOrderBy()==null){
			orderCondition.setOrderBy("pid");
			orderCondition.setAsc("asc");
		}
		
		sb.append("%' ORDER BY p."+ orderCondition.getOrderBy() +" "+ orderCondition.getAsc() +") t)");		
		sb.append(" where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}

	public List<Product> getPageByQuery(Product product, PageInfo pageInfo)
			throws Exception {
		
		List<Product> list = null;
		String asc ="";
		
		// String sql =
//		SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE 1=1 AND p.pname like '%
//				手机%' OR p.dianpuname LIKE '%手机%' OR c.cname LIKE '%手机%' 
//		ORDER BY p.pid ) t)
//		WHERE r>=1 AND r<=5 
		
		StringBuffer sb = new StringBuffer(
				"SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE 1=1 AND p.pname like '%");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		String cname = product.getCategory2().getCname();

		if (pname != null && !pname.trim().equals("")) {

			sb.append(pname);
		}

		if(dianpuName != null && !dianpuName.trim().equals("")){
			
			sb.append("%' OR p.dianpuname LIKE '%");
			sb.append(dianpuName);
		}
		
		if (cname != null && !cname.trim().equals("")) {
			sb.append("%' OR c.cname LIKE '%");
			sb.append(cname);
			
		}
		
		sb.append("%' ORDER BY p.pid ) t)");		
		sb.append(" where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	@Override
	public void productUp(int pid) throws Exception {
		String sql = "update product set onsale=1 where pid = "+pid;
		dao.updateOnSale(sql);
	}

	@Override
	public void productDown(int pid) throws Exception {
		String sql = "update product set onsale=0 where pid = "+pid;
		dao.updateOnSale(sql);
	}
	
	@Override
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception {
		String pid = "";

		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区的阀值为512K
		itemFactory.setSizeThreshold(0x80000);

		File tempDir = new File("D:\\productImg");
		if (!tempDir.exists()) {
			tempDir.mkdirs();
		}

		// 设置临时存储文件的目录为D:\\temp
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		//设置上传文件的最大数据量为10M
		fileUpload.setSizeMax(0xA00000);

		//解析上传文件流，得到FileItem对象的列表
		List<String> fileNameList = new ArrayList<String>();// 存文件名

		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			System.out.println("size=" + fileItems.size());
			Iterator<FileItem> it = fileItems.iterator();

			boolean flag = true;//一个产品的图片  放到一个文件夹 为了保证234行只执行一次
			
			while (it.hasNext()) {
					

				FileItem item = it.next();
				// 判断是否是文件域,input都算fileItem
				if (!item.isFormField()) {
					System.out.println("是文件");

					String name = item.getName();

					long size = item.getSize();

					if ((name == null || name.trim().equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					// 保存上传的文件到指定的目录
					if(flag){
						
						productListUploadPath = productListUploadPath + "\\product" + pid; //只执行一次
						flag = false;
					}
					
					File uploadFileDir = new File(productListUploadPath);
					System.out.println("uploadFileDir=" + uploadFileDir);
					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdirs();
					}

					// 如果浏览器传送的文件名是全路径名，则取出文件名
					// 图片本身的名字_当前时间距离1970年毫秒数_随机数1_随机数2
					// d:\\......\\1.jpg
					int index = name.lastIndexOf(File.separator);
					if (index > 0) {
						name = name.substring(index + 1, name.length());
					}

					// 解决同名文件覆盖问题:随机生成一个 唯一 的名字 用来替换上传文件的名字即可
					System.out.println("*********look here*********");

					long currentTime = System.currentTimeMillis();

					Random random = new Random();

					int num1 = random.nextInt(10000);
					int num2 = random.nextInt(10000);

					int dotPosition = name.lastIndexOf(".");

					String fileBeginName = name.substring(0, dotPosition);
					String fileEndName = name.substring(dotPosition);
					name = fileBeginName + "_" + currentTime + "_" + num1 + "_"
							+ num2 + fileEndName;

					System.out.println("afterName=" + name);
					fileNameList.add(name);

					File file = new File(uploadFileDir, name);
					item.write(file);// 上传文件 就这一句

				} else {
					System.out.println("不是文件 是普通的表单域");
					// 得到所有非文件域 的表单域,例如文本框等,这里得到pid 和 pname 这两个文本框的值
					String fieldName = item.getFieldName();
					String value = item.getString("utf-8");
					System.out.println("fieldName=" + fieldName);
					System.out.println("value=" + value);
					if ("pid".equals(fieldName)) {
						pid = value;
					}
				}
			}
		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		System.out.println("**********look here***************");
		System.out.println("pid=" + pid);
		for (String str : fileNameList) {
			System.out.println(str);
		}
		
	
		//---------------------------2.把上传的文件名 保存到数据库对应的字段中------------------------------
		
		List<String> fileNameWithDirectoryList = new ArrayList<String>();//带文件夹的文件名 例如 product2\\图片名
		for(String fileName:fileNameList){
			
			String fileNameWithDirectory = "";
			
			if(!fileName.trim().equals("")){
				 fileNameWithDirectory = "product" + pid + "\\" + fileName;
			}
			
			fileNameWithDirectoryList.add(fileNameWithDirectory);
			
		}
		
		ProductServiceImpl service2 = new ProductServiceImpl();
		service2.saveProductListImageNamesForOneProduct(pid, fileNameWithDirectoryList);
	}
	
	@Override
	public void saveProductListImageNamesForOneProduct(String pid,
			List<String> fileNameList) throws Exception {

		System.out.println("fileNameList size=" + fileNameList.size());
		
		//先把以前的查出来
		Product product = dao.getProductById(Integer.parseInt(pid));

		ProductDaoImpl dao2 = new ProductDaoImpl();

		String[] imgNameArr = {"ProductListLargeImage","ProductListSmallImage1","ProductListSmallImage2","ProductListSmallImage3","DetailLargeImg","DetailSmallImg1","DetailSmallImg2","DetailSmallImg3","DetailSmallImg4","DetailSmallImg5","ShoppingCarImg"};
		
		//使用反射调用方法
		Class<?> clazz = product.getClass();
		
		for(int i=0;i<imgNameArr.length;i++){
			String imgName = fileNameList.get(i);
			
			if (imgName != null
					&& !imgName.trim().equals("")) {
				
				String methodName = "set" + imgNameArr[i];
				
				try{
					Method method = clazz.getMethod(methodName,String.class);
					method.invoke(product, imgName);
					System.out.println("调用一次");
				}catch(Exception e){
					e.printStackTrace();
				}
				
				//product.setProductListLargeImage(imgName);
			}
			
		}
		


		/*String productListSmallImage1 = fileNameList.get(1);

		if (productListSmallImage1 != null
				&& !productListSmallImage1.trim().equals("")) {
			product.setProductListSmallImage1(productListSmallImage1);
		}

		String productListSmallImage2 = fileNameList.get(2);

		if (productListSmallImage2 != null
				&& !productListSmallImage2.trim().equals("")) {
			product.setProductListSmallImage2(productListSmallImage2);
		}

		String productListSmallImage3 = fileNameList.get(3);

		if (productListSmallImage3 != null
				&& !productListSmallImage3.trim().equals("")) {
			product.setProductListSmallImage3(productListSmallImage3);
		}*/
		
		//保存详细页图片名称到指定字段

		dao2.updateProductImageNames(product);
	}

	// 查询一级商品种类下对应的二级商品种类
	public List<Product> getAllProductByCategory2(int cid) throws Exception {
		List<Product> list = null;

		String sql = "select * from product where onsale=1 and cid=" + cid;
		list = dao.getPageByQuery(sql);
		return list;
	}

/*	@Override
	public void saveImagePathInTable(String pid, List<String> fileNameList)
			throws Exception {
		// TODO Auto-generated method stub
		
	}*/

				
}
