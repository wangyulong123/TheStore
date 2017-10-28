<%@page import="com.page.PageInfo"%>
<%@ page language="java" import="java.util.*,com.vo.*,com.service.*,com.servlet.*,com.page.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
		
		<title>我的1号店</title>
		
		<link href="${pageContext.request.contextPath }/css/css/gerenzhongxin.css" rel="stylesheet" type="text/css" />
		
		<script src="${pageContext.request.contextPath }/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/js/new_yihaodian_js.js" type="text/javascript" charset="utf-8"></script>
		
	</head>
	
	<body>
			<%
				List<Order1> order1 = (List<Order1>)request.getAttribute("list");
				
				PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
				
				int i;
			%>		
			<div id="top_top">
				<div class="top_top_all">
					<a class="yihaoshouye" href="http://www.yhd.com">
						<i class="iconfont">&#xe612;</i>
						<span>1号店首页</span>
					</a>
				
					<div class="top_top_dizhi">
						<div class="tou">
							<i class="iconfont">&#xe603;</i>
							<span>送货地址:</span>
							<em>上海</em>
						</div>
<!--================================================================================-->
						<div class="peisongdizhi">
							<div id="search_city">
								<b>搜索城市：</b><input type="text" name="city" id="city" placeholder="请输入城市名称" /><br/>
							</div>
							
							<div id="hot_city">
								<b>热门城市：</b>
								<div id="hot_city_li" >
									<li>
										<a>上海市</a>
										<a>北京市</a>
										<a>广州市</a>
										<a>深圳市</a>
										<a>南京市</a>
										<a>杭州市</a>
										<a>武汉市</a>
										<a>成都市</a>
										<a>重庆市</a>
										<a>苏州市</a>
									</li>
									<li>
										<a>天津市</a>
										<a>合肥市</a>
										<a>温州市</a>
										<a>无锡市</a>
										<a>宁波市</a>
										<a>常州市</a>
									</li>
								</div>
							</div>
							
							<div class="zimuchaxun">
								<b>按字母查：</b>	
								<div class="kuaijie_search" >
									<li class="zimu">
										<a>A</a>
										<a>B</a>
										<a>C</a>
										<a>D</a>
										<a>E</a>
										<a>F</a>
										<a>G</a>
										<a>H</a>
										<a>I</a>
										<a>J</a>
										<a>K</a>
										<a>L</a>
										<a>M</a>
										<a>N</a>
										<a>O</a>
										<a>P</a>
										<a>Q</a>
										<a>R</a>
										<a>S</a>
										<a>T</a>
										<a>U</a>
										<a>V</a>
										<a>W</a>
										<a>X</a>
										<a>Y</a>
										<a>Z</a>
									</li>
								</div>
							</div>
						
							<div id="juti_city">
								
							</div>
						</div>

					</div>
