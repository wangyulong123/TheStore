<%@page import="com.service.impl.Category2ServiceImpl"%>
<%@page import="com.service.inter.Category2Service"%>
<%@ page language="java" import="java.util.*,com.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
		<meta charset="UTF-8">
		<title>网上超市1号店，省力省钱省时间</title>
		<link rel="shortcut icon" href="staticTheStore/img/icon.png"/>
		<!-- src="staticTheStore/ -->
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/bootstrap-3.3.6/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/css.css" />
		<!--收货地址-->
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/hzw-city-picker.css">

		<link rel="stylesheet" type="text/css" href="staticTheStore/css/yidong.css"/>
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/Mycss.css" />
		
			<!--
        	动态边框
        -->
        <link rel="stylesheet" type="text/css" href="staticTheStore/css/动态边框.css"/>
		<script src="staticTheStore/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="staticTheStore/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="staticTheStore/js/sc.js" type="text/javascript" charset="utf-8"></script>
		<!--导航栏-->
		<script src="staticTheStore/js/Myjs.js" type="text/javascript" charset="utf-8"></script>
		<!--送货地址-->
			
	<script type="text/javascript" src="staticTheStore/js/city-data.js"></script>
	<script type="text/javascript" src="staticTheStore/js/hzw-city-picker.min.js"></script>
		<!--倒计时-->
		<script src="staticTheStore/js/leftTime.js" type="text/javascript" charset="utf-8"></script>
		<!--图片轮播-->
		<script src="staticTheStore/js/图片轮播.js" type="text/javascript" charset="utf-8"></script>
		<!-- 图片偏移-->
		<!--<script src="staticTheStore/js/图片偏移.js" type="text/javascript" charset="utf-8"></script>-->
		<!--左右划照片-->
		<script src="staticTheStore/js/yidong.js" type="text/javascript" charset="utf-8"></script>
		<script src="staticTheStore/js/右侧悬停.js" type="text/javascript" charset="utf-8"></script>
	   <!-- 动态边框-->
	   <script src="staticTheStore/js/动态边框.js" type="text/javascript" charset="utf-8"></script>
	   
	</head>

	<body>
		 <div class="main-right">
		 	
		 
		 <div class="side">
	<ul>
		<li><a href="javascript:void(0);"  ><div class="sidebox" ><img src="staticTheStore/图片/个人中心.png" style="width:34px;height: 25px;"><a href="javascript:void(0);"  class="main-right-a" style="text-decoration: none;">个人中心</a></div></a></li>
		<li style="text-align: center;"><a href="javascript:void(0);"  ><div class="sidebox" style="text-align: center;"><img src="staticTheStore/图片/购物车空.png" style="width: 30px;height: 25px;"><a href="javascript:void(0);"  class="main-right-a" style="text-decoration: none;">购物车</a></div></a></li>
		<li><a href="javascript:void(0);" ><div class="sidebox"><img src="staticTheStore/图片/会员卡卷3.png" style="width: 32px;height: 25px;"><a href="javascript:void(0);"  class="main-right-a" style="text-decoration: none;">我的卡卷</a></div></a></li>
		<li style="top:370px ;"><a href="javascript:void(0);" ><div class="sidebox"><img src="staticTheStore/图片/用户反馈.png"style="width: 30px;height: 25px;"><a href="javascript:void(0);"  class="main-right-a" style="text-decoration: none;">用户反馈</a></div></a></li>
		<li style="border:none; top: 380px; " ><a href="javascript:goTop();" class="sidetop"><img src="staticTheStore/图片/回到顶部.png"style="width: 28px;height: 25px;"><a href="javascript:void(0);"  class="main-right-a"> 	</a></a></li>
	</ul>
