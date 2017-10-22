<%@ page language="java" import="java.util.*,com.vo.Category2,com.page.PageInfo" pageEncoding="UTF-8"%>
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
				height:80px;
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
			.select{
			   width: 45px;
			   padding:3px;
			   font-size: 14px;
			   border: 1px solid #bad0ef;
			   border-radius:5px;
			   height: 26px;
			}
			
			.shengluehao{
				width:36px;
				height:34px;
				float:left;
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
				<li><a href="javascript:void(0)">商品种类管理</a></li>
				<li><a href="javascript:void(0)">管理二级商品种类</a></li>
			</ul>
		</div>
		
		<form id="categoryForm" action="Category2Servlet?action=getPage2ByQuery" method="post">
		
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
						<th width="15%">二级商品种类编号</th>
						<th width="15%">二级商品种类名称</th>
						<th width="35%">二级商品种类描述</th>
						<th width="15%">所属商品种类名称</th>
						<th width="10%">操作</th>
						<th width="10%">操作</th>
					</tr>
				</thead>

				<tbody>
				
					<%
						List<Category2> list = (List<Category2>)request.getAttribute("list");
						
						for(Category2 category:list){
					%>
						
						<tr>
							<td><%=category.getCid() %></td>
							<td><%=category.getCname() %></td>
							<td><%=category.getCdesc() %></td>
							<td><%=category.getCategory().getCname()%></td>
							<td>
								
								
								<button class="btn btn-success btn-xs" onclick="getOneForUpdate(<%=category.getCid() %>)">修改</button>
							</td>
							<td>
								<button class="btn btn-danger btn-xs" onclick="deleteCategoryById(<%=category.getCid() %>)">删除</button>
								
								
							</td>
						</tr>
					
					<%
						}
					 %>

				</tbody>

			</table>

		
			<div id="pageDiv">
			<% 
			%>		
				
			<form id="categoryForm2" action="Category2Servlet?action=getPage2ByQuery" method="post">
			<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
    
   <span class="mySpan">
  
    
   <span>共 <%=pageInfo.getTotalRecordCount()%> 条记录， </span>
      
      <span>当前第 <%=pageInfo.getCurrentPage()%> 页，</span>
    <span>共 <%=pageInfo.getTotalPageCount()%> 页，</span>
    
    <span>每页显示
   
 	<select id="recordsPerPage" class="select" style="border-radius:5px;" name="recordsPerPage">
		<option selected = 'selected'>5</option>
		<option>10</option>
		<option>15</option>
		<option>20</option>
	</select> 条，
	</span>
   
    
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
		<ul class="pagination" style="position:relative;right:30px;top:10px;float:right;">
			<li ><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a></li>
			<li ><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>">&laquo;</a></li>
			<%
				if(TotalPageCount<=10){
					for(int i = 1;i<=TotalPageCount;i++){
						%>
						<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=i %>"><%=i %></a></li>
						<%
					}
				}else{
					if(currentPage<=5){
						for(int i=1;i<=currentPage+2;i++){
							%>
							<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=i %>"><%=i %></a></li>
							<% 
						}
						%>
						<!-- active样式定位出现问题  eq(currentPage + 1) -->
						<div class="shengluehao" >...</div>
						<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=TotalPageCount %>"><%=TotalPageCount %></a></li>
						<%
					}else if(currentPage<TotalPageCount-3){
						%>			
						<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1">1</a></li>
						<div class="shengluehao" >...</div>
						<% 
						for(int i=currentPage-3;i<=currentPage+2;i++){
							%>
							<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=i %>"><%=i %></a></li>
							<%
						}
						%>
						
						<div class="shengluehao" >...</div>
						<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=TotalPageCount %>"><%=TotalPageCount %></a></li>
						<%
					}else{
						%>			
						<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1">1</a></li>
						<div class="shengluehao" >...</div>
						<% 
						for(int i=currentPage-3;i<=TotalPageCount;i++){
							%>
							<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=i %>"><%=i %></a></li>
							<%
						}
					}
				}
			%>
			<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>">&raquo;</a></li>
			<li><a href="Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a></li>
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
				 location.assign("Category2Servlet?action=getPage2ByQuery&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=1");
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
						
						location.assign("Category2Servlet?action=delete&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&cid=" + id);
					},
					cancel: function() {
						
					},
					
				});
			
			}
			
			function getOneForUpdate(id){
				
				location.assign("Category2Servlet?action=getOneForUpdate&recordsPerPage=<%=pageInfo.getPerPageRecordCount() %>&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&cid=" + id);
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