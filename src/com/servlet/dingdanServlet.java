package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.CategoryServiceImpl;
import com.service.inter.CategoryService;
import com.vo.Category;

public class dingdanServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if("guanlishouhuodizhi".equals(action)){
			this.guanlishouhuodizhi(request, response);
		}
//		else if("getAll".equals(action)){	
//			this.getAll(request,response);
//		}
	}

	public void guanlishouhuodizhi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
		
		//��.����ҵ���߼�
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//��.ת����ͼ
		target = "/WEB-INF/jsp/user/querendingdan.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