</div>
		 </div>
		 <!--左侧-->
		 
		 <nav class="floor-nav" style="left: 4%;" >
			<span class="scroll-nav active" >1号<br />首卖</span>
			<span class="scroll-nav" >1号<br />抢购</span>
			<span class="scroll-nav" >品牌<br />特卖</span>
			<span class="scroll-nav" >领取<br />中心</span>
			<span class="scroll-nav" >全球<br />进口</span>
			<span class="scroll-nav" >个人<br />美装</span>
	
			
		</nav>
		<!--头部栏-->
		<div id="header">
			<div class="header-center">
				<div class="header-left" style="z-index: 4;" >
					<!--  送货地址-->
					<input type="text" id="cityChoice"  value="送货地址：北京" style="margin: 134px 0 0 557px; width: 100px;" readonly="readonly">
				     
						<div style="width: 100%; height: auto; line-height: 25px; text-align: center; display: none;">
							<a href="javascript:void(0);" ><b></b></a>
						</div>
					
				</div>
				<div class="header-right" style="z-index: 1000;">
					
					<!--文本标签-->
						<%
					 User user=(User)session.getAttribute("user");
					 if(user==null){
					 //显示：Hi,请登录
					 %>	
					<a id="pregister" href="jsp/HomePage/Login.jsp">Hi,请登录</a>
					<a id="register" href="jsp/user/Regist.jsp">注册</a>
					<%
					}else{
					 %>
					   <b>你好!<%=user.getNickname() %></b>
					   <a href="LoginServlet?action=logout">退出登录</a>
					   <%
					   }
					    %>
					<span>|</span>
					
					<!--文本标签-->
					<a href="javascript:void(0);" >我的订单</a>
					<span>|</span>
					<!--文本标签-->
					<a href="javascript:void(0);" >充值中心</a>
					<span>|</span>
					<select name="客服中心" >
						<option value="客服中心">客服中心</option>
						<option value="包裹跟踪">包裹跟踪</option>
						<option value="常见问题">常见问题</option>
						<option value="配送范围">配送范围</option>
					</select>
					<select name="网站导航">
						<option value="1号商城">1号商城</option>
						<option value="1号社区">1号社区</option>
						<option value="网站联盟">网站联盟</option>
					</select>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<!--1号店logo-->
		<div id="logo" >
			<div class="logo-left">
				<img src="staticTheStore/图片/login.png" />
			</div>
			<div class="logo-center" style="position: relative; top: 50px;">
			
	  <!--    //搜索栏调整 -->
			<form id="categoryForm"
					action="UserProductServlet?action=getPageByQuery" method="post">
				<div class="input-group" style="width:600px; margin:0px auto;">
				<!-- <input  type="text" name="name" class="inputtable" id="name" /> form-control -->
					<input type="text" class="inputtable form-control" id="searchCondition" name="searchCondition"   value="${requestScope.searchCondition}"   id="name" />
					<span class="input-group-btn">
            <input type="submit" name="search" value="搜索"  class="btn btn-default"  style="background-color: #FF4040; color: white;"/> 
             	
			</span>
				</div>
				</form>
	          <div id="context1" style="background-color:white; border: 1px solid #bad0ef;width:545px;position:absolute; right:355px; z-index: 622; display:none; font-size: 15px; " >
     
    </div>
			</div>
			<div class="logo-center-under">
		
				<a href="javascript:void(0);" >巧克力</a>
				<span> </span>
				<a href="javascript:void(0);" >料酒</a>
				<span> </span>
				<a href="javascript:void(0);" >湿巾</a>
				<span> </span>
				<a href="javascript:void(0);" >洗衣粉</a>
				<span> </span>
				<a href="javascript:void(0);" >蜂蜜</a>
				<span> </span>
				<a href="javascript:void(0);" >手帕纸</a>
				<span> </span>
				<a href="javascript:void(0);" >醋</a>

			</div>
			<div class="logo-center-under1">
				<a href="javascript:void(0);" >1号抢购</a>
				<span> </span>
				<a href="javascript:void(0);" >1号团</a>
				<span> </span>
				<a href="javascript:void(0);" >领券中心</a>
				<span> </span>
				<a href="javascript:void(0);" >商城优选</a>
				<span> </span>
				<a href="javascript:void(0);" >全球进口</a>
				<span> </span>
				<a href="javascript:void(0);" >1号生鲜</a>
				<span> </span>
				<a href="javascript:void(0);" >美妆馆</a>
				<span> </span>
				<a href="javascript:void(0);" >家居馆</a>
				<span> </span>
				<a href="javascript:void(0);" >电器城</a>
			</div>
			<div class="logo-right">
				<!--<input type="button" name="btn1" id="btn1" value="购物车" />-->
				<button type="button" class="btn btn-default" style="width: 160px;">购物车</button>
				
			</div>
		</div>
		<div class="clear"></div>
		<!--flash幻灯片-->
			
 <div id="flash"  class="scroll-floor floor1" >
		 	
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" >
			<!--标识符:告诉我们页码-->
		
				<ol class="carousel-indicators" >
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			
			
			<!-- 幻灯片内容 -->
			<div class="carousel-inner" role="listbox" style="width: 990px; height:410px;position: relative; left: 215px;">
				<div class="item active">
					<img src="staticTheStore/图片/images1.jpg" style="width: 1200px; height: 404px;">

				</div>

				<div class="item">
					<img src="staticTheStore/图片/images2.jpg " style="width: 1200px; height: 404px;">

				</div>

				<div class="item">
					<img src="staticTheStore/图片/images3.jpg" style="width: 1200px; height: 404px;">

				</div>
			</div>
			<!-- 控制器: 负责上一页/下一页 -->
			<a class=" carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="position: absolute; left: 250px;">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" ></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class=" carousel-control" style="position:relative;left: 1100px; top: -208px;"  href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
		
	    <!--导航栏-->
		<div class="nav">
			<div class="nav-con">
				<div class="nav-con-left">
					<div class="nav-con-lefttext">
						<a href="javascript:void(0);" >全部商品分类</a>
					</div>
					<div class="nav-variety" id="things" >
						<ul class="thing-variety" id="variety" >
	
							<li class="tab-item" >
								<div class="thname">
	 <%
	 List<Category> list=(List<Category>)request.getAttribute("list");
	
	 %>
	
								
			<h4><a href="javascript:void(0);"  ><img src="staticTheStore/img/img1.png" />&nbsp;&nbsp;		
			<%
			 for(int i=0;i<3;i++){
			  %>
			  <%=list.get(i).getCname() %>/
			<% 
			 }
			%> </a></h4>
		   <span style="position:absolute; top: 10px;">&gt;</span>
		   </div>
			</li>
		 <li class="tab-item">
								<div class="thname">
									<h4>	<a href="javascript:void(0);" ><img src="staticTheStore/图片/食品.png" />&nbsp;&nbsp;		
									<%
									  for(int i=3;i<5;i++){
									   %>
									     <%=list.get(i).getCname() %>/
									   
									   <% 
									  }
									 %>
									
									
									</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/童装煮洗.png" />&nbsp;&nbsp;母婴/玩具/童装/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/童装煮洗.png" />&nbsp;&nbsp;纸巾/清洁用品/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/家具.png" />&nbsp;&nbsp;家具/家纺/家装/宠物/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/美妆.png" />&nbsp;&nbsp;美妆个人清洁/洗护/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/女装.png" />&nbsp;&nbsp;女装/男装/内衣/珠宝/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/鞋靴.png" />&nbsp;&nbsp;鞋靴/箱包/运动户外</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/手机.png" />&nbsp;&nbsp;手机/数码/电脑办公/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/家用电器.png" />&nbsp;&nbsp;家用电器/汽车用品/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/医药.png" />&nbsp;&nbsp;医药/保健滋补/成人/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/旅行.png" />&nbsp;&nbsp;旅行/票卷/生活广告/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>
							<li class="tab-item">
								<div class="thname">
									<h4><a href="javascript:void(0);" ><img src="staticTheStore/图片/理财.png" />&nbsp;&nbsp;理财/众筹/保险/</a></h4>
									<span style="position:absolute; top: 10px;">&gt;</span>
								</div>
							</li>

						</ul>
					<div class="dropdown hiden">
							<div class="fmaint clear hiden">
								<div class="subitems" style="">
							<%
							for(int j=0;j<=2;j++){
								
							%>
							<dl class="sub2" >
									<dt ><a href="javascript:void(0);"  style="text-align: center; "><%=list.get(j).getCname() %><span style="position:absolute; top: 10px;">&gt;</span></a></dt>
				
								<dd>
										<%
								//根据一级商品种类 查询下面的二级
								Category2Service service=new Category2ServiceImpl();
								List<Category2> category2List=service.getAllCategory2ByCategory1(list.get(j).getCid());
		
								for(Category2 category2:category2List){
							%>	
							  <%-- <a href="javascript:void(0);"  target="_blank"><%=category2.getCname() %></a> --%>
							  <a href="UserProductServlet?action=getProductListByCategory&requestPage=1&cid=<%=category2.getCid()%>"><%=category2.getCname()%></a>  	
						
							 <%
							 }
							  %>
                               	  </dd>
                            </dl> 
							
								
							<%	
								}
							 %>	
							 
						
									<dl class="sub3">
										<dt><a href="javascript:void(0);" >酒水<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">桔汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">橙汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">菠萝汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">菠萝汁汽水</a>
											<a href=# " target="_blank ">混合果汁汽水</a>
                                    <a href="# " target="_blank ">运动汽水</a>
                                </dd>
                            </dl>
                            <dl class="sub4 ">
                                <dt><a href="# ">粮油<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">橄榄油</a>
                                    <a href="# " target="_blank ">大米</a>
                                    <a href="# " target="_blank ">方便面</a>
                                    <a href="# " target="_blank ">罐头</a>
                                    <a href=#" target="_blank">食用油</a>
											<a href="javascript:void(0);"  target="_blank">好吃点</a>
										</dd>
									</dl>
									<dl class="sub5">
										<dt><a href="javascript:void(0);" >咖啡<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">浓缩咖啡</a>
											<a href="javascript:void(0);"  target="_blank">玛奇朵</a>
											<a href="javascript:void(0);"  target="_blank">美式咖啡</a>
											<a href="javascript:void(0);"  target="_blank">白咖啡</a>
											<a href=# " target="_blank ">拿铁</a>
                                    <a href="# " target="_blank ">康宝蓝</a>
                                </dd>
                            </dl>
                            <dl class="sub6 ">
                                <dt><a href="# ">母婴<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">奶瓶</a>
                                    <a href="# " target="_blank ">奶嘴</a>
                                    <a href="# " target="_blank ">喂药器</a>
                                    <a href="# " target="_blank ">吸奶器</a>
                                    <a href=#" target="_blank">奶瓶盖</a>
											<a href="javascript:void(0);"  target="_blank">棉签</a>
										</dd>
									</dl>
									<dl class="sub7">
										<dt><a href="javascript:void(0);" >家具<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">实木家具</a>
											<a href="javascript:void(0);"  target="_blank">板式家具</a>
											<a href="javascript:void(0);"  target="_blank">藤艺家具</a>
											<a href="javascript:void(0);"  target="_blank">软体类家具</a>
											<a href=# " target="_blank ">金属玻璃类家具</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl> 
                            <dl class="sub8 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">居家氛围</a>
										</dd>
									</dl>
									<dl class="sub9">
										<dt><a href="javascript:void(0);" >牛奶<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">纯牛奶</a>
											<a href="javascript:void(0);"  target="_blank">甜牛奶</a>
											<a href="javascript:void(0);"  target="_blank">高钙奶</a>
											<a href="javascript:void(0);"  target="_blank">脱脂奶</a>
											<a href=# " target="_blank ">儿童奶</a>
                                    <a href="# " target="_blank ">特仑苏</a>
                                </dd>
                            </dl>
                          
                        </div>
                                         
                        <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>
                       <!-- 第二个   --> 
                    <div class="fmaint clear hiden ">
                          
                        <div class="subitems ">
                          
							<%
							for(int j=3;j<=5;j++){
								
							%>
							<dl class="sub2" >
									<dt ><a href="javascript:void(0);"  style="text-align: center; "><%=list.get(j).getCname() %><span style="position:absolute; top: 10px;">&gt;</span></a></dt>
				
								<dd>
										<%
								//根据一级商品种类 查询下面的二级
								Category2Service service=new Category2ServiceImpl();
								List<Category2> category2List=service.getAllCategory2ByCategory1(list.get(j).getCid());
		
								for(Category2 category2:category2List){
							%>	
							  <a href="javascript:void(0);"  target="_blank"><%=category2.getCname() %></a>
						
							 <%
							 }
							  %>
                               	  </dd>
                            </dl> 
							
								
							<%	
								}
							 %>	
							 
								
									
						<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                           
									<dl class="sub3">
										<dt><a href="javascript:void(0);" >酒水<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">桔汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">橙汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">菠萝汁汽水</a>
											<a href="javascript:void(0);"  target="_blank">菠萝汁汽水</a>
											<a href=# " target="_blank ">混合果汁汽水</a>
                                    <a href="# " target="_blank ">运动汽水</a>
                                </dd>
                            </dl>
                            <dl class="sub4 ">
                                <dt><a href="# ">粮油<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">橄榄油</a>
                                    <a href="# " target="_blank ">大米</a>
                                    <a href="# " target="_blank ">方便面</a>
                                    <a href="# " target="_blank ">罐头</a>
                                    <a href=#" target="_blank">食用油</a>
											<a href="javascript:void(0);"  target="_blank">好吃点</a>
										</dd>
									</dl>
									<dl class="sub5">
										<dt><a href="javascript:void(0);" >咖啡<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">浓缩咖啡</a>
											<a href="javascript:void(0);"  target="_blank">玛奇朵</a>
											<a href="javascript:void(0);"  target="_blank">美式咖啡</a>
											<a href="javascript:void(0);"  target="_blank">白咖啡</a>
											<a href=# " target="_blank ">拿铁</a>
                                    <a href="# " target="_blank ">康宝蓝</a>
                                </dd>
                            </dl>
                            <dl class="sub6 ">
                                <dt><a href="# ">母婴<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">奶瓶</a>
                                    <a href="# " target="_blank ">奶嘴</a>
                                    <a href="# " target="_blank ">喂药器</a>
                                    <a href="# " target="_blank ">吸奶器</a>
                                    <a href=#" target="_blank">奶瓶盖</a>
											<a href="javascript:void(0);"  target="_blank">棉签</a>
										</dd>
									</dl>
									<dl class="sub7">
										<dt><a href="javascript:void(0);" >家具<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">实木家具</a>
											<a href="javascript:void(0);"  target="_blank">板式家具</a>
											<a href="javascript:void(0);"  target="_blank">藤艺家具</a>
											<a href="javascript:void(0);"  target="_blank">软体类家具</a>
											<a href=# " target="_blank ">金属玻璃类家具</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl> 
                        </div>
                                                     
                      <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                        
                        </div>
                       
                    </div> 
                    	
                    <!--     第三个-->
                    <div class="fmaint clear hiden ">
                      
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                         <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>
                       <!--     第四个-->
                    <div class="fmaint clear hiden ">
                      
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                         <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>
                                                  
                    <!--第五个-->
                   <div class="fmaint clear hiden ">
                     
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                         <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>   
                  <!--  第六个-->
                  <div class="fmaint clear hiden ">
                     
                      
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                  <!--  第七个-->
                  <div class="fmaint clear hiden ">
                     
                        
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                   <!-- 第八个-->
                   <div class="fmaint clear hiden ">
                     
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                  <!--  第九个-->
                  <div class="fmaint clear hiden ">
                     
                      
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                       <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                   <!-- 第十个-->
                   <div class="fmaint clear hiden ">
                     
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                       <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                  <!--  第十一个-->
                  <div class="fmaint clear hiden ">
                     
                      
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                       <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                   <!-- 第十二个-->
                   <div class="fmaint clear hiden ">
                     
                     
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                       <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                 <!--   第十三个-->
                  <div class="fmaint clear hiden ">
                     
                       
                        <div class="subitems ">
                            <dl class="sub1 ">
                                <dt><a href="# ">众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub2">
										<dt><a href="javascript:void(0);" >众筹<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">智能硬件</a>
											<a href="javascript:void(0);"  target="_blank">流行文化</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">公益</a>
											<a href=# " target="_blank ">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="sub3 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub4">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                            <dl class="sub5 ">
                                <dt><a href="# ">理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
                                <dd>
                                    <a href="# " target="_blank ">理财小金库</a>
                                    <a href="# " target="_blank ">票据理财</a>
                                    <a href="# " target="_blank ">基金理财</a>
                                    <a href="# " target="_blank ">定期理财</a>
                                    <a href=#" target="_blank">固收理财</a>
											<a href="javascript:void(0);"  target="_blank">妈妈理财</a>
										</dd>
									</dl>
									<dl class="sub6">
										<dt><a href="javascript:void(0);" >理财<span style="position:absolute; top: 10px;">&gt;</span></a></dt>
										<dd>
											<a href="javascript:void(0);"  target="_blank">理财小金库</a>
											<a href="javascript:void(0);"  target="_blank">票据理财</a>
											<a href="javascript:void(0);"  target="_blank">基金理财</a>
											<a href="javascript:void(0);"  target="_blank">定期理财</a>
											<a href=# " target="_blank ">固收理财</a>
                                    <a href="# " target="_blank ">妈妈理财</a>
                                </dd>
                            </dl>
                        </div>
                         <div class="item-promotions " style="position: relative; right: 30px; top: 20px;" >
                            <a href="# "><img src="staticTheStore/img/ib9.jpg" alt=" " width="175 " height="300 "/></a>
                         
                        </div>
                    </div>    
                </div>
            </div>
        </div>
        </div>
    </div>
		
