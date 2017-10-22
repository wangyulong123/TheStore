<%@ page language="java" import="java.util.*,com.vo.*,com.service.inter.*,com.service.impl.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>添加商品</title>

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
	right:30px;
}

#cid{
	height:24px;
	position:relative;
	right:20px;
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
		<li><a href="javascript:void(0)">商品管理</a></li>
		<li id="add"><a href="javascript:void(0)" >添加商品</a></li>
	</ul>
	
	<form action="ProductServlet" method="post">
		
		<input type="hidden" name="action" value="add"/>
		
		<fieldset id="categoryFieldset">
			<legend>添加商品</legend>
			<div class="categoryClass">
				<label for="pname">商品名称</label><input type="text" class="categoryLabel" name="pname"
					id="pname" />
			</div>

			<div class="categoryClass">
				<label for="price">商品价格</label><input type="text" class="categoryLabel" name="price"
					id="price" />
			</div>
			
			<div class="categoryClass">
				<label for="productSum">商品数量</label><input type="text" class="categoryLabel" name="productSum"
					id="productSum" />
			</div>
			
			<div class="categoryClass">
				<label for="dianpuName">店铺名称</label><input type="text" class="categoryLabel" name="dianpuName"
					id="dianpuName" />
			</div>
			
			<div class="categoryClass">
				<label for="pdesc">商品描述</label><input type="text" class="categoryLabel" name="pdesc"
					id="pdesc" />
			</div>
			
			<div class="categoryClass">
				<label>所属商品种类</label>
				<select id="category1" class="select" name="category1">
				
				<%
					List<Category> list = (List<Category>)request.getAttribute("list");
					for(Category category:list){
				%>
					
					<option value="<%=category.getCid()%>"><%=category.getCname()%></option>
				<%
					}	
				 %>
					
				</select>
				
				
				<select name="cid" class="select" id="cid">
				<%
					Category category = list.get(0);
					Category2ServiceImpl service = new Category2ServiceImpl();
					
					List<Category2> category2List = service.getAllCategory2ByCategory1(category.getCid());
					for(Category2 category2:category2List){
				%>
					<option value="<%=category2.getCid()%>"><%=category2.getCname()%></option>
				<%
					}
				 %>
					
				</select>
			</div>
			
			<div class="categoryClass">
				<input id="submt" type="submit" class="btn btn-success addCategoryBtn" value="添加商品" />
			</div>
		</fieldset>
	</form>

<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		//给一级商品种类下拉列表框绑定onchange事件
		//当用户选择一级商品种类后  发送Ajax请求  去服务器查询 对应的下面的二级商品种类
		//并且使用dom技术 动态改变  二级商品种类下拉列表框中的内容
		$("#category1").change(function(){
			
			var category1Id = this.options[this.selectedIndex].value;
			$.post("ProductServlet",{"action":"getCategory2ByCategory1ForAddProduct","category1Id":category1Id},function(data){
				
				//在回调函数中  使用dom技术  更新   category2下拉列表框
				generateCategory2Select(data);
			},"json");
		});
	});
	
	function generateCategory2Select(data){
		
		/*
			<select name="cid" id="cid">
				<option value="1">手机</option>
			</select>
		*/
		var category2Select = '<select class="select" name="cid" id="cid">';
		
		for(var i=0;i<data.length;i++){
			var cid = data[i].cid;
			var cname = data[i].cname;
			
			category2Select = category2Select + '<option value="' + cid + '">';
			category2Select = category2Select + cname + '</option>';
		}
		
		category2Select = category2Select + '</select>';
		
		$("#cid").replaceWith(category2Select);
	}
</script>
</body>
</html>
