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

	// ���Connection����
	private Connection conn;

	public ProductDaoImpl() {
		conn = ConnOracleTomcatDataSource.getConnection();
	}

	
	@Override
	public int addProduct(Product product) throws Exception{
		//�ող������Ʒ����"�¼�"״̬ ����onsale ��ֵΪ0    1 ��ʾ�ϼ�   0 ��ʾ�¼�
		String sql = "insert into product(pid,pname,price,pingjiasum,productSum,dianpuName,pdesc,onsale,cid) values(seq_product.nextval,?,?,0,?,?,?,0,?)";
		PreparedStatement pstmt = null;
		// ��.����ͨ��
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setDouble(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setInt(6, product.getCid());
			// ��.ִ�в����ؽ����
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("�����Ʒʧ��");
		} finally {
			// ��.�ر�
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);

		}
		
		return count;

	}

	@Override
	public int deleteProduct(Product product) throws Exception{
		String sql = "delete from product where pid=?";
		PreparedStatement pstmt = null;
		// ��.����ͨ��
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPid());

			// ��.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("ɾ����Ʒʧ��!");
		} finally {
			// ��.�ر�
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	// ��.�޸�
	public int updateProduct(Product product) throws Exception {
		String sql = "update product set pname=?,price=?,productSum=?,dianpuName=?,pdesc=?,cid=? where pid=?";
		PreparedStatement pstmt = null;
		// ��.����ͨ��
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
			
			
			// ��.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			
		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("�޸���Ʒʧ��!");
		} finally {
			// ��.�ر�
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);

		}

		return count;
	}

	// ��.��1
	public Product getProductById(Integer pid) throws Exception{
		Product product = new Product();

		String sql = "select * from product where pid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// ��.����ͨ��
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);

			// ��.ִ�в����ؽ����
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
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ��һ��Ʒʧ��!");
		} finally {
			// ��.�ر�
			ConnOracleTomcatDataSource.closeConnection(rs, pstmt, conn);

		}

		return product;
	}

	// ��.��SQL����
	public List<Product> getPageByQuery(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		List<Product> list = new ArrayList<Product>();

		Product product = null;
		Category2 category2 = null;

		// ��.����ͨ��
		try {
			stmt = conn.createStatement();
			// ��.ִ�в����ؽ����
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
			System.out.println("����ͨ��ʧ��!");
			e.printStackTrace();
			throw new Exception("��ѯ��Ʒʧ��!");
		} finally {
			// ��.�ر�
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
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ��Ʒ����ʧ��!");
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
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("�������¼�״̬ʧ��!");
		} finally {
		
			ConnOracleTomcatDataSource.closeConnection(null, stmt, conn);
		}

		return count;
	}
	
	public void updateProductImageNames(Product product) {
		String sql = "update product set productListLargeImage=?,productListSmallImage1=?,productListSmallImage2=?,productListSmallImage3=?,detailLargeImg=?,detailSmallImg1=?,detailSmallImg2=?,detailSmallImg3=?,detailSmallImg4=?,detailSmallImg5=?,shoppingCarImg=? where pid=?";
		PreparedStatement pstmt = null;
		// ��.����ͨ��
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductListLargeImage());
			pstmt.setString(2, product.getProductListSmallImage1());
			pstmt.setString(3, product.getProductListSmallImage2());
			pstmt.setString(4, product.getProductListSmallImage3());
			
			
			//���� ��ϸҳͼƬ�ֶ�
			pstmt.setString(5, product.getDetailLargeImg());
			pstmt.setString(6, product.getDetailSmallImg1());
			pstmt.setString(7, product.getDetailSmallImg2());
			pstmt.setString(8, product.getDetailSmallImg3());
			pstmt.setString(9, product.getDetailSmallImg4());
			pstmt.setString(10, product.getDetailSmallImg5());
			
			//���� ���ﳵͼƬ�ֶ�
			pstmt.setString(11, product.getShoppingCarImg());
			
			pstmt.setInt(12, product.getPid());
			// ��.ִ�в����ؽ����
			int count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			if (count >= 1) {
				System.out.println("�޸���ƷͼƬ�ɹ�!");
			} else {
				System.out.println("û���޸��κ���ƷͼƬ!");
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
		} finally {
			ConnOracleTomcatDataSource.closeConnection(null, pstmt, conn);
		}

	}

	

}