</div>
  <div class="clear "> </div>
  
  
   <!--	倒计时抢购-->
    <div id="time" class="scroll-floor floor2">
    	<!--左侧倒计时-->
    <div class="data-show-box" id="dateShow1" style="width: 165px ;background-color: orangered;height: 140px;  ">
			 <div class="data-show-box-top">
			 	一号抢购
			 </div>
			 <div class="data-show-box-top1">
			 	本场剩余
			 </div>
			 <div class="data-show-box-middle" >
			<span class="date-tiem-span h">00</span>:
			<span class="date-tiem-span m">00</span>:
			<span class="date-s-span s">00</span>
			 </div>
			 <div class="data-show-box-under">
			 	<a href="javascript:void(0);" >查看更多></a>
			 </div>
		</div>
		<div class="time-right">
			<div id="huadong">
			<a href="javascript:void(0);" id="left"><</a>
				
			<div id="shangpin" >
				<ul id="uul" style="margin-left:0px;">
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);" title="稻村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/1.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					
					<li>
							<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/2.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/3.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/4.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/5.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>						
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/6.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/7.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>						
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/8.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/3.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/1.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>						
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/2.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>
					</li>
					<li>
						<div class="danyishangpin">
							<div class="dotted_line"></div>
							<a href="javascript:void(0);"  title="稻香村 八月十五花月圆月饼礼盒" class="danyi">
								<div class="detail_mesg">
									<p class="name">稻香村 八月十五花月圆月饼礼盒</p>
									<p class="price">￥ 238</p>
									<p class="cankao">参考价：￥<span>298</span></p>
								</div>
								
								<img class="detail_img" src="staticTheStore/img/4.jpg"/>
								<div class="marking_label">已售76%</div>
							</a>
						</div>						
					</li>
				</ul>
				
				
			</div>
			<a href="javascript:void(0);" id="right">></a>
			
		</div>
		</div>
	
     </div>
  <!-- 品牌特卖-->
    <div id="sample-sale"  class="scroll-floor floor3" >
    	    <div class="sample-sale-left">
    	    	<img src="staticTheStore/图片/liudan.png" style="width: 210px; height: 320px;"/>
    	    	<div class="sample-sale-left-center img" >	
    	    		<a href="javascript:void(0);"  style="font-size: 15px; line-height: 10px;">品牌特卖</a><br />
    	    		<hr  style="width: 20px ; background-color: #000000;line-height: 10px;"/>
    	    		<a href="javascript:void(0);"  style="font-size:10px ;"line-height: 10px;>每天10:00上新!</a>
    	    		
    	    	</div>
    	    </div>
    		<div class="sample-sale-middle">
    			<h4 title="团购" style="line-height: 32px; text-align: center; background-color: #FB6233;width: 120px;color:white ; margin: auto; ">团购</h4>
    		     <div class="sample-sale-middle-left">
    		     	<img src="staticTheStore/图片/kuzi.png"/ style="width:200px ; height: 288px;">
    		     </div>
    		     <div class="sample-sale-middle-right">
    		     	<div class="sample-sale-middle-right-top">
    		     		 <h3 style="color: red;">1号 量饭团</h3>
    		     		 <h4>俞兆林礼品装</h4>
    		     		 <img src="staticTheStore/图片/饼干.jpg " class="devia" style=" left:0px;top:0px;width: 120px; height: 90px;position: relative;"/>
    		     	</div>
    		     	<div class="sample-sale-middle-right-under">
    		     		<h3 style="color: red;">1号 品牌团</h3>
    		     		 <h4>稻花村月饼</h4>
    		     		 <img src="staticTheStore/图片/蛋糕.jpg" class="devia" style="left:0px;top:0px;width: 120px; height: 90px; position: relative;	"/>
    		     	</div>
    		     </div>
    		</div>
    		<div class="sample-sale-right">
    			<h4 title="团购" style="line-height: 32px; text-align: center; background-color: #FB6233;width: 120px;color:white ; margin: auto; ">排行榜</h4>	 <a href="javascript:void(0);"  style="position: absolute; right: 20px; top: 8px; font-size:14px;">查看更多》</a>  
    			<div class="sample-sale-right-phbang">
    			
				<ul class="nav nav-tabs" id="myTab" style="width: 570px; height: 30px;">
			<li class="active">
				<a href="#intro" data-toggle="tab" style="height: 30px; width: 111px; 	">女装</a>
			</li>
			<li>
				<a href="#parameter" data-toggle="tab" style="height: 30px;width: 111px;">休闲食品</a>
			</li>
			<li>
				<a href="#qingdan" data-toggle="tab" style="height: 30px;width: 111px;">纸制品</a>
			</li>
			<li>
				<a href="#pingjia" data-toggle="tab" style="height: 30px;width: 111px;">面部护肤</a>
			</li>
			<li>
				<a href="#shouhou" data-toggle="tab" style="height: 30px;width: 115px; ">粮油/干货</a>
			</li>
		</ul>

		<div class="tab-content"style="width: 570px; height: 260px; " >
			<div class="tab-pane active" id="intro">
				 <div class="tab-pane-img" > 
				  <table border="0" cellspacing="" cellpadding="" width="570px" height="260px" id="tab-pane-img-table">
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行1.jpg"  class="devia" style="left:0px;top:0px; position: relative;	"/><br/><a href="javascript:void(0);" >INMAN/茵曼 2017</a></td>
				  		<td><img src="staticTheStore/图片/排行2.jpg"/><br/><a href="javascript:void(0);" >洛芊 秋冬新款大码</a></td>
				  		<td><img src="staticTheStore/图片/排行3.jpg"   class="devia" style="left:0px;top:0px; position: relative;	"/><br/><a href="javascript:void(0);" >Meters/bonwe美特</a></td>
				  	</tr>
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行4.jpg"  class="devia" style="left:0px;top:0px; position: relative;	"/><br/><a href="javascript:void(0);" >初语 2017春季新</a></td>
				  			<td><img src="staticTheStore/图片/排行5.jpg"/><br/><a href="javascript:void(0);" >裂帛 女装2017秋</a></td>
				  				<td><img src="staticTheStore/图片/排行6.jpg" class="devia" style="left:0px;top:0px; position: relative;	"/><br/><a href="javascript:void(0);" >洛芊 新款秋冬休闲</a></td>
				  	
				  	</tr>
				  	
				  </table>
				 </div>
			</div>
			<div class="tab-pane" id="parameter">
				 <table border="0" cellspacing="" cellpadding="" width="570px" height="260px" id="tab-pane-img-table">
				  	<tr>
				  		<td><img src="staticTheStore/排行榜图片/21.jpg" class="img"/><br/><a href="javascript:void(0);" >美滋滋天天见坚果</a></td>
				  		<td><img src="staticTheStore/排行榜图片/22.jpg"/><br/><a href="javascript:void(0);" >土豆薯条</a></td>
				  		<td><img src="staticTheStore/排行榜图片/23.jpg" class="img2"/><br/><a href="javascript:void(0);" >鸡蛋干</a></td>
				  	</tr>
				  	<tr>
				  		<td><img src="staticTheStore/排行榜图片/24.jpg" class="img"/><br/><a href="javascript:void(0);" >百草味</a></td>
				  			<td><img src="staticTheStore/排行榜图片/25.jpg"/><br/><a href="javascript:void(0);" >手撕风干牛肉干</a></td>
				  				<td><img src="staticTheStore/排行榜图片/26.jpg" class="img"/><br/><a href="javascript:void(0);" >三只松鼠</a></td>
				  	
				  	</tr>
				  	
				  </table>
			</div>
			<div class="tab-pane" id="qingdan">
				 <table border="0" cellspacing="" cellpadding="" width="570px" height="260px" id="tab-pane-img-table">
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行1.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行2.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行3.jpg" class="img2"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	</tr>
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行4.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  			<td><img src="staticTheStore/图片/排行5.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  				<td><img src="staticTheStore/图片/排行6.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	
				  	</tr>
				  	
				  </table>
			</div>
			<div class="tab-pane" id="pingjia">
				 <table border="0" cellspacing="" cellpadding="" width="570px" height="260px" id="tab-pane-img-table">
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行1.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行2.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行3.jpg" class="img2"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	</tr>
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行4.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  			<td><img src="staticTheStore/图片/排行5.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  				<td><img src="staticTheStore/图片/排行6.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	
				  	</tr>
				  	
				  </table>
			</div>
			<div class="tab-pane" id="shouhou">
				 <table border="0" cellspacing="" cellpadding="" width="570px" height="260px" id="tab-pane-img-table">
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行2.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行1.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  		<td><img src="staticTheStore/图片/排行5.jpg" class="img2"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	</tr>
				  	<tr>
				  		<td><img src="staticTheStore/图片/排行4.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  			<td><img src="staticTheStore/图片/排行5.jpg"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  				<td><img src="staticTheStore/图片/排行6.jpg" class="img"/><br/><a href="javascript:void(0);" >排行1</a></td>
				  	
				  	</tr>
				  	
				  </table>
			</div>
		</div>
	</div>
    		</div>
    	</div>
    	<!--领卷中心-->
    	<div id="discount" class="scroll-floor floor4">
    		<img src="staticTheStore/图片/优惠券.png"/>
    	</div>
    	<div class="clear">
    <!--  全球进口-->
     <div id="allear" class="scroll-floor floor5">
     <div class="allear-left">
        <img src="staticTheStore/图片/牛奶.png" style="float: left;"/>
    <div class="banner_link"  >
		<ul class="clearfix-allear">
		<li><a title="进口饼干" target="_blank" href="//search.yhd.com/c5020-0-0/mbname-b/a-s1-v0-p1-price-d0-f0-m1-rt0-pid-mid0-color-size-k/">进口饼干</a></li>
		<li><a title="进口坚果" target="_blank" href="//search.yhd.com/c0-0/k%25E8%25BF%259B%25E5%258F%25A3%25E5%259D%259A%25E6%259E%259C/">进口坚果</a></li>
		<li><a title="进口水饮" target="_blank" href="//search.yhd.com/c0-0/k%25E8%25BF%259B%25E5%258F%25A3%25E9%25A5%25AE%25E6%2596%2599/">进口水饮</a></li>
		<li><a title="进口食用油" target="_blank" href="//search.yhd.com/c15054-0-0/mbname-b/a-s1-v0-p1-price-d0-f0-m1-rt0-pid-mid0-color-size-k/">进口食用油</a></li>
		<li><a title="进口调料" target="_blank" href="//search.yhd.com/c0-0/k%25E8%25BF%259B%25E5%258F%25A3%25E8%25B0%2583%25E6%2596%2599/">进口调料</a></li>
		<li><a title="进口方便面" target="_blank" href="//search.yhd.com/c15055-0-0/mbname-b/a-s1-v0-p1-price-d0-f0-m1-rt0-pid-mid0-color-size-k/">进口方便面</a></li>
		</ul>
	</div>
     	 </div>
     	  <div class="allear-center">
     	  <div class="allear-center-top">
     	  	<img src="staticTheStore/图片/没戏.png"  class="allearimg" width="404px" height="224px" />
     	  </div>
     	  <div class="allear-center-under">
     	  	  <div class="allear-center-under-left">
     	  	  	 <img src="staticTheStore/图片/啤酒.png"  class="allearimg" width="202.5px" height="225px"/>
     	  	  </div>
     	  	  <div class="allear-center-under-right">
     	  	  	<img src="staticTheStore/图片/零食.png"width="202.5px" height="224px"  class="allearimg"/>
     	  	  </div>
     	  	
     	  </div>
     	 
     </div> 
     <div class="allear-center2">
     	   <div class="allear-center2-top">
     	   	 <img src="staticTheStore/图片/零食.png" width="215px" height="224px"  class="allearimg"/>
     	   </div>	
     	  	<div class="allear-center2-under">
     	   	<img src="staticTheStore/图片/咖啡.png" 	width="216px" height="225px"  class="allearimg"/>
     	   </div>
     	  	
     	  </div>
     	  <div class="allear-right">
     	  	<ul class="clearfix">
     <li class="jk_mh">
		<a title="BEAUTY" href="//list.yhd.com/vc4468" target="_blank" data-tc="ad.0.0.22026-47264098.1" data-ref="22026_47264098_1" >
		<p class="pro_tit">进口美护</p>
		<p class="pro_sub_tit">BEAUTY</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口美户.png" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		<li class="jk_my">
		<a title="MOM&amp;BABY" href="//cms.yhd.com/sale/abmXbsBWbEm" target="_blank" data-tc="ad.0.0.22027-47264092.1" data-ref="22027_47264092_1">
		<p class="pro_tit">进口母婴</p>
		<p class="pro_sub_tit">MOM&amp;BABY</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口母婴.png" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		<li class="jk_sx">
		<a title="FRESH" href="//list.yhd.com/vc4581" target="_blank" data-tc="ad.0.0.22028-47264095.1" data-ref="22028_47264095_1">
		<p class="pro_tit">进口生鲜</p>
		<p class="pro_sub_tit">FRESH</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口生鲜.png" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		<li class="jk_jj">
		<a title="HOME" href="//list.yhd.com/vc4469/c950340/b/a-s1-v4-p1-price-d0-mid0-f0-k" target="_blank" data-tc="ad.0.0.22029-47264105.1" data-ref="22029_47264105_1">
		<p class="pro_tit">进口家居</p>
		<p class="pro_sub_tit">HOME</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口家具.png" width="130" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		<li class="jk_cw">
		<a title="清洁进口" href="//cms.yhd.com/sale/ISGXlFFObhS" target="_blank" data-tc="ad.0.0.22030-47264107.1" data-ref="22030_47264107_1">
		<p class="pro_tit">进口厨卫清洁</p>
		<p class="pro_sub_tit">CLEANING</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口清洁.png" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		<li class="jk_bj">
		<a title="进口保健品" href="//list.yhd.com/vc4470" target="_blank" data-tc="ad.0.0.22031-47264111.1" data-ref="22031_47264111_1">
		<p class="pro_tit">进口保健品</p>
		<p class="pro_sub_tit">HEALTH</p>
		<p class="pro_color"></p>
		<img src="staticTheStore/图片/进口保健品.png" width="100" height="100" alt="进口美护" data-imgattr="original" style=" left:0px;top:0px; opacity:100;position: relative;"  class="devia">
		</a>
		</li>
		</ul>
     	  	
     	  </div>
     </div>
    <!-- 个户美妆-->
     <div id="ghmz" class="scroll-floor floor6">
	     	<div class="cn_gobuy" style="height: 300px;">
	    <div class="search_y"><a href="javascript:void(0);" ><img src="staticTheStore/图片/新品.png"  width="50"/></a></div>
	    <div class="biankuang biankuang_1"></div>
	    <div class="biankuang biankuang_2"></div>
	    <div class="biankuang biankuang_3"></div>
	    <div class="biankuang biankuang_4"></div>
	    <a class="tp_gobuy" href="#"><img src="staticTheStore/图片/iphonne7.jpg" alt="Voyager 3" title="Voyager 3"></a>
	    <a class="top_text" href="#">iphone7</a>
	    <div class="text_gobuy">
	        <br/>
	        <b class="text-b">￥6900.00</b>
	        <br/>
	
	        <div class="a_add_divboc">
	            <div id="boynow">
	                <a href="javascript:void(0);" >
	              <img src="staticTheStore/图片/加入购物车 .png" width="30" height="30" > &nbsp;&nbsp;<img src="staticTheStore/图片/热度对比.png" width="30" height="30"/>
	                 	<!--<button type="button" class="btn btn-default" style="width: 90px;height: 30px; background-color: #FF4040; color: white; position: relative; top: -10px;">加入购物车</button>-->
	                </a>
	            </div>
	        </div>
    </div>
    
      
      
