package com.servlet;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.PaymentUtil;

public class CallbackServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 获得支付公司 发回 支付结果数据
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String amount = request.getParameter("r3_Amt");
		String currency = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String rb_BankId = request.getParameter("rb_BankId");
		String ro_BankOrderId = request.getParameter("ro_BankOrderId");
		String rp_PayDate = request.getParameter("rp_PayDate");
		String rq_CardNo = request.getParameter("rq_CardNo");
		String ru_Trxtime = request.getParameter("ru_Trxtime");
		String hmac = request.getParameter("hmac");

		// 2、验证支付公司身份
		// 将所有数据加密一次获得 hmac 通过支付公司发来hmac比较
		String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString(
				"p1_MerId");
		String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
				"keyValue");
		boolean result = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, amount, currency, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType, keyValue);
		if (result) {
			// 验证成功
			if (r9_BType.equals("1")) {
				// 浏览器重定向 ，通知用户付款成功！
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println("您已经支付成功！成功支付金额: " + amount);
				//重定向 到首页
				response.sendRedirect("/WEB-INF/jsp/user/chargeSuccess.jsp");
			} else if (r9_BType.equals("2")) {
				// 服务器点对点，易宝通知你
				System.out.println("服务器进行支付成功数据处理...");
				response.getWriter().println("success");
			}
		} else {
			// 验证失败
			System.out.println("交易数据被篡改！");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
