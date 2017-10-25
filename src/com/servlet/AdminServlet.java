package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.AdminServiceImpl;
import com.service.inter.AdminService;
import com.vo.Admin;

public class AdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("adminLogin")){
			this.adminLogin(request,response);
		}
	}
	
	public void adminLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.接收数据
		String target="";
		
		String adminName = request.getParameter("adminname");
		String adminpwd = request.getParameter("adminpwd");
		//2.调用业务逻辑
		AdminService service = new AdminServiceImpl();
		//3.转发视图
		try {
			Admin admin = service.login(adminName, adminpwd);
		
			if(admin!=null){
				target ="/WEB-INF/jsp/admin/admin.jsp";
				
			}else{
				target = "/WEB-INF/msg.jsp";
				request.setAttribute("msg", "管理员名或密码不正确！");
			}	
			
		} catch (Exception e) {
			target ="/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
