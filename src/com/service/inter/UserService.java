package com.service.inter;

import com.vo.User;

public interface UserService {

	public User login(String username,String password) throws Exception;
}
