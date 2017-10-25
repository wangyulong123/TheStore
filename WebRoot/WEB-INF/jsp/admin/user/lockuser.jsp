<%@ page language="java" import="java.util.*,com.vo.*,com.page.*,com.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<base href="<%=basePath%>">
	<head>
		<meta charset="UTF-8">
		<title>用户锁定解锁</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/jQuery-confirm/jquery-confirm.css"/>
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
			a:link {
				text-decoration: none;
			}
			
			
		
			tr.tableHead {
				background-color: #337AB7;
				color: #ffffff;
			}
			
			tr.tableHead>th {
				text-align: center;
			}
			
			/*鼠标悬停的 当前行高亮*/
			/*table>tbody>tr:hover {
				background-color:#BAD0EF !important;
			}*/
			
			div.categoryTableDiv {
				width:1060px;
				margin:0px auto;
				position:relative;
				top:55px;
				opacity:0.8; 
			}
			
			#pageDiv {
				position:absolute;
				right:0px;
			}
			
			/*一级商品种类搜索框*/
			#jdCategorySearch {
				width:500px;
				margin:0px auto;
				position:relative;
				top:30px;
				right:25px;
				opacity:0.8; 
				
			}
			.breadcrumb{
			opacity:0.8; 
			}
			.mySpan {
		   color: white;
			}
			.myclass1{
			color: black;
			}
			.breadcrumb{
			width: 300px;
			}
		</style>
	</head>

	<body>
		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
			
		 %>
		
	   <div class="main">
	   <div>
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li><a href="#">用户信息管理</a></li>
				<li><a href="#">用户加锁解锁</a></li>
			</ul>
		</div>
		
		<form id="categoryForm" action="UsernameServlet?action=getlockByQuery" method="post">
		  <!--  <img src="img/京东logo.svg"  style="width: 60px;height: 60px; position: relative; left: 560px; top:30px;"/> -->
			<div id="jdCategorySearch" class="input-group">
					<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
					
					<span class="input-group-btn">
						<input type="submit"  value="搜索" class="btn btn-default"/>
					</span>
			</div>
	
		</form>
		
		<div class="text-center categoryTableDiv">

			<table id="categoryTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="10%">用户id</th>
						<th width="15%">用户账号</th>
						<th width="15%">用户账号状态</th>
						<th width="15%">登录失败次数</th>
						<th width="25%">登陆时间</th>
						<th width="10%">锁定</th>
						<th width="10%">解锁</th>
					</tr>
				</thead>

				<tbody style="background-color: white; 	opacity:0.9; ">
				
					<%
						List<User> list = (List<User>)request.getAttribute("list");
						
						for(User user:list){
					%>
						
						<tr>
							<td><%=user.getC_id()%></td>
							<td><%=user.getUsername() %></td>
							<% %>
							<td><%=UserDictionary.onsaleIntToStr(user.getLock_flag())%></td>
							<td><%=user.getFalure_num() %></td>
							<td><%=user.getDate() %></td>
						
								
				  
						
						<td>
							<%
								int onsale = user.getLock_flag();
													//上架状态的商品  上架按钮灰掉
													if(onsale==1){
							%>
									<button onclick="userUp(<%=user.getC_id()%>)" class="btn btn-success btn-xs disabled" disabled="disabled">冻结</button>
							<%
								}else{
							%>
									<button onclick="userUp(<%=user.getC_id()%>)" class="btn btn-success btn-xs">冻结</button>
							<%
								}
							%>
							
						</td>
						
						<td>
							<%
								if(onsale==0){
							%>
									<button onclick="userDown(<%=user.getC_id()%>)" class="btn btn-danger btn-xs disabled" disabled="disabled">解锁</button>
							<%
								}else{
							%>
									<button onclick="userDown(<%=user.getC_id()%>)" class="btn btn-danger btn-xs">解锁</button>
							<%
								}
							%>
							
						</td>
						</tr>
					
					<%
						}
					 %>

					

					
					

				</tbody>

			</table>

		
			<div id="pageDiv">
					
				
			<form id="categoryForm2" action="UsernameServlet?action=getlockByQuery" method="post">
			<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
	 <a id="first" class="btn btn-default btn-sm" href="UsernameServlet?action=getlockByQuery&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a>
    
    
     <a id="previous" class="btn btn-default btn-sm" href="UsernameServlet?action=getlockByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPerPageRecordCount()%>"> 上一页</a>
     <a id="next" class="btn btn-default btn-sm" href="UsernameServlet?action=getlockByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>"> 下一页</a>
    
    
     <a id="last" class="btn btn-default btn-sm" href="UsernameServlet?action=getlockByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>  
    
   <span class="mySpan">
   <span>当前第<%=pageInfo.getCurrentPage()%>页</span>
    
   <span>共<%=pageInfo.getTotalRecordCount()%>条记录 </span>
    
    <span>共<%=pageInfo.getTotalPageCount()%>页</span>
    
    <span>每页<%=pageInfo.getPerPageRecordCount()%>条</span>
    
    
    <span >跳到第 </span>	
    	<select id="requestPage" name="requestPage"class="myclass1">
    		<%
    			int TotalPageCount = pageInfo.getTotalPageCount();
    			
    			int currentPage = pageInfo.getCurrentPage();
    			for(int i=1;i<=TotalPageCount;i++){
    				
    				if(currentPage==i){
    					out.println("<option selected='selected'>" + i + "</option>");
    				}else{
    					out.println("<option>" + i + "</option>");
    				}
    				
    			}
    		 %> 
    		
    	</select>
    	
    <span>页 </span>
   </span>
    	
    	
		</form>
			
			</div>
		</div>
	   
	   </div>
		
		
		

		<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			
			$(function(){
				//对id为categoryTable表格进行隔行换色
				$("#categoryTable>tbody>tr:even").css("background-color","#fff");
				
				//给跳到第几页下拉列表框绑定事件
				$("#requestPage").change(function(){
					
					//提交请求
					$("#categoryForm2").submit();
				});
				
				//第一页时 "首页"和上一页不能用
				
				 var currentPage = <%=pageInfo.getCurrentPage()%>;
				var totalPageCount = <%=pageInfo.getTotalPageCount()%>;
				if(currentPage==1){
					$("#first").addClass("disabled");
					$("#previous").addClass("disabled");
				}else if(currentPage==totalPageCount){
					//最后一页时 "下一页"和"尾页"不能能用
					$("#next").addClass("disabled");
					$("#last").addClass("disabled");
				}  
			});
			//冻结
			function userUp(id){
			alert(id);
				$.confirm({
				    title: ' ',
				    content: '您确认冻结编号为' + id + '的用户吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UsernameServlet?action=userlock&target=productMainUpDown&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&userid=" + id);
				    },
				    cancel: function(){
				       
				    }
				});
			}
			//解除冻结
			function userDown(id){
			alert(id);
			$.confirm({
				    title: ' ',
				    content: '您确认解除编号为' + id + '的商品吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UsernameServlet?action=userunclok&target=productMainUpDown&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&userid=" + id);
				    },
				    cancel: function(){
				       
				    }
				}); 
				
			}
			
			
				
			
	
		</script>
		
		<%
			String msg = (String)request.getAttribute("msg");
			String msgDetail = (String)request.getAttribute("msgDetail");
			if(msg!=null){
		%>
			
		<script type="text/javascript">
				
			 $.alert({
                   title: '${msg}',
                   content: '${msgDetail}',
                   animation: 'rotate',
                   closeAnimation: 'right',
                   opacity: 0.5
               });
			
			
		</script>
		
		<%
			}
		%>
	</body>

</html>