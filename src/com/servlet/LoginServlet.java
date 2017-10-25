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
                // �û�����
                if (service.checkLoginRecord(userName)) {
                    // �û��й���¼��¼
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
                        // �û�������
                        if (service.localdateLtDate2(loginDate)) {
                            // ����ʱ�䳬��һ��
                            //ɾ���û��ĵ�¼��¼
                            service.deleteLoginRecord(userName);
                            if(service.checkNameAndPsw(user)){
                                //�û���������ƥ��
                                service.insertLoginRecord(userName, "0", "0");
                                request.getSession().setAttribute("LoginFlag", "1");
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp");
                                return;
                            }else{
                                //�û������벻ƥ��
                                service.insertLoginRecord(userName, "0", "1");      
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                return;
                            }

                        } else {
                            // ����ʱ��δ��һ��
                        	System.out.println("12");
                            response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=3");
                            return;
                        }

                    } else {
                        // �û�δ������
                        if(service.checkNameAndPsw(user)){
                            //�û�������ƥ��
                            service.deleteLoginRecord(userName);
                            service.insertLoginRecord(userName, "0", "0");
                            request.getSession().setAttribute("LoginFlag", "1");
                            HttpSession session=request.getSession(true);
                        	session.setAttribute("user", user);//��user����session��
                        	String toWhere =request.getParameter("toWhere");
                           /* response.sendRedirect("http://localhost:8080//yhd/jsp/user/Yhd.jsp");*/
                            response.sendRedirect("Category2Servlet?action=getMenuForFirstPage");
                            return;                              
                        }else{
                            //�û������벻ƥ��
                            if(service.localdateLtDate(loginDate)){
                                //�����ϴε�¼ʧ�ܳ���5����
                                service.deleteLoginRecord(userName);
                                service.insertLoginRecord(userName, "0", "1");
                                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                return;
                            }else{
                                //δ����5����
                                if("2".equals(failureNum)){
                                    //�ϴε�¼ʧ��ʱ�Ѵ�������
                                    String date1=service.getFaNum2Record(userName);
                                    if(service.localdateLtDate(date1)){
                                        //���һ�ε�¼����ʱ�����5����
                                        service.deleteLoginRecord(userName);
                                        service.insertLoginRecord(userName, "0", "1");
                                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                        return;

                                    }else{
                                        //��5��������
                                        service.insertLoginRecord(userName, "1", "3");
                                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=4");
                                        return;
                                    }
                                }else{
                                    //�ϴε�¼ʧ��ʱû��������
                                    service.insertLoginRecord(userName, "0", String.valueOf((Integer.parseInt(failureNum)+1)));
                                    response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                                    return;
                                }
                            }
                        }
                    }
                } else {
                    // �û�δ�й���¼��¼
                    if(service.checkNameAndPsw(user)){
                        //�û�������ƥ��
                        service.insertLoginRecord(userName, "0", "0");
                        request.getSession().setAttribute("LoginFlag", "1");
                        response.sendRedirect("Category2Servlet?action=getMenuForFirstPage");
                        return;

                    }else{
                        //�û������벻ƥ��
                        service.insertLoginRecord(userName, "0", "1");
                        response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=2");
                        return;

                    }
                }
            } else {
                // �û�������
                response.sendRedirect("http://localhost:8080/TheStore/jsp/HomePage/Login.jsp?error=1");
                return;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
  
	}
	//�˳�
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    //�˳���¼
		String target = "";
		//һ.�������
		//��.����ҵ���߼�
		//�˳���¼ ע��se
		
		HttpSession session = request.getSession(true);
		session.invalidate();
		//��.ת����ͼ
		target = "/jsp/HomePage/Login.jsp";
		 request.getRequestDispatcher(target).forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	  this.doGet(request, response);
	}

}
