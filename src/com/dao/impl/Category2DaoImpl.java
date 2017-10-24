package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.dao.inter.Category2Dao;
import com.util.ConnOracle;
import com.util.ConnOracleTomcatDataSource;
import com.vo.Category;
import com.vo.Category2;

public class Category2DaoImpl implements Category2Dao {

	// 1.组合Connection
	private Connection conn;

	public Category2DaoImpl() {
//		conn = ConnOracleTomcatDataSource.getConnection();
		conn = ConnOracle.getConnection();
	}

	@Override
	public int addCategory2(Category2 category) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "insert into category2 values(seq_category2.nextval,?,?,?)";
		PreparedStatement pstmt = null;


		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加二级商品种类失败");
			e.printStackTrace();
			
			throw new Exception("二级商品种类添加失败");
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	@Override
	public List<Category2> getPageByQuery(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		Category category1 = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category2();
				
				category.setCid(rs.getInt(1));
				category.setCname(rs.getString(2));
				category.setCdesc(rs.getString(3));
				
				category1 = new Category();
				//cname重名
				category1.setCname(rs.getString(6));
				category.setCategory(category1);
				
				list.add(category);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询二级商品种类失败!");
			
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	@Override
	public int getTotalRecordCount(String sql) throws Exception{
		int totalRecordCount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				
				totalRecordCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询一级商品下的二级商品总共有多少条记录失败!");
			
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}
	
	@Override
	public List<Category2> getPage2ByQuery(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category2();

				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				category.setCdesc(rs.getString("cdesc"));
				category.setFid(rs.getInt("fid"));
				
				list.add(category);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询二级商品种类失败!");
			
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	@Override
	public int deleteCategory2(Category2 category) throws Exception{
		int count = 0;
		String sql = "delete from category2 where cid=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, category.getCid());

			// 4.执行并返回结果集
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("建立通道或删除商品种类失败");
			e.printStackTrace();
			throw new Exception("删除二级商品种类失败!");
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	@Override
	public Category2 getCategory2ById(int id) throws Exception{
		Category2 category = new Category2();

		// 3.建立通道
		String sql = "select * from category2 where cid=?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				category.setCdesc(rs.getString("cdesc"));
			}
		} catch (SQLException e) {
			System.out.println("建立通道或查询单个二级商品种类失败");
			e.printStackTrace();
			throw new Exception("查询单个二级商品种类失败");
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, pstmt, conn);
		}

		return category;
	}
	
	@Override
	public int updateCategory2(Category2 category) throws Exception{
		int count = 0;
		String sql = "update category2 set cname=?,cdesc=? where cid=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getCid());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("建立通道或修改二级商品种类失败");
			e.printStackTrace();
			throw new Exception("修改二级商品种类失败!");
		} finally {
			// 5.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	@Override
	public List<Category> getAllCategorysBySql(String sql) throws Exception {

		List<Category> list = new ArrayList<Category>();
		List<Category2> list2 = null;
		List<String> cname1List = new ArrayList<String>();
		
		Category2 category2 = null;
		Category category1 = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
			
			
			while (rs.next()) {
				String cname1 = rs.getString("cname1");
				if(!cname1List.contains(cname1)){
					cname1List.add(cname1);
					category1 = new Category();
					list2 = new ArrayList<Category2>();
					category1.setCid(rs.getInt("cid1"));
					category1.setCname(rs.getString("cname1"));
					category1.setCdesc(rs.getString("cdesc1"));
					
					category1.setList(list2);
					list.add(category1);
				}else{
					category2 = new Category2();
					//可以获取其它信息cid和cdesc，但是要改sql语句
					category2.setCid(rs.getInt("cid2"));
					category2.setCname(rs.getString("cname2"));
					category2.setCdesc(rs.getString("cdesc2"));
					category2.setFid(rs.getInt("fid"));
					
					list2.add(category2);
				}
				
		 		
			}
			
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询一级和二级商品种类失败!");
			
		} finally {
			// 5.关闭
//			ConnOracleTomcatDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	public static void main(String[] args) throws Exception {
		String sql = " SELECT c1.cname cname1,c2.cname cname2 FROM CATEGORY2 c2 INNER JOIN category c1 ON (c1.cid = c2.fid)   ";
		List<Category> list = new Category2DaoImpl().getAllCategorysBySql(sql);
	 	
	 	for(Category category1:list){
	 		System.out.println("111"+category1.getCname());
	 		for(Category2 category2 :category1.getList()){
	 			System.out.println("222"+category2.getCname());
	 		}
	 	}
	}
}

