package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.JavaMailServiceImpl;

public class MailServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MailServlet���ӳɹ�");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String target = "";
		
		//һ.�������
		String from = request.getParameter("from");
		System.out.println(from);
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//��.����ҵ���߼�
		JavaMailServiceImpl service = new JavaMailServiceImpl();
		
		boolean isSuccessFlag = service.sendTextMail(from, to, subject, content);
		
		if(isSuccessFlag){
			request.setAttribute("msg", "���ͳɹ�,��ǰ�����伤��,��ȡURL��ַ,����һ��ճ����ַ");
		}else{
			request.setAttribute("msg", "����ʧ�ܣ�������ǰ��ע��ҳ��");
		}
		
		target = "/WEB-INF/msg.jsp";
		//��.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
