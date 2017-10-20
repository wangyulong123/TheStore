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
		//一.填充数据
		
		//二.调用业务逻辑
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/jsp/user/querendingdan.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
