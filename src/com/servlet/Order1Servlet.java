package com.servlet;

import com.vo.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.PageInfo;
import com.service.impl.Order1ServiceImpl;
import com.service.inter.Order1Service;
import com.vo.Order1;

public class Order1Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String action = request.getParameter("action");
		System.out.println(action);
		
		if("getshouhuorenname".equals(action)){
			this.getshouhuorenname(request,response);
		}else if("getRecordCountFenYe".equals(action)){
			this.getRecordCountFenYe(request, response);
		}
		
		

	}
	public void getshouhuorenname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//濉厖鏁版嵁	
		String target =request.getParameter("target");
		System.out.println(target);
		String shouhuorenname = request.getParameter("shouhuorenname");
		System.out.println(shouhuorenname);
		//璋冪敤閫昏緫
		Order1ServiceImpl service = new Order1ServiceImpl();
		
		try {
			List<Order1> list = service.getPageByQuery(shouhuorenname);

		//杞彂瑙嗗浘
		target = "/WEB-INF/jsp/user/"+target+".jsp";
		System.out.println(target);	
		request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	//鏌ヨ鍏ㄩ儴璁㈠崟椤靛垎鏁版嵁鐨勮缁嗕俊鎭�
	public void getRecordCountFenYe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//濉厖鏁版嵁
		Order1Service os = new Order1ServiceImpl();
		Order1 order = new Order1();
		
		String target = request.getParameter("target");
		System.out.println(target+"!!!!!!");
		String name = request.getParameter("shouhuorenname");
		
		order.setShouhuorenname(name);
		
		String requestPage = request.getParameter("requestPage");
		System.out.println("+++++++++++"+requestPage);
		
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
		
		try {
			
			int totalRecordCount = os.GetRecordCount(order);
			
			System.out.println("----"+totalRecordCount);
			pageInfo.setTotalRecordCount(totalRecordCount);
			
		} catch (Exception e1) {
			e1.printStackTrace();
		} 
	//璋冪敤涓氬姟閫昏緫;
		try {
			
			List<Order1> list = os.getFenye(pageInfo, order);
			
			request.setAttribute("list",list);
			request.setAttribute("pageInfo", pageInfo);
		
			target = "/WEB-INF/jsp/user/" + target + ".jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		//杞彂瑙嗗浘
		request.getRequestDispatcher(target).forward(request, response);
	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
