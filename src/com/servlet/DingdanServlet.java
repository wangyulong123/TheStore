package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.OrderServiceImpl;
import com.service.inter.OrderService;
import com.vo.Order1;

public class DingdanServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if("guanlishouhuodizhi".equals(action)){
			this.guanlishouhuodizhi(request, response);
		}else if("querendingdan".equals(action)){	
			this.querendingdan(request,response);
		}
	}

	public void guanlishouhuodizhi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		
		//二.调用业务逻辑
		
		//三.转发视图
		target = "/WEB-INF/jsp/user/querendingdan.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void querendingdan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		Order1 order = new Order1();
		//一.填充数据
		HttpSession session = request.getSession(true);
		String userid = request.getParameter("userid");
		String shouhuoren = request.getParameter("uname");
		String xiangxidizhi = request.getParameter("xiangxidizhi");
		String tel = request.getParameter("phone");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss"); 
		String ordertime = sdf.format(date);
		String price = "0.1";
		String orderdesc = "满100减99";
		
		order.setUserid(Integer.parseInt(userid));
		order.setOrderdesc(orderdesc);
		order.setOrderprice(Double.parseDouble(price));
		order.setOrdertime(ordertime);
		order.setShouhuorenname(shouhuoren);
		order.setTel(Integer.parseInt(tel));
		order.setOrderstatus(0);
		
		//二.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		try {
			service.addOrder(order);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//三.转发视图
		target = "/WEB-INF/jsp/user/querendingdan2.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss"); 
		String d = sdf.format(date);
		System.out.println(d);
	}
	
}
