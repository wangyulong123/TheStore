package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Category;
import com.vo.User;

public interface UsernameService {
    //核实名字和密码是否匹配
	public User getUser(String name, String password) throws Exception;
	//注册
	public int register (User user)throws Exception;	
	//查询用户总共有多少条记录
	public int getTotalRecordCount() throws Exception;
	//查所有
	public List<User> getAllUsers() throws Exception;
	//查询所有后分页
	public List<User> getAllByPage(PageInfo pageInfo) throws Exception;
	//添加
	public int adduser(User user) throws Exception;
	//删除单个一级商品种类
	public int deleteUserById(String userid) throws Exception;
	//查1
	public User getUserById(String userid) throws Exception;
	//修改
	public int updateUser(User user) throws Exception;
	//根据条件查询 然后分页
	public List<User> getPageByQuery(User user,PageInfo pageInfo) throws Exception;
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(User user) throws Exception;
	//查询用户登录信息
	public List<User>  getlockAll() throws Exception;
	//查询用户登录数量
	public int getsum() throws Exception;
	//根据sql语句查询登陆次数
	public List<User> getPageByLockQuery(User user, PageInfo pageInfo)throws Exception;
}
