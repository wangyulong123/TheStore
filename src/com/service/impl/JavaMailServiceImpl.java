package com.service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.service.inter.JavaMailService;

public class JavaMailServiceImpl implements JavaMailService{

	private String mailHost = "smtp.sina.com";
	private String mailPort = "25";
	private String username = "thestore1@sina.com";
	private String password = "thestore1";
	
	private Properties props = new Properties();
	@Override
	public boolean sendTextMail(String from, String to, String subject,
			String content) {
		
		boolean flag = true;
		
		//����һ��javaMail ��Ҫ�Ļ���������Ϣ 
		props.put("mail.smtp.host", mailHost);
		// �������,ָ��ʵ��javax.net.SocketFactory�ӿڵ��������,����ཫ�����ڴ���SMTP���׽���
		//props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		// �������Ϊtrue,δ�ܴ���һ���׽���ʹ��ָ�����׽��ֹ����ཫ����ʹ��java.net.Socket�������׽����ࡣĬ��ֵΪtrue��
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", mailPort);
		props.setProperty("mail.smtp.socketFactory.port", mailPort);
		props.setProperty("mail.smtp.auth", "true");
		
		
		try {
			Message message = getMessage(from,to,subject,content);
			Transport.send(message);
		} catch (AddressException e) {
			flag = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public Message getMessage(String from, String to, String subject,
			String content) throws AddressException, MessagingException{
		Message message = null;
		
		//����һ�� �ʼ��ͻ���  ��  smtp������֮��ĻỰ
		Session session = Session.getDefaultInstance(props, 
				new Authenticator(){

					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						
						return new PasswordAuthentication(username,password);
					}
			
			
		});
		
		message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject(subject);
		message.setSentDate(new Date());
		message.setText("��Ѻ����urlճ���� ��ַ���� ���ɼ����û�    http://localhost:8080/ts0.1/UserServlet?action=active&username="+content);
		
		return message;
	}
	
	public static void main(String[] args) {
		JavaMailServiceImpl service = new JavaMailServiceImpl();
		
		String content = "��������urlճ���� ��ַ���� ���ɼ����û�http://localhost:8080/jd/UserServlet?action=active&username=";
		String subject = "����1�ŵ��̳��û��˺ż���";
		service.sendTextMail("thestore1@sina.com","fengxiewuguo@163.com", subject, content);
	}
}
