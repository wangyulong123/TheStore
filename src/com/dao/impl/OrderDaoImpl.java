package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.dao.inter.OrderDao;
import com.util.ConnOracle;
import com.util.ConnOracleTomcatDataSource;
import com.vo.Order1;
import com.vo.Product;
import com.vo.User;

public class OrderDaoImpl implements OrderDao {

	
	private Connection conn;
	
	public OrderDaoImpl() {
		conn = ConnOracle.getConnection();
	}


	@Override
	public int addOrder(Order1 order) throws Exception {
		int orderId = 0;
		Random random = new Random();
		int num1 = random.nextInt(10000);
		int num2 = random.nextInt(1000);
		
		String sql = "INSERT INTO order1 VALUES("+num1+"||"+num2+"||seq_order1.nextval,to_date('"+order.getOrdertime()+"','YYYY-MM-DD HH24:MI:SS'),?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, order.getOrderprice());
			pstmt.setString(2,order.getOrderdesc());
			pstmt.setString(3,order.getShouhuorenname());
			pstmt.setLong(4, order.getTel());
			pstmt.setInt(5,order.getUserid());
			pstmt.setString(6,order.getAddress());
			pstmt.setInt(7,order.getOrderstatus());

			// 四.执行并返回结果集
			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			rs.next();
			orderId = rs.getInt(1);
			System.out.println("orderId=" + orderId);
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("添加订单失败");
		} /*finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}*/

		return orderId;
	}

	@Override
	public int deleteUser(User user) throws Exception{
		int count = 0;
		String sql = "delete from user where userid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserid());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("删除用户成功!");
			} else {
				System.out.println("没有删除任何用户!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("删除用户失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;
	}

	// 三.修改
	public int updateUser(User user) throws Exception{
		int count;
		String sql = "update user set cname=?,cdesc=? where cid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setInt(3, user.getUserid());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("修改用户成功!");
			} else {
				System.out.println("没有修改任何用户!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改用户失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	// 四.查1

	public User getUserById(Integer userid) throws Exception{
		User user = new User();

		String sql = "select * from user where userid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userid);

			// 四.执行并返回结果集
			// ResultSet 结果集 封装了 数据库查询的结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单个用户失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, pstmt, conn);

		}

		return user;
	}

	// 五.按SQL语句查
	public List<User> getPageByQuery(String sql) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;

		List<User> list = new ArrayList<User>();

		User user = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user = new User();

				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setIsActive(rs.getInt("isActive"));
				user.setNickname(rs.getString("nickname"));
				user.setAddress(rs.getString("address"));
				
				list.add(user);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}



	public int getTotalRecordSum(String sql) throws Exception{
		int totalRecordSum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			

			// 四.执行并返回结果集
			// ResultSet 结果集 封装了 数据库查询的结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecordSum = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询用户数量失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, pstmt, conn);

		}

		return totalRecordSum;
	}
	
	// 七.按SQL语句查
	public List<Order1> getOrderPageByQuery(String sql) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;

		List<Order1> list = new ArrayList<Order1>();

		Order1 order = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				order = new Order1();
				order.setOrderid(rs.getInt("orderid"));
				order.setOrdertime(rs.getString("ordertime"));
				order.setShouhuorenname(rs.getString("shouhuorenname"));
				order.setTel(rs.getLong("tel"));
				order.setAddress(rs.getString("address"));
				order.setOrderdesc(rs.getString("orderdesc"));
				order.setOrderprice(rs.getDouble("orderprice"));
				order.setOrderstatus(rs.getInt("orderstatus"));
				
				list.add(order);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询用户失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	
	@Override
	public int deleteOrder(Order1 order) throws Exception{
		String sql = "delete from order1 where orderid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderid());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("删除订单失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	// 三.修改
	public int updateOrder(Order1 order) throws Exception {
//		UPDATE order1 SET orderprice = 0.01 ,orderdesc ='买一赠一',tel='15300000000',address='浩瀚的宇宙',orderstatus = 1 WHERE ORDERid = 748330027
		String sql = "update order1 SET orderprice = ? ,orderdesc = ?,tel=?,address=?,orderstatus = ? WHERE ORDERid = ?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, order.getOrderprice());
			pstmt.setString(2, order.getOrderdesc());
			pstmt.setLong(3, order.getTel());
			pstmt.setString(4,order.getAddress());
			pstmt.setInt(5, order.getOrderstatus());
			pstmt.setInt(6, order.getOrderid());
			
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改订单失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);

		}

		return count;
	}

	// 四.查1
	public Order1 getOrderById(int orderid) throws Exception{
		Order1 order = new Order1();
		
		String sql = "select * from order1 where orderid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderid);

			// 四.执行并返回结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
			
				order.setOrderid(rs.getInt("orderid"));
				order.setAddress(rs.getString("address"));
				order.setOrderdesc(rs.getString("orderdesc"));
				order.setOrderprice(rs.getDouble("orderprice"));
				order.setOrderstatus(rs.getInt("orderstatus"));
				order.setShouhuorenname(rs.getString("shouhuorenname"));
				order.setTel(rs.getLong("tel"));
				order.setUserid(rs.getInt("userid"));
				
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单一订单失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, pstmt, conn);

		}

		return order;
	}


}
