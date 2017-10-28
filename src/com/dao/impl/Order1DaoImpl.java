package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.Order1Dao;
import com.util.ConnOracle;
import com.vo.Order1;

public class Order1DaoImpl implements Order1Dao {

	private Connection conn;

	public Order1DaoImpl() {
		conn = ConnOracle.getConnection();
	}

	@Override
	public List<Order1> getPageByQuery(String shouhuorenname) throws Exception {
		List<Order1> list = new ArrayList<Order1>();
		
		String sql = "select * from order1 where shouhuorenname =  "+"'"+ shouhuorenname+"'";
		System.out.println(sql);
		Order1 order1 = null;
		ResultSet rs = null;
		Statement stmt = null;
	
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				order1 = new Order1();

				order1.setOrderid(rs.getInt("orderid"));
				order1.setOrderprice(rs.getDouble("orderprice"));
				order1.setOrdertime(rs.getString("ordertime"));
				order1.setShouhuorenname(rs.getString("shouhuorenname"));
				order1.setOrderdesc(rs.getString("orderdesc"));
				order1.setTel(rs.getLong("tel"));
				order1.setAddress(rs.getString("address"));
				order1.setOrderstatus(rs.getInt("orderstatus"));
				list.add(order1);

			}
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		} finally {
			ConnOracle.closeConnection(rs, null, null);
		}

		return list;
	}
	//查询结果的记录数有多少条
	@Override
	public int GetRecordCount(String sql) throws Exception {
		
		int recordcount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				recordcount = rs.getInt(1);//rs.getint(1);
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道或查询结果集失败");
			e.printStackTrace();
			throw new Exception("查询的总记录条数失败");
		}
		
		return recordcount;
	}
	
	@Override
	public List<Order1> getFenyeXx(String sql) throws Exception {
		List<Order1> listxx = new ArrayList<Order1>();
		
		String sql1 = sql;
		ResultSet rs = null;
		Statement stmt = null;
		
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			Order1 orderx = new Order1();
			
			orderx.setOrderid(rs.getInt("orderid"));
			orderx.setOrderprice(rs.getDouble("orderprice"));
			orderx.setOrdertime(rs.getString("ordertime"));
			orderx.setShouhuorenname(rs.getString("shouhuorenname"));
			orderx.setOrderdesc(rs.getString("orderdesc"));
			orderx.setTel(rs.getLong("tel"));
			orderx.setAddress(rs.getString("address"));
			orderx.setOrderstatus(rs.getInt("orderstatus"));
			
			listxx.add(orderx);
		}
		return listxx;
	}
	public static void main(String[] args) {
		Order1DaoImpl sss = new Order1DaoImpl();
		String sql = "select count(*) from order1 where shouhuorenname = '123'";
		int r = 0;
		
		try {
			r = sss.GetRecordCount(sql);
			
			System.out.println(r);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
