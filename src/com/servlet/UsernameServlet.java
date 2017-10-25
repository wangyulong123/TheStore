package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.impl.UsernameServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.vo.Category;
import com.vo.Product;
import com.vo.User;

public class UsernameServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      String action=request.getParameter("action");
      System.out.println(action);
      if("check".equals(action)){
    	  this.check(request,response);
      }else if("register".equals(action)){
    	  this.register(request,response);
      }else if("getAllByPage".equals(action)){
    	  this.getAllByPage(request,response);
      }else if("add".equals(action)){
			this.add(request, response);
	  }else if("getAll".equals(action)){	
			this.getAll(request,response);
	  }else if("delete".equals(action)){	
			this.delete(request,response);
	  }else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
	  }else if("update".equals(action)){	
			this.update(request,response);
	  }else if("getPageByQuery".equals(action)){	
			this.getPageByQuery(request,response);
	  }else if("logout".equals(action)){
		    this.logout(request,response);
	  }else if("getlockAll".equals(action)){
		  this.getlockAll(request, response);
	  }else if("getlockByQuery".equals(action)){
		  this.getlockByQuery(request, response);
	  }else if("userlock".equals(action)){
		  this.userlock(request,response);
	  }else if("userunclok".equals(action)){
		  this.userunclok(request, response);
	  }
		
	}
	public void check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       String target="";  
       //1.填充数据
       String username=request.getParameter("username");
       String password=request.getParameter("password");
       System.out.println(username);
       //2.调用业务逻辑
      UsernameServiceImpl service=new UsernameServiceImpl();
        User user=new User();
        try {	
		user=service.getUser(username, password);
		 if (null != user) {
		    /*  this.getMenuForFirstPage(request, response);*/
        Integer isActive=user.getIsActive();
        System.out.println(isActive);
        if(isActive==1){
        	//登陆成功
        	HttpSession session=request.getSession(true);
        	session.setAttribute("user", user);//把user存在session中
        	String toWhere=request.getParameter("toWhere");
        	System.out.println(toWhere);
         if(toWhere==null||toWhere.trim().equals("")){
				//跳到京东首页 firstPage
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
				target = "/WEB-INF/jsp/ShoppingCar/ShoppingCar.jsp";
			}else{
	        	//登陆失败 调到登陆界面 显示"用户没有激活，请激活 "
		         request.setAttribute("msg", "用户没有激活，请登录");
		         target="/jsp/user/login.jsp"; 	
		    }	
        }else{
			//登录失败 跳回登录页面 显示 "用户名或密码错误"
			request.setAttribute("msg", "用户名或密码错误,请重新输入");
			target = "/jsp/user/login.jsp";
		}
        
	  }

		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg","登录失败 请回到登录页面从新登录");
			e.printStackTrace();
		}
      //3.转发试图
        request.getRequestDispatcher(target).forward(request, response);
		
	}
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    //退出登录
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
	public void getMenuForFirstPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         
		String target="";
		//1.填存数据
	  //2.调用业务逻辑
		CategoryService service=new CategoryServiceImpl();
		try {
		List<Category> list=service.getAllCategorys();
		  request.setAttribute("list", list);
		  target="/WEB-INF/jsp/user/welcome.jsp";
		} catch (Exception e) {
			
		  request.setAttribute("msg", "输入名字错误");
		  target="/WEB-INF/msg.jsp";
			e.printStackTrace();
			
		}
	
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	//注册
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        String target="";
        //1.填充数据
        String username=request.getParameter("username");
        System.out.println(username);
        String password=request.getParameter("password");
        System.out.println(password);
        String telphone=request.getParameter("telphone");
        System.out.println(telphone);
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setTelphone(telphone);
        //2.调用业务逻辑
        UsernameServiceImpl service=new UsernameServiceImpl();
         try {
			int count =service.register(user);
			if(count>0){
				target="/jsp/user/login.jsp";
			}
		} catch (Exception e) {
           request.setAttribute("msg", e.getMessage());
           target="/jsp/register.jsp";
			e.printStackTrace();
		}
         request.getRequestDispatcher(target).forward(request, response);
	}
	 //得到所用用户
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String requestPage = request.getParameter("requestPage");
		System.out.println("123456");
		System.out.println(requestPage);
		try {
			
			//查询一共多少条记录
			UsernameServiceImpl service=new UsernameServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount();
			 System.out.println("-----------------"+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.调用业务逻辑
			UsernameServiceImpl service2 = new UsernameServiceImpl();
			
			List<User> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/user/usermain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
		
	}
	//添加
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		
		//二.调用业务逻辑
		User user = new User();
		user.getUsername();
		user.getPassword();
		
		UsernameServiceImpl service = new UsernameServiceImpl();
		try {
			service.adduser(user);
			request.setAttribute("msg", "添加用户成功");
		} catch (Exception e) {
			request.setAttribute("msg", "添加用户失败");
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}

	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
  
		
		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		UsernameServiceImpl service = new UsernameServiceImpl();
		
		try {
			List<User> list = service.getAllUsers();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/user/usermain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询用户失败!");
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
		String userid = request.getParameter("userid");
		  System.out.println("-----------"+userid); 
		
		try {
			//2.调用业务逻辑
				UsernameServiceImpl service = new UsernameServiceImpl();
				service.deleteUserById(userid);
				request.setAttribute("msg", "删除用户 成功");
			  this.getPageByQuery(request, response);
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
		String userid = request.getParameter("userid");
		System.out.println("-------userid="+userid);
		//2.调用业务逻辑
		UsernameServiceImpl service = new UsernameServiceImpl();
		
		try {
			User user = service.getUserById(userid);
			request.setAttribute("user", user);
			target = "/WEB-INF/jsp/admin/user/updateuser.jsp";
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
		String userid=request.getParameter("userid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String adress = request.getParameter("adress");
		String nickname=request.getParameter("nickname");
		String telphone=request.getParameter("telphone");
		System.out.println(username+password+adress+nickname+telphone);
		User user = new User();
		user.setUserid(Integer.parseInt(userid));
	    user.setUsername(username);
	    user.setPassword(password);
	    user.setAddress(adress);
	    user.setNickname(nickname);
	    user.setTelphone(telphone);
		//2.调用业务逻辑
		UsernameServiceImpl service = new UsernameServiceImpl();
		try {
			service.updateUser(user);
			request.setAttribute("msg", "修改用户成功");
			this.getPageByQuery(request, response);
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
		 System.out.println("------11111");
		
		String target = "";
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		User user = new User();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			user.setUsername(searchCondition);
			user.setNickname(searchCondition);
		}
		
		try {
			
			
			//按照条件查询一共多少条记录
			UsernameServiceImpl service = new UsernameServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount(user);
			System.out.println("我是servlet下的totalRecordCont"+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.调用业务逻辑
			UsernameServiceImpl service2 = new UsernameServiceImpl();

			List<User> list = service2.getPageByQuery(user, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			
			target ="/WEB-INF/jsp/admin/user/usermain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
   // 查询用户登录信息
	public void getlockAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    String target="";
      String requestPage=request.getParameter("requestPage");
      System.out.println(requestPage);
      //查询一共有多少条记录
      
  	UsernameServiceImpl service=new UsernameServiceImpl();
  	int totalRecordCount=-1;
  	try {
		 totalRecordCount =service.getsum();
	} catch (Exception e1) {
		
		e1.printStackTrace();
	}
  	PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
	pageInfo.setTotalRecordCount(totalRecordCount);
  	
  	
    List<User> list=null;
     //调用业务逻辑
     UsernameServiceImpl service2 =new UsernameServiceImpl();
     try {
		list=service2.getlockAll();
		 request.setAttribute("list", list);
		 request.setAttribute("pageInfo", pageInfo);
		 target="/WEB-INF/jsp/admin/user/lockuser.jsp";
		 
	} catch (Exception e) {
		request.setAttribute("msg", e.getMessage());
		e.printStackTrace();
		target="/WEB-INF/msg.jsp";
	}
     
	//3.转发试图
     request.getRequestDispatcher(target).forward(request, response);
	}
	//按要求查询登录记录
	public void getlockByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     
		String target = "";
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		 System.out.println(searchCondition);
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		User user = new User();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
			user.setUsername(searchCondition);

		}
		
		try {
			
			
			//按照条件查询一共多少条记录
			UsernameServiceImpl service = new UsernameServiceImpl();
			
			int totalRecordCount = service.getTotalLockCount(user);
			System.out.println("我是servlet下的totalRecordCont"+totalRecordCount);
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.调用业务逻辑
			UsernameServiceImpl service2 = new UsernameServiceImpl();

			List<User> list = service2.getPageByLockQuery(user, pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			
			target ="/WEB-INF/jsp/admin/user/lockuser.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
		
	}
	//锁定用户
	public void userlock(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     
		// 一.填充数据
		String id = request.getParameter("userid");
      System.out.println(id);
		// 二.调用业务逻辑
        UsernameServiceImpl service=new UsernameServiceImpl();

		try {
			service.userlock(Integer.parseInt(id));

			request.setAttribute("msgTitle", "编号为" + id +"的用户解除失败!");
			request.setAttribute("msgContent", "");

			this.getlockByQuery(request, response);
		} catch (Exception e) {	
			e.printStackTrace();
		}
		
	}
	//用户解除
	public void userunclok(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 一.填充数据
		String id = request.getParameter("userid");

		// 二.调用业务逻辑

		UsernameServiceImpl service=new UsernameServiceImpl();

		try {
			service.userulock(Integer.parseInt(id));
			request.setAttribute("msgTitle", "编号为" + id +"用户解除成功!");
			request.setAttribute("msgContent", "");
			this.getlockByQuery(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      this.doGet(request, response);
	}

}