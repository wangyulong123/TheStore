	package com.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.dao.impl.*;
import com.vo.Book;

public class Service {
	 BooksDao booksDao=new BooksDao();
	 public String findBooksAjax(String name) throws SQLException {
		  List<Book> nameList=booksDao.findBooksAjax(name);
		  String res="";
		  for (int i=0;i<nameList.size();i++) {
		   if(i>0){
		    res+=","+nameList.get(i).getName();
		   }else{
		    res+=nameList.get(i).getName();
		   }
		  }
		  System.out.println(res+"------res");
		  return res;
	 }
	 public static void main(String[] args) throws SQLException {
		 Service s=new Service();
		 String name=" ÷";
		 s.findBooksAjax(name);
	}
}