<!--================================================================================-->				
					<div class="top_top_right">
					
						<ul class="top_top_right_ul">
							<li class="li_one">
								<span>hi,</span>
								<% String name;
									name = order1.get(0).getShouhuorenname();
								%>
								
								<a><%=name%></a>
								<span class="duanwei">新晋</span>
								
								<div class="xinjin_div">
									<div id="xinjin_div_top">
										<div id="xinjin_div_top_left">
											<img src="${pageContext.request.contextPath }/img/img/renwu.gif"/>
										</div>
										
										<a id="name"><%=name%></a>
										
										<div id="xinjin_zhengwen">
											<a>新晋</a>
										</div>
										
										<a class="tuichu">退出登录</a>
										
									</div>
									
									<div id="zunxiang">
										<a>我尊享的<em>4</em>项特权</a>
									</div>
									
									<div id="tequanxiangqing">
										<a href="">
											<i class="iconfont">&#xe693;</i>
											<p>一号金币</p>
										</a>
										
										<a href="">
											<i class="iconfont">&#xe695;</i>
											<p>电子杂志</p>
										</a>
										
										<a href="">
											<i class="iconfont">&#xe601;</i>
											<p>在线客服</p>
										</a>
										
										<a href="">
											<i class="iconfont">&#xe695;</i>
											<p>退换无忧</p>
										</a>
									</div>
								
								</div>
							</li>
							<li class="dingdan">
								<i class="iconfont">&#xe633;</i>
								<a>我的订单</a>
							</li>
							<li class="kefu">
								<span>客户服务</span>
								<div class="kefu_juti" >
									<div>
										包裹跟踪
									</div>
					
									<div>
										在线退换货
									</div>
			
								</div>	
							</li>
							
							<li class="qifu">企业服务</li>
						</ul>
					</div>
					
				</div>
			</div>
			
			<div id="top_heise">
				<div id="zhengshi">
					<div id="logo">
						<img src="${pageContext.request.contextPath }/img/img/logo.png" />
					</div>
					
					<div id="shouye_jinrong">
						<ul class="shouye_jinrong_ul">
							<li class="shouye_jinrong"><a>首页</a></li>
							<li class="shezhi">
								<a>个人设置</a>
								<span class="shezhixiala">
									<div id="one">
										<a>个人资料</a>
									</div>
									<div id="two">
										<a>账户安全设置</a>
									</div>
									<div id="three">
										<a>地址管理</a>
									</div>
								</span>
							</li>
							<li class="jinrong"><a>1号金融</a></li>
						</ul>
					</div>
					
					<div id="top_sou_suo">
						<input type="search" name="sousuo" id="sousuo" placeholder="搜全站" />
					</div>
				</div>
			</div>
			
			<div id="middle">
				<div id="middle_left">
					<div id="middle_middle_left_two">
						<div id="middle_middle_left_two_A">
							<i class="iconfont">&#xe633;</i>
							<b>我的交易</b>
						</div>
						
						<ul>
							<li>1号店订单</li>
						</ul>
					</div>
					
					<div id="middle_middle_left_three">
						<div id="middle_middle_left_three_A">
							<i class="iconfont">&#xe630;</i>
							<b>会员资料</b>
						</div>
						
						<ul>
							<li>我的联名卡</li>
							<li>个人资料</li>
							<li>地址管理</li>
							<li>安全设置</li>
						</ul>
					</div>
					
					<div id="middle_middle_left_four">
						<div id="middle_middle_left_four_A">
							<i class="iconfont">&#xe613;</i>
							<b>我的评论</b>
						</div>
						
						<ul>
							<li>评论商品</li>
						</ul>
					</div>
					
					<div id="middle_middle_left_five">
						<div id="middle_middle_left_five_A">
							<i class="iconfont">&#xe630;</i>
							<b>我的资产</b>
						</div>
						
						<ul>
							<li>我的金币</li>
							<li>我的抵用券</li>
							<li>我的礼品卡</li>
							<li>我的余额</li>
						</ul>
					</div>
					
					<div id="middle_middle_left_six">
						<div id="middle_middle_left_six_A">
							<i class="iconfont">&#xe631;</i>
							<b>我的服务</b>
						</div>
						
						<ul>
							<li>发票中心</li>
							<li>在线退换货</li>
						</ul>
					</div>
				</div>
			
				<div id="middle_right">
			<!--遍历所有订单，并且分页  -->
					<% 
						for(i=0;i<order1.size();i++){
					%>
						<div class="QBDD">
							<div class="QBDD_li_div_left">
								<a class="tupian">
									<img src="${pageContext.request.contextPath }/img/img/xiaotu.jpg">
								</a>
										
								<div id="xiangqing">
									<li>
											<%
												if(order1.get(i).getOrderstatus()==0){
											%>
													<span>等待付款</span>
											<%	
												}else{
											%>
													<span>付款成功</span>
											<%	
												}
											%>
										&nbsp;¥：<%=order1.get(i).getOrderprice() %>
									</li>
									<li>订单编号：<%=order1.get(i).getOrderid() %></li>
									<li>货主姓名: <%=order1.get(0).getShouhuorenname() %></li>
									<li>下单时间：<%=order1.get(i).getOrdertime() %></li>
									<li>联系电话：<%=order1.get(i).getTel() %></li>
									<li>联系地址：<%=order1.get(i).getAddress() %></li>			
								</div> 
									<div class="daojishi" >
										<%
											if(order1.get(i).getOrderstatus()==0){		
										%>
											<a class="quxiaodingdan">取消订单</a>
											<a class="dianjianniu">立即付款</a>
										<%
											}else if(order1.get(i).getOrderstatus()==1){
										%>
											<a class="quxiaodingdan">正在发货</a>
											<a class="dianjianniu">申请退款</a>
										<%
											}else if(order1.get(i).getOrderstatus()==2){
										%>
											<a class="quxiaodingdan">已经发货</a>
											<a class="dianjianniu">申请退货</a>
										<%	
											}else if(order1.get(i).getOrderstatus()==3){
										%>
											<a class="quxiaodingdan">删除订单</a>
											<a class="dianjianniu">再次购买</a>
										<%
											}
										 %>
												
									</div>
							</div>
						</div>
					<%	
					}
					%>
					<div id="tiaozhuan">
						共&nbsp<span><%=pageInfo.getTotalPageCount() %></span>&nbsp页&nbsp&nbsp
						第&nbsp<span><%=pageInfo.getCurrentPage() %></span>&nbsp页
						<a id="last"  href="/yihaodian/Order1Servlet?action=getRecordCountFenYe&target=QuanBuDingDan&requestPage=<%=pageInfo.getPreviousPage() %>&shouhuorenname=<%=name%>">上一页</a>
						<a id="next"  href="/yihaodian/Order1Servlet?action=getRecordCountFenYe&target=QuanBuDingDan&requestPage=<%=pageInfo.getNextPage() %>&shouhuorenname=<%=name%>">下一页</a>
						<%-- 跳<input id="yekuang" type="text" name= "requestPage">页
						<input id="anniu" value="跳转" type="submit" onclick="tiaozhuan(<%=name%>)"/> --%>
						<select id="yekuang" name="requestPage">
				    		<%
				    			int TotalPageCount = pageInfo.getTotalPageCount();
				    			
				    			int currentPage = pageInfo.getCurrentPage();
				    			for(i=1;i<=TotalPageCount;i++){
				    				
				    				if(currentPage==i){
				    					out.println("<option selected='selected'>" + i + "</option>");
				    				}else{
				    					out.println("<option>" + i + "</option>");
				    				}	
				    			}
				    		 %>
				    	</select>
						<input id="anniu" value="跳转" type="submit" onclick="tiaozhuan(<%=name%>)"/>
					</div>
				</div>
					
			</div>
		
