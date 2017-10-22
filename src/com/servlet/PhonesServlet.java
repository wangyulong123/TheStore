package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Product;

public class PhonesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		String action = request.getParameter("action");
		if ("turnPhones".equals(action)) {
			this.turnPhones(request, response);
		} else if ("getOnePhone".equals(action)) {
			this.getOnePhone(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	public void turnPhones(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "";
		// 1.填充数据
		String cid = request.getParameter("cid");
		// System.out.println(cid);
		// 2.调用业务逻辑
		ProductService service = new ProductServiceImpl();

		try {
			List<Product> list = service.getAllProductByCategory2(Integer
					.parseInt(cid));
			request.setAttribute("list",list);
/*			System.out.println(list);
*/			target = "/WEB-INF/jsp/user/phones.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "查询单一手机商品失败");
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void getOnePhone(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.填充数据
		String pid = request.getParameter("pid");
		String target = "";
		ProductService service = new ProductServiceImpl();
		try {
			Product product = new Product();
			product = service.getProductById(pid);
			request.setAttribute("product", product);
			target = "/WEB-INF/jsp/user/singlePhone.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "查询单一手机商品失败");
			e.printStackTrace();
		}
		// 3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
}
