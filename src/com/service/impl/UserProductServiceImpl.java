package com.service.impl;


import java.util.List;

import com.dao.impl.ProductDaoImpl;
import com.dao.inter.ProductDao;
import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.inter.UserProductService;
import com.vo.Product;

public class UserProductServiceImpl implements UserProductService {

	private ProductDao dao = new ProductDaoImpl();

	//ָ�������µ�������Ʒ������
	public int getTotalRecordSumByCategory(String cid) throws Exception{
		String sql = "select count(*) as totalRecordSum from product where onsale=1 and cid=" + cid;
		System.out.println(sql);
		int totalRecordSum = 0;

		try {
			totalRecordSum = dao.getTotalRecordSum(sql);
		} catch (Exception e) {
			
			e.printStackTrace();
			throw new Exception("��ѯָ����������Ʒ����ʧ��");
		}

		return totalRecordSum;
	}

	//��ѯָ����Ʒ�����µ�������Ʒ  Ȼ���ҳ
	public List<Product> getAllByPageByCategory(PageInfo pageInfo,String cid) throws Exception{

		String sql = "select * from (select c.*,rownum r from product c where onsale=1 and cid=" + cid + ") where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);
		List<Product> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	//��ѯָ����Ʒ�����µ�������Ʒ  + ���� Ȼ���ҳ
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

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	@Override
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception{
		int totalRecordSum = 0;
		StringBuilder sb = new StringBuilder(
				"select count(*) as totalRecordSum from product where 1=1 and onsale=1");

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

	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception{
		List<Product> list = null;

		

/*select * from (select c.*,rownum r from (select * from product where 1=1 and onsale=1 and pname='�ֻ�' or dianpuName like '%�ֻ�%' or 

cid=62 order by price asc) c)

where r>=9 and r<=16*/

		
		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from (select * from product where 1=1 and onsale=1");

		String pname = product.getPname();
		String dianpuName = product.getDianpuName();
		Integer cid = product.getCid();
		
		String orderCondition = product.getOrderConditionObj().getOrderCondition();
		String ascOrDesc = product.getOrderConditionObj().getAscOrDesc();
		
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
		list = dao.getPageByQuery(sql);
		return list;
	}
	
	@Override
	public Product getProductById(String pid) throws Exception{
		Product product = null;
		product = dao.getProductById(new Integer(pid));
		return product;
	}

}
 