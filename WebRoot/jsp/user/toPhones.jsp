<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">

  </head>
  
  <body>
      <jsp:forward page="/PhonesServlet">
      		<jsp:param name="action" value="getPageByQuery" />
			<jsp:param name="cid" value="62" />
			<jsp:param name="orderCondition" value="price"/>
			<jsp:param name="ascOrDesc" value="asc"/>
			<jsp:param name="requestPage" value="1"/>
		</jsp:forward>
  </body>
</html>
