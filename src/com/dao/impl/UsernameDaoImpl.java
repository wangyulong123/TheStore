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
	//�û���¼
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
	 //�û�ע��
	
	public int register(User user) throws Exception{
		int count = 0;
		// 3.����ͨ��
		//INSERT INTO user1(userid,username,Password,Telphone) VALUES(seq_user1.nextval,'jhpe','1234564','176106538334')
		String sql = "insert into user1(userid,username,Password,isactive,Telphone) values(seq_user1.nextval,?,?,0,?)";
		
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getTelphone());
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();										
		} catch (SQLException e) {
	
			System.out.println("����ͨ���������Ʒ����ʧ��");
			e.printStackTrace();
			
			throw new Exception("������Ʒ�������ʧ��");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//�û����
	@Override
	public int addUser(User user) throws Exception {
		int count = 0;
		// 3.����ͨ��
		String sql = "insert into user1 values(seq_category.nextval,?,?,?,?,?)";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;

		// Ĭ�������ǹرյ� ����addCategory����һ����¼��ʱ�� ���Զ��ύ
		// ��������

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setInt(3, user.getIsActive());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6,user.getTelphone());
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

			if (count >= 1) {
				System.out.println("����û��ɹ�!");
			} else {
				System.out.println("û������κ��û�����!");
			}
		} catch (SQLException e) {
			
			System.out.println("����ͨ��������û�ʧ��");
			e.printStackTrace();
			
			throw new Exception("�û����ʧ��");//�쳣ת��
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//�û�ɾ��
	@Override
	public int deleteUser(User user) throws Exception {
		int count = 0;
		// 3.����ͨ��
		System.out.println(user.getUserid());
		String sql = "delete from user1 where userId= ?";
		
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// 4.ִ�в����ؽ����
			 System.out.println(sql);
			pstmt.setInt(1, user.getUserid());
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

			if (count >= 1) {
				System.out.println("ɾ���û��ɹ�!");
			} else {
				System.out.println("û��ɾ���κ��û�!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ����ɾ���û�ʧ��");
			e.printStackTrace();
			throw new Exception("ɾ���û�ʧ��!");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	@Override
	public int updateUser(User user) throws Exception {
		int count = 0;
		// 3.����ͨ��
		//username+password+adress+nickname+telphone
		String sql = "update user1 set username=?,password=? ,address=?,nickname=?,telphone=? where userid=?";
		// �����һ��Ԥ�����ͨ�� �൱��IOͨ�� ��������������sql���
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getAddress());
			pstmt.setString(4,user.getNickname());
			pstmt.setString(5, user.getTelphone());
			pstmt.setInt(6, user.getUserid());
			
			// 4.ִ�в����ؽ����
			count = pstmt.executeUpdate();// ����ִ�г���DQL�������е���� DML ���ص�����Ӱ�������
											// DCL��DDL��� ����ֵ��0

			if (count >= 1) {
				System.out.println("�޸��û��ɹ�!");
			} else {
				System.out.println("û���޸��κ��û�!");
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����޸��û�ʧ��");
			e.printStackTrace();
			throw new Exception("�޸��û�ʧ��!");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	//����id���û�
	@Override
	public User getUserById(int id) throws Exception {
		User user = new User();

		// 3.����ͨ��
		String sql = "select * from user1 where userid=?";
        System.out.println(sql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, id);
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�û�ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ�û�ʧ��");
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(rs, pstmt, conn);
		}

		return user;
	}
	//����sql�����û�
	@Override
	public List<User> getPageByQuery(String sql) throws Exception {
		List<User> list = new ArrayList<User>();
		User user = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ�û�ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}
	//����sql�����û�����
	@Override
	public int getTotalRecordCount(String sql) throws Exception {
        int totalRecordCount = -1;
		 System.out.println(sql);
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				
				totalRecordCount = rs.getInt(1);
			
			}
		} catch (SQLException e) {
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ�ܹ��ж�������¼ʧ��!");
			
		} finally {
			// 5.�ر�
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return totalRecordCount;
	}
	//��ѯ��¼���е���Ϣ
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
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception("��ѯ�û���½��¼ʧ��");
		}
		
		return list;
	}
	//��ѯ��½��Ϣһ���ж�����
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
			System.out.println("����ͨ��ʧ��");
			e.printStackTrace();
			throw new Exception();
		}
		
		
		return sum;
		
	}
	//��ѯ��½��Ϣһ���ж�����
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
				System.out.println("����ͨ��ʧ��");
				e.printStackTrace();
				throw new Exception();
			}
			
		System.out.println("----------����Ҫ���sum"+sum);
			return sum;
			
		}
  //����sql��ѯ��¼��Ϣ
//����sql�����û�
	@Override
	public List<User> getPageBylockQuery(String sql) throws Exception {
		List<User> list = new ArrayList<User>();
		User user = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.����ͨ��
		try {
			stmt = conn.createStatement();
			// 4.ִ�в����ؽ����
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
			System.out.println("����ͨ�����ѯ�����ʧ��");
			e.printStackTrace();
			
			throw new Exception("��ѯ�û�ʧ��!");
			
		} finally {
			// 5.�ر�
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