</div>
     <div class="scroll-floor-center">
	 <div class="keywords" data-tpc="JJSH_LMC">
		<ul class="clearfix">
		<li>
		|<a title="餐具水具" target="_blank" href="//list.yhd.com/c28758-0" data-tc="ad.0.0.22103-46369960.1" data-ref="22103_46369960_1">餐具水具</a>
		</li>
		<li>
		|<a title="厨具锅具" target="_blank" href="//list.yhd.com/c7262-0" data-tc="ad.0.0.22104-46369962.1" data-ref="22104_46369962_1">厨具锅具</a>
		</li>
		<li>
		|<a title="床上用品" target="_blank" href="//list.yhd.com/c950341-0" data-tc="ad.0.0.22105-46369964.1" data-ref="22105_46369964_1">床上用品</a>
		</li>
		<li>
		|<a title="家纺布艺" target="_blank" href="//list.yhd.com/c950342-0" data-tc="ad.0.0.22106-46369965.1" data-ref="22106_46369965_1">家纺布艺</a>
		</li>
		<li>
		|<a title="居家日用" target="_blank" href="//list.yhd.com/c36940-0" data-tc="ad.0.0.22107-46369966.1" data-ref="22107_46369966_1">居家日用</a>
		</li>
		<li>
		|<a title="收纳洗晒" target="_blank" href="//list.yhd.com/c950344-0" data-tc="ad.0.0.22108-46369967.1" data-ref="22108_46369967_1">收纳洗晒</a>
		</li>
		<li>
		|<a title="宠物用品" target="_blank" href="//list.yhd.com/c950350-0" data-tc="ad.0.0.22109-46369972.1" data-ref="22109_46369972_1">宠物用品</a>
		</li>
		<li>
		|<a title="家装建材" target="_blank" href="//list.yhd.com/c36939-0" data-tc="ad.0.0.22110-46369973.1" data-ref="22110_46369973_1">家装建材</a>
		</li>
		<li>
		|<a title="鲜花园艺" target="_blank" href="//list.yhd.com/c35072-0" data-tc="ad.0.0.22111-46369976.1" data-ref="22111_46369976_1">鲜花园艺</a>
		</li>
		</ul>
		</div>	
     <div class="scroll-floor-center-center" data-tpc="JJSH_HDGGW">
					<div class="pro_wrap">
					<a title="好货优选" target="_blank" href="//shop.yhd.com/m-5170.html" data-tc="ad.0.0.22112-47089412.1" data-ref="22112_47089412_1">
					<p class="pro_tit">富安娜九月超闪</p>
					<p class="pro_sub_tit">好货优选</p>
					<img src="staticTheStore/图片/好货优品.png"  calt="富安娜九月超闪" width="130" height="130" style="left: 0px; right: 0px; position: absolute;" data-imgattr="original">
					</a>
					</div>
					<div class="pro_wrap">
					<a title="缤纷的餐具" target="_blank" href="//cms.yhd.com/sale/cuuyQcQyunC" data-tc="ad.0.0.22113-47721164.1" data-ref="22113_47721164_1">
					<p class="pro_tit">缤纷的餐具</p>
					<p class="pro_sub_tit">爆款直降</p>
					<img src="staticTheStore/图片/爆款直降.png" alt="缤纷的餐具" width="130" height="130" data-imgattr="original">
					</a>
					</div>
					<div class="pro_wrap">
					<a title="厨具焕新" target="_blank" href="//list.yhd.com/c7262-0-0/" data-tc="ad.0.0.22114-47721165.1" data-ref="22114_47721165_1">
					<p class="pro_tit">厨具焕新</p>
					<p class="pro_sub_tit">品质甄选</p>
					<img src="staticTheStore/图片/好货优品.png" alt="厨具焕新" width="130" height="130" data-imgattr="original">
					</a>
