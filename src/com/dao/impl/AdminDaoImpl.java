package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.AdminDao;
import com.dao.inter.UserDao;
import com.util.ConnOracle;
import com.vo.Admin;
import com.vo.User;

public class AdminDaoImpl implements AdminDao {

	
	private Connection conn;
	
	public AdminDaoImpl() {
		conn = ConnOracle.getConnection();
	}

	@Override
	public List<Admin> getPageByQuery(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		List<Admin> list = new ArrayList<Admin>();

		Admin admin = null;

		// ��.����ͨ��
		try {
			stmt = conn.createStatement();
			// ��.ִ�в����ؽ����
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				admin = new Admin();
				admin.setAdminid(rs.getInt("adminid"));
				admin.setAdminName(rs.getString("adminname"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				
				list.add(admin);
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��!");
			e.printStackTrace();
			throw new Exception("��ѯ����Աʧ��");
		} finally {
			// ��.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

}
