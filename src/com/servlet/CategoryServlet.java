package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

public class CategoryServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//�ַ�����
		String action = request.getParameter("action");
		
		if("add".equals(action)){
			this.add(request, response);
		}else if("getAll".equals(action)){	
			this.getAll(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
		}else if("getAllByPage".equals(action)){	
			this.getAllByPage(request,response);
		}else if("getPageByQuery".equals(action)){	
			this.getPageByQuery(request,response);
		}
		
		
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		
		//��.����ҵ���߼�
		Category category = new Category();
		category.setCname(cname);
		category.setCdesc(cdesc);
		
		CategoryService service = new CategoryServiceImpl();
		try {
			service.addCategory(category);
			request.setAttribute("msg", "���һ����Ʒ����ɹ�");
		} catch (Exception e) {
			request.setAttribute("msg", "���һ����Ʒ����ʧ��");
			e.printStackTrace();
		}
		
		//��.ת����ͼ
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);
		
	}
	
	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
System.out.println("test!!!");
		
		String target = "";
		//1.�������
		String requestPage = request.getParameter("requestPage");
		
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		String cid = request.getParameter("cid");
		
		
		try {
			//2.����ҵ���߼�
			Category2Service service = new Category2ServiceImpl();
			int count = service.getCategory2SumByCategory1(Integer.parseInt(cid));
			
			if(count > 0){
				request.setAttribute("msg", "ɾ��ʧ�ܣ�");
				request.setAttribute("msgDetail", "���ҵ��Ӽ�¼������ɾ�������࣬�ټ���ɾ����");
			}else{
				CategoryService service2 = new CategoryServiceImpl();
				service2.deleteCategoryById(cid);
				request.setAttribute("msg", "ɾ���ɹ�!");
			}
			
			
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			//3.ת����ͼ
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		String cid = request.getParameter("cid");
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		try {
			Category category = service.getCategoryById(cid);
			request.setAttribute("category", category);
			target = "/WEB-INF/jsp/admin/category/updateCategory.jsp";
		} catch (Exception e) {
			
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target= "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.�������
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		Category category = new Category();
		category.setCid(Integer.parseInt(cid));
		category.setCname(cname);
		category.setCdesc(cdesc);
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		try {
			service.updateCategory(category);
			request.setAttribute("msg", "�޸�һ����Ʒ����ɹ�!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.ת����ͼ
			request.getRequestDispatcher(target).forward(request,response);
		}
		
	}
	
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		String requestPage = request.getParameter("requestPage");
		try {
			
			//��ѯһ����������¼
			CategoryService service = new CategoryServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount();
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.����ҵ���߼�
			CategoryService service2 = new CategoryServiceImpl();
			
			List<Category> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String target = "";
		//1.�������
		String searchCondition = request.getParameter("searchCondition");
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		Category category = new Category();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			
		}else{
			searchCondition = "%";
		}
			category.setCname(searchCondition);
			category.setCdesc(searchCondition);
		
		try {
			
			
			//��ѯһ����������¼
			CategoryService service = new CategoryServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(category);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.����ҵ���߼�
			CategoryService service2 = new CategoryServiceImpl();

			List<Category> list = service2.getPageByQuery(category, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}


