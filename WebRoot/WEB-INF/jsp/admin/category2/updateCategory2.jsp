<%@ page language="java" import="java.util.*,com.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>修改二级商品种类</title>

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
	height:300px;
	padding: 50px;
	position:relative;
	top:10px;
	left:200px;
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
.select{
   width: 45px;
   padding:3px;
   font-size: 14px;
   border: 1px solid #bad0ef;
   border-radius:5px;
   height: 26px;
}
</style>



</head>

<body>
	<ul class="breadcrumb">
		<li><a href="jsp/admin/admin.jsp" target="_parent">首页</a></li>
				<li><a href="javascript:void(0)">商品种类管理</a></li>
				<li><a href="javascript:void(0)">修改二级商品种类</a></li>	</ul>
	
	<form action="Category2Servlet" method="post">
		
		<%
			Category2 category = (Category2)request.getAttribute("category");
			
			String requestPage = request.getParameter("requestPage");
			String searchCondition = request.getParameter("searchCondition");
			String recordsPerPage = request.getParameter("recordsPerPage");
			
		 %>
		 
		<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="cid" value="<%=category.getCid()%>"/>
		<input type="hidden" name="requestPage" value="<%=requestPage%>"/>
		<input type="hidden" name="searchCondition" value="<%=searchCondition%>"/>
		<input type="hidden" name="recordsPerPage" value="<%=recordsPerPage %>">
		
		<fieldset id="categoryFieldset">
			<legend>修改二级商品种类</legend>
			<div class="categoryClass">
				<label for="cname">商品种类名称</label><input type="text" class="categoryLabel" name="cname"
					id="cname" value="<%=category.getCname()%>"/>
			</div>

			<div class="categoryClass">
				<label for="cdesc">商品种类描述</label><input type="text" class="categoryLabel" name="cdesc"
					id="cdesc" value="<%=category.getCdesc()%>"/>
			</div>
			
			<div class="categoryClass">
				<input type="submit" class="btn btn-success addCategoryBtn" value="修改二级商品种类" />
			</div>
		</fieldset>
	</form>

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
