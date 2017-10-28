package com.service.impl;

import java.util.List;

import com.dao.impl.Order1DaoImpl;
import com.page.PageInfo;
import com.service.inter.Order1Service;
import com.vo.Order1;

public class Order1ServiceImpl implements Order1Service {

	private Order1DaoImpl orderdao;
	public Order1ServiceImpl(){
		 orderdao = new Order1DaoImpl();
	}
		
	@Override
	public List<Order1> getPageByQuery(String shouhuorenname) throws Exception {
	
		List<Order1> list = orderdao.getPageByQuery(shouhuorenname);
		
		return list;
	}


	@Override
	public int GetRecordCount(Order1 order) throws Exception {
		
		int recordcount = -1;
		String name = order.getShouhuorenname();
		String sql = "select count(*) from order1 where shouhuorenname =" + "'"+ name+ "'";
		System.out.println("数量"+sql);
		recordcount =  orderdao.GetRecordCount(sql);
		
		System.out.println(recordcount+"shuliang");
		
		return recordcount;
	}

	@Override
	public List<Order1> getFenye(PageInfo pageInfo ,Order1 order) throws Exception {
	
		String name = order.getShouhuorenname();
		String sql ="select * from (select O.* ,rownum r from Order1 O where shouhuorenname = " + "'" + name + "'" + ") where r>=" 
						+ pageInfo.getBegin() +" and r<="+pageInfo.getEnd();
		System.out.println(sql);
		List<Order1> list = null;
		
		list = orderdao.getFenyeXx(sql);
	
		System.out.println(name);
		System.out.println("分页查询后的宽度"+list.size());
		
		return list;
	}
/*	public static void main(String[] args) throws Exception {
		Order1ServiceImpl a = new Order1ServiceImpl();
		Order1 order = new Order1();
		order.setShouhuorenname("123");
		PageInfo pageInfo=new PageInfo(1);
		List<Order1> list =a.getFenye(pageInfo, order);

		for(Order1 ss:list){
			System.out.println(ss);
		}
	}*/
}
