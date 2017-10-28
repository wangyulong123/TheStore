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
		
		System.out.println("��������"+count);
		//��.����ҵ���߼�
		ProductService service = new ProductServiceImpl();
		try {
			Product product = service.getProductById(pid);
			product.setShoppingSum(Integer.parseInt(count));
			
			ShoppingCartServiceImpl shoppingCartService = new ShoppingCartServiceImpl();

			// true ����к͵�ǰ�û�(���������)�������session ������� session
			// ���û�� ��Ϊ����û�(���������)����һ����Ӧ��session

			// false ����к͵�ǰ�û�(���������)�������session ������� session
			// û���������session ����null
			HttpSession session = request.getSession(true);// ����Ҫʹ��true
			shoppingCartService.addToCart(session, product);
			
			// ��.ת����ͼ
			target = "/WEB-INF/jsp/user/jiarushoppingcar.jsp";
			request.setAttribute("product", product);
			
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		//3.ת����ͼ
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
			//��.����ҵ���߼�
			ProductService service = new ProductServiceImpl();
			Product product = service.getProductById(pid);
			ShoppingCartService service2 = new ShoppingCartServiceImpl();
			service2.delete(session, product);
			// ��.ת����ͼ
			this.queryShoppingCart(request, response);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			//3.ת����ͼ
			request.getRequestDispatcher(target).forward(request, response);
		}
		
		
	}
	
	public void queryShoppingCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//���÷�������Ӧ���������� Ϊapplication/json
		//response.setContentType("application/json");
		String target = "";
		// һ.�������
		// ��.����ҵ���߼�
		HttpSession session = request.getSession(true);

		List<Product> list = (List<Product>) session.getAttribute("shoppingCart");
		
		if(list==null||list.size()==0){
			session.setAttribute("list", list);
			target = "/WEB-INF/jsp/user/shoppingCartNoProduct.jsp";
		}else{	
			session.setAttribute("list", list);
			target = "/WEB-INF/jsp/user/shoppingCar.jsp";
		}
		
		// ��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
