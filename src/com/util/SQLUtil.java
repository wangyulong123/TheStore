package com.util;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

//专门用来调用存储过程的工具类
public class SQLUtil {

	
	private Connection conn;
	
	public SQLUtil(){
		conn = ConnOracleTomcatDataSource.getConnection();
	}
	
	//调用存储过程
	public  void callProcedure(){
		//三.建立通道
		String sql = "{call proc_increase_salary(?,?)}";
		CallableStatement cstmt = null;
		
		try {
			cstmt = conn.prepareCall(sql);
			cstmt.setInt(1, 10);
			
			//设置输出参数
			cstmt.registerOutParameter(2,Types.VARCHAR);
			
			//四.执行
			cstmt.executeUpdate();
			
			
			String msg = cstmt.getString(2);
			System.out.println("存储过程成功");
			System.out.println(msg);
		} catch (SQLException e) {
			System.out.println("调用存储过程失败");
			e.printStackTrace();
		}finally{
			//五.关闭
			if(cstmt!=null){
				try {
					cstmt.close();
				} catch (SQLException e) {
					System.out.println("关闭通道失败");
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("关闭数据库连接失败");
					e.printStackTrace();
				}
			}
			
			
		}
		
		
	}
	
	//一个工具方法: 可以执行除DQL以外的任何SQL语句
	public void executeExceptDQL(String sql){
		//三.建立通道
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			
			//四.执行
			int count = stmt.executeUpdate(sql);//执行 除了dql以外所有的语句,  dml  或ddl
			//如果执行的是dml 返回值是 受影响的行数   执行ddl 返回的是 0
			System.out.println("count=" + count);
			System.out.println("执行语句成功");
			
		} catch (SQLException e) {
			System.out.println("执行语句失败");
			e.printStackTrace();
		}finally{
			//五.关闭
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("关闭通道失败");
					e.printStackTrace();
				}
			}
			
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("关闭数据库连接失败");
					e.printStackTrace();
				}
			}
			
			
		}
	}
	
	
	public static void main(String[] args) {
		SQLUtil sqlUtil = new SQLUtil();
		
		//sqlUtil.callProcedure();
		
		String sql = "insert into account values(1,'小辉',3000);insert into account values(1,'小辉',3000);insert into account values(1,'小辉',3000);insert into account values(1,'小辉',3000);";
		sqlUtil.executeExceptDQL(sql);
		
	}
	
	/*public static void main(String[] args) {
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.callProcedure();
	}*/
	
}