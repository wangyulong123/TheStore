<%@ page language="java" import="java.util.*,com.vo.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>我的购物车-1号店，只为更好的生活</title>
		<link rel="shortcut icon" href="img/icon.png" />
		<link rel="stylesheet" type="text/css" href="css/theStore.css" />
		<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/theStore.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery.alterBorderColor.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/fdj.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/distpicker.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/distpicker.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			a {
				text-decoration:none;
			}
			#divmiddle {
				height: 125px;
				background: #f5f5f5;
				margin-bottom: 20px;
				padding-top: 20px;
			}
			
			#divmiddle1 {
				width: 1210px;
				margin: 0px auto;
				position: relative;
				left: 20px;
				top: 180px;
			}
			
			#success-top {
				position: relative;
				padding-left: 35px;
				margin-bottom: 20px;
			}
			
			.succ-icon {
				position: absolute;
				top: 0;
				left: 0;
				display: block;
				width: 25px;
				height: 25px;
				overflow: hidden;
				background: url(img/images2/addtocart-icons.png) 0 0 no-repeat;
			}
			
			.ftx-02,
			.ftx02 {
				color: #71b247;
			}
			
			.ftx-h3 {
				font-size: 18px;
				line-height: 25px;
				font-weight: 400;
				font-family: "Microsoft YaHei";
			}
			
			.success-cont {
				font-family: "Microsoft YaHei";
			}
			
			.p-item .p-img {
				float: left;
				width: 60px;
				margin-right: 10px;
				border: 1px solid #e8e8e8;
				overflow: hidden;
			}
			
			.p-item .p-info {
				float: left;
				width: 350px;
				margin: 0;
			}
			
			.p-item .p-name {
				width: 100%;
				line-height: 28px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				font-size: 14px;
			}
			
			.p-item .p-extra {
				display: inline-block;
				display: block;
				color: #aaa;
			}
			
			.p-item .txt {
				float: left;
				max-width: 135px;
				margin-right: 5px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				_display: inline;
				font-family: "Microsoft YaHei";
			}
			
			.p-item .clr {
				display: block;
				overflow: hidden;
				clear: both;
				height: 0;
				line-height: 0;
				font-size: 0;
			}
			
			.p-name a {
				color: #333;
				font-family: "Microsoft YaHei";
			}
			
			.p-item .btn-tobback {
				padding: 0 30px;
				margin-right: 7px;
				*margin-right: 7px;
				background: #fff;
				color: #ED1B23;
				border: 1px solid #fff;
			}
			
			.p-item .btn-tobback {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				height: 34px;
				line-height: 36px;
				font-size: 16px;
				vertical-align: middle;
				font-family: "Microsoft YaHei";
			}
			
			.p-item .btn-addtocart {
				position: relative;
				width: 140px;
				padding-left: 30px;
				background: #ED1B23;
				border: 1px solid #ED1B23;
				color: #fff;
				display: inline-block;
				*display: inline;
				*zoom: 1;
				height: 34px;
				line-height: 36px;
				font-size: 16px;
				vertical-align: middle;
				font-family: "Microsoft YaHei";
			}
			
			.btn-addtocart b {
				position: absolute;
				top: 8px;
				right: 15px;
				width: 10px;
				height: 20px;
				overflow: hidden;
				background: url(img/images2/addtocart-icons.png) -20px -81px no-repeat;
			}
			
			#p-info-success {
				position: relative;
				width: 400px;
				left: 938px;
				top: -37px;
			}
			
			#buyother {
				position: relative;
				width: 1210px;
				margin: 0px auto;
				height: 662px;
				z-index: -1;
			}
			
			#needother {
				width: 1210px;
				margin: 0px auto;
				height: 331px;
			}
			
			#similer {
				overflow: visible;
			}
			
			.m1 {
				font-family: "Microsoft YaHei";
			}
			
			.m1 .mt {
				display: inline-block;
				display: block;
				height: 40px;
				line-height: 40px;
			}
			
			.m1 .mt h3 {
				float: left;
				font-size: 14px;
				color: #333;
			}
			
			.m1 .mt .extra-r {
				float: right;
			}
			
			.goods-list-tab .s-item {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 8px;
				height: 8px;
				overflow: hidden;
				background: #aaa;
				vertical-align: middle;
				-webkit-border-radius: 4px;
				-moz-border-radius: 4px;
				border-radius: 4px;
			}
			
			.goods-list-tab .curr {
				width: 26px;
				background: #e4393c;
			}
			
			#allboth {
				width: 1210px;
				height: 300px;
				/*background-color: #ED1B23;*/
				font: 12px/150% Arial, Verdana, "\5b8b\4f53";
			}
			
			#alllist {
				position: absolute;
				z-index: 1;
				opacity: 1;
			}
			
			#alllist>ul {
				display: block;
				width: 100%;
				height: 100%;
				list-style: none;
			}
			
			#alllist li {
				float: left;
			}
			/*#item:hover{
				border: 1px solid #FF0000;
			}*/
			
			#item {}
			
			.item1 {
				padding: 20px;
				width: 200px;
				position: relative;
				background: #fff;
				margin: -1px 0 0 -1px;
				border: 1px dotted #cacaca;
				overflow: hidden;
				font-family: "Microsoft YaHei";
				//background-color: gray;
			}
			
			.item2 {
				z-index: 1;
				border: 1px solid #C91623;
			}
			
			#p-img {
				width: 160px;
				margin: 0 auto;
			}
			
			#p-img>a {
				color: #666;
				text-decoration: none;
			}
			
			#p-img img {
				width: 160px;
				height: 160px;
			}
			
			#p-name {
				width: 200px;
				height: 36px;
				line-height: 18px;
				margin: 5px 0;
				overflow: hidden;
			}
			
			#p-name a {
				color: #333;
				text-decoration: none;
			}
			
			#price {
				width: 100%;
				height: 19px;
				overflow: hidden;
				text-align: left;
			}
			
			#price>strong {
				font-size: 14px;
				color: #d91f20;
				font-family: verdana;
				font-weight: 400;
			}
			
			#price em {
				font-style: normal;
			}
			
			#price i {
				font-style: normal;
				font-family: arial;
			}
			
			#donation {
				color: #fff;
				background: #e4393c;
				padding: 0 2px;
				margin-right: 2px;
				font-size: 12px;
			}
			
			#p-btn {
				margin: 15px 0 0;
				text-align: center;
			}
			
			.btn-append {
				display: inline-block;
				height: 28px;
				line-height: 28px;
				padding: 0 55px;
				border: 1px solid #999;
				//color: #666;
				text-align: center;
				border-radius: 2px;
				text-decoration: none;
			}
			#ft_wrap{
				position:relative;
				left:50px;
			}
		</style>
	</head>

	<body>
		<div id="wholeDiv">
			<div id="loginDiv">
				<span>Hi,请</span>
				<a href="#">登录</a>
				<a class="regist" href="#">注册</a>
				<div id="orderDiv">
					<a href="#" target="_blank">我的订单</a>
				</div>
				<div class="secmenuDiv">
					<ul class="nav">
						<li>
							<a href="" target="_blank">充值中心</a>
							<ul>
								<li>
									<a href="" target="_blank">话费充值</a>
								</li>
								<li class="line_bottom">
									<a href="" target="_blank">流量充值</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="" target="_blank">客户服务</a>
							<ul>
								<li>
									<a href="" target="_blank">包裹跟踪</a>
								</li>
								<li>
									<a href="" target="_blank">常见问题</a>
								</li>
								<li>
									<a href="" target="_blank">在线退换货</a>
								</li>
								<li class="line_bottom">
									<a href="" target="_blank">配送范围</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="" target="_blank">网站导航</a>
							<ul>
								<li>
									<a href="" target="_blank">1号商城</a>
								</li>
								<li>
									<a href="" target="_blank">1号社区</a>
								</li>
								<li>
									<a href="" target="_blank">网站联盟</a>
								</li>
								<li>
									<a href="" target="_blank">招商通道</a>
								</li>
								<li>
									<a href="" target="_blank">企业采购</a>
								</li>
								<li class="line_bottom">
									<a href="" target="_blank">充值中心</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div id="logoDiv" style="background-color:#fff;">
				<div id="yiHaoDianDiv">
					<a href="#"><img src="img/1号店自营.png" width="200px" height="110px" /></a>
				</div>
				<div id="searchText">
					<form action="#" method="post">
						<input type="text" id="search" value="请输入关键词" style="width: 668px" onfocus="form1();" onblur="form2();" />
					</form>
				</div>
				<div id="fangDaJing">
					<a href="#"><img src="img/放大镜.png" /></a>
				</div>
				<div id="shoppingCart">
					<div id="lianJie">
						<a href="#"><img src="img/小车.png" /></a>
					</div>
					<a href="#">购物车</a>
				</div>
				<div id="many1">
					<a href="#" target="_blank">单反相机&nbsp;&nbsp;</a>
					<a href="#" target="_blank">nikang&nbsp;&nbsp;</a>
					<a href="#" target="_blank">单反尼康&nbsp;&nbsp;</a>
					<a href="#" target="_blank">佳能800d&nbsp;&nbsp;</a>
					<a href="#" target="_blank">尼康5500相机&nbsp;&nbsp;</a>
					<a href="#" target="_blank">尼康810&nbsp;&nbsp;</a>
					<a href="#" target="_blank">尼康d7500&nbsp;&nbsp;</a>
					<a href="#" target="_blank">单反佳能&nbsp;&nbsp;</a>
					<a href="#" target="_blank">佳能单反相机&nbsp;&nbsp;</a>
				</div>
				<div id="list_category">
					<div id="category">
						<a href="#">所有商品分类</a>
						<img src="img/白色向下箭头.png" />
					</div>
					<div id="listDiv">
						<div><img src="img/list_picture.png" /></div>
						<ul>
							<li>
								<a href="#" title="全球进口">全球进口</a>
							</li>
							<li>
								<a href="#" title="食品饮料">食品饮料</a>/
								<a href="#" title="酒">酒</a>/
								<a href="#" title="生鲜">生鲜</a>
							</li>
							<li>
								<a href="#" title="母婴">母婴</a>/
								<a href="#" title="玩具">玩具</a>/
								<a href="#" title="童装">童装</a>
							</li>
							<li>
								<a href="#" title="纸巾">纸巾</a>/
								<a href="#" title="厨卫清洁">厨卫清洁</a>
							</li>
							<li>
								<a href="#" title="家居">家居</a>/
								<a href="#" title="家纺">家纺</a>/
								<a href="#" title="家装">家装</a>/
								<a href="#" title="宠物">宠物</a>
							</li>
							<li>
								<a href="#" title="美妆个人清洁">美妆个人清洁</a>
							</li>
							<li>
								<a href="#" title="女装">女装</a>/
								<a href="#" title="男装">男装</a>/
								<a href="#" title="内衣">内衣</a>/
								<a href="#" title="珠宝">珠宝</a>
							</li>
							<li>
								<a href="#" title="鞋靴">鞋靴</a>/
								<a href="#" title="箱包">箱包</a>/
								<a href="#" title="户外运动">户外运动</a>
							</li>
							<li>
								<a href="#" title="手机">手机</a>/
								<a href="#" title="数码">数码</a>/
								<a href="#" title="电脑办公">电脑办公</a>
							</li>
							<li>
								<a href="#" title="家用电器/汽车用品">家用电器/汽车用品</a>
							</li>
							<li>
								<a href="#" title="医药/保健滋补/成人">医药/保健滋补/成人</a>
							</li>
							<li>
								<a href="#" title="图书">图书</a>
							</li>
						</ul>
					</div>
				</div>

				<div id="many2">
					<pre><a href="#" target="_blank">1号抢购      </a><a href="#" target="_blank">1号团      </a><a href="#" target="_blank">领券中心      </a><a href="#" target="_blank">商城优选      </a><a href="#" target="_blank">全球进口      </a><a href="#" target="_blank">1号生鲜      </a><a href="#" target="_blank">美妆馆      </a><a href="#" target="_blank">家居馆      </a><a href="#" target="_blank">电器城      </a></pre>
				</div>
			</div>

			<div id="divmiddle">
				<div id="divmiddle1">
					<div id="success-top">
						<b class="succ-icon"></b>
						<h3 class="ftx-02 ftx-h3">商品已成功加入购物车！</h3>
					</div>
					<div class="p-item">
						<div class="p-img">
							<a href="//item.jd.com/1514838.html" target="_blank">
								<!-- img/images2/show11.jpg -->
								<img src="img/productImage/${product.shoppingCarImg} "/>
							</a>
						</div>
						<div class="p-info">
							<div class="p-name">
								<a href="#" target="_blank" title="${product.pname}">${product.pname}</a>
							</div>
							<%-- <%
							String count = request.getParameter("count"); 
							%> --%>
							<div class="p-extra">
								<span class="txt" title="粉">颜色：粉</span><span class="txt" title="全网通">尺码：全网通</span><span class="txt">/  数量：${product.shoppingSum }></span>
							</div>
						</div>
						<div class="clr"></div>
						<div id="p-info-success">
							<a class="btn-tobback" href="#" onclick="window.history.back();">返回</a>
							<a class="btn-addtocart" href="ShoppingCarServlet?action=queryShoppingCart" id="GotoShoppingCart"><b></b>去购物车结算</a>
						</div>
					</div>

					<!--中间推荐部分-->
					<div id="buyother">
						<div id="similer" class="m1">
							<div class="mt">
								<h3> 购买了该商品的用户还购买了</h3>
								<div class="extra-r">
									<div class="goods-list-tab">
										<a href="#none" class="s-item curr">&nbsp;</a>
										<a href="#none" class="s-item">&nbsp;</a>
										<a href="#none" class="s-item">&nbsp;</a>
									</div>
								</div>
							</div>
							<div id="allboth">
								<div id="alllist">
									<ul>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother1.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>29.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother2.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>26.40</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother3.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>49.10</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother4.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>22.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother5.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>99.99</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother6.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>36.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother7.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>22.99</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother8.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>22.60</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother9.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>32.40</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother10.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>29.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="needother">
						<div id="similer" class="m1">
							<div class="mt">
								<h3>您可能还需要</h3>
								<div class="extra-r">
									<div class="goods-list-tab">
										<a href="#none" class="s-item curr">&nbsp;</a>
										<a href="#none" class="s-item">&nbsp;</a>
										<a href="#none" class="s-item">&nbsp;</a>
									</div>
								</div>
							</div>
							<div id="allboth">
								<div id="alllist">
									<ul>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother1.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>29.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother2.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>26.40</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother3.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>49.10</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother4.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>22.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>
										<li>
											<div id="item" class="item1">
												<div id="p-img">

													<a href="http://item.jd.com/1502757200.html">
														<img src="img/images2/buyother5.jpg" />
													</a>
												</div>
												<div id="p-name">
													<a href="http://item.jd.com/1502757200.html"> 阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版 5.7英寸 玫红色</a>
												</div>
												<div id="price">
													<strong>
									<em>￥</em>
									<i>22.90</i>
								</strong>
													<a id="donation">赠品</a>
												</div>
												<div id="p-btn">
													<a class="btn-append">
														<b class="b1"></b> 加入购物车
													</a>
												</div>
											</div>
										</li>

									</ul>
								</div>
							</div>
						</div>
					</div>

					<!--最底部-->
					<div id="ft_wrap" class="scroll-floor floor7">
						<div class="ft_wrap_top">
							<a href="#">
								<img src="图片/正常保障.png" />
								<b>正品保障</b>
								<span>正品行货 放心选购</span>
							</a>
							<a href="#">
								<img src="图片/满68.png" />
								<b>满68包邮</b>
								<span>满68元 免运费</span>
							</a>

							<a href="#">
								<img src="图片/售后无忧.png" />
								<b>售后无忧</b>
								<span>7天无理由退货</span>
							</a>
							<a href="#">
								<img src="图片/准时送达.png" />
								<b>准时送达</b>
								<span>收货时间由你做主</span>
							</a>
						</div>
						<div class="ft_wrap_center">
							<div class="ft_wrap_center_left">
								<dl>
									<dt>新手入门</dt>
									<dd>
										<a href="#" style="color: black;">购物流程</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">会员制度</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">发票制度</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">订单查询</a>
									</dd>
									<dd>
										<a href="" style="color: black;">常见问题</a>
									</dd>

								</dl>
								<dl>
									<dt>新手入门</dt>
									<dd>
										<a href="#" style="color: black;">支付方式</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">货到付款</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">网上支付</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">银行转账</a>
									</dd>
									<dd>
										<a href="" style="color: black;">礼品卡支付</a>
									</dd>
									<dd>
										<a href="" style="color: black;">其他支付</a>
									</dd>
								</dl>
								<dl>
									<dt>配送服务</dt>
									<dd>
										<a href="#" style="color: black;">配送范围及运费</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">配送进度查询</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">自提服务</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">商品验收与签收</a>
									</dd>

								</dl>
								<dl>
									<dt>售后保障</dt>
									<dd>
										<a href="#" style="color: black;">退换货政策</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">退换货流程</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">退款说明</a>
									</dd>
									<dd>
										<a href="#" style="color: black;">延保说明页面</a>
									</dd>
									<dd>
										<a href="" style="color: black;">联系客服</a>
									</dd>

								</dl>

							</div>
							<!--二维码-->
							<div class="ft_wrap_center_right">
								<div class="ft_wrap_center_right_left" </div>
									<p>APP更优惠</p>
									<img src="图片/APP.png" />
								</div>
								<div class="ft_wrap_center_right_left" </div>
									<p>加微信查订单</p>
									<img src="图片/APP.png" />
								</div>

							</div>

						</div>
						<!--最底下-->
						<div id="foot" class="ft_wrap_under">
							<p class="foot_p	">
								<a href="#">关于一号店</a>|
								<a href="#">我们的团队</a>|
								<a href="#">网站联盟</a>|
								<a href="#">热门搜索</a>|
								<a href="#">友情链接</a>|
								<a href="#">1号点社区</a>|
								<a href="#">商家登录</a>|
								<a href="#">供应商登录</a>|
								<a href="#">放心搜</a>|
								<a href="#">1号店新品</a>|
								<a href="#">开放平台</a>|
								<a href="#">沃尔玛</a>|

							</p>
							<p>
								<a href="#">沪ICP备16050468号</a>|
								<a href="#">沪B2-20170039</a>|
								<a href="#">经营证照</a>|
								<a href="#">互联网药品信息服务资格证</a>|
								<a href="#">违法和不良信息举报电话：0514-85899118</a>|
							</p>
							<p>
								<a href="#">Copyright© 1号店网上超市 2007-2017，All Rights Reserved</a>

							</p>
							<small class="ft_wrap_small">
						     			 <span style="display:inline-block;position:relative;width:auto; height: 32px;margin: 0 4px;"></span>
						     			 	<img src="图片/可信网站.png"/>
						     			 	<img src="图片/银联.png"/>
						     			 	<img src="图片/上海.png"/>
						     			 	<img src="图片/网络.png"/>
						     			 	<img src="图片/纠纷.png"/>
						     			 	<img src="图片/视频.png"/>
						     			 	<img src="图片/上海上.png"/>
						     			 </span>
						     		</small>
						</div>
					</div>
				</div>
			</div>

			<div id="blackbarDiv"></div>
			
	</body>

</html>