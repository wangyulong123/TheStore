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
import com.page.PageInfo;
import com.service.inter.ProductService;
import com.util.SQLUtil;
import com.vo.Product;

public class ProductServiceImpl implements ProductService{

	private ProductDao dao;
	
	public ProductServiceImpl(){
		
		dao = new ProductDaoImpl();	
	}
	
	public int addProduct(Product product) throws Exception{
		
		int count = dao.addProduct(product);
		return count;
	}
	
	@Override
	public int deleteProductById(String pid) throws Exception {
		Product product = new Product();
		product.setPid(new Integer(pid));
		int count = dao.deleteProduct(product);
		return count;
	}
	
	@Override
	public int getTotalRecordSum() throws Exception {
		String sql = "select count(*) as totalRecordSum from product";

		int totalRecordSum = 0;

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}
	
	@Override
	public int updateProduct(Product product) throws Exception{

		int count = dao.updateProduct(product);
		return count;
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
	
	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception{
		List<Product> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='��Ʒ��������' or cdesc like '%��Ʒ��������%') where r>=1 and r<=5";

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from product c where 1=1");

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
		
		if (onsale != null) {
			sb.append(" or onsale=");
			sb.append(onsale);
			
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
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception {
		int totalRecordSum = 0;
		StringBuilder sb = new StringBuilder(
				"select count(*) as totalRecordSum from product where 1=1");

		// select count(*) as totalRecordSum from category where 1=1 and
		// cname='��Ʒ��������' or cdesc like '%��Ʒ��������%'
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
	
	//��Ʒ�ϼ�
	public void productUp(Integer pid) throws Exception{
		String sql = "update product set onsale=1 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		try {
			sqlUtil.executeExceptDQL(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("�ϼ�ʧ��");
		}
			
	}
	
	//��Ʒ�¼�
	public void productDown(Integer pid) throws Exception{
		String sql = "update product set onsale=0 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		try {
			sqlUtil.executeExceptDQL(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("�¼�ʧ��");
		}
				
	}
	
	@Override
	public Product getProductById(String pid) throws Exception{
		Product product = null;
		product = dao.getProductById(new Integer(pid));
		return product;
	}
	
	@Override
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception{
		String pid = "";

		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// �����ڴ滺�����ķ�ֵΪ512K
		itemFactory.setSizeThreshold(0x80000);

		File tempDir = new File("D:\\temp");
		if (!tempDir.exists()) {
			tempDir.mkdirs();
		}

		// ������ʱ�洢�ļ���Ŀ¼ΪD:\\temp
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		//�����ϴ��ļ������������Ϊ10M
		fileUpload.setSizeMax(0xA00000);

		//�����ϴ��ļ������õ�FileItem������б�
		List<String> fileNameList = new ArrayList<String>();// ���ļ���

		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			System.out.println("size=" + fileItems.size());
			Iterator<FileItem> it = fileItems.iterator();

			boolean flag = true;//һ����Ʒ��ͼƬ  �ŵ�һ���ļ��� Ϊ�˱�֤86��ִֻ��һ��
			
			while (it.hasNext()) {
					

				FileItem item = it.next();
				// �ж��Ƿ����ļ���
				if (!item.isFormField()) {
					System.out.println("���ļ�");

					String name = item.getName();

					long size = item.getSize();

					if ((name == null || name.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					// �����ϴ����ļ���ָ����Ŀ¼
					if(flag){
						
						productListUploadPath = productListUploadPath + "\\product" + pid; //ִֻ��һ��
						flag = false;
					}
					
					File uploadFileDir = new File(productListUploadPath);
					System.out.println("uploadFileDir=" + uploadFileDir);
					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdirs();
					}

					// �����������͵��ļ�����ȫ·��������ȡ���ļ���
					// ͼƬ���������_��ǰʱ�����1970�������_�����1_�����2
					// d:\\......\\1.jpg
					int index = name.lastIndexOf(File.separator);
					if (index > 0) {
						name = name.substring(index + 1, name.length());
					}

					// ���ͬ���ļ���������:�������һ�� Ψһ ������ �����滻�ϴ��ļ������ּ���
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
					item.write(file);// �ϴ��ļ� ����һ��

				} else {
					System.out.println("�����ļ� ����ͨ�ı���");
					// �õ����з��ļ��� �ı���,�����ı����,����õ�pid �� pname �������ı����ֵ
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
		
	
		//---------------------------2.���ϴ����ļ��� ���浽���ݿ��Ӧ���ֶ���------------------------------
		
		List<String> fileNameWithDirectoryList = new ArrayList<String>();//���ļ��е��ļ��� ���� product2\\ͼƬ��
		for(String fileName:fileNameList){
			
			String fileNameWithDirectory = "";
			
			if(!fileName.trim().equals("")){
				 fileNameWithDirectory = "product" + pid + "\\" + fileName;
			}
			
			fileNameWithDirectoryList.add(fileNameWithDirectory);
			
		}
		
		ProductServiceImpl service2 = new ProductServiceImpl();
		service2.saveImagePathInTable(pid, fileNameWithDirectoryList);
	}
	
	@Override
	public void saveImagePathInTable(String pid,
			List<String> fileNameList) throws Exception{

		System.out.println("fileNameList size=" + fileNameList.size());
		
		//�Ȱ���ǰ�Ĳ����
		Product product;
		try {
			product = dao.getProductById(Integer.parseInt(pid));
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new Exception("������ƷͼƬ·��ʱ ��ѯ��һ��Ʒʧ��!");
		
		}

		ProductDaoImpl dao2 = new ProductDaoImpl();

		String[] imgNameArr = {"ProductListLargeImage","ProductListSmallImage1","ProductListSmallImage2","ProductListSmallImage3","DetailLargeImg","DetailSmallImg1","DetailSmallImg2","DetailSmallImg3","DetailSmallImg4","DetailSmallImg5","ShoppingCarImg"};
		
		//ʹ�÷�����÷���
		Class<?> clazz = product.getClass();
		
		for(int i=0;i<imgNameArr.length;i++){
			String imgName = fileNameList.get(i);
			
			if (imgName != null
					&& !imgName.trim().equals("")) {
				
				String methodName = "set" + imgNameArr[i];
				
				try{
					Method method = clazz.getMethod(methodName,String.class);
					method.invoke(product, imgName);
					System.out.println("����һ��");
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
		
		//������ϸҳͼƬ���Ƶ�ָ���ֶ�
		dao2.updateProductImageNames(product);
	}
}
