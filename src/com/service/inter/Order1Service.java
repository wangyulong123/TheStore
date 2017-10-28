package com.service.inter;

import java.util.List;

import com.page.PageInfo;
import com.vo.Order1;

public interface Order1Service {
	//查询记录
	public List<Order1> getPageByQuery(String shouhuorenname) throws Exception;
	//查询所要求记录的数量
	public int GetRecordCount(Order1 order) throws Exception;
	//分页
	public List<Order1> getFenye(PageInfo pageInfo,Order1 order) throws Exception;
}
