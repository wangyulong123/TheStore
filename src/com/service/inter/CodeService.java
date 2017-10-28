package com.service.inter;

import com.vo.Code;

public interface CodeService {
     //添加用户注册输入的手机号码到数据库表code1
	public int addPhone(Code code) throws Exception;
}

