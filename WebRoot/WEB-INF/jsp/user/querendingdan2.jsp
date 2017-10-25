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
		<link rel="shortcut icon" href="staticTheStore/img/icon.png"/>
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/querendingdan.css"/>
		<script src="staticTheStore/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="staticTheStore/js/querendingdan2.js" type="text/javascript" charset="utf-8"></script>
		<script src="staticTheStore/js/jsAddress.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<% 
			Order1 order = (Order1)session.getAttribute("order");
			String shouhuoren = order.getShouhuorenname();
			String address = order.getAddress();
			long tel = order.getTel();
			
			Address addrs = (Address)request.getAttribute("addrs");
			String sheng = addrs.getSheng();
			String shi = addrs.getShi();
			String qu = addrs.getQu();
		%>
		<a name="top"></a>
		<div id="all">
			<div id="top">
				<a id="logo" href="#"><img src="staticTheStore/img/yhd.png"/></a>
				<div id="bg_head">
					<a id="chakan" href="javascript:void(0);"><b>查看购物车</b></a>
					
				</div>
					
			</div>
			
			<div class="main">
				<div id="title">
					<span>  <font><b>填写核对订单信息</b></font></span>
				</div>
				<div id="content">
					<div id="zhuti">
					
					<div id="tianhaodizhi">
						<div style="width:930px;height:30px;"><b><span class="t" style="line-height: 30px;"> 收货信息</span></b><br/></div>
						<div id="address">
							<ul>
							<li>
								<div id="address_label">
								<img src="staticTheStore/img/jiaicon.png"/>
								<a href="">编辑</a><em>|</em><a href="">删除</a>
							</div>
							...............................
							<div id="address_info">
								<p><span><b> <%=shouhuoren%></b> 收</span></p>
								<p><span> <%=sheng%>   <%=shi%>  <%=qu%> </span></p>
								<p><span> <%=address.substring(address.indexOf("~")+1) %></span></p>
								<p><span> <%=tel%></span></p>
								<sub class="xiabiao"><img src="staticTheStore/img/xiabiao.png"/></sub>
							</div>	
								</li>
							</ul>
						</div>
						
						<div id="dizhibuxiang"><img src="staticTheStore/img/gankanhao.png"/><span id="buxiang">地址不详，可能影响配送时效</span></div><br/>
						<input type="button" id="xiugaidizhi" value="使用新地址" />
						<hr/>
					</div>
					
					<div class="peisongxinxi"><b><span class="t"> 配送信息</span></b><br/>
					<span>      <b>1号店自营</b></span><br/>
					<table class="tab">
						<tr class="shouhang"><td>包裹</td><td>配送方式</td><td>运费</td><td>备注</td></tr>
						<tr><td>包裹1<a id="kan" href="">(查看)</a></td>
							<td>任意日期（普通快递）</td><td><b>￥20</b></td><td>预计商品下单后09-24送达</td>
						</tr>
					</table>
					<hr/></div>
					
					<div class="fapiaoxinxi"><b><span class="t"> 发票信息</span></b><a id="xiugai" href="">[修改]</a><br/>
					<span>      发票类型：不需要发票<br/>      商品清单：需要
						</span>
					<hr/></div>
					
					<div class="zhifuxinxi"><b><span class="t"> 支付及抵用券信息</span></b><br/>
					<span>   <img src="staticTheStore/img/jiahao.png"/> <b>使用抵用券</b>（您当前订单无可用抵用券）										    		     <a href="" id="jihuo">激活抵用券</a></span><br/>
					<span>      <b>使用礼品卡余额</b> (仅限1号店自营商品)										已有礼品卡？ <a href="" id="lipinka">使用礼品卡激活充值</a></span><br/> 
					<span>      您当前可用余额¥0，最多可用¥0 您礼品卡可用余额为零，无法使用礼品卡余额支付
      <b>使用账户余额</b><br/>      您当前有¥0可用余额 您账户余额为零，无法使用账户余额
      <b>使用1号金币</b>
           您的账户共有0个，最多可以使用0个
</span>

			<ul id="allUl">
				<li>
					<div class="fukuanfangshi" id="wangshangzhifu">
			<span>     <input type="radio" name="zhifufangshi" id="" value="" checked="checked"/><b> 网上支付</b>                 为了保证及时处理您的订单，请您下单后尽快付款。</span>
			</div>
				</li>
				
				<li>
					<div class="fukuanfangshi">
			<span>     <input type="radio" disabled="disabled" name="zhifufangshi" id="" value=""/><b> 货到付款</b>                 任意方式支持现金、刷银行卡、刷斯玛特卡和杉德卡                                                        <span id="zhankai">展开︿</span> </span>
			</div>
			<div class="fukuanfangshi" id="fuxianjin">
				<span>    	 <input type="radio" disabled="disabled" name="zhifufangshi" id="" value="" />    货到付现金      	    很抱歉，不提供货到付现金的服务，请选择其他支付方式。      </span>
			</div>
				</li>
				
				<li>
					<div class="fukuanfangshi">
			<span>     <input type="radio" name="zhifufangshi" disabled="disabled" id="" value="" /><b> 银行转账</b>                 订单金额小于￥5000，不支持银行转账</span>
			</div>
				</li>
			</ul>
			
					<br/><br/>
					<hr/></div>
					
					<div class="shangpinxinxi"><b><span class="t"> 商品信息</span></b>
						<div >
							<table class="tab">
								<tr class="shouhang">
									<td>包裹</td><td>商品名称</td><td>数 量(个)</td><td >重 量(kg)</td><td>金额小计</td>
								</tr>
								<tr>
									<td>包裹1</td><td>	好丽友 派 巧克力味涂饰蛋类芯饼 204g/盒（6枚） 
										不支持无理由退货</td><td>2 </td><td>0.252 </td><td>¥18.4 </td>
								</tr>
							</table>
							<div id="xiadan"><img id="warning" src="staticTheStore/img/warning.png" alt="" /><span>  您的订单含不支持“7天无理由退货”商品，请确认后下单</span></div>
						</div>
					<hr/></div>
					
					<div class="tijiaodingdan">
						<span id="jin_e">           商品金额<span><b>18.4</b></span>元</span><br/>
						<span id="xuzhifu"><b>您需为订单支付<span>18.4</span>元</b></span><br/>
						<form action="DingdanServlet" method="post">
							<input type="hidden" name="action" value="submitDingdan" />
							<input type="hidden" name="orderid" value="<%=order.getOrderid() %>" />
							<input type="submit" name="tijiao" id="tijiao" value="提交订单" />
						</form>
						
					</div>
					</div>
				</div>
				
				
			</div>
			
			
			<div id="fixedImg">
				
				<a href="" class="fankui"><img id="fkh" src="staticTheStore/img/fankuihover.png" alt="用户反馈" title="用户反馈"/><br/><img src="staticTheStore/img/fankui.png"/></a><br/>
				<a href="#top" class="huidingbu"><img src="staticTheStore/img/fanhuidingbu.png" /><br/><img id="hdb" src="staticTheStore/img/dingbuhover.png" alt="返回顶部" title="返回顶部"/></a><br/>
				
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
