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
import com.vo.Address;
import com.vo.Order1;
//订单
public class DingdanServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if("guanlishouhuodizhi".equals(action)){
			this.guanlishouhuodizhi(request, response);
		}else if("querendingdan".equals(action)){	
			this.querendingdan(request,response);
		}else if("submitSuccess".equals(action)){
			this.submitSuccess(request,response);
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
System.out.println("DingdanServlet.querendingdan()");
		String target = "";
		Order1 order = new Order1();
		Address addrs = new Address();
		
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
		String address = request.getParameter("xiangxidizhi");
		String sheng = request.getParameter("select1");
		String shi = request.getParameter("select2");
		String qu = request.getParameter("select3");
		
		order.setUserid(Integer.parseInt(userid));
		order.setOrderdesc(orderdesc);
		order.setOrderprice(Double.parseDouble(price));
		order.setOrdertime(ordertime);
		order.setShouhuorenname(shouhuoren);
		order.setTel(Long.parseLong(tel));
		order.setOrderstatus(0);
		order.setAddress(sheng+shi+qu+"~"+address);
		
		addrs.setSheng(sheng);
		addrs.setShi(shi);
		addrs.setQu(qu);
		
		//二.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		try {
			service.addOrder(order);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("order", order);
		request.setAttribute("addrs", addrs);
		//三.转发视图
		target = "/WEB-INF/jsp/user/querendingdan2.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void submitSuccess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		
		//二.调用业务逻辑
		
		//三.转发视图
		target = "/WEB-INF/jsp/user/submitSuccess.jsp";
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
		long i = Long.parseLong("13000000000");
		System.out.println(i);
	}
	
}
