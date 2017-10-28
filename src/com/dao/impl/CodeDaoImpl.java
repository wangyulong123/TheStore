package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dao.inter.CodeDao;
import com.util.ConnOracle;
import com.vo.Code;

public class CodeDaoImpl implements CodeDao{
	
	private Connection conn;
	
	public CodeDaoImpl() {
		//conn = ConnOracleTomcatDataSource.getConnection();
		conn = ConnOracle.getConnection();
	}


	@Override
	public int addPhone(Code code) throws Exception {
		int count = 0;
		String sql = "insert into code1 values(seq_code1.nextval,?,?)";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1,code.getPhone());
			pstmt.setString(2, code.getCode());
			
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("添加手机号码成功!");
			} else {
				System.out.println("没有添加任何手机号码!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("添加用户失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;
		
	}

}
