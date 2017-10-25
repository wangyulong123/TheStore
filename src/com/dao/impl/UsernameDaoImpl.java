package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.UsernameDao;
import com.util.ConnOracle;
import com.vo.Category;
import com.vo.Category2;
import com.vo.User;

public class UsernameDaoImpl implements UsernameDao {
	private Connection conn;
	public UsernameDaoImpl() {
			conn = ConnOracle.getConnection();
		}
	//用户登录
	@Override
	public User getUser(String name, String password) throws SQLException {
		 User user = null;
		 String sql = "select * from user1 where username = ? and password = ?";
		  PreparedStatement ps = conn.prepareStatement(sql);
		  ps.setString(1, name);
          ps.setString(2, password);
          ResultSet rs = ps.executeQuery();
          if (rs.next()){
              user = new User();
              user.setUserid(rs.getInt(1));
              user.setUsername(rs.getString(2));
              user.setPassword(rs.getString(3));
              user.setIsActive(rs.getInt(4));
              user.setNickname(rs.getString("NickName"));
              user.setAddress(rs.getString("address"));
              user.setTelphone(rs.getString("telphone"));
          }
          ps.close();

          conn.close();
          return user;
  }
	 //用户注册
	
	public int register(User user) throws Exception{
		int count = 0;
		// 3.建立通道
		//INSERT INTO user1(userid,username,Password,Telphone) VALUES(seq_user1.nextval,'jhpe','1234564','176106538334')
		String sql = "insert into user1(userid,username,Password,isactive,Telphone) values(seq_user1.nextval,?,?,0,?)";
		
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getTelphone());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();										
		} catch (SQLException e) {
	
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("二级商品种类添加失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//用户添加
	@Override
	public int addUser(User user) throws Exception {
		int count = 0;
		// 3.建立通道
		String sql = "insert into user1 values(seq_category.nextval,?,?,?,?,?)";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;

		// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
		// 开启事务

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setInt(3, user.getIsActive());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6,user.getTelphone());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("添加用户成功!");
			} else {
				System.out.println("没有添加任何用户种类!");
			}
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加用户失败");
			e.printStackTrace();
			
			throw new Exception("用户添加失败");//异常转译
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//用户删除
	@Override
	public int deleteUser(User user) throws Exception {
		int count = 0;
		// 3.建立通道
		System.out.println(user.getUserid());
		String sql = "delete from user1 where userId= ?";
		
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// 4.执行并返回结果集
			 System.out.println(sql);
			pstmt.setInt(1, user.getUserid());
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("删除用户成功!");
			} else {
				System.out.println("没有删除任何用户!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除用户失败");
			e.printStackTrace();
			throw new Exception("删除用户失败!");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	@Override
	public int updateUser(User user) throws Exception {
		int count = 0;
		// 3.建立通道
		//username+password+adress+nickname+telphone
		String sql = "update user1 set username=?,password=? ,address=?,nickname=?,telphone=? where userid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getAddress());
			pstmt.setString(4,user.getNickname());
			pstmt.setString(5, user.getTelphone());
			pstmt.setInt(6, user.getUserid());
			
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0

			if (count >= 1) {
				System.out.println("修改用户成功!");
			} else {
				System.out.println("没有修改任何用户!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或修改用户失败");
			e.printStackTrace();
			throw new Exception("修改用户失败!");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//更具id查用户
	@Override
	public User getUserById(int id) throws Exception {
		User user = new User();

		// 3.建立通道
		String sql = "select * from user1 where userid=?";
        System.out.println(sql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
		
	              user.setUserid(rs.getInt(1));
	              user.setUsername(rs.getString(2));
	              user.setPassword(rs.getString(3));
	              user.setIsActive(rs.getInt(4));
	              user.setNickname(rs.getString("NickName"));;
	              user.setAddress(rs.getString("address"));
	              user.setTelphone(rs.getString("telphone"));;
			}
		} catch (SQLException e) {
			System.out.println("建立通道或查询用户失败");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, pstmt, conn);
		}

		return user;
	}
	//根据sql语句查用户
	@Override
	public List<User> getPageByQuery(String sql) throws Exception {
		List<User> list = new ArrayList<User>();
		User user = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				  user = new User();
	              user.setUserid(rs.getInt(1));
	              user.setUsername(rs.getString(2));
	              user.setPassword(rs.getString(3));
	              user.setIsActive(rs.getInt(4));
	              user.setNickname(rs.getString("NickName"));
	              user.setAddress(rs.getString("address"));
	              user.setTelphone(rs.getString("telphone"));
              list.add(user);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询用户失败!");
			
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	//更具sql语句查用户个数
	@Override
	public int getTotalRecordCount(String sql) throws Exception {
        int totalRecordCount = -1;
		 System.out.println(sql);
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
			
			throw new Exception("查询总共有多少条记录失败!");
			
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}
	//查询登录表中的信息
	public List<User> getlockAll() throws Exception {
		List<User> list = new ArrayList<User>();
		String sql="select * from C_LOGIN_RECORD ";
		ResultSet rs = null;
		Statement stmt = null;	
		try {
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
		    User user=new User();
			user.setC_id(rs.getInt(1));
			user.setUsername(rs.getString(2));	
			user.setLock_flag(rs.getInt(3));
			user.setFalure_num(rs.getInt(4));
			user.setDate(rs.getDate(5));
			list.add(user);
			}
			//		
		} catch (SQLException e) {
			System.out.println("创建通道失败");
			e.printStackTrace();
			throw new Exception("查询用户登陆记录失败");
		}
		
		return list;
	}
	//查询登陆信息一共有多少条
	public int getsum() throws Exception{
		int sum=-1;
		//select count(*) FROM C_LOGIN_RECORD 
		String sql="select count(*) from C_LOGIN_RECORD";
		ResultSet rs = null;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				sum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception();
		}
		
		
		return sum;
		
	}
	//查询登陆信息一共有多少条
  public int getsumByQuery(String sql) throws Exception{
			int sum=-1;
			
			
			ResultSet rs = null;
			Statement stmt = null;
			try {
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					sum=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("建立通道失败");
				e.printStackTrace();
				throw new Exception();
			}
			
		System.out.println("----------我是要求的sum"+sum);
			return sum;
			
		}
  //根据sql查询登录信息
//根据sql语句查用户
	@Override
	public List<User> getPageBylockQuery(String sql) throws Exception {
		List<User> list = new ArrayList<User>();
		User user = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				  user = new User();
	              user.setC_id(rs.getInt(1));;
	              user.setUsername(rs.getString(2));
	              user.setLock_flag(rs.getInt(3));
	              user.setFalure_num(rs.getInt(4));
	              user.setDate(rs.getDate(5));
              list.add(user);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询用户失败!");
			
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	public static void main(String[] args) throws Exception {
		UsernameDaoImpl service=new UsernameDaoImpl();
		List<User> list=service.getlockAll();
		 for(User user:list){
			System.out.println(user); 
		 }
	}
}



