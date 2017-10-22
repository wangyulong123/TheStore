package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.impl.UserProductServiceImpl;
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
		if ("getProductListByCategory".equals(action)) {
			this.getProductListByCategory(request, response);
		} else if ("getOnePhone".equals(action)) {
			this.getOnePhone(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
	public void getProductListByCategory(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in UsreProductServlet getProductListByCategory!!!");
		String target = "";
		// 一.填充数据
		String cid = request.getParameter("cid");// 62 查手机
		System.out.println(cid);

		String requestPage = request.getParameter("requestPage");
		System.out.println(requestPage);
		
		
		String orderCondition = request.getParameter("orderCondition");
		String ascOrDesc = request.getParameter("ascOrDesc");
		
		OrderCondition orderConditionObj = new OrderCondition();
		
		if(orderCondition!=null&&!orderCondition.trim().equals("")){
			orderConditionObj.setOrderCondition(orderCondition);
			orderConditionObj.setAscOrDesc(ascOrDesc);
		}
		
		
		
		// 二.调用业务逻辑
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage), 8);// 每页显示8条记录

		List<Product> list;
		try {
			// 查询指定商品种类下 总共有多少条商品记录
			UserProductServiceImpl service1 = new UserProductServiceImpl();

			int totalRecordSum = service1.getTotalRecordSumByCategory(cid);
			pageInfo.setTotalRecordCount(totalRecordSum);
			// 根据商品种类 查询 商品
			UserProductServiceImpl service = new UserProductServiceImpl();
			list = service.getAllByPageByCategory(pageInfo, cid,orderConditionObj);
			// 三.转发视图
			request.setAttribute("list", list);
			request.setAttribute("cid", cid);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("orderConditionObj", orderConditionObj);
			target = "/WEB-INF/jsp/user/phones.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
/*	public void turnPhones(HttpServletRequest request,
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
			System.out.println(list);
			target = "/WEB-INF/jsp/user/phones.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "查询单一手机商品失败");
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}
*/
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
