package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.vo.Category;
import com.vo.Category2;

public class Category2Servlet extends HttpServlet {

	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//分发请求
		String action = request.getParameter("action");
		
		if("add".equals(action)){
			this.add(request, response);
		}else if("getCategory1ForAddCategory2".equals(action)){	
			this.getCategory1ForAddCategory2(request,response);
		}else if("getAllByPage".equals(action)){	
			this.getAllByPage(request,response);
		}else if("getPage2ByQuery".equals(action)){	
			this.getPage2ByQuery(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
		}else if("getMenuForFirstPage".equals(action)){	
			this.getMenuForFirstPage(request,response);
		}
		
		
	}
	
	public void getCategory1ForAddCategory2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		
		try {
			//2.调用业务逻辑
			CategoryService service = new CategoryServiceImpl();
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category2/addCategory2.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		String fid = request.getParameter("fid");
		//二.调用业务逻辑
		Category2 category = new Category2();
		category.setCname(cname);
		category.setCdesc(cdesc);
		category.setFid(Integer.parseInt(fid));
		
		Category2Service service = new Category2ServiceImpl();
		try {
			service.addCategory2(category);
			request.setAttribute("msg", "添加二级商品种类成功");
		} catch (Exception e) {
			request.setAttribute("msg",e.getMessage());
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		String requestPage = request.getParameter("requestPage");
		
		//2.调用业务逻辑
		Category2Service service = new Category2ServiceImpl();
		
		try {
			List<Category2> list = service.getAllCategorys2();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category2/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询二级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String requestPage = request.getParameter("requestPage");
		String recordsPerPage = request.getParameter("recordsPerPage");
//		String recordsPerPage2 = (String)request.getAttribute("recordsPerPage"); 
		try {
			//查询一共多少条记录
			Category2Service service = new Category2ServiceImpl();
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
			Category2Service service2 = new Category2ServiceImpl();
			
			List<Category2> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category2/category2Main.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void getPage2ByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String target = "";
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		Category2 category = new Category2();
		
		if(searchCondition!=null&&!searchCondition.trim().equals("")){
			
		}else{
			searchCondition = "%";
		}
		category.setCname(searchCondition);
		category.setCdesc(searchCondition);
		Category cate = new Category();
		cate.setCname(searchCondition);
		category.setCategory(cate);
		
		try {
			//查询一共多少条记录
			Category2Service service = new Category2ServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(category);
			String recordsPerPage = request.getParameter("recordsPerPage");
			
			if(recordsPerPage == null){
				recordsPerPage = "5";
			}
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),Integer.parseInt(recordsPerPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			Category2Service service2 = new Category2ServiceImpl();

			List<Category2> list = service2.getPageByQuery(category, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category2/category2Main.jsp";
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
		String cid = request.getParameter("cid");
		
		
		try {
			//2.调用业务逻辑
			Category2Service service = new Category2ServiceImpl();
			
			service.deleteCategory2ById(cid);
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
		String cid = request.getParameter("cid");
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		//2.调用业务逻辑
		Category2Service service = new Category2ServiceImpl();
		
		try {
			Category2 category = service.getCategory2ById(cid);
			request.setAttribute("category", category);
			target = "/WEB-INF/jsp/admin/category2/updateCategory2.jsp?recordsPerPage="+recordsPerPage;
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
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		Category2 category = new Category2();
		category.setCid(Integer.parseInt(cid));
		category.setCname(cname);
		category.setCdesc(cdesc);
		//2.调用业务逻辑
		Category2Service service = new Category2ServiceImpl();
		try {
			service.updateCategory(category);
			request.setAttribute("msg", "修改二级商品种类成功!");
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
	
	public void getMenuForFirstPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		System.out.println("456465");
		try {
			//2.调用业务逻辑
			Category2Service service = new Category2ServiceImpl();
			List<Category> list = service.getAllCategorysName();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/HomePage/Yhd.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
