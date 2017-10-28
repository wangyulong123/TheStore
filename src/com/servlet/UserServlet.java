package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.portable.ApplicationException;

import com.google.gson.Gson;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.UserServiceImpl;
import com.service.inter.CategoryService;
import com.service.inter.UserService;
import com.vo.Category;
import com.vo.Product;
import com.vo.User;

public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if("login".equals(action)){
			this.login(request,response);
		}else if("logout".equals(action)){
			this.logout(request,response);
		}else if("active".equals(action)){
			this.active(request,response);
		}else if("addUser".equals(action)){
			this.addUser(request, response);
		}else if ("checkUnameUnique".equals(action)) {
			this.checkUnameUnique(request,response);
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
						//������ҳ firstPage
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
	
	
	
	public void active(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.�������
		String username = request.getParameter("username");
	   
		try {
			//2.����ҵ���߼�
			UserService service = new UserServiceImpl();
			boolean flag = service.activeUser(username);
			if(flag){
				request.setAttribute("msg", "�û�����ɹ�!!!<a href='LoginServlet?action=gotologin'>�������ȥ��¼</a>");
			}else{
				request.setAttribute("msg", "�û�����ʧ��!");
			}
		} catch (Exception e) {
			request.setAttribute("msg", "�û�����ʧ��!");
			e.printStackTrace();
		}
		//3.ת����ͼ
		target = "/WEB-INF/msg.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         System.out.println("�û����� ���ݿ����ӳɹ� ");
		String target = "";
		//һ.�������
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String telphone = request.getParameter("telphone");
		String nickname = request.getParameter("nickname");
		
		System.out.println(username);
		System.out.println(password);
		System.out.println(telphone);
		System.out.println(nickname);
		//��.����ҵ���߼�
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setIsActive(0);
		user.setNickname("");
		user.setAddress("");
	    user.setTelphone(telphone);
		UserService service = new UserServiceImpl();
		try {
			service.addUser(user);
			request.setAttribute("msg", "�����˻��ɹ�,�����һҳ����д���䣬���������˻�");
			System.out.println("��� �û��ɹ�");
		} catch (Exception e) {
		 	request.setAttribute("msg", "�����˻�ʧ��");
			e.printStackTrace();
			System.out.println("����û�ʧ��");
		}
		//��.ת����ͼ
	target = "/WEB-INF/msg.jsp";
	request.getRequestDispatcher(target).forward(request, response);
	}
	public void checkUnameUnique(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("checkUnameUnique----------");
		//���÷�������Ӧ����������  application/json
		response.setContentType("application/json");
		//1.�������
		String target="";

			try {
				//2.����ҵ���߼�
				UserService service = new UserServiceImpl();
				
				List<User> usersList = service.getAllUsers();
				System.out.println(usersList);
				//���
				PrintWriter out = response.getWriter();
				
				Gson gson = new Gson();
				String userList = gson.toJson(usersList);
				out.println(userList);
				out.flush();
				out.close();
			} catch (Exception e) {
				System.out.println("��ȡ�����û�ʧ��");
				target="/WEB-INF/msg.jsp";
				request.getRequestDispatcher(target).forward(request, response);
			}
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	

}
