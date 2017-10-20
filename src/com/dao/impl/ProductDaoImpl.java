package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.inter.ProductDao;
import com.util.ConnOracle;
import com.vo.Product;

public class ProductDaoImpl implements ProductDao {

	// ���Connection����
	private Connection conn;

	public ProductDaoImpl() {
		conn = ConnOracle.getConnection();
	}

	@Override
	public int addProduct(Product product) throws Exception {
		// �ող������Ʒ����"�¼�"״̬ ����onsale ��ֵΪ0 1 ��ʾ�ϼ� 0 ��ʾ�¼�
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
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;

	}

	@Override
	public int deleteProduct(Product product) throws Exception {
		String sql = "delete from product where pid=?";
		PreparedStatement pstmt = null;
		// ��.����ͨ��
		int count;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPid());

			// ��.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			if (count >= 1) {
				System.out.println("ɾ����Ʒ�ɹ�!");
			} else {
				System.out.println("û��ɾ���κ���Ʒ!");
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("ɾ����Ʒʧ��");
		} finally {
			// ��.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;

	}

	public int updateProduct(Product product) throws Exception{
		String sql = "update product set pname=?,price=?,productSum=?,dianpuName=?,pdesc=?,cid=? where pid=?";
		PreparedStatement pstmt = null;
		//��.����ͨ��
		int count;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getPname());
			pstmt.setDouble(2, product.getPrice());
			pstmt.setInt(3, product.getProductSum());
			pstmt.setString(4, product.getDianpuName());
			pstmt.setString(5, product.getPdesc());
			pstmt.setInt(6, product.getCid());
			pstmt.setInt(7, product.getPid());

			//��.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ִ��dml �� ddl���� ������Ӱ�������
			if (count >= 1) {
				System.out.println("�޸���Ʒ�ɹ�!");
			} else {
				System.out.println("û���޸��κ���Ʒ!");
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("�޸���Ʒʧ��");
		} finally {
			//��.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);

		}
		
		return count;

	}

	public Product getProductById(Integer pid) throws Exception {
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
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getInt(3));
				
				product.setPingjiaSum(rs.getInt(4));
				product.setDianpuName(rs.getString(5));
				product.setProductListLargeImage(rs.getString(6));
				
				product.setProductListSmallImage1(rs.getString(7));
				product.setProductListSmallImage2(rs.getString(8));
				product.setProductListSmallImage3(rs.getString(9));
				
				product.setPdesc(rs.getString(10));
				product.setProductSum(rs.getInt(11));
				
				product.setDetailLargeImg(rs.getString(12));
				product.setDetailSmallImg1(rs.getString(13));
				product.setDetailSmallImg2(rs.getString(14));
				product.setDetailSmallImg3(rs.getString(15));
				product.setDetailSmallImg4(rs.getString(16));
				product.setDetailSmallImg5(rs.getString(17));
				
				product.setShoppingCarImg(rs.getString(18));
				
				product.setOnsale(rs.getInt(19));
				product.setCid(rs.getInt(20));
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ��һ��Ʒʧ��");
		} finally {
			// ��.�ر�
			ConnOracle.closeConnection(rs, pstmt, conn);
		}
		return product;
	}

	// ��.��SQL����
	public List<Product> getPageByQuery(String sql) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;

		List<Product> list = new ArrayList<Product>();

		Product product = null;

		// ��.����ͨ��
		try {
			stmt = conn.createStatement();
			// ��.ִ�в����ؽ����
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				product = new Product();

				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setPingjiaSum(rs.getInt("pingjiasum"));
				product.setDianpuName(rs.getString("dianpuName"));
				product.setProductListLargeImage(rs.getString("productListLargeImage"));
				product.setProductListSmallImage1(rs.getString("productListSmallImage1"));
				product.setProductListSmallImage2(rs.getString("productListSmallImage2"));
				product.setProductListSmallImage3(rs.getString("productListSmallImage3"));
				product.setPdesc(rs.getString("pdesc"));
				product.setProductSum(rs.getInt("productSum"));
				product.setDetailLargeImg(rs.getString("detailLargeImg"));
				product.setDetailSmallImg1(rs.getString("detailSmallImg1"));
				product.setDetailSmallImg2(rs.getString("detailSmallImg2"));
				product.setDetailSmallImg3(rs.getString("detailSmallImg3"));
				product.setDetailSmallImg4(rs.getString("detailSmallImg4"));
				product.setDetailSmallImg5(rs.getString("detailSmallImg5"));
				product.setShoppingCarImg(rs.getString("shoppingCarImg"));
				product.setOnsale(rs.getInt("onsale"));
				product.setCid(rs.getInt("cid"));

				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��!");
			e.printStackTrace();
			throw new Exception("��ѯ��Ʒʧ��");
		} finally {
			// ��.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	public int getTotalRecordSum(String sql) throws Exception {
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

			ConnOracle.closeConnection(rs, pstmt, conn);
		}

		return totalRecordSum;
	}
	
	public void updateProductImageNames(Product product) throws Exception{
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
			
		} catch (SQLException e) {
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("�޸���ƷͼƬʧ��");
		} finally {
			// ��.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

	}

	public static void main(String[] args) throws Exception {
		Product p = new Product();
		p.setPname("iphone6s");
		p.setPrice(5288);
		p.setProductSum(10);
		p.setDianpuName("����Apple��ƷרӪ��");
		p.setPdesc("ƻ�������ֻ�");
		p.setCid(62);
		ProductDaoImpl dao = new ProductDaoImpl();
		dao.addProduct(p);
	}

}
