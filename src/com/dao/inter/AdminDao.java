package com.dao.inter;

import java.util.List;

import com.vo.Admin;

public interface AdminDao {
	
	//Îå.°´SQLÓï¾ä²é
	public List<Admin> getPageByQuery(String sql) throws Exception;
	
	
}
