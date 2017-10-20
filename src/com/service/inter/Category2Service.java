package com.service.inter;

import java.util.List;

import com.vo.Category2;

public interface Category2Service {

	//���
	public int addCategory2(Category2 category) throws Exception;
	//��ѯһ����Ʒ�����µĶ�����Ʒ��������
	public int getCategory2SumByCategory1(int cid) throws Exception;
	//��ѯһ����Ʒ�����¶�Ӧ�Ķ�����Ʒ����
	public List<Category2> getAllCategory2ByCategory1(int cid) throws Exception;
	//��1
	public Category2 getCategoryById(String cid) throws Exception;

	//������Ʒ�������ֵõ�Category2
	public Category2 getCategoryByName(String cname) throws Exception;
	//��ѯָ����������ĸ���һ�������cid  
	//�β�: cid ���������cid
	//����ֵ: ����һ�������cid
	public int getParentCategoryById(int cid) throws Exception;
}
