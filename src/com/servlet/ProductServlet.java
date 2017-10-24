package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("getAllCategorysForAddProduct".equals(action)){
			this.getAllCategorysForAddProduct(request, response);
		}else if("getCategory2ByCategory1ForAddProduct".equals(action)){	
			this.getCategory2ByCategory1ForAddProduct(request,response);
		}else if("add".equals(action)){	
			this.add(request,response);
		}else if("getAllByPage".equals(action)){	
			this.getAllByPage(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
		}else if("getPageByQuery".equals(action)){	
			this.getPageByQuery(request,response);
		}else if("shangxiajia".equals(action)){	
			this.shangxiajia(request,response);
		}else if("productUp".equals(action)){
			this.productUp(request,response);
		}else if("productDown".equals(action)){
			this.productDown(request,response);
		}else if("getOneForUpload".equals(action)){
			this.getOneForUpload(request,response);
		}else if ("uploadImage".equals(action)) {
			this.uploadImage(request, response);
		}
		
		
	}

	public void getAllCategorysForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//二.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/product/addProduct.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getCategory2ByCategory1ForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置服务器相应地数据类型 为application/json
		response.setContentType("application/json");
		//1.填充数据
		String target = "";
		String category1Id = request.getParameter("category1Id");
		//二.调用业务逻辑
		Category2Service service = new Category2ServiceImpl();
		//3.输出
		PrintWriter out = response.getWriter();
		
		try {
			List<Category2> list = service.getAllCategory2ByCategory1(Integer.parseInt(category1Id));
			
			Gson gson = new Gson();
			
			String category2ListJson = gson.toJson(list);
			
			out.println(category2ListJson);
			
			out.flush();
			out.close();
		} catch (Exception e) {
			request.setAttribute("msg", "查询二级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String productSum = request.getParameter("productSum");
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		String cid = request.getParameter("cid");
		
		Product product = new Product();
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setProductSum(Integer.parseInt(productSum));
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setCid(Integer.parseInt(cid));
		//二.调用业务逻辑
		
		ProductService service = new ProductServiceImpl();
		try {
			service.addProduct(product);
			request.setAttribute("msg", "添加商品成功");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
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
			ProductService service = new ProductServiceImpl();
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
			ProductService service2 = new ProductServiceImpl();
			
			List<Product> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/product/"+target+".jsp";
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
		String pid = request.getParameter("pid");
		
		
		try {
			//2.调用业务逻辑
			ProductService service = new ProductServiceImpl();
			
			service.deleteProductById(pid);
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
		String pid = request.getParameter("pid");
		String recordsPerPage = request.getParameter("recordsPerPage");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		//2.调用业务逻辑
		ProductService service = new ProductServiceImpl();
		
		try {
			Product product = service.getProductById(pid);

			int cid = product.getCid();
			
			Category2Service categoryService2 = new Category2ServiceImpl();

			int parentCid = categoryService2.getParentCategoryById(cid);

			// 查询出所有的一级商品种类
			CategoryService categoryService = new CategoryServiceImpl();

			List<Category> categoryList = categoryService.getAllCategorys();
			
			request.setAttribute("product", product);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("parentCid", parentCid);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("recordsPerPage", recordsPerPage);
			
			target = "/WEB-INF/jsp/admin/product/updateProduct.jsp?recordsPerPage="+recordsPerPage;
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
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String pdesc = request.getParameter("pdesc");
		String productSum = request.getParameter("productSum");
		String dianpuName = request.getParameter("dianpuName");
		String cid = request.getParameter("cid");
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		product.setPname(pname);
		product.setPdesc(pdesc);
		product.setPrice(Double.parseDouble(price));
		product.setProductSum(Integer.parseInt(productSum));
		product.setDianpuName(dianpuName);
		product.setCid(Integer.parseInt(cid));
		
		//2.调用业务逻辑
		ProductService service = new ProductServiceImpl();
		try {
			service.updateProduct(product);
			request.setAttribute("msg", "修改商品成功!");
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
		
		Product product = new Product();
		
		if(searchCondition!=null&&!searchCondition.trim().equals("")){
			
		}else{
			searchCondition = "%";
		}
		
		if(recordsPerPage == null){
			recordsPerPage = "5";
		}
		product.setPname(searchCondition);
		product.setDianpuName(searchCondition);
		Category2 cate = new Category2(); 
		cate.setCname(searchCondition);
		product.setCategory2(cate);
		
		try {
			//查询一共多少条记录
			ProductService service = new ProductServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(product);
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),Integer.parseInt(recordsPerPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			ProductService service2 = new ProductServiceImpl();

			List<Product> list = service2.getPageByQuery(product, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/product/"+target+".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void shangxiajia(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = request.getParameter("target");
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		String recordsPerPage = request.getParameter("recordsPerPage");
		
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		Product product = new Product();
		
		if(searchCondition!=null&&!searchCondition.trim().equals("")){
			
		}else{
			searchCondition = "%";
		}
		
		if(recordsPerPage == null){
			recordsPerPage = "5";
		}
		product.setPname(searchCondition);
		product.setDianpuName(searchCondition);
		Category2 cate = new Category2(); 
		cate.setCname(searchCondition);
		product.setCategory2(cate);
		
		try {
			//查询一共多少条记录
			ProductService service = new ProductServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(product);
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage),Integer.parseInt(recordsPerPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			ProductService service2 = new ProductServiceImpl();

			List<Product> list = service2.getPageByQuery(product, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/product/"+target+".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void productUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String pid = request.getParameter("pid");
		//2.调用业务逻辑
		ProductService service = new ProductServiceImpl();
		try {
			service.productUp(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品上架成功!");

			this.shangxiajia(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}
		//3.转发视图
	}
	
	public void productDown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String pid = request.getParameter("pid");
		//2.调用业务逻辑
		ProductService service = new ProductServiceImpl();
		try {
			service.productDown(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品下架成功!");

			this.shangxiajia(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void getOneForUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = request.getParameter("target");
		// 一.填充数据
		String pid = request.getParameter("pid");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		// 二.调用业务逻辑
		Product product;
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			product = service.getProductById(pid);
			request.setAttribute("product", product);
			target = "/WEB-INF/jsp/admin/product/"+target+".jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target="/WEB-INF/msg.jsp";
		}
		
		// 三.转发视图
		
		request.setAttribute("target", request.getAttribute("target"));
		request.setAttribute("requestPage", requestPage);
		request.setAttribute("searchCondition", searchCondition);

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "";

		// 一.填充数据

		// 二.调用业务逻辑
		ServletConfig servletConfig = this.getServletConfig();
		String productListUploadPath = servletConfig
				.getInitParameter("productImageUploadPath");
		ProductServiceImpl service = new ProductServiceImpl();
		try {
			service.upload(request, productListUploadPath);
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "上传图片成功!");
		} catch (Exception e) {
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "上传图片失败!");
		}

		// 三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
