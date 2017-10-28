package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.service.impl.ProductServiceImpl;
import com.service.impl.ShoppingCartServiceImpl;
import com.service.inter.ProductService;
import com.service.inter.ShoppingCartService;
import com.vo.Product;

public class ShoppingCarServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("getProduct".equals(action)){
			this.getProductToAdd(request, response);
		}else if ("queryShoppingCart".equals(action)) {
			this.queryShoppingCart(request, response);
		}else if("delete".equals(action)){
			this.delete(request,response);
		}
	}

	public void getProductToAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		String pid = request.getParameter("pid");
		
		String count = request.getParameter("count");
		
		System.out.println("购买数量"+count);
		//二.调用业务逻辑
		ProductService service = new ProductServiceImpl();
		try {
			Product product = service.getProductById(pid);
			product.setShoppingSum(Integer.parseInt(count));
			
			ShoppingCartServiceImpl shoppingCartService = new ShoppingCartServiceImpl();

			// true 如果有和当前用户(浏览器窗口)相关联的session 返回这个 session
			// 如果没有 就为这个用户(浏览器窗口)创建一个对应的session

			// false 如果有和当前用户(浏览器窗口)相关联的session 返回这个 session
			// 没有相关联的session 返回null
			HttpSession session = request.getSession(true);// 必须要使用true
			shoppingCartService.addToCart(session, product);
			
			// 三.转发视图
			target = "/WEB-INF/jsp/user/jiarushoppingcar.jsp";
			request.setAttribute("product", product);
			
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		String pid = request.getParameter("pid");
		System.out.println(pid);
		
		HttpSession session = request.getSession(true);
		List<Product> list = (List<Product>) session.getAttribute("shoppingCart");
			
		try{
			//二.调用业务逻辑
			ProductService service = new ProductServiceImpl();
			Product product = service.getProductById(pid);
			ShoppingCartService service2 = new ShoppingCartServiceImpl();
			service2.delete(session, product);
			// 三.转发视图
			this.queryShoppingCart(request, response);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
		
	}
	
	public void queryShoppingCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//设置服务器相应地数据类型 为application/json
		//response.setContentType("application/json");
		String target = "";
		// 一.填充数据
		// 二.调用业务逻辑
		HttpSession session = request.getSession(true);

		List<Product> list = (List<Product>) session.getAttribute("shoppingCart");
		
		if(list==null||list.size()==0){
			session.setAttribute("list", list);
			target = "/WEB-INF/jsp/user/shoppingCartNoProduct.jsp";
		}else{	
			session.setAttribute("list", list);
			target = "/WEB-INF/jsp/user/shoppingCar.jsp";
		}
		
		// 三.转发视图
		request.getRequestDispatcher(target).forward(request, response);

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
