package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.Service;

public class Servlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  response.setContentType("text/html;charset=utf-8");
			  request.setCharacterEncoding("utf-8");
			  //��ȡ���������������
			  String name=request.getParameter("name");
			  System.out.println(name);
//			  name=new String(name.getBytes("iso-8859-1"), "utf-8");
			  //��server�������Ӧ��ҵ��
			  Service booksServer=new Service();
			  String res;
			try {
				res = booksServer.findBooksAjax(name);
			
				 //���ؽ��
				  response.getWriter().write(res);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			 
			 }
	
			 public void doPost(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			 
			  doGet(request, response);
			 }
    }