</div>
</div>	
	 <div class="scroll-floor-center-center" data-tpc="JJSH_DPHDW">
			<div class="pro_wrap">
			<a title="收纳洗晒" target="_blank" href="//list.yhd.com/c950344-0-0/" data-tc="ad.0.0.22115-46608798.1" data-ref="22115_46608798_1">
			<p class="pro_tit">收纳洗晒</p>
			<p class="pro_sub_tit">换季焕新家</p>
			<img src="staticTheStore/图片/换季换新家.jpg" alt="收纳洗晒" width="252" height="194" data-imgattr="original">
			</a>
			</div>
			<div class="pro_wrap">
			<a title="家装建材" target="_blank" href="//list.yhd.com/c36939-0-0/" data-tc="ad.0.0.22116-46608805.1" data-ref="22116_46608805_1">
			<p class="pro_tit">家装建材</p>
			<p class="pro_sub_tit">爆款直降</p>
			<img src="staticTheStore/图片/家装.png" alt="家装建材" width="252" height="194" data-imgattr="original">
			</a>
			</div>
			<div class="pro_wrap">
			<a title="焕新家具" target="_blank" href="//list.yhd.com/c950343-0-0/" data-tc="ad.0.0.22117-46608812.1" data-advid="22117" data-advcode="PCSY_JJSH_DPHDW_TP3" data-ajax="1" data-fee="" data-done="" data-nsf="" data-ref="22117_46608812_1">
			<p class="pro_tit">焕新家具</p>
			<p class="pro_sub_tit">极致好货</p>
			<img src="staticTheStore/图片/极致好货.png" alt="焕新家具" width="252" height="194" data-imgattr="original">
			</a>
