package com.dao.inter;

import java.util.List;

import com.vo.Order1;
import com.vo.User;

public interface OrderDao {
	//һ.����
	public int addOrder(Order1 order) throws Exception;
	//��.ɾ��
	public int deleteUser(User user) throws Exception;
	//��.�޸�
	public int updateUser(User user) throws Exception;
	
	//��.��1
	public User getUserById(Integer userid) throws Exception;
	
	//��.��SQL����
	public List<User> getPageByQuery(String sql) throws Exception;
	
	//��.��ѯ�ܹ��ж�������¼
	public int getTotalRecordSum(String sql) throws Exception;
	
}
