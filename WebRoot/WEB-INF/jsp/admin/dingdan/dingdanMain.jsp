<%@ page language="java" import="java.util.*,com.vo.*,com.page.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<base href="<%=basePath%>">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/jQuery-confirm/jquery-confirm.css"/>
		<style type="text/css">
			body {
				background-color:#F9F9F9;
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
			table>tbody>tr:hover {
				background-color:#BAD0EF !important;
			}
			
			div.categoryTableDiv {
				width:1060px;
				margin:0px auto;
				position:relative;
				top:80px;
			}
			
			#pageDiv {
				width:1050px;
				position:absolute;
				right:0px;
			}
			
			#jdCategorySearch {
				width:500px;
				margin:0px auto;
				position:relative;
				top:50px;
				right:60px;
			}
			
			#categoryForm2{
				position:absolute;
				left:0px;
			}
			
			#productTable {
				table-layout:fixed;  
			}
						
			#productTable td{
					overflow: hidden;  
			       	white-space: nowrap;  
			       	text-overflow: ellipsis;
			}
			
			.select{
			   padding:3px;
			   font-size: 14px;
			   border: 1px solid #bad0ef;
			   border-radius:5px;
			   height: 26px;
			}
			
			#selectSearchCondition{
				height:34px;
				position:relative;
				left:40px;
				top:85px;
			}
		</style>
	</head>

	<body>
		<%
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
		 %>
	
		<div>
			<ul class="breadcrumb">
				<li><a href="jsp/admin/admin.jsp" target="_parent">首页</a></li>
				<li><a href="javascript:void(0)">订单管理</a></li>
				<li><a href="javascript:void(0)">管理订单</a></li>
			</ul>
		</div>
		
		<form id="categoryForm" action="DingdanServlet?action=getPageByQuery&target=dingdanMain" method="post">
			<span style="color:#337AB7;font-size:16px;position:relative;left:30px;top:85px;"><b>[搜索条件提示]</b></span>
			<select class="select" name="selectSearchCondition" id="selectSearchCondition" >
				
				<option selected="selected">收货人</option>
				<option>住址</option>
				<option>订单描述</option>
			</select>
			
			<div id="jdCategorySearch" class="input-group">
				
					<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
					
					<span class="input-group-btn">
						<input type="submit"  value="搜索" class="btn btn-default"/>
					</span>
			</div>
	
		</form>
		
		<div class="text-center categoryTableDiv">

			<table id="productTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="10%">订单编号</th>
						<th width="15%">下单时间</th>
						<th width="10%">收货人</th>
						<th width="10%">联系电话</th>
						<th width="20%">住址</th>
						<th width="10%">订单描述</th>
						<th width="5%">订单金额</th>
						<th width="10%">订单状态</th>
						<th width="5%">操作</th>
						<th width="5%">操作</th>
					</tr>
				</thead>

				<tbody>
				
					<%
						List<Order1> list = (List<Order1>)request.getAttribute("list");
						
						for(Order1 order:list){
					%>
						
						<tr>
							<td><%=order.getOrderid() %></td>
							<td><%=order.getOrdertime() %></td>
							<td><%=order.getShouhuorenname() %></td>
							<td><%=order.getTel() %></td>
							<td><%=order.getAddress() %></td>
							<td><%=order.getOrderdesc() %></td>
							<td><%=order.getOrderprice() %></td>
							
							<td><%switch(order.getOrderstatus()){
								case 0:%>未付款<%break;
								case 1:%>已付款<%break;
								case 2:%>已发货<%break;
								case 3:%>已完成<%break;
							} %></td>
							<td>
								
								<button class="btn btn-success btn-xs" onclick="getOneForUpdate(<%=order.getOrderid() %>)">修改</button>
							</td>
							<td>
								<button class="btn btn-danger btn-xs" onclick="deleteCategoryById(<%=order.getOrderid() %>)">删除</button>
								
								
							</td>
						</tr>
					
					<%
						}
					 %>

				</tbody>

			</table>

		
			<div id="pageDiv">
			<% 
				if(pageInfo == null){
					pageInfo = new PageInfo(0);	
				}
			%>		
				
			<form id="categoryForm2" action="DingdanServlet?action=getPageByQuery&target=dingdanMain" method="post">
			<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
   <span class="mySpan">
  
    
   <span>共 <%=pageInfo.getTotalRecordCount()%> 条记录， </span>
      
      <span>当前第 <%=pageInfo.getCurrentPage()%> 页，</span>
    <span>共 <%=pageInfo.getTotalPageCount()%> 页，</span>
    
    <span>每页显示
 	<select id="recordsPerPage" class="select" name="recordsPerPage">
		<option selected = 'selected'>5</option>
		<option>10</option>
		<option>15</option>
		<option>20</option>
	</select> 条，</span>
   
    
    <span>跳到第 </span>	
    	<select id="requestPage" class="select" name="requestPage">
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
			
			<!-- 分页class="disabled"  -->
		<ul class="pagination" style="position:relative;right:30px;float:right;">
			<li ><a href="DingdanServlet?action=getPageByQuery&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a></li>
			<li ><a href="DingdanServlet?action=getPageByQuery&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>">&laquo;</a></li>
			
			<%
				for(int i=1;i<=TotalPageCount;i++){
				
			%>
			
			<li><a href="DingdanServlet?action=getPageByQuery&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=i %>"><%=i %></a></li>
			<% 
				}
			 %>
			
			<li><a href="DingdanServlet?action=getPageByQuery&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>">&raquo;</a></li>
			<li><a href="DingdanServlet?action=getPageByQuery&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a></li>
		</ul>
			
			</div>
		</div>
		
		

		<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
	 	$(function(){
	 		 <% 
		      	if(pageInfo.getCurrentPage()>pageInfo.getTotalPageCount()){
					pageInfo.setCurrentPage(1);
					//当前页数 > 总页数 ，应该重新跳转
			 	
			 %>
				 location.assign("DingdanServlet?action=getAllByPage&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1");
			  <% 	
		      	}
		      %>
	 	});
	 </script>
	 
		<script type="text/javascript">
			
			$(function(){
				//对id为categoryTable表格进行隔行换色
				$("#categoryTable>tbody>tr:even").css("background-color","#fff");
				
				//给跳到第几页下拉列表框绑定事件
				$("#requestPage").change(function(){
					
					//提交请求
					$("#categoryForm2").submit();
				});
				
				//给每页显示多少条绑定事件
				$("#recordsPerPage").change(function(){
					//提交请求
					$("#categoryForm2").submit();
					
				});
				
				$("#recordsPerPage>option").each(function(){
					if($(this).text() == <%=pageInfo.getPerPageRecordCount()%>){
						$(this).prop("selected","selected");
					}
				});
				
				
				
				var $firstLi = $("ul.pagination li:first");
				var $lastLi = $("ul.pagination li:last");
				var currentPage = <%=pageInfo.getCurrentPage()%>;
				var totalPageCount = <%=pageInfo.getTotalPageCount()%>;

				if(currentPage == 1){
					$firstLi.next().addClass("disabled");
					$firstLi.next().children().attr("href","javascript:void(0)");
					$firstLi.addClass("disabled");
					$firstLi.children().attr("href","javascript:void(0)");
				}else if(currentPage == totalPageCount){
					$lastLi.prev().addClass("disabled");
					$lastLi.prev().children().attr("href","javascript:void(0)");
					$lastLi.addClass("disabled");
					$lastLi.children().attr("href","javascript:void(0)");
				}
				
				$("ul.pagination li>a").each(function(){
					if($(this).text() == <%=currentPage%>){
						$(this).parent().addClass("active");
					}
				});
				
				if($("#searchCondition").val()=="%"){
					$("#searchCondition").val("");
				}
			});
			
			
			function deleteCategoryById(id){
				
			
				$.confirm({
					title: '',
					content: '您确认删除吗?',
					confirm: function() {
						
						location.assign("DingdanServlet?action=delete&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderid=" + id);
					},
					cancel: function() {
						
					},
					
				});
			
			}
			
			function getOneForUpdate(id){
				
				location.assign("DingdanServlet?action=getOneForUpdate&target=dingdanMain&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&orderid=" + id);
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