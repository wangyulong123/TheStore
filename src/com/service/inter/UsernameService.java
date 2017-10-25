package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.User;

public interface UsernameService {
    //��ʵ���ֺ������Ƿ�ƥ��
	public User getUser(String name, String password) throws Exception;
	//ע��
	public int register (User user)throws Exception;	
	//��ѯ�û��ܹ��ж�������¼
	public int getTotalRecordCount() throws Exception;
	//������
	public List<User> getAllUsers() throws Exception;
	//��ѯ���к��ҳ
	public List<User> getAllByPage(PageInfo pageInfo) throws Exception;
	//���
	public int adduser(User user) throws Exception;
	//ɾ������һ����Ʒ����
	public int deleteUserById(String userid) throws Exception;
	//��1
	public User getUserById(String userid) throws Exception;
	//�޸�
	public int updateUser(User user) throws Exception;
	//����������ѯ Ȼ���ҳ
	public List<User> getPageByQuery(User user,PageInfo pageInfo) throws Exception;
	//����������ѯ �ܹ��ж�������¼
	public int getTotalRecordCount(User user) throws Exception;
	//��ѯ�û���¼��Ϣ
	public List<User>  getlockAll() throws Exception;
	//��ѯ�û���¼����
	public int getsum() throws Exception;
	//����sql����ѯ��½����
	public List<User> getPageByLockQuery(User user, PageInfo pageInfo)throws Exception;
}
