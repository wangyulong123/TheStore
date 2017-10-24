package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.util.ConnOracle;
import com.util.ConnOracleTomcatDataSource;
import com.vo.Book;

public class BooksDao {
	//根据部分书名，查询类似的书名
	Connection conn=null;
	 public BooksDao(){
		 conn=ConnOracle.getConnection();
	 }
	 
 public List<Book> findBooksAjax(String name) throws SQLException {
	/* QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
	  try {
	   return qr.query("select name from book where name like ?", new ColumnListHandler(),"%"+name+"%");
	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
	  return null;*/
		/* Book book=new Book();*/
	  List<Book> list=new ArrayList<Book>();
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 /*select cname from category2 where cname LIKE '%手%'*/
		 String sql ="select cname from category2 where cname like "+"'%"+name+"%'";
		 System.out.println(sql);
		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book=new Book();
				book.setName(rs.getString("cname"));
				list.add(book);
			}
			  return list;
	 }
 
	   /*public List<Object> findBooksAjax(String name) {
	        QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
	        try {
	            return qr.query("select name from book where name like ?", new ColumnListHandler(),"%"+name+"%");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }*/
 public static void main(String[] args) throws SQLException {
	 BooksDao book =new BooksDao();
	 String name="人";
	 book.findBooksAjax(name);
	 
	 
}
}
 
