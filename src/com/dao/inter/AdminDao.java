package com.dao.inter;

import java.util.List;

import com.vo.Admin;

public interface AdminDao {
	
	//��.��SQL����
	public List<Admin> getPageByQuery(String sql) throws Exception;
	
	
}
