<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>sdsd </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">

  </head>
  
  <body>
  		<%-- <jsp:forward page="/PayServlet">
			<jsp:param name="action" value="submitPay" />
		</jsp:forward> --%>
		<%
			String orderid = request.getParameter("orderid");
			String money = request.getParameter("money");
		 %>
		<form action="PayServlet" method="post">
			<input type="hidden" name="action" value="submitPay" />
	  		<input type="hidden" name="pd_FrpId" value="CCB-NET" />
	  		<input type="hidden" name="orderid" value="74185296 " />
	  		<input type="hidden" name="money" value="0.01" />
	  		<input type="submit" value="立即付款" />
	  	</form>
  </body>
</html>
