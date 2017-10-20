package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.ProductServiceImpl;
import com.service.impl.ShoppingCartServiceImpl;
import com.vo.Product;

public class ShoppingCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");
		if ("addToCart".equals(action)) {
			this.addToCart(request, response);
		} else if ("queryShoppingCart".equals(action)) {
			this.queryShoppingCart(request, response);
		}

	}

	public void addToCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// һ.�������
		String pid = request.getParameter("pid");
		System.out.println("pid=" + pid);

		try {
			ProductServiceImpl productService = new ProductServiceImpl();
			Product product = productService.getProductById(pid);
			
			ShoppingCartServiceImpl shoppingCartService = new ShoppingCartServiceImpl();

			// true ����к͵�ǰ�û�(���������)�������session ������� session
			// ���û�� ��Ϊ����û�(���������)����һ����Ӧ��session

			// false ����к͵�ǰ�û�(���������)�������session ������� session
			// û���������session ����null
			HttpSession session = request.getSession(true);// ����Ҫʹ��true
			shoppingCartService.addToCart(session, product);

			// ��.ת����ͼ
			target = "/WEB-INF/jsp/user/addToShoppingCart.jsp";
			request.setAttribute("product", product);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		// ��.����ҵ���߼�

		request.getRequestDispatcher(target).forward(request, response);
	}

	public void queryShoppingCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// һ.�������
		// ��.����ҵ���߼�
		HttpSession session = request.getSession(true);

		List<Product> list = (List<Product>) session
				.getAttribute("shoppingCart");
		
		if(list==null||list.size()==0){
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "���ﳵ����ʱû����Ʒ����¼����ʾ��֮ǰ�������Ʒ ");
		}else{
			request.setAttribute("list", list);
			target = "/WEB-INF/jsp/user/shoppingCart.jsp";
		}
		// ��.ת����ͼ
		
		request.getRequestDispatcher(target).forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
