package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.ProductDao;
import com.util.ConnOracleTomcatDataSource;
import com.vo.Category2;
import com.vo.Product;

public class ProductDaoImpl implements ProductDao {

	// 组合Connection对象
	private Connection conn;

	public ProductDaoImpl() {
		conn = ConnOracleTomcatDataSource.getConnection();
	}

	
	@Override
	public int addProduct(Product product) throws Exception{
		//刚刚插入的商品处于"下架"状态 所以onsale 的值为0    1 表示上架   0 表示下架
		String sql = "insert into product(pid,pname,price,pingjiasum,productSum,dianpuName,pdesc,onsale,cid) values(seq_product.nextval,?,?,0,?,?,?,0,?)";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setDouble(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setInt(6, product.getCid());
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("添加商品失败");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);

		}
		
		return count;

	}

	@Override
	public int deleteProduct(Product product) throws Exception{
		String sql = "delete from product where pid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPid());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("删除商品失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	// 三.修改
	public int updateProduct(Product product) throws Exception {
		String sql = "update product set pname=?,price=?,productSum=?,dianpuName=?,pdesc=?,cid=? where pid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setDouble(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setInt(6, product.getCid());
			pstmt.setInt(7, product.getPid());
			
			
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改商品失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);

		}

		return count;
	}

	// 四.查1
	public Product getProductById(Integer pid) throws Exception{
		Product product = new Product();

		String sql = "select * from product where pid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);

			// 四.执行并返回结果集
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setCid(rs.getInt("cid"));
				product.setPingjiaSum(rs.getInt("pingjiaSum"));
				product.setProductListLargeImage(rs.getString("productListLargeImage"));
				product.setPdesc(rs.getString("pdesc"));
				product.setProductSum(rs.getInt("productsum"));
				product.setPrice(rs.getInt("price"));
				product.setDianpuName(rs.getString("dianpuname"));
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单一商品失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, pstmt, conn);

		}

		return product;
	}

	// 五.按SQL语句查
	public List<Product> getPageByQuery(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		List<Product> list = new ArrayList<Product>();

		Product product = null;
		Category2 category2 = null;

		// 三.建立通道
		try {
			stmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				product = new Product();

				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPdesc(rs.getString("pdesc"));
				product.setPrice(rs.getDouble("price"));
				product.setDianpuName(rs.getString("dianpuname"));
				product.setProductSum(rs.getInt("productsum"));
				product.setOnsale(rs.getInt("onsale"));
				product.setProductListLargeImage(rs.getString("productListLargeImage"));
				product.setPingjiaSum(rs.getInt("pingjiasum"));
				
				category2 = new Category2();
				category2.setCid(rs.getInt("cid"));
				category2.setCname(rs.getString("cname"));
				category2.setCdesc(rs.getString("cdesc"));
				category2.setFid(rs.getInt("fid"));

				product.setCategory2(category2);
				
				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询商品失败!");
		} finally {
			// 五.关闭
			ConnOracleTomcatDataSource.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	
	
	public int getTotalRecordSum(String sql) throws Exception{
		int totalRecordSum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecordSum = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询商品数量失败!");
		} finally {
		
			ConnOracleTomcatDataSource.closeConnection(rs, pstmt, conn);
		}

		return totalRecordSum;
	}


	@Override
	public int updateOnSale(String sql) throws Exception {
		int count = 0;

		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			
			count = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("更改上下架状态失败!");
		} finally {
		
			ConnOracleTomcatDataSource.closeConnection(null, stmt, conn);
		}

		return count;
	}
	
	public void updateProductImageNames(Product product) {
		String sql = "update product set productListLargeImage=?,productListSmallImage1=?,productListSmallImage2=?,productListSmallImage3=?,detailLargeImg=?,detailSmallImg1=?,detailSmallImg2=?,detailSmallImg3=?,detailSmallImg4=?,detailSmallImg5=?,shoppingCarImg=? where pid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductListLargeImage());
			pstmt.setString(2, product.getProductListSmallImage1());
			pstmt.setString(3, product.getProductListSmallImage2());
			pstmt.setString(4, product.getProductListSmallImage3());
			
			
			//设置 详细页图片字段
			pstmt.setString(5, product.getDetailLargeImg());
			pstmt.setString(6, product.getDetailSmallImg1());
			pstmt.setString(7, product.getDetailSmallImg2());
			pstmt.setString(8, product.getDetailSmallImg3());
			pstmt.setString(9, product.getDetailSmallImg4());
			pstmt.setString(10, product.getDetailSmallImg5());
			
			//设置 购物车图片字段
			pstmt.setString(11, product.getShoppingCarImg());
			
			pstmt.setInt(12, product.getPid());
			// 四.执行并返回结果集
			int count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("修改商品图片成功!");
			} else {
				System.out.println("没有修改任何商品图片!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
		} finally {
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

	}

	

}
