package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.SendMsgUtil;
import com.google.gson.Gson;
import com.service.impl.CodeServiceImpl;
import com.service.impl.UserServiceImpl;
import com.service.inter.CodeService;
import com.service.inter.UserService;
import com.vo.Code;

public class CodeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       System.out.println("手机验证么这块已经连接上了");
		String action = request.getParameter("action");
		//分发请求
		if("addPhone".equals(action)){
			this.addPhone(request,response);
		}else if("check".equals(action)){
			this.check(request,response);
			
		}
	
	}
//将填写正确的手机号码存入到数据库中
	public void addPhone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //填充数据
		String phone =request.getParameter("phone");
		System.out.println(phone);
		//调用业务逻辑
		Code code = new Code();
		
		code.setPhone(phone);
		
		code.setCode("");
		CodeService service = new CodeServiceImpl();
		try {
			service.addPhone(code);
			/*request.setAttribute("msg", "添加用户成功");*/
			System.out.println("添加手机号到数据库成功");
		} catch (Exception e) {
			/*request.setAttribute("msg", "添加用户失败");
			e.printStackTrace();*/
			System.out.println("添加手机号到数据库失败");
		}
		//转发视图（这里不需要转发视图）
		
	}
	public void check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("application/json");
		Gson gson = new Gson();
		PrintWriter pWriter = response.getWriter();
		
		String phoneNumber = request.getParameter("phoneNumber");
		
		System.out.println("我是jsp传过来的代码"+phoneNumber);
		SendMsgUtil sendMsgUtil = new SendMsgUtil();
	    String yzNum = sendMsgUtil.send(phoneNumber);
	    String yzNumGson = gson.toJson(yzNum);
	  
	    pWriter.print(yzNumGson);
 		pWriter.flush();
 		pWriter.close();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
