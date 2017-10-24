package com.service.inter;

import com.vo.Admin;

public interface AdminService {

	public Admin login(String adminName,String adminpwd) throws Exception;
}