<!------------------------------------------------------------------------------------------------>
			<div class="botton_botton">
				<div id="bottom_top">	
					<a class="zhengpingbaozhang">
						<img src="${pageContext.request.contextPath }/img/img/zheng.jpg"/>
						<b>正品保障</b>
						<span>正品行货&nbsp;放心选购</span>
					</a>
					
					<a class="baoyoufuwu">
						<img src="${pageContext.request.contextPath }/img/img/bao.jpg"/>
						<b>满68包邮</b>
						<span>满68元&nbsp;免运费</span>
					</a>
					
					<a class="shouhouwuyou">
						<img src="${pageContext.request.contextPath }/img/img/shou.jpg"/>
						<b>售后无忧</b>
						<span>7天无理由退货</span>
					</a>
					
					<a class="zhunshisongda">
						<img src="${pageContext.request.contextPath }/img/img/zhun.jpg"/>
						<b>准时送达</b>
						<span>收货时间由你做主</span>
					</a>
				</div>
				<div id="bottom_middle">
					<div id="bottom_middle_left">
						<dl>
							<dt>新手入门</dt>
							<dd><a>购物流程</a></dd>
							<dd><a>会员制度</a></dd>
							<dd><a>订单查询</a></dd>
							<dd><a>发票制度</a></dd>
						</dl>
						
						<dl>
							<dt>支付方式</dt>
							<dd><a>货到付款</a></dd>
							<dd><a>网上支付</a></dd>
							<dd><a>银行转账</a></dd>
							<dd><a>礼品卡支付</a></dd>
							<dd><a>其他支付</a></dd>
						</dl>
						
						<dl>
							<dt>配送服务</dt>
							<dd><a>配送进度查询</a></dd>
							<dd><a>商品验货与签收</a></dd>
						</dl>
						
						<dl>
							<dt>售后保障</dt>
							<dd><a>退换货政策</a></dd>
							<dd><a>联系客服</a></dd>
						</dl>
					
					</div>
					
					<div id="bottom_middle_right">
						<div id="erweima">
							<p>APP更优惠</p>
							<img src="${pageContext.request.contextPath }/img/img/app.png"/>
						</div>
						
						<div id="erweima">
							<p>加微信查订单</p>
							<img src="${pageContext.request.contextPath }/img/img/search.jpg"/>
						</div>
					</div>
				</div>
				<div id="bottom_bottom">
					<p id="bottom_bottom_p">
						<a>沪IC备16050468号</a>
						|
						<a>经营证照</a>
						|
						<a>互联网药品服务资格证</a>
						|
						<a>违法和不良信息举报电话：0514-85899118</a>
						|
						<a>沪B2-20170039</a>
							
					</p>	
				
					<p id="bottom_cop_p">
						<a>Copyright© 1号店网上超市 2007-2017，All Rights Reserved</a>
					</p>	
				
					<p id="bottom_daodi">
						<a href="https://www.95516.com/static/union/pages/index/index.html" target="_blank" id="web_one"><img src="${pageContext.request.contextPath }/img/img/a.jpg"/></a>
						<a href="http://www.gsxt.gov.cn/index.html" target="_blank" id="web_two"><img src="${pageContext.request.contextPath }/img/img/b.jpg"/></a>
						<a href="http://www.zx110.org/" target="_blank" id="web_three"><img src="${pageContext.request.contextPath }/img/img/c.jpg"/></a>
						<a href="http://www.12377.cn/" target="_blank" id="web_four"><img src="${pageContext.request.contextPath }/img/img/d.jpg"/></a>
						<a href="http://shwg.dianping.com/index.html" target="_blank" id="web_five"><img src="${pageContext.request.contextPath }/img/img/e.jpg"/></a>
						<a href="http://www.shjbzx.cn/" target="_blank" id="web_six"><img src="${pageContext.request.contextPath }/img/img/f.jpg"/></a>
						<a href="https://credit.cecdc.com/CX20150608010268010812.html" target="_blank" id="web_senven"><img src="${pageContext.request.contextPath }/img/img/g.jpg"/></a>
						<a href="https://ss.knet.cn/verifyseal.dll?sn=e13050631010040492h5mq000000&ct=df&a=1&pa=500267" target="_blank" id="web_eight"><img src="${pageContext.request.contextPath }/img/img/h.png"/></a>
					</p>		
				</div>
			</div>

			<script type="text/javascript">
				function tiaozhuan(name){
					var requestPageValue = $("#yekuang").val();	
					location.assign("/yihaodian/Order1Servlet?action=getRecordCountFenYe&target=QuanBuDingDan&shouhuorenname=<%=name%>&requestPage="+ requestPageValue);
				}
			</script>

	</body>
</html>