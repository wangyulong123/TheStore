package com.dao.inter;

import java.util.List;

import com.vo.Category;
import com.vo.User;


public interface UsernameDao {
  //�û�����½
 public User getUser(String name, String password) throws Exception;
 //�û�ע��
 public int register(User user) throws Exception;
//1.���
 public int addUser(User user) throws Exception;
//2.ɾ��
 public int deleteUser(User user) throws Exception;
//3.�޸�
 public int updateUser(User user) throws Exception;
//4.��1
 public User getUserById(int id) throws Exception;
//5.��SQL����
 public List<User> getPageByQuery(String sql) throws Exception;
//6.����sql��ѯ �ܹ��ж�������¼
 public int getTotalRecordCount(String sql) throws Exception;
 //7.��ѯ�û���¼��Ϣ
 public  List<User> getlockAll() throws Exception;
 //8.��ѯ�û���¼��¼
 public int getsum() throws Exception;
 //9.����sql����ѯ�û���¼����
 public int getsumByQuery(String sql) throws Exception;
 //10������sql����ѯ�û���¼��Ϣ
 public List<User> getPageBylockQuery(String sql) throws Exception;
}
