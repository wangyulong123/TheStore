package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.OrderServiceImpl;
import com.service.inter.OrderService;
import com.vo.Order1;
import com.vo.Product;
import com.vo.User;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if("checkOrder".equals(action)){
			this.checkOrder(request,response);
		} 
	}
	
	public void checkOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in checkOrder");
		String target = "";
		//һ.�������
		//��.����ҵ���߼�
		//�ж��Ƿ��¼
		HttpSession session = request.getSession(true);
		
		User user = (User)session.getAttribute("user");
		if(user!=null){
			//���� ����ҳ
			
			//��ѯ���ﳵ��Ķ��� �ڽ���ҳ  ����ʾһ��  Ϊ��ȷ��
			List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
			//��.ת����ͼ
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/user/jiesuan.jsp";
		}else{
			//������½ҳ��
			target = "/jsp/user/login.jsp";
			request.setAttribute("toWhere", "jiesuan");
		}
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
