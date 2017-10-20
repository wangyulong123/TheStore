package com.dao.inter;

import java.util.List;
import com.vo.User;

public interface UserDao {
	//һ.����
	public int addUser(User user) throws Exception;
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
