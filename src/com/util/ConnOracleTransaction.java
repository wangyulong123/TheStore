package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ��˾:�������ѧԺ ����:zhangzy ʱ��:2017��8��30�� ����9:26:05 ����:�������ݿ�Ĺ�����
 */
public class ConnOracleTransaction {

	// ����ThreadLocal��̬������ȷ����ȡ����ΪConnection
	private static ThreadLocal<Connection> connHolder = new ThreadLocal<Connection>();

	public static Connection getConnection() {
		Connection conn = connHolder.get();
		System.out.println("**********look here***************");
		System.out.println("conn=" + conn);
		if (conn == null) {
			String className = "oracle.jdbc.OracleDriver";
			String url = "jdbc:oracle:thin:@pgos:1521:orcl11";
			String user = "scott";
			String password = "tiger";
			// 1.��������
			try {
				Class.forName(className);

			} catch (ClassNotFoundException e) {
				System.out.println("������û���ҵ�");
				e.printStackTrace();
			}

			// 2.��������
			try {
				conn = DriverManager.getConnection(url, user, password);
				System.out.println("conn=" + conn);
				// ��Connection���õ�ThreadLocal
				connHolder.set(conn);
			} catch (SQLException e) {
				System.out.println("�������ݿ�ʧ��");
				e.printStackTrace();
			}

		}

		return conn;
	}

	public static void closeConnection(ResultSet rs, Statement stmt,
			Connection conn) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("�ر�ͨ��ʧ��");
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("�ر����ݿ�����ʧ��");
				e.printStackTrace();
			}
		}

	}

	// ������
	public static void beginTransaction() {
		
		Connection conn = connHolder.get();
		
		try {
			if (conn != null) {
				if (conn.getAutoCommit()) {
					conn.setAutoCommit(false); // �ֶ��ύ
				}
			}
		} catch (SQLException e) {
		}
	}

	// ������
	public static void closeTransaction() {
		
		Connection conn = connHolder.get();
		
		try {
			if (conn != null) {
				if (!conn.getAutoCommit()) {
					conn.setAutoCommit(true); // �Զ��ύ
				}
			}
		} catch (SQLException e) {
		}
	}

	// �����ύ
	public static void commitTransaction() {
		
		Connection conn = connHolder.get();
		try {
			if (conn != null) {
				if (!conn.getAutoCommit()) {
					conn.commit();
				}
			}
		} catch (SQLException e) {
		}
	}

	// ����ع�
	public static void rollbackTransaction() {
		System.out.println("rollbackTransaction");
		Connection conn = connHolder.get();
		System.out.println("conn=" + conn);
		try {
			if (conn != null) {
				if (!conn.getAutoCommit()) {
					conn.rollback();
				}
			}
		} catch (SQLException e) {
		}
	}

	public static void main(String[] args) {
		System.out.println(ConnOracleTransaction.getConnection());
	}
}
