package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.dao.impl.Category2DaoImpl;
import com.dao.inter.Category2Dao;
import com.page.PageInfo;
import com.service.inter.Category2Service;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class Category2ServiceImpl implements Category2Service {

	private Category2Dao dao;

	public Category2ServiceImpl() {
		dao = new Category2DaoImpl();
	}

	@Override
	public List<Category2> getAllCategorys() throws Exception {
		List<Category2> list = null;
		
		String sql = " SELECT * FROM CATEGORY c1 INNER JOIN category2 c2 ON (c1.cid = c2.fid)   ";
		list = dao.getPageByQuery(sql);
		
		return list;
	}

	@Override
	public int addCategory2(Category2 category) throws Exception {

		int count = dao.addCategory2(category);
		return count;
	}

	@Override
	public int getCategory2SumByCategory1(int fid) throws Exception {
		String sql = "select count(*) from category2 where fid = "+fid;
		int count = dao.getTotalRecordCount(sql);
		
		return count;
	}

	@Override
	public List<Category2> getAllCategorys2() throws Exception {
		List<Category2> list = null;
		
		String sql = "SELECT * FROM CATEGORY c1 INNER JOIN category2 c2 ON (c1.cid = c2.fid)  ";
		list = dao.getPage2ByQuery(sql);
		
		return list;
	}
	
	// ��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "select count(*) from category c1 INNER JOIN category2 c2 ON (c1.cid = c2.fid)";
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	
	// ��ѯ���к��ҳ
	public List<Category2> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM CATEGORY2 c2 INNER JOIN category c1 ON (c1.cid = c2.fid)) t )WHERE r>="+pageInfo.getBegin()+" AND r<="+pageInfo.getEnd();
		System.out.println(sql);

		List<Category2> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Category category) throws Exception{
		
		
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer("select count(*) from category where 1=1");
		
		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and cname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		String sql = sb.toString();
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(Category2 category) throws Exception{
		
		
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer(
				"SELECT count(*) FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM category2 c2 INNER JOIN CATEGORY c1 ON (c1.cid = c2.fid) WHERE 1=1 AND ");

		String cname = category.getCname();
		String cdesc = category.getCdesc();
		String cname1 = category.getCategory().getCname();

		if (cname1 != null && !cname1.trim().equals("")) {

			sb.append(" c1.cname LIKE '%");
			sb.append(cname1);
			sb.append("%'");
		}

		if(cname != null && !cname.trim().equals("")){
			
			sb.append(" OR c2.cname LIKE '%");
			sb.append(cname);
			sb.append("%' ");
		}
		
		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" OR c2.cdesc LIKE '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		sb.append(") t ) ");
		
		String sql = sb.toString();
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}
	
	// ����������ѯ Ȼ���ҳ
	public List<Category2> getPageByQuery(Category2 category, PageInfo pageInfo)
			throws Exception {

		List<Category2> list = null;

		// String sql =
//		SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM category2 c2 INNER JOIN CATEGORY c1 ON (c1.cid = c2.fid) WHERE 1=1 AND c1.cname LIKE '���õ���' OR c2.cname LIKE '���õ���' OR c2.cdesc LIKE '���õ���') t )
//		WHERE r>=1 AND r<=5
		
		StringBuffer sb = new StringBuffer(
				"SELECT * FROM (SELECT t.*,ROWNUM r FROM (SELECT * FROM category2 c2 INNER JOIN CATEGORY c1 ON (c1.cid = c2.fid) WHERE 1=1 AND ");

		String cname = category.getCname();
		String cdesc = category.getCdesc();
		String cname1 = category.getCategory().getCname();

		if (cname1 != null && !cname1.trim().equals("")) {

			sb.append(" c1.cname LIKE '%");
			sb.append(cname1);
			sb.append("%'");
		}

		if(cname != null && !cname.trim().equals("")){
			
			sb.append(" OR c2.cname LIKE '%");
			sb.append(cname);
			sb.append("%' ");
		}
		
		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" OR c2.cdesc LIKE '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		sb.append(") t ) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	// ɾ������������Ʒ����
	public int deleteCategory2ById(String cid) throws Exception {
	
		Category2 category = new Category2();
		category.setCid(Integer.parseInt(cid));
		int count = dao.deleteCategory2(category);
		return count;
	}
	
	// ��1
	public Category2 getCategory2ById(String cid) throws Exception {

		Category2 category = null;

		category = dao.getCategory2ById(Integer.parseInt(cid));
		return category;
	}
	
	// �޸�
	public int updateCategory(Category2 category) throws Exception {
		int count = dao.updateCategory2(category);
		return count;
	}
	
	@Override
	public List<Category> getAllCategorysName() throws Exception {
		List<Category> list = null;
		
		String sql = " SELECT c1.cid cid1,c1.cname cname1,c1.cdesc cdesc1,c2.cid cid2,c2.cname cname2,c2.cdesc Cdesc2,c2.fid FROM CATEGORY2 c2 INNER JOIN category c1 ON (c1.cid = c2.fid)   ";
		list = dao.getAllCategorysBySql(sql);
		
		return list;
	}
	
	//��ѯһ����Ʒ�����¶�Ӧ�Ķ�����Ʒ����
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception{
		List<Category2> list = null;
		
		String sql = "select * from category2 where fid=" + cid;
		list = dao.getPage2ByQuery(sql);
		return list;
	}

	// ��ѯָ����������ĸ���һ�������cid
	// �β�: cid ���������cid
	// ����ֵ: ����һ�������cid
	public int getParentCategoryById(int cid) throws Exception{
		int parentCid = 0;
		String sql = "select fid from category2 where cid=" + cid;
		try {
			parentCid = dao.getTotalRecordCount(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("��ѯ���������Ӧ��һ����Ʒ����ʧ��");
			
		}
		return parentCid;
	}
	// ������Ʒ�������ֵõ�Category2
		public Category2 getCategoryByName(String cname) throws Exception {
			Category2 category2 = null;
			String sql = "select * from category2 where cname='" + cname + "'";
			List<Category2> list = dao.getPageByQuery(sql);
			if (list.size() > 0) {
				category2 = list.get(0);
			}
			return category2;
		}
	
}
