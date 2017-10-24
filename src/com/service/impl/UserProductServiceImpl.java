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
import com.service.inter.UserProductService;
import com.util.SQLUtil;
import com.vo.Product;

public class UserProductServiceImpl implements UserProductService {

	private ProductDao dao = new ProductDaoImpl();

	@Override
	public void addProduct(Product product) throws Exception {
		dao.addProduct(product);

	}

	@Override
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception {
		String pid = "";

		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区的阀值为512K
		itemFactory.setSizeThreshold(0x80000);

		File tempDir = new File("D:\\temp");
		if (!tempDir.exists()) {
			tempDir.mkdir();
		}

		// 设置临时存储文件的目录为E:\temp
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		// 设置上传文件的最大数据量为10M
		fileUpload.setSizeMax(0xA00000);

		// 解析上传文件流，得到FileItem对象的列表
		List<String> fileNameList = new ArrayList<String>();// 存文件名

		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			System.out.println("size=" + fileItems.size());
			Iterator<FileItem> it = fileItems.iterator();

			while (it.hasNext()) {

				FileItem item = it.next();
				// 判断是否是文件域
				if (!item.isFormField()) {
					System.out.println("是文件");

					String name = item.getName();

					long size = item.getSize();

					if ((name == null || name.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					// 保存上传的文件到指定的目录

					File uploadFileDir = new File(productListUploadPath);
					System.out.println("uploadFileDir=" + uploadFileDir);
					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdir();
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

		// 2.把上传的文件名 保存到数据库对应的字段中
		UserProductServiceImpl service2 = new UserProductServiceImpl();
		service2.saveProductListImageNamesForOneProduct(pid, fileNameList);
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

	@Override
	public List<Product> getAllProduct() throws Exception {
		List<Product> list = null;

		String sql = "select * from product order by cid";

		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public void deleteProductById(String pid) throws Exception {
		Product product = new Product();
		product.setPid(new Integer(pid));
		dao.deleteProduct(product);
	}

	@Override
	public Product getProductById(String pid) throws Exception {
		Product product = null;
		product = dao.getProductById(new Integer(pid));
		return product;
	}

	@Override
	public void updateProduct(Product product) throws Exception {

		dao.updateProduct(product);
	}

	@Override
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from product c order by pid asc) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);
		List<Product> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	//查询指定商品种类下的所有商品  然后分页
	public List<Product> getAllByPageByCategory(PageInfo pageInfo,String cid) throws Exception {

//		String sql = "select * from (select c.*,rownum r from product c where onsale=1 and cid=" + cid + ") where r>="
//				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		
		String sql = "SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM product p INNER JOIN category2 c ON (p.cid = c.cid) WHERE c.cid= "+Integer.parseInt(cid)+" order by p.pid) t) WHERE r>= "+pageInfo.getBegin()+" AND r<="+pageInfo.getEnd();
		System.out.println(sql);
		List<Product> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	//查询指定商品种类下的所有商品  + 排序 然后分页
		public List<Product> getAllByPageByCategory(PageInfo pageInfo,String cid,OrderCondition orderConditionObj) throws Exception{


			//String sql = "select * from (select c.*,rownum r from (select * from product where onsale=1 and cid=62
			// order by price asc) c) where r>=1 and r<=8"; 
			String orderCondition = orderConditionObj.getOrderCondition();
			String ascOrDesc = orderConditionObj.getAscOrDesc();
			
			
			String sql = "select * from (select c.*,rownum r from (select * from product where onsale=1 and cid=" + cid + 
			
			" order by " + orderCondition + " " + ascOrDesc;
			
			sql = sql + ") c) where r>=";
			
			sql = sql + pageInfo.getBegin();
			
			sql = sql + " and r<=";
			
			sql = sql + pageInfo.getEnd();
			
			System.out.println(sql);
			List<Product> list = null;

			list = dao.getProductByPageByQuery(sql);
			return list;
		}
	
	@Override
	public int getTotalRecordSum() throws Exception {
		String sql = "select count(*) as totalRecordSum from product";

		int totalRecordSum = 0;

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}
	//指定种类下的所有商品的数量
	public int getTotalRecordSumByCategory(String cid) throws Exception {
		String sql = "select count(*) as totalRecordSum from product where onsale=1 and cid=" + cid;
		System.out.println(sql);
		int totalRecordSum = 0;

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}

	@Override
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception {
		int totalRecordSum = 0;
		StringBuilder sb = new StringBuilder(
				"select count(*) as totalRecordSum from product where 1=1 and onsale=1");

		// select count(*) as totalRecordSum from category where 1=1 and
		// cname='商品种类描述' or cdesc like '%商品种类描述%'
		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		Integer onsale = product.getOnsale();
		
		Integer cid = product.getCid();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and pname='");
			sb.append(pname);
			sb.append("'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuName like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}
		
		if (onsale != null) {
			sb.append(" or onsale=");
			sb.append(onsale);
			
		}
		
		if (cid != null) {
			sb.append(" or cid=");
			sb.append(cid);
			
		}
		
		

		String sql = sb.toString();
		System.out.println(sql);

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}

	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception {
		List<Product> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%商品种类描述%') where r>=1 and r<=5";

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from product c where 1=1 and onsale=1");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		Integer cid = product.getCid();
		Integer onsale = product.getOnsale();
		
		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and pname='");
			sb.append(pname);
			sb.append("'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuName like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}
		
		
		if (cid != null) {
			sb.append(" or cid=");
			sb.append(cid);
			
		}
		

		sb.append(" order by pid asc) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());

		
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getPageByQuery(sql);
		return list;
	}
	@Override
	public List<Product> getPageByQuery1(Product product, PageInfo pageInfo) throws Exception {
		List<Product> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%商品种类描述%') where r>=1 and r<=5";

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from product c where 1=1 and onsale=1");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		Integer cid = product.getCid();
		Integer onsale = product.getOnsale();
		
		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and pname='");
			sb.append(pname);
			sb.append("'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuName like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}
		
		
		if (cid != null) {
			sb.append(" or cid=");
			sb.append(cid);
			
		}
		

		sb.append(" order by pid asc) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());

		
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getProductByPageByQuery(sql);
		return list;
	}
	//产品下架
	public void productDown(Integer pid){
		String sql = "update product set onsale=0 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.executeExceptDQL(sql);
		
	}
	
	//产品上架
	public void productUp(Integer pid){
		String sql = "update product set onsale=1 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.executeExceptDQL(sql);
			
	}
	
	//根据商品种类 查询商品
	public List<Product> getProductListByCategory(String cid) throws Exception{
		
		List<Product> list = null;
		String sql = "select * from product where onsale=1 and cid=" + cid;
		
		list = dao.getPageByQuery(sql);
		return list;
	}

	public static void main(String[] args) throws Exception {
		PageInfo pageInfo = new PageInfo(2,8);
		
		
		UserProductServiceImpl service = new UserProductServiceImpl();
		List<Product> list = service.getAllByPageByCategory(pageInfo,"62");
		for(Product product:list){
			System.out.println(product.getPname());
		}
	}
	@Override
	public int getPhonesSumBySearchCondition(Product product,String low,String high)throws Exception{
		int totalRecordSum = 0;
		StringBuilder sb = new StringBuilder(
				"select count(*) as totalRecordSum from product where 1=1 and onsale=1");

		// select count(*) as totalRecordSum from category where 1=1 and
		// cname='��Ʒ��������' or cdesc like '%��Ʒ��������%'		
		Integer cid = product.getCid();
		Integer lowInteger = Integer.parseInt(low);
		Integer highInteger = Integer.parseInt(high);
		if (cid != null) {
			sb.append(" and cid=");
			sb.append(cid);
			
		}	
		if(lowInteger!=null){
			sb.append(" and price>=");
			sb.append(low);
		}
		if(highInteger!=null){
			sb.append(" and price<=");
			sb.append(high);
		}
		String sql = sb.toString();
		System.out.println(sql);

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
		
	}

	@Override
	public List<Product> getPhonesPageByQuery(Product product, String low,
			String high, PageInfo pageInfo) throws Exception {
		List<Product> list = null;
		/*select * from (select c.*,rownum r from (select * from product where 1=1 and onsale=1 and pname='�ֻ�' or dianpuName like '%�ֻ�%' or 

		cid=62 order by price asc) c)

		where r>=9 and r<=16*/
		
		StringBuilder sb = new StringBuilder(
						"select * from (select c.*,rownum r from (select * from product where 1=1 and onsale=1");

				Integer cid = product.getCid();
				Integer lowInteger = Integer.parseInt(low);
				Integer highInteger = Integer.parseInt(high);
				String orderCondition = product.getOrderConditionObj().getOrderCondition();
				String ascOrDesc = product.getOrderConditionObj().getAscOrDesc();				
				
				if (cid != null) {
					sb.append(" and cid=");
					sb.append(cid);
					
				}
				if(lowInteger!=null&&!lowInteger.equals("")){
					sb.append(" and price>=");
					sb.append(low);
				}
				if(highInteger!=null&&!highInteger.equals("")){
					sb.append(" and price<=");
					sb.append(high);
				}
				if (orderCondition != null && !orderCondition.trim().equals("")) {
					sb.append(" order by ");
					
					sb.append(orderCondition);
					sb.append(" ");
					
					if("asc".equals(ascOrDesc)){
						
						sb.append("asc");
					}else{
						sb.append("desc");
					}
					
				}
					
				sb.append(") c) where r>=");
				sb.append(pageInfo.getBegin());
				sb.append(" and r<=");
				sb.append(pageInfo.getEnd());

				String sql = sb.toString();
				System.out.println(sql);
				list = dao.getProductByPageByQuery(sql);
				return list;
	}
}
 