</div>
</div>  	
     	
     </div>
      <div class="scroll-floor_right">
      	  <p class="hot_tit">热门商品</p>
      	   <div class="rank_list" data-tpc="JJSH_RMSP">
			<ul>
			<li data-singlemodule="1">
			<a class="pro_img clearfix" title="SAMSUNG 三星 55英寸  超高清  LED  液晶  4K智能网络曲面  HDR  电视机  UA55KU6880JXXZ  黑色" target="_blank" href="//item.yhd.com/item/64721946" data-advid="22118" data-advcode="PCSY_JJSH_RMSP_SPW1" data-ajax="1" data-fee="" data-done="1" data-nsf="1" data-ref="" data-tc="4.4.5.55496549.1" data-tce="request-fe44ce3ca3bbda4cfeaaa74a89d07a60abf6,section-1013,n-3" data-recordtracker="1">
			<img alt="SAMSUNG 三星 55英寸  超高清  LED  液晶  4K智能网络曲面  HDR  电视机  UA55KU6880JXXZ  黑色" src="staticTheStore/图片/手机排行2.jpg" width="60" height="60"   stydata-done="1">
			<i>1</i>
			<div class="rank_detail">
			<p class="pro_name">SAMSUNG 三星 55英寸  超高清  LED  液晶  4K智能网络曲面  HDR  电视机  UA55KU6880JXXZ  黑色</p>
			<p class="pro_price" productid="55496549" pmid="64721946" data-pricedone="1">¥<em>5299</em></p>
			</div>
			</a>
			</li>
			<li data-singlemodule="1">
			<a class="pro_img clearfix" title="Joyoung九阳 JYZ-V919低速榨汁机大口径家用多功能电动炸果汁机" target="_blank" href="//item.yhd.com/item/66738964" data-advid="22119" data-advcode="PCSY_JJSH_RMSP_SPW2" data-ajax="1" data-fee="" data-done="1" data-nsf="1" data-ref="" data-tc="4.4.5.57226559.2" data-tce="request-fe44ce3ca3bbda4cfeaaa74a89d07a60abf6,section-1013,n-3" data-recordtracker="1">
			<img alt="Joyoung九阳 JYZ-V919低速榨汁机大口径家用多功能电动炸果汁机" src="staticTheStore/图片/手机排行3.jpg" width="60" height="60" data-done="1">
			<i class="rank_second">2</i>
			<div class="rank_detail">
			<p class="pro_name">Joyoung九阳 JYZ-V919低速榨汁机大口径家用多功能电动炸果汁机</p>
			<p class="pro_price" productid="57226559" pmid="66738964" data-pricedone="1">¥<em>699</em></p>
			</div>
			</a>
			</li>
			<li data-singlemodule="1">
			<a class="pro_img clearfix" title="Nan Ji ren 南极人 全棉四件套 纯棉斜纹印花床上用品套件 床单式四件套 （被套200*230cm）似水流年1.5-1.8m床通用" target="_blank" href="//item.yhd.com/item/54468744" data-tc="ad.0.0.22120-45318035.1" data-ref="22120_45318035_1">
			<img alt="Nan Ji ren 南极人 全棉四件套 纯棉斜纹印花床上用品套件 床单式四件套 （被套200*230cm）似水流年1.5-1.8m床通用" src="staticTheStore/图片/手机排行1.jpg" width="60" height="60" data-imgattr="original">
			<i class="rank_third">3</i>
			<div class="rank_detail">
			<p class="pro_name">Nan Ji ren 南极人 全棉四件套 纯棉斜纹印花床上用品套件 床单式四件套 （被套200*230cm）似水流年1.5-1.8m床通用</p>
			<p class="pro_price" productid="46812634" pmid="54468744" promotionid="" promotiontype="" grouponid="" data-pricedone="1">¥<em>149</em></p>
			</div>
			</a>
			</li>
			
			</ul>
