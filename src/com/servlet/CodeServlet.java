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
       System.out.println("�ֻ���֤ô����Ѿ���������");
		String action = request.getParameter("action");
		//�ַ�����
		if("addPhone".equals(action)){
			this.addPhone(request,response);
		}else if("check".equals(action)){
			this.check(request,response);
			
		}
	
	}
//����д��ȷ���ֻ�������뵽���ݿ���
	public void addPhone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //�������
		String phone =request.getParameter("phone");
		System.out.println(phone);
		//����ҵ���߼�
		Code code = new Code();
		
		code.setPhone(phone);
		
		code.setCode("");
		CodeService service = new CodeServiceImpl();
		try {
			service.addPhone(code);
			/*request.setAttribute("msg", "����û��ɹ�");*/
			System.out.println("����ֻ��ŵ����ݿ�ɹ�");
		} catch (Exception e) {
			/*request.setAttribute("msg", "����û�ʧ��");
			e.printStackTrace();*/
			System.out.println("����ֻ��ŵ����ݿ�ʧ��");
		}
		//ת����ͼ�����ﲻ��Ҫת����ͼ��
		
	}
	public void check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("application/json");
		Gson gson = new Gson();
		PrintWriter pWriter = response.getWriter();
		
		String phoneNumber = request.getParameter("phoneNumber");
		
		System.out.println("����jsp�������Ĵ���"+phoneNumber);
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
