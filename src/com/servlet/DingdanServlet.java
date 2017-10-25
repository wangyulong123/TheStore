package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.OrderService;
import com.service.inter.ProductService;
import com.vo.Address;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Order1;
import com.vo.Product;
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

		}else if("examineOrder".equals(action)){
			this.examineOrder(request,response);
		}else if("getAllByPage".equals(action)){	
			this.getAllByPage(request,response);
		}else if("getPageByQuery".equals(action)){	
			this.getPageByQuery(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
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
		
		/*//一.填充数据
		String pid = request.getParameter("pid");
		String count = request.getParameter("count");
		//二.调用业务逻辑
		ProductService service1 = new ProductServiceImpl();
		Product product;
		try {
			product = service1.getProductById(pid);
			product.setShoppingSum(Integer.parseInt(count));
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}*/
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

	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = request.getParameter("target");
		//1.填充数据
		String requestPage = request.getParameter("requestPage");
		String recordsPerPage = request.getParameter("recordsPerPage");
		try {
			//查询一共多少条记录
			OrderService service = new OrderServiceImpl();
			int totalRecordCount = service.getTotalRecordCount();
			if(recordsPerPage == null){
				recordsPerPage = "5";
			}
			
			if(requestPage == null){
				requestPage = "1";
			}
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),Integer.parseInt(recordsPerPage));
			
			pageInfo.setTotalRecordCount(totalRecordCount);
			pageInfo.setPerPageRecordCount(Integer.parseInt(recordsPerPage));
			
			
			//2.调用业务逻辑
			OrderService service2 = new OrderServiceImpl();
			
			List<Order1> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/dingdan/"+target+".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String target = request.getParameter("target");
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		Order1 order = new Order1();
		
		if(searchCondition!=null&&!searchCondition.trim().equals("")){
			
		}else{
			searchCondition = "%";
		}
		
		if(recordsPerPage == null){
			recordsPerPage = "5";
		}
		
		order.setShouhuorenname(searchCondition);
		order.setAddress(searchCondition);
		order.setOrderdesc(searchCondition);
		
		try {
			//查询一共多少条记录
			OrderService service = new OrderServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(order);
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),Integer.parseInt(recordsPerPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			OrderService service2 = new OrderServiceImpl();

			List<Order1> list = service2.getPageByQuery(order, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/dingdan/"+target+".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}

	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String orderid = request.getParameter("orderid");
		
		
		try {
			//2.调用业务逻辑
			OrderService service = new OrderServiceImpl();
			
			service.deleteOrderById(orderid);
			request.setAttribute("msg", "删除成功!");
			this.getAllByPage(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String orderid = request.getParameter("orderid");
		String recordsPerPage = request.getParameter("recordsPerPage");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		//2.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		
		try {
			Order1 order = service.getOrderById(orderid);

			request.setAttribute("order", order);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("recordsPerPage", recordsPerPage);
			
			target = "/WEB-INF/jsp/admin/dingdan/updateOrder.jsp?recordsPerPage="+recordsPerPage;
		} catch (Exception e) {
			
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target= "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		String orderid = request.getParameter("orderid");
		String shouhuorenname =request.getParameter("shouhuorenname");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String orderprice = request.getParameter("orderprice");
		String orderdesc = request.getParameter("orderdesc");
		String orderstatus = request.getParameter("orderstatus");
		
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		Order1 order = new Order1();
		order.setOrderid(Integer.parseInt(orderid));
		order.setShouhuorenname(shouhuorenname);
		order.setTel(Long.parseLong(tel));
		order.setAddress(address);
		order.setOrderdesc(orderdesc);
		order.setOrderprice(Double.parseDouble(orderprice));
		order.setOrderstatus(Integer.parseInt(orderstatus));
		
		//2.调用业务逻辑
		OrderService service = new OrderServiceImpl();
		try {
			service.updateOrder(order);
			request.setAttribute("msg", "修改订单成功!");
			request.setAttribute("recordsPerPage",recordsPerPage);
			this.getAllByPage(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.转发视图
			request.getRequestDispatcher(target).forward(request,response);
		}
		
	}
	
	public void examineOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		
		//二.调用业务逻辑
		
		//三.转发视图
		target = "/WEB-INF/jsp/user/NewYiHaoDian.jsp";
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
