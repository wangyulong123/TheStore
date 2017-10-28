package com.service.inter;

import java.util.List;

import com.vo.Category;
import com.vo.User;

public interface UserService {

	public User login(String username,String password) throws Exception;
	
	public boolean activeUser(String username) throws Exception;
	
	public int addUser(User user) throws Exception;
	
	public List<User> getAllUsers()throws Exception;
}
