<%@ page language="java" import="java.util.*,com.vo.*,com.service.impl.*,com.service.inter.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>修改订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>

<style type="text/css">

body {
		background-color:#F9F9F9;
}

div.categoryClass {
	margin-bottom: 20px;
}

#categoryFieldset {
	width: 370px;
	height:360px;
	padding: 30px;
	position:relative;
	top:10px;
	left:300px;
}

fieldset legend {
	font-size:20px;
	font: 16px/100% Arial, Verdana, "宋体";
}

fieldset label {
	margin-right: 50px;
	font: 16px/100% Arial, Verdana, "宋体";
}

/*bootstrap 按钮样式*/
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}

.btn-success {
  color: #fff;
  background-color: #5cb85c;
  border-color: #4cae4c;
}

.addCategoryBtn {
	position:absolute;
	right:50px;
	bottom:50px;
}

.categoryLabel
 {
  
  padding: 0px 10px;
  font-size: 16px;
  border-radius: 3px;
}

#category1{
	height:24px;
	position:relative;
}

#cid{
	height:24px;
	position:relative;
}

.select{
   font-size: 14px;
   border: 1px solid #bad0ef;
   border-radius:5px;
}

</style>



</head>

<body>
	<ul class="breadcrumb">
		<li><a href="jsp/admin/admin.jsp" target="_parent">首页</a></li>
				<li><a href="javascript:void(0)">订单管理</a></li>
				<li><a href="javascript:void(0)">修改订单</a></li>	</ul>
	
	<form action="DingdanServlet" method="post">
		
		<%
			Order1 order = (Order1)request.getAttribute("order");
			String requestPage = request.getParameter("requestPage");
			String searchCondition = request.getParameter("searchCondition");
			String recordsPerPage = request.getParameter("recordsPerPage");
			
		 %>
		 
		<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="orderid" value="<%=order.getOrderid()%>"/>
		<input type="hidden" name="requestPage" value="<%=requestPage%>"/>
		<input type="hidden" name="searchCondition" value="<%=searchCondition%>"/>
		<input type="hidden" name="recordsPerPage" value="<%=recordsPerPage %>">
		<input type="hidden" name="target" value="<%=request.getAttribute("target") %>" />
		
		<fieldset id="categoryFieldset">
			<legend>修改订单</legend>
			<div class="categoryClass">
				<label for="shouhuorenname">收     货     人</label><input type="text" class="categoryLabel" name="shouhuorenname"
					id="shouhuorenname" value="<%=order.getShouhuorenname() %>" />
			</div>

			<div class="categoryClass">
				<label for="tel">联系电话</label><input type="text" class="categoryLabel" name="tel"
					id="tel" value="<%=order.getTel() %>" />
			</div>

			<div class="categoryClass">
				<label for="address">收货地址</label><input type="text" class="categoryLabel" name="address"
					id="address" value="<%=order.getAddress() %>" />
			</div>
			
			<div class="categoryClass">
				<label for="orderprice">订单金额</label><input type="text" class="categoryLabel" name="orderprice"
					id="orderprice" value="<%=order.getOrderprice() %>" />
			</div>
			
			<div class="categoryClass">
				<label for="orderdesc">订单描述</label><input type="text" class="categoryLabel" name="orderdesc"
					id="orderdesc" value="<%=order.getOrderdesc() %>" />
			</div>
			
			<div class="categoryClass">
				<label for="orderstatus">订单状态</label><input type="text" class="categoryLabel" name="orderstatus"
					id="orderstatus" value="<%=order.getOrderstatus() %>" />
			</div>
			<div class="categoryClass">
				<label for="orderstatus">提示：订单状态：0表示未付款，1表示已付款，2表示已发货，3表示已完成</label>
			</div>

			<div class="categoryClass" style="position:relative;top:60px;">
				<input type="submit" class="btn btn-success addCategoryBtn" value="修改订单" />
			</div>
		</fieldset>
	</form>

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
</script>
</body>
</html>
