package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.impl.UserParaService;
import com.vo.User;

public class LoginServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       String action=request.getParameter("action");
       System.out.println("wshi"+action);
      if("getClock".equals(action)){
    	  this.getClock(request,response);
      }else if("logout".equals(action)){
		    this.logout(request,response);
	  }
	
	}
	public void getClock(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     String target="";
     String userName=request.getParameter("username");
     String passWord=request.getParameter("password");
    User user=new User(userName,passWord);
    UserParaService service=new UserParaService();
     try {
            if (service.checkUser(userName)) {
                // 用户存在
                if (service.checkLoginRecord(userName)) {
                    // 用户有过登录记录
                    ResultSet rs = service.getLatestLoginRecord(userName);
                    String lockFlag = "";
                    String failureNum = "";
                    String loginDate = "";
                    if (rs != null && rs.next()) {
                        lockFlag = rs.getString("LOCK_FLAG");
                        failureNum = rs.getString("FAILURE_NUM");
                        loginDate = rs.getString("LOGIN_DATE").replace("T", " ");
                        System.out.println("loginDate="+loginDate);
                    }
                    if ("1".equals(lockFlag)) {
                        // 用户被锁定
                        if (service.localdateLtDate2(loginDate)) {
                            // 锁定时间超过一天
                            //删除用户的登录记录
                            service.deleteLoginRecord(userName);
                            if(service.checkNameAndPsw(user)){
                                //用户名和密码匹配
                                service.insertLoginRecord(userName, "0", "0");
                                request.getSession().setAttribute("LoginFlag", "1");
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp");
                                return;
                            }else{
                                //用户名密码不匹配
                                service.insertLoginRecord(userName, "0", "1");      
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                return;
                            }

                        } else {
                            // 锁定时间未满一天
                        	System.out.println("12");
                            response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=3");
                            return;
                        }

                    } else {
                        // 用户未被锁定
                        if(service.checkNameAndPsw(user)){
                            //用户名密码匹配
                            service.deleteLoginRecord(userName);
                            service.insertLoginRecord(userName, "0", "0");
                            request.getSession().setAttribute("LoginFlag", "1");
                            HttpSession session=request.getSession(true);
                        	session.setAttribute("user", user);//把user存在session中
                        	String toWhere =request.getParameter("toWhere");
                           /* response.sendRedirect("http://localhost:8080//yhd/jsp/user/Yhd.jsp");*/
                            response.sendRedirect("Category2Servlet?action=getMenuForFirstPage");
                            return;                              
                        }else{
                            //用户名密码不匹配
                            if(service.localdateLtDate(loginDate)){
                                //距离上次登录失败超过5分钟
                                service.deleteLoginRecord(userName);
                                service.insertLoginRecord(userName, "0", "1");
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                return;
                            }else{
                                //未超过5分钟
                                if("2".equals(failureNum)){
                                    //上次登录失败时已错误两次
                                    String date1=service.getFaNum2Record(userName);
                                    if(service.localdateLtDate(date1)){
                                        //距第一次登录错误时间大于5分钟
                                        service.deleteLoginRecord(userName);
                                        service.insertLoginRecord(userName, "0", "1");
                                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                        return;

                                    }else{
                                        //在5分钟以内
                                        service.insertLoginRecord(userName, "1", "3");
                                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=4");
                                        return;
                                    }
                                }else{
                                    //上次登录失败时没超过两次
                                    service.insertLoginRecord(userName, "0", String.valueOf((Integer.parseInt(failureNum)+1)));
                                    response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                    return;
                                }
                            }
                        }
                    }
                } else {
                    // 用户未有过登录记录
                    if(service.checkNameAndPsw(user)){
                        //用户名密码匹配
                        service.insertLoginRecord(userName, "0", "0");
                        request.getSession().setAttribute("LoginFlag", "1");
                        response.sendRedirect("Category2Servlet?action=getMenuForFirstPage");
                        return;

                    }else{
                        //用户名密码不匹配
                        service.insertLoginRecord(userName, "0", "1");
                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                        return;

                    }
                }
            } else {
                // 用户不存在
                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=1");
                return;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
  
	}
	//退出
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    //退出登录
		String target = "";
		//一.填充数据
		//二.调用业务逻辑
		//退出登录 注销se
		
		HttpSession session = request.getSession(true);
		session.invalidate();
		//三.转发视图
		target = "/jsp/HomePage/Login.jsp";
		 request.getRequestDispatcher(target).forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	  this.doGet(request, response);
	}

}
