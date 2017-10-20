package com.service.impl;

import java.util.List;

import com.dao.impl.CategoryDaoImpl;
import com.dao.inter.CategoryDao;
import com.page.PageInfo;
import com.service.inter.CategoryService;
import com.vo.Category;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDao dao;

	public CategoryServiceImpl() {
		dao = new CategoryDaoImpl();
	}

	@Override
	public int addCategory(Category category) throws Exception {

		int count = dao.addCategory(category);
		return count;
	}

	@Override
	public List<Category> getAllCategorys() throws Exception {
		List<Category> list = null;

		String sql = "select * from category";
		list = dao.getPageByQuery(sql);
		return list;
	}

	// ɾ������һ����Ʒ����
	public int deleteCategoryById(String cid) throws Exception {

		Category category = new Category();
		category.setCid(Integer.parseInt(cid));
		int count = dao.deleteCategory(category);
		return count;
	}

	// ��1
	public Category getCategoryById(String cid) throws Exception {

		Category category = null;

		category = dao.getCategoryById(Integer.parseInt(cid));
		return category;
	}

	// �޸�
	public int updateCategory(Category category) throws Exception {
		int count = dao.updateCategory(category);
		return count;
	}

	// ��ѯ���к��ҳ
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from category c) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);

		List<Category> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}

	

	// ��ѯ�ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "select count(*) from category";
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}

	// ����������ѯ Ȼ���ҳ
	public List<Category> getPageByQuery(Category category, PageInfo pageInfo)
			throws Exception {

		List<Category> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='��Ʒ��������' or cdesc like '%111%') where r>=11 and r<=15"

		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from category c where 1=1");

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
		
		sb.append(") where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		CategoryServiceImpl service = new CategoryServiceImpl();

		Category category = new Category();
		
		PageInfo pageInfo = new PageInfo(1);
		
		List<Category> list = service.getPageByQuery(category, pageInfo);
		
		for(Category temp:list){
			System.out.println(temp);
		}
		
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

}
