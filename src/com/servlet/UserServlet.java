package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.CategoryServiceImpl;
import com.service.impl.UserServiceImpl;
import com.service.inter.CategoryService;
import com.vo.Category;
import com.vo.Product;
import com.vo.User;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		if("login".equals(action)){
			this.login(request,response);
		}else if("logout".equals(action)){
			this.logout(request,response);
		}
		
		
		
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//һ.�������
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//��.����ҵ���߼� 
		try {
			UserServiceImpl service = new UserServiceImpl();
			User user = service.login(username, password);
			
			if(user!=null){//�����û����������ҵ��˸��û�
				
				Integer isActive = user.getIsActive();
				if(isActive==1){//��¼�ɹ� 
				
					HttpSession session = request.getSession(true);
					session.setAttribute("user", user);//��user����浽session�� �Ժ�ÿ��ҳ���ж�����ȡ����ʹ��
					
					String toWhere = request.getParameter("toWhere");
					System.out.println(toWhere.equals(""));
					if(toWhere==null||toWhere.trim().equals("")){
						//����������ҳ firstPage
						//��ѯ��Ʒ���� ������ʾ��ҳ�Ĳ˵�
						CategoryService categoryService = new CategoryServiceImpl();
						List<Category> list = categoryService.getAllCategorys();
						request.setAttribute("list", list);
						target = "/WEB-INF/jsp/user/welcome.jsp";
					}else if("jiesuan".equals(toWhere)){
						//���� ����ҳ
						//��ѯ���ﳵ��Ķ��� �ڽ���ҳ  ����ʾһ��  Ϊ��ȷ��
						List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
						//��.ת����ͼ
						request.setAttribute("list", list);
						target = "/WEB-INF/jsp/user/jiesuan.jsp";
					}
					
					
					
					
				}else{
					//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û���δ����,�뼤����ٳ��Ե�¼"
					request.setAttribute("msg", "�û���δ����,�뼤����ٳ��Ե�¼");
					target = "/jsp/user/login.jsp";
				}
			}else{
				//��¼ʧ�� ���ص�¼ҳ�� ��ʾ "�û������������"
				request.setAttribute("msg", "�û������������,����������");
				target = "/jsp/user/login.jsp";
			}
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","��¼ʧ�� ��ص���¼ҳ����µ�¼");
			e.printStackTrace();
		}
		
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//һ.�������
		//��.����ҵ���߼�
		//�˳���¼ ע��session����
		HttpSession session = request.getSession(true);
		session.invalidate();
		//��.ת����ͼ
		target = "/jsp/user/login.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
