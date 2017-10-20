package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import com.util.ProductDictionary;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// �ַ�����
		String action = request.getParameter("action");

		if ("getAllCategoryForAddProduct".equals(action)) {
			this.getAllCategoryForAddProduct(request, response);
		}else if("getCategory2ByCategory1ForAddProduct".equals(action)){
			this.getCategory2ByCategory1ForAddProduct(request,response);
		}else if("add".equals(action)){
			this.add(request,response);
		}else if ("getAllByPage".equals(action)) {
			this.getAllByPage(request, response);
		}else if ("delete".equals(action)) {
			this.delete(request, response);
		}else if ("getPageByQuery".equals(action)) {
			this.getPageByQuery(request, response);
		}else if ("getOneForUpdate".equals(action)) {
			this.getOneForUpdate(request, response);
		}else if ("update".equals(action)) {
			this.update(request, response);
		}else if ("productUp".equals(action)) {
			this.productUp(request, response);
		}else if ("productDown".equals(action)) {
			this.productDown(request, response);
		}else if ("getOneForUpload".equals(action)) {
			this.getOneForUpload(request, response);
		}else if ("uploadImage".equals(action)) {
			this.uploadImage(request, response);
		}
		
		

	}
	
	public void getAllCategoryForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/product/addProduct.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getCategory2ByCategory1ForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//���÷�������Ӧ����������  Ϊapplication/json 
		response.setContentType("application/json");
		String target = "";
		
		//1.�������
		String category1Id = request.getParameter("category1Id");
		
		//2.����ҵ���߼�
		
		Category2Service service = new Category2ServiceImpl();
		
		//3.���
		PrintWriter out = response.getWriter();
		
		try {
			List<Category2> list = service.getAllCategory2ByCategory1(Integer.parseInt(category1Id));
			
			Gson gson = new Gson();
			
			String category2ListJson = gson.toJson(list);
			
			out.println(category2ListJson);
			
			out.flush();
			
			out.close();
		
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯ������Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.ת����ͼ
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
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
		//��.����ҵ���߼�
		
		ProductService service = new ProductServiceImpl();
		try {
			service.addProduct(product);
			request.setAttribute("msg", "�����Ʒ�ɹ�");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		//��.ת����ͼ
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}

	public void getAllByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String target = request.getParameter("target");
		
		// һ.�������
		String requestPage = request.getParameter("requestPage");
		System.out.println(requestPage);
		// ��.����ҵ���߼�
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

		// ��ѯ�ܹ��ж�������¼
		ProductServiceImpl service1 = new ProductServiceImpl();

		int totalRecordSum;
		try {
			totalRecordSum = service1.getTotalRecordSum();
			
			pageInfo.setTotalRecordCount(totalRecordSum);

			ProductServiceImpl service2 = new ProductServiceImpl();

			List<Product> list = service2.getAllByPage(pageInfo);
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		// ��.ת����ͼ
	
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// һ.�������
		String pid = request.getParameter("pid");
		System.out.println("********look here**********");
		// ��.����ҵ���߼�
		System.out.println(pid);
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.deleteProductById(pid);
			request.setAttribute("msg", "ɾ���ɹ���");
			this.getPageByQuery(request, response);	
		} catch (Exception e) {
			request.setAttribute("msg", "ɾ��ʧ�ܣ�");
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		
		

	}
	
	public void getPageByQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		String target = request.getParameter("target");
		// һ.�������
		String requestPage = request.getParameter("requestPage");

		System.out.println("requestPage=" + requestPage);
		if (requestPage == null) {
			requestPage = "1";
		}

		try {
			String searchCondition = request.getParameter("searchCondition");
			System.out.println("searchCondition=" + searchCondition);
			// ��.����ҵ���߼�
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

			//����ѯ������ѯ �����ѯ����ܹ��ж�������¼
			ProductServiceImpl service1 = new ProductServiceImpl();

			Product product = new Product();
			
			//����ǰ���Ʒ�������Ʋ�ѯ ��Ҫ�Ѵ���������Ʒ��������ת����cid
			Category2Service service = new Category2ServiceImpl();
			
			Category2 category = service.getCategoryByName(searchCondition);
			if (searchCondition != null && !searchCondition.trim().equals("")) {
				product.setPname(searchCondition);
				
				//��������¼�ҳ�������  �Ͱ� ���¼�״̬��ѯ   �����ǰ��������Ʋ�ѯ
				//����ҳ��(�����ϴ�ͼƬ�͹�����Ʒ���������ǰ� �������Ʋ�ѯ��)
				if("productMainUpDown".equals(target)){
					System.out.println("************look here***************");
					System.out.println(searchCondition);
					Integer onsale = ProductDictionary.onsaleStrToInt(searchCondition);
					product.setOnsale(onsale);
				}else{
					product.setDianpuName(searchCondition);
				}
				
				if(category!=null){
					product.setCid(category.getCid());
				}
				
			}

			int totalRecordSum = service1
					.getTotalRecordSumBySearchCondition(product);
			pageInfo.setTotalRecordCount(totalRecordSum);

			ProductServiceImpl service2 = new ProductServiceImpl();
			List<Product> list = service2.getPageByQuery(product, pageInfo);

			// ��.ת����ͼ
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", searchCondition);
		}catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getOneForUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		
		// һ.�������
		String pid = request.getParameter("pid");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		// ��.����ҵ���߼�
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			Product product = service.getProductById(pid);

			int cid = product.getCid();

			Category2Service categoryService2 = new Category2ServiceImpl();

			int parentCid = categoryService2.getParentCategoryById(cid);

			// ��ѯ�����е�һ����Ʒ����
			CategoryService categoryService = new CategoryServiceImpl();

			List<Category> categoryList = categoryService.getAllCategorys();
			// ��.ת����ͼ
			target = "/WEB-INF/jsp/admin/product/updateProduct.jsp";
			request.setAttribute("product", product);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("parentCid", parentCid);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
		} catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		// һ.�������(��������)
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String productSum = request.getParameter("productSum");
		String dianpuName = request.getParameter("dianpuName");
		String pdesc = request.getParameter("pdesc");
		String cid = request.getParameter("cid");

		// ��.����ҵ���߼�
		Product product = new Product();
		product.setPid(Integer.parseInt(pid));
		product.setPname(pname);
		product.setPrice(Double.parseDouble(price));
		product.setProductSum(Integer.parseInt(productSum));
		product.setDianpuName(dianpuName);
		product.setPdesc(pdesc);
		product.setCid(Integer.parseInt(cid));

		ProductService service = new ProductServiceImpl();
		try {
			service.updateProduct(product);
			request.setAttribute("msg", "�޸ĳɹ���");
			// ��.ת����ͼ
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	public void productUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// һ.�������
		String pid = request.getParameter("pid");

		// ��.����ҵ���߼�
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.productUp(Integer.parseInt(pid));
			request.setAttribute("msg", "���Ϊ" + pid +"����Ʒ�ϼܳɹ�!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		

	}
	
	public void productDown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// һ.�������
		String pid = request.getParameter("pid");

		// ��.����ҵ���߼�
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.productDown(Integer.parseInt(pid));
			request.setAttribute("msg", "���Ϊ" + pid +"����Ʒ�¼ܳɹ�!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		

	}
	
	public void getOneForUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// һ.�������
		String pid = request.getParameter("pid");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		// ��.����ҵ���߼�
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			Product product = service.getProductById(pid);

			// ��.ת����ͼ
			target = "/WEB-INF/jsp/admin/product/uploadProductImage.jsp";
			request.setAttribute("product", product);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
		} catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "��ѯ��һ��Ʒ��Ϣʧ��");
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "/WEB-INF/msg.jsp";

		// һ.�������

		// ��.����ҵ���߼�
		ServletConfig servletConfig = this.getServletConfig();
		String productListUploadPath = servletConfig
				.getInitParameter("productImageUploadPath");
		
		if(productListUploadPath==null||productListUploadPath.trim().equals("")){
			request.setAttribute("msg", "ϵͳδָ���ϴ�·��");
			
		}else{
			ProductServiceImpl service = new ProductServiceImpl();
			try {
				service.upload(request, productListUploadPath);
				
				request.setAttribute("msg", "�ϴ�ͼƬ�ɹ�!");
			} catch (Exception e) {
				
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
			}
		}

		

		// ��.ת����ͼ
		
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
