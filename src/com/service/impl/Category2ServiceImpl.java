package com.service.impl;

import java.util.List;

import com.dao.impl.Category2DaoImpl;
import com.dao.inter.Category2Dao;
import com.service.inter.Category2Service;
import com.vo.Category2;

public class Category2ServiceImpl implements Category2Service {

	private Category2Dao dao;

	public Category2ServiceImpl() {
		dao = new Category2DaoImpl();
	}

	@Override
	public int addCategory2(Category2 category) throws Exception {

		int count = dao.addCategory2(category);
		return count;
	}

	// ��ѯһ����Ʒ�����µĶ�����Ʒ��������
	public int getCategory2SumByCategory1(int fid) throws Exception {

		int count = 0;
		String sql = "select count(*) from category2 where fid=" + fid;
		count = dao.getTotalRecordCount(sql);
		return count;
	}

	// ��ѯһ����Ʒ�����¶�Ӧ�Ķ�����Ʒ����
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception {
		List<Category2> list = null;

		String sql = "select * from category2 where fid=" + cid;
		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public Category2 getCategoryById(String cid) throws Exception {
		Category2 category2 = null;
		category2 = dao.getCategoryById(new Integer(cid));
		return category2;
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
}
