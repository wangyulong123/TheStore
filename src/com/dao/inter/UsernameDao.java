package com.dao.inter;

import java.util.List;

import com.vo.Category;
import com.vo.User;


public interface UsernameDao {
  //用户名登陆
 public User getUser(String name, String password) throws Exception;
 //用户注册
 public int register(User user) throws Exception;
//1.添加
 public int addUser(User user) throws Exception;
//2.删除
 public int deleteUser(User user) throws Exception;
//3.修改
 public int updateUser(User user) throws Exception;
//4.查1
 public User getUserById(int id) throws Exception;
//5.按SQL语句查
 public List<User> getPageByQuery(String sql) throws Exception;
//6.根据sql查询 总共有多少条记录
 public int getTotalRecordCount(String sql) throws Exception;
 //7.查询用户登录信息
 public  List<User> getlockAll() throws Exception;
 //8.查询用户登录记录
 public int getsum() throws Exception;
 //9.根据sql语句查询用户登录次数
 public int getsumByQuery(String sql) throws Exception;
 //10。根据sql语句查询用户登录信息
 public List<User> getPageBylockQuery(String sql) throws Exception;
}
