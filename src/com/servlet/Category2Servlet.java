package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.vo.Category;
import com.vo.Category2;

public class Category2Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// �ַ�����
		String action = request.getParameter("action");

		if ("getAllCategoryForAddCategory2".equals(action)) {
			this.getAllCategoryForAddCategory2(request, response);
		}else if("add".equals(action)){	
			this.add(request,response);
		}else if("getMenuForFirstPage".equals(action)){	
			this.getMenuForFirstPage(request,response);
		}
		

	}
	
	public void getAllCategoryForAddCategory2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//1.�������
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category2/addCategory2.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getMenuForFirstPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//1.�������
		//2.����ҵ���߼�
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/HomePage/Yhd.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "��ѯһ����Ʒ����ʧ��!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		String fid	= request.getParameter("fid");
		
		//��.����ҵ���߼�
		Category2 category = new Category2();
		category.setCname(cname);
		category.setCdesc(cdesc);
		category.setFid(Integer.parseInt(fid));
		
		Category2Service service = new Category2ServiceImpl();
		try {
			service.addCategory2(category);
			request.setAttribute("msg", "��Ӷ�����Ʒ����ɹ�");
		} catch (Exception e) {
			request.setAttribute("msg", "��Ӷ�����Ʒ����ʧ��");
			e.printStackTrace();
		}
		//��.ת����ͼ
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
