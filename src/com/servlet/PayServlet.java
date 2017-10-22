package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.CategoryServiceImpl;
import com.service.inter.CategoryService;
import com.vo.Category;

public class PayServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 分发请求
		String action = request.getParameter("action");

		if ("submitPay".equals(action)) {
			this.submitPay(request, response);
		}
	}

	public void submitPay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		
		target = "/WEB-INF/jsp/user/payPage.jsp";
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
