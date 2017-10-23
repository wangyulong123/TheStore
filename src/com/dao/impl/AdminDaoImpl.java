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

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				admin = new Admin();
				admin.setAdminid(rs.getInt("adminid"));
				admin.setAdminName(rs.getString("adminname"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				
				list.add(admin);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询管理员失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

}
