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
		// ��.����ͨ��
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1,code.getPhone());
			pstmt.setString(2, code.getCode());
			
			// ��.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			if (count >= 1) {
				System.out.println("����ֻ�����ɹ�!");
			} else {
				System.out.println("û������κ��ֻ�����!");
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("����û�ʧ��");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;
		
	}

}
