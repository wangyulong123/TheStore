package com.service.impl;

import com.dao.impl.CodeDaoImpl;
import com.dao.inter.CodeDao;
import com.service.inter.CodeService;
import com.vo.Code;

public class CodeServiceImpl implements CodeService{

	@Override
	public int addPhone(Code code) throws Exception {
		CodeDao dao = new CodeDaoImpl();
		int count = dao.addPhone(code);
		return count;
	}
	
}
