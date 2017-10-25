<%@ page language="java" import="java.util.*,com.vo.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>1号店,只为更好的生活</title>

		<link rel="shortcut icon" href="img/icon.png"/>

		<link rel="shortcut icon" href="staticTheStore/img/icon.png"/>
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/querendingdan.css"/>
		<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/querendingdan.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jsAddress.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<a name="top" id="top"></a>
	
		<a name="top"></a>
		<div id="all">
			<div id="top">
				<a id="logo" href="javascript:void(0);"><img src="staticTheStore/img/yhd.png"/></a>
				<div id="bg_head">
					<a id="chakan" href="shoppingcar.html"><b>查看购物车</b></a>
					
				</div>
						<!--<sub>下标</sub> <sup>上标</sup>-->
			</div>
			
			<div class="main">
				<div id="title">
					
					<span>  <font><b>填写核对订单信息</b></font></span>
				</div>
				<div id="content">
					<div id="zhuti">
						<% 
							User user = (User)session.getAttribute("user");
						%>
						<!-- int userid = user.getUserid(); -->
					<form id="shouhuoxinxi" action="DingdanServlet" method="post" class="shouhuoxinxi"><b><span class="t"> 收货信息</span></b><br/>
						<input type="hidden" name="action" value="querendingdan"/>
						<input type="hidden" name="userid" value="4" />
												
						<span class="te">  <div class="xing">* </div> 收 货 人:</span>
						<input type="text" name="uname" id="uname" value="姓名" /><span></span><br/>
						<span class="te">  <div class="xing">* </div> 收货地址:</span>
						<label class="xuanzequyu">
							<select name="select1" id="select1"></select>
							<select name="select2" id="select2"></select>
							<select name="select3" id="select3"></select>
						</label>
						<br/>
						<span class="te">  <div class="xing">* </div> 详细地址:</span>
						<input type="text" name="xiangxidizhi" id="xiangxidizhi" value="街道名称/编号 楼宇名称 单位 房间" /><a id="shuoming" href="">配送说明</a><span></span><br/>
						<span class="te">  <div class="xing">* </div> 手机号码:</span>
						<input type="text" name="phone" id="phone" value="常用手机号码" />
						<span class="te"> 或 固定电话:</span>
						<input type="text" name="quhao" id="quhao" value="区号" />—<input type="text" name="guding" id="guding" value="电话号码" />—<input type="text" name="fenjihao" id="fenjihao" value="分机号" /><span id="phoneSpan"></span><br/>
						<span class="te">     地址标签:</span>
						<input type="text" name="biaoqian" id="biaoqian" value="支持自定义标签" /><span></span><br/>
						<span>           </span><input type="button" class="biaoqian" name="jia" id="jia" value="家" /><span> </span><input type="button" class="biaoqian" name="fumujia" id="fumujia" value="父母家" /><span> </span><input type="button" class="biaoqian" name="gongsi" id="gongsi" value="公司" /><span> </span><input type="button" class="biaoqian" name="xuexiao" id="xuexiao" value="学校" />
						<br/><span>   <input type="checkbox" name="changyong" id="changyong"/> 设为常用地址</span>	
						<br/><input type="button" name="queding" id="queding" value="确定" />
						<br/>
					<hr/>
					</form>
					
					<div class="peisongxinxi"><b><span class="t"> 配送信息</span></b><br/>
					<span>      请先确认"收货信息"</span>
					<hr/></div>
					
					<div class="fapiaoxinxi"><b><span class="t"> 发票信息</span></b><br/>
					<span>      请先确认"配送信息"</span>
					<hr/></div>
					
					<div class="zhifuxinxi"><b><span class="t"> 支付及抵用券信息</span></b><br/>
					<span>      请先确认"发票信息"</span><br/><br/><br/>
					<hr/></div>
					
					<div class="shangpinxinxi"><b><span class="t"> 商品信息</span></b>
					<%
						List<Product> list = (List<Product>)session.getAttribute("list");
						
						double productTotalPrice = 0;	
						int productTotalSum = 0;
						if(list!=null){
							for(Product product:list){
								int shoppingCarSum = product.getShoppingSum();
								double price = product.getPrice();
								double singleProductTotalPrice = price * shoppingCarSum;
								productTotalPrice = productTotalPrice + singleProductTotalPrice;
					%>
						<div >
							<table class="tab">
								<tr class="shouhang">
									<td>包裹</td><td>商品名称</td><td>数 量(个)</td><td >重 量(kg)</td><td>金额小计</td>
								</tr>
								<tr>
								<!-- 好丽友 派 巧克力味涂饰蛋类芯饼 204g/盒（6枚）  -->
									<td>包裹1</td>
									<td><%=product.getPname()%>	不支持无理由退货</td>
									<td><%=shoppingCarSum %> </td>
									<td>0.1 </td>
									<td>¥<%=singleProductTotalPrice %> </td>
								</tr>
							</table>
						</div><hr/>
					<%				
				    		}
				    	}
				    %>
					</div>
					
					<div class="tijiaodingdan">
						<span id="jin_e">商品金额<span><b><%=productTotalPrice %></b></span>元</span><br/>
						<span id="xuzhifu"><b>您需为订单支付<span><%=productTotalPrice %></span>元</b></span><br/>
						<input type="button" name="tijiao" id="tijiao" value="提交订单" />
					</div>
					</div>
				</div>
			</div>
			
			<div id="fixedImg">
				<a href="" class="fankui"><img id="fkh" src="staticTheStore/img/fankuihover.png" alt="用户反馈" title="用户反馈"/><br/><img src="staticTheStore/img/fankui.png"/></a><br/>
				<a href="javascript:void(0)" onclick="document.getElementById('top').scrollIntoView()" class="huidingbu"><img src="staticTheStore/img/fanhuidingbu.png" /><br/><img id="hdb" src="staticTheStore/img/dingbuhover.png" alt="返回顶部" title="返回顶部"/></a><br/>
			</div>
			
			<br/>
			<hr/>
			<div class="copyright">
				<a href="#">沪ICP备16050468号</a><span>  |  </span><a href="#">营业执照</a><br/>
				<p>Copyright© 1号店网上超市 2007-2017， All Rights Reserved</p>
			</div>
		</div>
	</body>
</html>
