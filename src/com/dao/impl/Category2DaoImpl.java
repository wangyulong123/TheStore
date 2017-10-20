package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.Category2Dao;
import com.util.ConnOracle;
import com.vo.Category;
import com.vo.Category2;

public class Category2DaoImpl implements Category2Dao {


	private Connection conn;

	public Category2DaoImpl() {

		conn = ConnOracle.getConnection();
	}

	@Override
	public int addCategory2(Category2 category) throws Exception{
		int count = 0;
		// 3.����ͨ��
		String sql = "insert into category2 values(seq_category2.nextval,?,?,?)";
		
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();
											
		} catch (SQLException e) {
			
			System.out.println("����ͨ���������Ʒ����ʧ��");
			e.printStackTrace();
			
			throw new Exception("������Ʒ�������ʧ��");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	@Override
	public int getTotalRecordCount(String sql) throws Exception{
		int totalRecordCount = -1;
		
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				
				totalRecordCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ�ܹ��ж�������¼ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}
	
	@Override
	public List<Category2> getPageByQuery(String sql) throws Exception {

		List<Category2> list = new ArrayList<Category2>();
		Category2 category = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ������Ʒ����ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	public Category2 getCategoryById(Integer cid) throws Exception{
		Category2 category2 = new Category2();

		String sql = "select * from category2 where cid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				category2.setCid(rs.getInt(1));
				category2.setCname(rs.getString(2));
				category2.setCdesc(rs.getString(3));
				category2.setFid(rs.getInt(4));
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ����������Ʒ����ʧ��");
		} finally {
			
			ConnOracle.closeConnection(rs, pstmt, conn);
		}
	
		return category2;
	}
}
