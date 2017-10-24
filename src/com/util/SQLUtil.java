package com.util;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

//ר���������ô洢���̵Ĺ�����
public class SQLUtil {

	
	private Connection conn;
	
	public SQLUtil(){
		conn = ConnOracleTomcatDataSource.getConnection();
	}
	
	//���ô洢����
	public  void callProcedure(){
		//��.����ͨ��
		String sql = "{call proc_increase_salary(?,?)}";
		CallableStatement cstmt = null;
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, 10);
			
			//�����������
			cstmt.registerOutParameter(2,Types.VARCHAR);
			
			//��.ִ��
			cstmt.executeUpdate();
			
			
			String msg = cstmt.getString(2);
			System.out.println("�洢���̳ɹ�");
			System.out.println(msg);
		} catch (SQLException e) {
			System.out.println("���ô洢����ʧ��");
			e.printStackTrace();
		}finally{
			//��.�ر�
			if(cstmt!=null){
				try {
					cstmt.close();
				} catch (SQLException e) {
					System.out.println("�ر�ͨ��ʧ��");
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("�ر����ݿ�����ʧ��");
					e.printStackTrace();
				}
			}
			
			
		}
		
		
	}
	
	//һ�����߷���: ����ִ�г�DQL������κ�SQL���
	public void executeExceptDQL(String sql){
		//��.����ͨ��
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			
			//��.ִ��
			int count = stmt.executeUpdate(sql);//ִ�� ����dql�������е����,  dml  ��ddl
			//���ִ�е���dml ����ֵ�� ��Ӱ�������   ִ��ddl ���ص��� 0
			System.out.println("count=" + count);
			System.out.println("ִ�����ɹ�");
			
		} catch (SQLException e) {
			System.out.println("ִ�����ʧ��");
			e.printStackTrace();
		}finally{
			//��.�ر�
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("�ر�ͨ��ʧ��");
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("�ر����ݿ�����ʧ��");
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	
	public static void main(String[] args) {
		SQLUtil sqlUtil = new SQLUtil();
		
		//sqlUtil.callProcedure();
		
		String sql = "insert into account values(1,'С��',3000);insert into account values(1,'С��',3000);insert into account values(1,'С��',3000);insert into account values(1,'С��',3000);";
		sqlUtil.executeExceptDQL(sql);
		
	}
	
	/*public static void main(String[] args) {
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.callProcedure();
	}*/
	
}