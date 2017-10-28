package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.OrderServiceImpl;
import com.service.inter.OrderService;
import com.vo.Order1;
import com.service.impl.ProductServiceImpl;
import com.service.inter.ProductService;
import com.vo.Product;
import com.vo.User;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if("checkOrder".equals(action)){
			this.checkOrder(request,response);
		} 
	}
	
	public void checkOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in checkOrder");
		String target = "";
		//一.填充数据
		String pid = request.getParameter("pid");
		String count = request.getParameter("count");
		Product product;
		
		//判断是否登录
		HttpSession session = request.getSession(true);
		
		User user = (User)session.getAttribute("user");
		
		if(user!=null){
			//跳到 结算页
			//查询购物车里的东西 在结算页  再显示一遍  为了确认
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			//三.转发视图
			if(pid!=null){
				//二.调用业务逻辑
				ProductService service = new ProductServiceImpl();
				try {
					product = service.getProductById(pid);
					product.setShoppingSum(Integer.parseInt(count));
					if(list.size()==0){
						list.add(product);
					}
				} catch (Exception e) {
					target = "/WEB-INF/msg.jsp";
					request.setAttribute("msg", e.getMessage());
					e.printStackTrace();
				}
			}
		
			session.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/querendingdan.jsp";
		}else{
			//跳到登陆页面
			target = "/jsp/HomePage/Login.jsp";
			request.setAttribute("toWhere", "querendingdan");
		}
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
