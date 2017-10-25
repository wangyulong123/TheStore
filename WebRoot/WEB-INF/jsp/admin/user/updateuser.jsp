<%@ page language="java" import="java.util.*,com.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>修改一级商品种类</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>

<style type="text/css">

body {
		background-color:white;
}
.main{
			 background:url("staticTheStore/img/桌面.jpeg") no-repeat;
			  background-size: cover;  
			 width: 1200px;
			 height: 635px;
			   background-size: 100%;
			 
			 
			 }
div.categoryClass {
	margin-bottom: 20px;
}

#categoryFieldset {
	width: 700px;
	height:350px;
	padding: 50px;
	position:relative;
	top:30px;
	margin:auto;
	border: 0;
	background-color: #f7f7f7;
	text-align: center;
		opacity:0.8; 
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
.breadcrumb{
			width: 300px;
			}
.categoryLabel
 {
  
  padding: 0px 10px;
  font-size: 16px;
  border-radius: 3px;
}
</style>



</head>

<body>
  <div class="main">
  <ul class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">用户信息管理</a></li>
		<li><a href="#">用户信息修改</a></li>
	</ul>
	
	<form action="UsernameServlet" method="post">
		
		<%
			
			User user=(User)request.getAttribute("user");
			String requestPage = request.getParameter("requestPage");
			String searchCondition = request.getParameter("searchCondition");
			
			
		 %>
		 
		<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="userid" value="<%=user.getUserid()%>"/>
		<input type="hidden" name="requestPage" value="<%=requestPage%>"/>
		<input type="hidden" name="searchCondition" value="<%=searchCondition%>"/>
		
		<fieldset id="categoryFieldset">
		  <!--  <img  src="img/京东狗.png" width="90" height="90"> -->
			<h3 style="color: blue; ">修改用户信息</h3>
			<hr style="background-color: white; width: 100%;height: 2px;">
			<div class="categoryClass">
				<label for="cname">用户账号</label><input type="text" class="categoryLabel" name="username"
					id="cname" value="<%=user.getUsername()%>"/>
			</div>

			<div class="categoryClass">
				<label for="cdesc">用户密码</label><input type="text" class="categoryLabel" name="password"
					id="cdesc" value="<%=user.getPassword()%>"/>
			</div>
			<div class="categoryClass">
				<label for="cdesc">用户地址</label><input type="text" class="categoryLabel" name="adress"
					id="cdesc" value="<%=user.getAddress()%>"/>
			</div>
			<div class="categoryClass">
				<label for="cdesc">用户昵称</label><input type="text" class="categoryLabel" name="nickname"
					id="cdesc" value="<%=user.getNickname()%>"/>
			</div>
			<div class="categoryClass">
				<label for="cdesc">用户昵称</label><input type="text" class="categoryLabel" name="nickname"
					id="cdesc" value="<%=user.getNickname()%>"/>
			</div>
			

			<div class="categoryClass">
				<input type="submit" class="btn btn-success addCategoryBtn" value="修改用户信息" />
			</div>
		</fieldset>
	</form>
  </div>
	

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
