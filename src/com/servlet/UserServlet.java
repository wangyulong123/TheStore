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
import com.service.impl.JavaMailServiceImpl;
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
		}else if("mail".equals(action)){
			this.mail(request,response);
		}
		
		
		
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//一.填充数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//二.调用业务逻辑 
		try {
			UserServiceImpl service = new UserServiceImpl();
			User user = service.login(username, password);
			
			if(user!=null){//根据用户名和密码找到了该用户
				
				Integer isActive = user.getIsActive();
				if(isActive==1){//登录成功 
				
					HttpSession session = request.getSession(true);
					session.setAttribute("user", user);//把user对象存到session中 以后每个页面中都可以取出来使用
					
					String toWhere = request.getParameter("toWhere");
					System.out.println(toWhere.equals(""));
					if(toWhere==null||toWhere.trim().equals("")){
						//跳到首页 firstPage
						//查询商品种类 用来显示首页的菜单
						CategoryService categoryService = new CategoryServiceImpl();
						List<Category> list = categoryService.getAllCategorys();
						request.setAttribute("list", list);
						target = "/WEB-INF/jsp/user/welcome.jsp";
					}else if("jiesuan".equals(toWhere)){
						//跳到 结算页
						//查询购物车里的东西 在结算页  再显示一遍  为了确认
						List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
						//三.转发视图
						request.setAttribute("list", list);
						target = "/WEB-INF/jsp/user/jiesuan.jsp";
					}
					
				}else{
					//登录失败 跳回登录页面 显示 "用户尚未激活,请激活后再尝试登录"
					request.setAttribute("msg", "用户尚未激活,请激活后再尝试登录");
					target = "/jsp/user/login.jsp";
				}
			}else{
				//登录失败 跳回登录页面 显示 "用户名或密码错误"
				request.setAttribute("msg", "用户名或密码错误,请重新输入");
				target = "/jsp/user/login.jsp";
			}
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","登录失败 请回到登录页面从新登录");
			e.printStackTrace();
		}
		
		//三.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		//二.调用业务逻辑
		//退出登录 注销session即可
		HttpSession session = request.getSession(true);
		session.invalidate();
		//三.转发视图
		target = "/jsp/user/login.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void mail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MailServlet连接成功");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String target = "";
		
		//一.填充数据
		String from = request.getParameter("from");
		System.out.println(from);
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		//二.调用业务逻辑
		JavaMailServiceImpl service = new JavaMailServiceImpl();
		
		boolean isSuccessFlag = service.sendTextMail(from, to, subject, content);
		
		if(isSuccessFlag){
			request.setAttribute("msg", "发送成功,请前往邮箱激活!");
		}else{
			request.setAttribute("msg", "发送失败，请重新前往注册页面");
		}
		target = "/WEB-INF/msg.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void active(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.addUser(request, response);
		String target = "";
		//1.填充数据
		String username = request.getParameter("username");
	   
		try {
			//2.调用业务逻辑
			UserService service = new UserServiceImpl();
			boolean flag = service.activeUser(username);
			if(flag){
				request.setAttribute("msg", "用户激活成功!!!<a href='LoginServlet?action=gotologin'>点这里去登录</a>");
			}else{
				request.setAttribute("msg", "请前往邮箱激活！");
			}
		} catch (Exception e) {
			request.setAttribute("msg", "用户激活失败!");
			e.printStackTrace();
		}
		//3.转发视图
		target = "/WEB-INF/msg.jsp";
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("用户存入 数据库连接成功 ");
		String target = "";
		//一.填充数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String telphone = request.getParameter("telphone");
		String nickname = request.getParameter("nickname");
		
		System.out.println(username);
		System.out.println(password);
		System.out.println(telphone);
		System.out.println(nickname);
		//二.调用业务逻辑
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
			request.setAttribute("msg", "申请账户成功,请后退一页，填写邮箱，激活您的账户");
			System.out.println("添加 用户成功");
		} catch (Exception e) {
		 	request.setAttribute("msg", "申请账户失败");
			e.printStackTrace();
			System.out.println("添加用户失败");
		}
		//三.转发视图
//		this.active(request, response);
//	target = "/WEB-INF/msg.jsp";
//	request.getRequestDispatcher(target).forward(request, response);
	}
	public void checkUnameUnique(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("checkUnameUnique----------");
		//设置服务器相应的数据类型  application/json
		response.setContentType("application/json");
		//1.填充数据
		String target="";

			try {
				//2.调用业务逻辑
				UserService service = new UserServiceImpl();
				
				List<User> usersList = service.getAllUsers();
				System.out.println(usersList);
				//输出
				PrintWriter out = response.getWriter();
				
				Gson gson = new Gson();
				String userList = gson.toJson(usersList);
				out.println(userList);
				out.flush();
				out.close();
			} catch (Exception e) {
				System.out.println("获取所有用户失败");
				target="/WEB-INF/msg.jsp";
				request.getRequestDispatcher(target).forward(request, response);
			}
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	

}