</div>
      	
      </div>
     
     
     <div class="clear">
     	
     </div>
     <!--最底部-->
     <div id="ft_wrap" class="scroll-floor floor7">
     	<div class="ft_wrap_top">
         <a href="javascript:void(0);" >
         	<img src="staticTheStore/图片/正常保障.png"/>
         	<b>正品保障</b>
         	<span>正品行货 放心选购</span>
         </a>
            <a href="javascript:void(0);" >
            	<img src="staticTheStore/图片/满68.png"/>
            	<b>满68包邮</b>
         	<span>满68元 免运费</span>
            </a>
           
               <a href="javascript:void(0);" >
               	<img src="staticTheStore/图片/售后无忧.png"/>
               	<b>售后无忧</b>
         	<span>7天无理由退货</span>
               </a>
                  <a href="javascript:void(0);" >
                  	<img src="staticTheStore/图片/准时送达.png"/>
                  <b>准时送达</b>
         	<span>收货时间由你做主</span>
                  </a>
     	</div>
     	<div class="ft_wrap_center" style="position:relative;left:60px;">
     		<div class="ft_wrap_center_left">
     			<dl>
     				<dt>新手入门</dt>
     				<dd> <a href="javascript:void(0);" >购物流程</a></dd>
     				<dd> <a href="javascript:void(0);" >会员制度</a></dd>
     				<dd><a href="javascript:void(0);" >发票制度</a></dd>
     				<dd><a href="javascript:void(0);" >订单查询</a></dd>
     				<dd><a href="javascript:void(0);" >常见问题</a></dd>
     				
     			</dl>
     			<dl>
     				<dt>新手入门</dt>
     				<dd> <a href="javascript:void(0);" >支付方式</a></dd>
     				<dd> <a href="javascript:void(0);" >货到付款</a></dd>
     				<dd><a href="javascript:void(0);" >网上支付</a></dd>
     				<dd><a href="javascript:void(0);" >银行转账</a></dd>
     				<dd><a href="javascript:void(0);" >礼品卡支付</a></dd>
     				<dd><a href="javascript:void(0);" >其他支付</a></dd>
     			</dl>
     			<dl>
     				<dt>配送服务</dt>
     				<dd> <a href="javascript:void(0);" >配送范围及运费</a></dd>
     				<dd> <a href="javascript:void(0);" >配送进度查询</a></dd>
     				<dd><a href="javascript:void(0);" >自提服务</a></dd>
     				<dd><a href="javascript:void(0);" >商品验收与签收</a></dd>
     				
     				
     			</dl>
     			<dl>
     				<dt>售后保障</dt>
     				<dd> <a href="javascript:void(0);" >退换货政策</a></dd>
     				<dd> <a href="javascript:void(0);" >退换货流程</a></dd>
     				<dd><a href="javascript:void(0);" >退款说明</a></dd>
     				<dd><a href="javascript:void(0);" >延保说明页面</a></dd>
     				<dd><a href="javascript:void(0);" >联系客服</a></dd>
     				
     			</dl>
     			
     		</div>
     		<!--二维码-->
     		<div class="ft_wrap_center_right">
     	  <div class="ft_wrap_center_right_left"></div>
     	  	<p>APP更优惠</p>
     	  	<img src="staticTheStore/图片/APP.png"/>
     		</div>
     		 <div class="ft_wrap_center_right_left"></div>
     	  	<p>加微信查订单</p>
     	  	<img src="staticTheStore/图片/APP.png"/>
     		</div>
     		
     	</div>
     	
     		
     	</div>
     	<!--最底下-->
     	
     	<div id="foot" class="ft_wrap_under">
     		<p class="foot_p	">
     			<a href="javascript:void(0);" >关于一号店</a>|
     			<a href="javascript:void(0);" >我们的团队</a>|
     			<a href="javascript:void(0);" >网站联盟</a>|
     			<a href="javascript:void(0);" >热门搜索</a>|
     			<a href="javascript:void(0);" >友情链接</a>|
     			<a href="javascript:void(0);" >1号点社区</a>|
     			<a href="javascript:void(0);" >商家登录</a>|
     			<a href="javascript:void(0);" >供应商登录</a>|
     			<a href="javascript:void(0);" >放心搜</a>|
     			<a href="javascript:void(0);" >1号店新品</a>|
     			<a href="javascript:void(0);" >开放平台</a>|
     			<a href="javascript:void(0);" >沃尔玛</a>|
     			
     		</p>
     		<p>
     			<a href="javascript:void(0);" >沪ICP备16050468号</a>|
     			<a href="javascript:void(0);" >沪B2-20170039</a>|
     			<a href="javascript:void(0);" >经营证照</a>|
     			<a href="javascript:void(0);" >互联网药品信息服务资格证</a>|
     			<a href="javascript:void(0);" >违法和不良信息举报电话：0514-85899118</a>|
     		</p>
     		<p>
     			<a href="javascript:void(0);" >Copyright© 1号店网上超市 2007-2017，All Rights Reserved</a>
     			
     		</p>
     		<small class="ft_wrap_small">
     			 <span style="display:inline-block;position:relative;width:auto; height: 32px;margin: 0 4px;"></span>
     			 	<img src="staticTheStore/图片/可信网站.png"/>
     			 	<img src="staticTheStore/图片/银联.png"/>
     			 	<img src="staticTheStore/图片/上海.png"/>
     			 	<img src="staticTheStore/图片/网络.png"/>
     			 	<img src="staticTheStore/图片/纠纷.png"/>
     			 	<img src="staticTheStore/图片/视频.png"/>
     			 	<img src="staticTheStore/图片/上海上.png"/>
     			 </span>
     		</small>
     	</div>
     	ft_wrap_center
     </div>
     <script src="staticTheStore/js/左侧悬浮栏.js" type="text/javascript" charset="utf-8"></script>
  
    
      
	</body>
	
   <script type="text/javascript">
    $(".inputtable").keyup(function(){
  var content=$(this).val();
  //如果当前搜索内容为空，无须进行查询
  if(content==""){
   $("#context1").css("display","none");
   return ;
  }
  //由于浏览器的缓存机制 所以我们每次传入一个时间
  var time=new Date().getTime();
  $.ajax("Servlet",{
   type:"get",
   //新建一个名为findBooksAjaxServlet的servlet
 /*   url:"${pageContext.request.contextPath}/servlet/findBooksAjaxServlet", */
 
 //url:"D:/MyEclipse/Workspaces/Ssl/src/com/servlet/Servlet",
   data:{name:content,time:time},
   success:function(data){
    //拼接html
    var res=data.split(",");
    var html="";
    for(var i=0;i<res.length;i++){
     //每一个div还有鼠标移出、移入点击事件
     html+="<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>&nbsp;&nbsp;"+res[i]+"</div>";
    }
    $("#context1").html(html);
    //显示为块级元素
    $("#context1").css("display","block");
   }
  });
 });
 //鼠标移动到内容上
 function changeBackColor_over(div){
  $(div).css("background-color","#CCCCCC");
 }
 //鼠标离开内容
 function changeBackColor_out(div){
  $(div).css("background-color","");
 }
 //将点击的内容放到搜索框
 function setSearch_onclick(div){
  $(".inputtable").val(div.innerText.trim());
  $("#context1").css("display","none");
 }
    </script>

</html>
