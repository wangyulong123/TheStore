package com.service.impl;


import java.util.List;

import com.dao.impl.UsernameDaoImpl;
import com.dao.inter.UsernameDao;
import com.page.PageInfo;
import com.service.inter.UsernameService;
import com.util.SQLUtil;
import com.vo.Category;
import com.vo.Product;
import com.vo.User;

public class UsernameServiceImpl implements UsernameService {
	UsernameDao usernameDao=new UsernameDaoImpl();
	//登陆
	@Override
	public User getUser(String name, String password) throws Exception {
		User user=new User();
	     user=usernameDao.getUser(name, password);
		return user;
	}
	//注册
	@Override
	public int register(User user) throws Exception {
		int count=0;
		count=usernameDao.register(user);
		return count;
	}
	//查用户记录数
	@Override
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "select count(*) from user1";
		totalRecordCount = usernameDao.getTotalRecordCount(sql);
		System.out.println("我是usernameServiceimpl的"+totalRecordCount);
		return totalRecordCount;
	}
	//查所有的用户
	@Override
	public List<User> getAllUsers() throws Exception {
		List<User> list = null;

		String sql = "select * from user1";
		list = usernameDao.getPageByQuery(sql);
		return list;
	}
	//根据页数查询用户
	@Override
	public List<User> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from user1 c) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);

		List<User> list = null;

		list =usernameDao.getPageByQuery(sql);
		return list;
	}
	@Override
	public int adduser(User user) throws Exception {
		int count = usernameDao.addUser(user);
		return count;
	}
	@Override
	public int deleteUserById(String userid) throws Exception {
         System.out.println("userid"+userid);
		User user = new User();
		user.setUserid(Integer.parseInt(userid));
		int count = usernameDao.deleteUser(user);
		return count;
	}
	@Override
	public User getUserById(String userid) throws Exception {
		User user = null;

		user = usernameDao.getUserById(Integer.parseInt(userid));/*getCategoryById(Integer.parseInt(userid));*/
		return user;
	}
	@Override
	public int updateUser(User user) throws Exception {
		int count = usernameDao.updateUser(user);
		return count;
	}
	@Override
	public List<User> getPageByQuery(User user, PageInfo pageInfo)
			throws Exception {
		List<User> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from user1 c where 1=1 and username='789' 
		//OR nickname like '%null%') where r>=1 and r<=5";
		
		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from user1 c where 1=1");

		String username = user.getUsername();
		String nickname = user.getNickname();
		Integer userid = user.getUserid();
	
		
		if (username != null && !username.trim().equals("")) {
			sb.append(" and username='");
			sb.append(username);
			sb.append("'");
		}

		if (nickname != null && !nickname.trim().equals("")) {
			sb.append(" or nickname like '%");
			sb.append(nickname);
			sb.append("%'");
		}
	
		sb.append(" ) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());

		
		String sql = sb.toString();
		
		System.out.println(sql);
		list = usernameDao.getPageByQuery(sql);
		return list;
	}
	//统计用多少条数据
	@Override
	public int getTotalRecordCount(User user) throws Exception {
		int totalRecordCount = -1;
		String sql = "select count(*) from user1";
		totalRecordCount =  usernameDao.getTotalRecordCount(sql);
		return totalRecordCount;
		
	}
	//查询用户登录
	public List<User> getlockAll() throws Exception{
		List<User> list=null;
		list=usernameDao.getlockAll();
	//-----------------------------------------------------------	
		return list;
	}
	 //查询用户登录数据
	public int getsum() throws Exception{
		int sum=-1;
		sum=usernameDao.getsum();
		return sum;
		
	}
	//根据条件查询用户登录次数
	public int getTotalLockCount(User user) throws Exception{
		int sum=-1;
		//select count(*) FROM C_LOGIN_RECORD where 1=1 AND 
		//username='zzy'or c_id like '%111%'
		StringBuffer  sb=new StringBuffer("select count(*)form FROM C_LOGIN_RECORD where 1=1");
		String username=user.getUsername();
		//Integer it = new Integer(10); String str = it.toString();
		Integer it=new Integer(user.getC_id());
		
		String  id=it.toString();
		if (username != null && !username.trim().equals("")) {

			sb.append(" and username='");
			sb.append(username);
			sb.append("'");
		}

		if ( id != null && !id.trim().equals("")) {
			sb.append(" or c_id like '%");
			sb.append(id);
			sb.append("%'");
		}
		String sql = sb.toString();
		System.out.println(sql);
		sum=usernameDao.getsumByQuery(sql);
		return sum;
		
	}
	//根据用户输入查询登陆信息
	@Override
	public List<User> getPageByLockQuery(User user, PageInfo pageInfo)throws Exception {
		List<User> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from user1 c where 1=1 and username='789' 
		//OR nickname like '%null%') where r>=1 and r<=5";
		
		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from C_LOGIN_RECORD c where 1=1");

		String username = user.getUsername();
        Integer it=new Integer(user.getC_id());
		
		String  id=it.toString();

		if (username != null && !username.trim().equals("")) {
			sb.append(" and username='");
			sb.append(username);
			sb.append("'");
		}

		if (id != null && !id.trim().equals("")) {
			sb.append(" or c_id like '%");
			sb.append(id);
			sb.append("%'");
		}
	
		sb.append(" ) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());

		
		String sql = sb.toString();
		
		System.out.println(sql);
		list = usernameDao.getPageBylockQuery(sql);
		return list;
	}
	//用户锁定
	public void userlock(Integer userid) throws Exception{
		String sql = "update C_LOGIN_RECORD set lock_flag=1 where c_id=" + userid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.executeExceptDQL(sql);
		
	}
	//用户解除
	
	public void userulock(Integer userid) throws Exception{
		String sql = "update C_LOGIN_RECORD set lock_flag=0 where c_id=" + userid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		sqlUtil.executeExceptDQL(sql);
		
	}
   public static void main(String[] args) throws Exception {
	UsernameServiceImpl service =new UsernameServiceImpl();
	List<User> list= service.getlockAll();
	for(User user:list){
		System.out.println(user);
	}
}
}
