<%@page import="com.vo.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    	<%
    		Product product = (Product)request.getAttribute("product");
    	 %>
    	<meta charset="UTF-8">
		<title><%=product.getPname() %></title>
		<link rel="shortcut icon" href="staticTheStore/img/mobile/icon.png" />
		<!--选择手机颜色的js-->
		<script type="text/javascript" src="staticTheStore/js/jquery-2.1.4.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/bootstrap.js" charset="UTF-8"></script>
		<!--   自己的js   -->
		<script type="text/javascript" src="staticTheStore/js/singlePhone.js" charset="UTF-8"></script>
		<!--   自己的样式表   -->
		<link rel="stylesheet" href="staticTheStore/css/singlePhone.css" />
		<!--放大镜导入的样式表和js-->
		<link rel="stylesheet" href="staticTheStore/css/detail.css" />
		<link rel="stylesheet" href="staticTheStore/css/main.css" />
		<script type="text/javascript" src="staticTheStore/js/changeSkin.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/finish.js" charset="UTF-8"></script>
		<!--		<script type="text/javascript" src="js/jquery-1.3.1.js" charset="UTF-8" ></script>
-->
		<script type="text/javascript" src="staticTheStore/js/jquery.easyui.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/jquery.jqzoom.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/jquery.livequery.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/switchImg.js" charset="UTF-8"></script>
		<script type="text/javascript" src="staticTheStore/js/use_jqzoom.js" charset="UTF-8"></script>
  </head>
  
  	<body>
		<div id="top">
			<div class="layout">
				<div id="left">
					<a href="#"><img src="staticTheStore/img/mobile/place.jpg" /> 送货地址:北京市</a>
				</div>
				<div id="right">
					<div id="msg" class="menu">
						<a href="jsp/HomePage/Login.jsp" title="aa">Hi,请登录 </a>
						<a href="#">注册&nbsp;&nbsp;</a>
					</div>
					<div id="mine" class="menu">
						<a href="#"><img src="staticTheStore/img/mobile/dingdan.jpg" />我的订单</a>
					</div>
					<div id="menu">
						<li>
							<a href="#" id="one">充值中心</a>
							<ul id="one1">
								<li>
									<a href="#">话费充值</a>
								</li>
								<li>
									<a href="#">流量充值</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" id="two">客户服务</a>
							<ul id="two1">
								<li>
									<a href="#">包裹跟踪</a>
								</li>
								<li>
									<a href="#">常见问题</a>
								</li>
								<li>
									<a href="#">在线退换货</a>
								</li>
								<li>
									<a href="#">配送范围</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#" id="three">网站导航</a>
							<ul id="three1">
								<li>
									<a href="#">1号商城</a>
								</li>
								<li>
									<a href="#">1号社区</a>
								</li>
								<li>
									<a href="#">网站联盟</a>
								</li>
								<li>
									<a href="#">招商通道</a>
								</li>
								<li>
									<a href="#">企业采购</a>
								</li>
								<li>
									<a href="#">充值中心</a>
								</li>
							</ul>
						</li>
					</div>
				</div>
			</div>
		</div>

		<div id="search1">
			<div class="layout">
				<div id="logo">
					<img src="staticTheStore/img/mobile/logo2.png" />
				</div>
				<div id="logoRight">
					<div id="sousuo">
						<div id="sousuokuang">
							<input type="text" placeholder="三门智控冰箱抢免单" />
							<img src="staticTheStore/img/mobile/sousuo.png" />
						</div>
						<div id="shoppingCar">
							<img src="staticTheStore/img/mobile/shoppingCar.png" />&nbsp;&nbsp;购物车
						</div>
					</div>
					<div id="brand">
						<ul>
							<li>
								<a href="#">手机</a>
							</li>
							<li>
								<a href="#">zuk手机</a>
							</li>
							<li>
								<a href="#">乐视手机乐s3</a>
							</li>
							<li>
								<a href="#">z17</a>
							</li>
							<li>
								<a href="#"> 天机c2016</a>
							</li>
							<li>
								<a href="#"> 微软手机</a>
							</li>
							<li>
								<a href="#"> zxsony</a>
							</li>
							<li>
								<a href="#"> 华为手机p10</a>
							</li>
							<li>
								<a href="#"> 天翼手机</a>
							</li>
							<li>
								<a href="#"> 小米品牌</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="nav">
			<div class="layout">
				<div id="xiala">所有商品分类</div>
				<div id="fenlei">
					<ul>
						<li>
							<a href="#">1号抢购</a>
						</li>
						<li>
							<a href="#">1号团</a>
						</li>
						<li>
							<a href="#">领券中心</a>
						</li>
						<li>
							<a href="#">商城优选</a>
						</li>
						<li>
							<a href="#">全球进口</a>
						</li>
						<li>
							<a href="#">1号生鲜</a>
						</li>
						<li>
							<a href="#">美妆馆</a>
						</li>
						<li>
							<a href="#">家居馆</a>
						</li>
						<li>
							<a href="#">电器城</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div id="search2">
			<div class="layout">
				<div id="sousuoleibie1" class="sousuoleibie">
					<a href="#">手机、数码、配件</a>
					<span>&nbsp;&nbsp;></span>
				</div>
				<div id="sousuoleibie2" class="sousuoleibie">
					<a href="#">手机通讯</a>
					<span>&nbsp;&nbsp;></span>
				</div>
				<div id="sousuoleibie3" class="sousuoleibie">
					<a href="#">手机</a>
					<span>&nbsp;&nbsp;></span>
				</div>
				<div id="sousuoleibie4" class="sousuoleibie">
					<a href="#">Huawei/华为</a>
					<span>&nbsp;&nbsp;></span>
				</div>
				<div id="sousuoleibie5" class="sousuoleibie">
					<a href="#">&nbsp;华为P10&nbsp;4GB+64GB&nbsp;全网通&nbsp;草木绿</a>
				</div>
			</div>
		</div>

		<!--手机图片 价格 -->
		<div id="MIX2msg">
			<div class="layout">
				<!--放大镜图片-->
				<div id="photos">
					<div id="photo">
						<div class="jqzoom"><img src="staticTheStore/img/productImage/<%=product.getDetailLargeImg()%>" /></div>
						<ul class="imgList">
							<li><img src="staticTheStore/img/productImage/<%=product.getDetailSmallImg1()%>" alt="" /></li>
							<li><img src="staticTheStore/img/productImage/<%=product.getDetailSmallImg2()%>" alt="" /></li>
							<li><img src="staticTheStore/img/productImage/<%=product.getDetailSmallImg3()%>" alt="" /></li>
							<li><img src="staticTheStore/img/productImage/<%=product.getDetailSmallImg4()%>" alt="" /></li>
							<li><img src="staticTheStore/img/productImage/<%=product.getDetailSmallImg5()%>" alt="" /></li>
						</ul>
					</div>
					<div id="bianhao">
						<label>商品编号11476740620&nbsp;|</label><label>分享﹀</label>
					</div>
				</div>
				<!--价格详情-->
				<div id="priceInfo">
					<div class="layout1">
						<div id="title">
							<h3>
							<%=product.getPname() %>
						</h3>
							<p>麒麟960芯片！wifi双天线设计！徕卡人像摄影！ </p>
						</div>
						<div id="price">
							<div id="jiage">
								<ul>
									<li id="price1" class="price1">价格</li>
									<li id="price2"><%=product.getPrice() %></li>
								</ul>
							</div>
							<div id="mianYunFei">
								<span>支持</span>
								<span id="span"><a href="#">货到付款</a></span>
								<span><a href="#">免运费</a></span>
							</div>
							<div id="haoPingSongJinBi">
								<div id="haoPing">
									<img src="staticTheStore/img/mobile/HUAWEIP10/haoPing.png">
									<label><a href="#">好评率<span class="span1">97%</span></a><a href="#">[评论<span>226</span>条]</a></label>
								</div>
								<div id="songJinBi">
									<img src="staticTheStore/img/mobile/HUAWEIP10/jinBi.png"><label><a href="#">送金币<span class="span1">697</span></a></label>
								</div>
							</div>
						</div>
						<div id="cuXiao">
							<div id="cuxiao">
								<ul>
									<li class="price1">促销</li>
									<li>
										<span>满赠</span>
										<p id="zengPin">指定商品满1件，赠送
											<a href="#">华为（HUAWEI）荣耀自拍杆 AF11 适用于所有华为手机及苹果IOS/小米/三星等安卓系统 荣耀蓝</a>
										</p>
									</li>
									<li>
										<a href="#">立即参加</a>
									</li>
								</ul>
							</div>
						</div>
						<div id="color">
							<div class="left">颜色</div>
							<div id="colorChoice">
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/zuanDiaoLan.jpg">钻雕蓝<b></b>
								</div>
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/yaoShiHei.jpg">曜石黑<b></b>
								</div>
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/meiGuiJin.jpg">玫瑰金<b></b>
								</div>
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/taoCiBai.jpg">陶瓷白<b></b>
								</div>
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/caoMuLv.jpg">草木绿<b></b>
								</div>
								<div class="border">
									<img src="staticTheStore/img/mobile/HUAWEIP10/zuanDiaoJin.jpg">钻雕金<b></b>
								</div>
							</div>
						</div>
						<div id="banBen">
							<div class="left">版本</div>
							<div id="banbenaa">
								<div class="border">
									4GB+128GB
								</div>
								<div class="border">
									4GB+64GB
								</div>
							</div>
						</div>
						<div id="sendTo">
							<div id="to" class="left">送货至</div>
							<div id="area">
								<span>上海静安区城区&nbsp;﹀</span>
								<label id="label1">有货</label><label id="label2">,&nbsp;在线支付免运费</label>
								<p>由 中恒国信手机旗舰店 从 广东深圳市 发货,并提供售后服务. </p>
							</div>
						</div>
						<div id="goodsCar">
							<input type="text" value="1" />
							<div id="updown">
								<div class="up"><img src="staticTheStore/img/mobile/up.png" /></div>
								<div class="down"><img src="staticTheStore/img/mobile/down1.png" id="img_find" /></div>
							</div>
							<a onclick="addShoppingCart()">
							<div id="shoppingCar2">
								<img src="staticTheStore/img/mobile/shoppingCar1.png" /><a href="shoppingcar.html">加入购物车</a>
							</div>
								</a>
						</div>
						<div id="promise">
							<div class="left">保障</div>
							<div id="tuihuanhuo">
								<img src="staticTheStore/img/mobile/HUAWEIP10/duigou.png" />支持7天无理由退货
							</div>
						</div>
					</div>
					<!--  看了又看   -->

				</div>
				<div id="look">
					<div id="others">
						<label>看了还看</label>
						<a href="#">↻换一批</a>
					</div>
					
					<div class="otherPhones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/荣耀畅玩6X.jpg">
						<p class="desc1">荣耀 畅玩6X 4GB 32GB 全网通4G手机 高配版 铂光金</p>
						<p class="desc2">￥1299.00</p>
					</div>
					<div class="otherPhones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/华为Mate9.jpg">
						<p class="desc1">华为 Mate 9 4GB+32GB版 月光银 移动联通电信4G手机 双卡双待</p>
						<p class="desc2">￥2899.00</p>
					</div>
					<div class="otherPhones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/华为荣耀V9.jpg">
						<p class="desc1">华为（HUAWEI） 荣耀V9手机 幻夜黑 全网通（6+64G）高配</p>
						<p class="desc2">￥2999.00</p>
					</div>
				</div>
			</div>
		</div>

		<!-- 详细介绍   -->
		<div id="detail">
			<div class="layout">
				<div id="leftPhones">
					<div id="shop">
						<div id="shopName">
							<a href="#"><%=product.getDianpuName() %></a>
						</div>
						<div id="chatWith">
							<span>联系卖家:</span>
							<a><img src="staticTheStore/img/mobile/HUAWEIP10/联系客服.png"></a>
						</div>
						<div id="pingJia">
							<div id="fenshu">9.34</div>
							<div id="gexiangfenshu">
								<div><span class="aa">商品评价</span><span class="aa">9.24</span><span class="bold">⬇</span></div>
								<div><span class="aa">服务态度</span><span class="aa">9.23</span><span class="bold">⬇</span></div>
								<div><span class="aa">物流速度</span><span class="aa">9.06</span><span class="bold">⬇</span></div>
							</div>
						</div>
						<div id="joinShop">
							<a href="#">进入店铺</a>
						</div>
					</div>
					<div id="leftTop">
						看了本商品的用户最终购买了
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/P10玫瑰金.jpg">
						<p class="desc1">华为 P10 手机 玫瑰金 全网通版(4GB+64GB)标配</p>
						<p id="desc2" class="desc2">￥3488.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/Mate9pro.jpg">
						<p class="desc1">华为（HUAWEI） 华为(HUAWEI) Mate9 Pro 4G手机 双卡双待 琥珀金 全网通(4GB RAM+64GB ROM)</p>
						<p id="desc2" class="desc2">￥4399.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/Mate9.jpg">
						<p class="desc1">华为 Mate 9 4GB+32GB版 月光银 移动联通电信4G手机 双卡双待</p>
						<p id="desc2" class="desc2">￥2899.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/BlackBerry.jpg">
						<p class="desc1">黑莓（BlackBerry）KEYone 4G全网通 4GB+64GB 银色 移动联通电信手机</p>
						<p id="desc2" class="desc2">￥3999.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/P10Plus.jpg">
						<p class="desc1">华为 P10 Plus 手机 玫瑰金 全网通4G(6G RAM+64G ROM)标配</p>
						<p id="desc2" class="desc2">￥3988.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/Mate9Pro4G.jpg">
						<p class="desc1">华为（HUAWEI） Mate9 Pro 4G手机 双卡双待 玫瑰金 全网通4G(6G RAM+128G ROM)标配</p>
						<p id="desc2" class="desc2">￥4899.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/p10钢化膜.jpg">
						<p class="desc1">acover 华为p10钢化膜3D不碎边全屏覆盖防爆手机贴膜适用与华为p10plus 3D不碎边-原装白-p10</p>
						<p id="desc2" class="desc2">￥28.80</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/P10送钢化膜.jpg">
						<p class="desc1">【原装免邮 送钢化膜】华为P10手机壳/防摔手机保护套 适用华为P10/P10plus 翻盖款-深灰色 P10</p>
						<p id="desc2" class="desc2">￥69.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/VERTU.jpg">
						<p class="desc1">【镇店之宝】VERTU纬图（威图） SIGNATURE 系列手机 眼镜蛇限量版</p>
						<p id="desc2" class="desc2">￥2474000.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/荣耀9.jpg">
						<p class="desc1">荣耀9 全网通 高配版 6GB+64GB 魅海蓝 移动联通电信4G手机 双卡双待</p>
						<p id="desc2" class="desc2">￥2699.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/iphone632G.jpg">
						<p class="desc1">Apple iPhone 6 32GB 金色 移动联通电信4G手机</p>
						<p id="desc2" class="desc2">￥2499.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
					<div id="last" class="phones">
						<img src="staticTheStore/img/mobile/HUAWEIP10/iphone7.jpg">
						<p class="desc1">Apple iPhone 7 (A1660) 32G 金色 移动联通电信4G手机</p>
						<p id="desc2" class="desc2">￥4588.00</p>
						<div id="btn"><button>查看详情</button></div>
					</div>
				</div>
				<div id="right2">
					<div id="zuiShouXiAiPaiHangBang">
						<div id="xiai"><label>▍</label><span>顾客最喜爱商品排行榜</span></div>
						<div>
							<div class="rightPhones">
								<img class="num" src="staticTheStore/img/mobile/HUAWEIP10/num1.png">
								<img src="staticTheStore/img/mobile/HUAWEIP10/华为畅享7Plus.jpg">
								<p class="desc4">华为畅享7 plus手机 香槟金 全网通4G(3G RAM+32G ROM)标配版</p>
								<p class="desc5">￥1269.00</p>
								<div class="btn"><button>查看详情</button></div>
							</div>
							<div class="rightPhones">
								<img class="num" src="staticTheStore/img/mobile/HUAWEIP10/num2.png">
								<img src="staticTheStore/img/mobile/HUAWEIP10/华为nova青春版.jpg">
								<p class="desc4">华为（HUAWEI） 华为nova青春版 手机 铂光金 全网通4G(4G RAM+64G ROM)热销款</p>
								<p class="desc5">￥1475.00</p>
								<div class="btn"><button>查看详情</button></div>
							</div>
							<div class="rightPhones">
								<img class="num" src="staticTheStore/img/mobile/HUAWEIP10/num3.png">
								<img src="staticTheStore/img/mobile/HUAWEIP10/美图T8s.jpg">
								<p class="desc4">美图（meitu） 美图T8s 手机 烈焰红 全网通(4G+128G)</p>
								<p class="desc5">￥4099.00</p>
								<div class="btn"><button>查看详情</button></div>
							</div>
							<div class="rightPhones">
								<img class="num" src="staticTheStore/img/mobile/HUAWEIP10/num4.png">
								<img src="staticTheStore/img/mobile/HUAWEIP10/华为nava2.jpg">
								<p class="desc4">华为nova2 手机 流光金 全网通(4GB+64GB)标配</p>
								<p class="desc5">￥2499.00</p>
								<div class="btn"><button>查看详情</button></div>
							</div>
							<div class="rightPhones">
								<img class="num" src="staticTheStore/img/mobile/HUAWEIP10/num5.png">
								<img src="staticTheStore/img/mobile/HUAWEIP10/华为荣耀V9.jpg">
								<p class="desc4">荣耀9 手机 魅海蓝 全网通(4G RAM+64G ROM)标准版</p>
								<p class="desc5">￥2399.00</p>
								<div class="btn"><button>查看详情</button></div>
							</div>
						</div>
					</div>
					<a href="javascript:void(0)" onclick="document.getElementById('shangPinJieShao').scrollIntoView();">
						<div id="shouJiDetail">
								<li class="beChoose">商品介绍</li>
					</a>
					<a href="#pingJia">
						<li>
							评价<label><%=product.getPingjiaSum() %></label>
						</li>
					</a>
					<a href="javascript:void(0)" onclick="document.getElementById('guiGeJiCanShu').scrollIntoView();">
						<li>
							规格及包装
						</li>
					</a>
					<a href="javascript:void(0)" onclick="document.getElementById('shouHouFuWu').scrollIntoView();">
						<li>
							售后服务
						</li>
					</a>
					</ul>
					</div>

					<div id="guiGeCanShu">
						<a id="shangPinJieShao"></a>
						<p><span>规格参数</span><label><a href="javaScript:void(0)" id="chaKan">查看更多   »</a></label></p>
						<dd title="品牌：华为(HUAWEI)">品牌：华为(HUAWEI)</dd>
						<dd title="商品名称：华为（HUAWEI） 华为P10 手机 草绿色 全网通4G(4GB+128GB)">商品名称：华为（HUAWEI） 华为P10 手机 草绿色 全网通4G(4GB+128GB)</dd>
						<dd title="商品编号：11476740620">商品编号：11476740620</dd>
						<dd title="商品毛重：500.00g">商品毛重：500.00g</dd>
					</div>
					<div id="images">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic1.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic2.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic3.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic4.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic5.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic6.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic7.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic8.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic9.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic10.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic11.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic12.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic13.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic14.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic15.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic16.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic17.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic18.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic19.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic20.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic21.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic22.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic23.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic24.jpg">
						<img src="staticTheStore/img/mobile/HUAWEIP10/pic25.jpg">
					</div>
					<!-- 参数详情 -->
					<a name="guiGeJiCanShu"></a>
					<div id="canShuXiangQing" class="hide">
						<!--表格-->
						<table class="table" frame="void">
							<tr>
								<td colspan="2" class="thead">主体</td>
							</tr>
							<tr>
								<td width="25%" class="td1">品牌</td>
								<td class="td2">华为（HUAWEI）</td>
							</tr>
							<tr>
								<td width="25%" class="td1">型号</td>
								<td class="td2">P10</td>
							</tr>
							<tr>
								<td width="25%" class="td1">入网型号</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">上市年份</td>
								<td class="td2">2017年</td>
							</tr>
							<tr>
								<td width="25%" class="td1">上市月份</td>
								<td class="td2">3月</td>
							</tr>
							<tr>
								<td colspan="2" class="thead">基本信息</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身颜色</td>
								<td class="td2">金色</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身长度（mm）</td>
								<td class="td2">145.3</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身宽度（mm）</td>
								<td class="td2">69.3</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身厚度（mm）</td>
								<td class="td2">6.98</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身重量（g）</td>
								<td class="td2">约145g（含电池）</td>
							</tr>
							<tr>
								<td width="25%" class="td1">输入方式</td>
								<td class="td2">触控+键盘</td>
							</tr>
							<tr>
								<td width="25%" class="td1">运营商标志或内容</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">机身材质分类</td>
								<td class="td2">金属边框；金属后盖</td>
							</tr>
							<tr>
								<td colspan="2" class="thead">操作系统</td>
							</tr>
							<tr>
								<td width="25%" class="td1">操作系统</td>
								<td class="td2">Android</td>
							</tr>
							<tr>
								<td colspan="2" class="thead">主芯片</td>
							</tr>
							<tr>
								<td width="25%" class="td1">CPU品牌</td>
								<td class="td2">海思（Hisilicon）</td>
							</tr>
							<tr>
								<td width="25%" class="td1">CPU频率</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">CPU核数</td>
								<td class="td2">8核</td>
							</tr>
							<tr>
								<td width="25%" class="td1">CPU型号</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td colspan="2" class="thead">网络支持</td>
							</tr>
							<tr>
								<td width="25%" class="td1">双卡机类型</td>
								<td class="td2">双卡双待单通</td>
							</tr>
							<tr>
								<td width="25%" class="td1">最大支持SIM卡数量</td>
								<td class="td2">2个</td>
							</tr>
							<tr>
								<td width="25%" class="td1">4G网络</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">3G/2G网络</td>
								<td class="td2">3G:移动(TD-SCDMA);3G:联通(WCDMA);3G:电信(CDMA2000);2G:移动联通(GSM)+电信(CDMA);其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">网络频率(2G/3G)</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td colspan="2" class="thead">存储</td>
							</tr>
							<tr>
								<td width="25%" class="td1">ROM</td>
								<td class="td2">128GB</td>
							</tr>
							<tr>
								<td width="20%" class="td1">RAM</td>
								<td class="td2">4GB</td>
							</tr>
							<tr>
								<td width="25%" class="td1">存储卡</td>
								<td class="td2">支持MicroSD(TF)</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">屏幕</td>
							</tr>
							<tr>
								<td width="25%" class="td1">主屏幕尺寸(英寸)</td>
								<td class="td2">5.1英寸</td>
							</tr>
							<tr>
								<td width="25%" class="td1">分辨率</td>
								<td class="td2">1920*1080(FHD)</td>
							</tr>
							<tr>
								<td width="25%" class="td1">屏幕材质类型</td>
								<td class="td2">TFT</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">前置摄像头</td>
							</tr>
							<tr>
								<td width="25%" class="td1">前置摄像头</td>
								<td class="td2">800万像素</td>
							</tr>
							<tr>
								<td width="25%" class="td1">前摄光圈大小</td>
								<td class="td2">F1.9</td>
							</tr>
							<tr>
								<td width="25%" class="td1">闪光灯</td>
								<td class="td2">LED灯</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">后置摄像头</td>
							</tr>
							<tr>
								<td width="25%" class="td1">摄像头数量</td>
								<td class="td2">2个</td>
							</tr>
							<tr>
								<td width="25%" class="td1">后置摄像头</td>
								<td class="td2">1200万像素；2000万像素</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">电池信息</td>
							</tr>
							<tr>
								<td width="25%" class="td1">电池容量(mAh)</td>
								<td class="td2">3200mAh</td>
							</tr>
							<tr>
								<td width="25%" class="td1">电池类型</td>
								<td class="td2">锂聚合物电池</td>
							</tr>
							<tr>
								<td width="25%" class="td1">电池是否可拆</td>
								<td class="td2">否</td>
							</tr>
							<tr>
								<td width="25%" class="td1">充电器</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">闪充</td>
								<td class="td2">其他</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">数据接口</td>
							</tr>
							<tr>
								<td width="25%" class="td1">数据传输接口</td>
								<td class="td2">其他</td>
							</tr>
							<tr>
								<td width="25%" class="td1">NFC/NFC模式</td>
								<td class="td2">支持(点对点模式)</td>
							</tr>
							<tr>
								<td width="25%" class="td1">耳机接口类型</td>
								<td class="td2">3.5mm</td>
							</tr>
							<tr>
								<td width="25%" class="td1">充电接口类型</td>
								<td class="td2">Type-C</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">手机特性</td>
							</tr>
							<tr>
								<td width="25%" class="td1">指纹识别</td>
								<td class="td2">支持</td>
							</tr>
							<tr>
								<td width="25%" class="td1">语音识别</td>
								<td class="td2">支持</td>
							</tr>
							<tr>
								<td width="25%" class="td1">GPS</td>
								<td class="td2">支持</td>
							</tr>
							<tr>
								<td width="25%" class="td1">陀螺仪</td>
								<td class="td2">其他</td>
							</tr>

							<tr>
								<td colspan="2" class="thead">辅助功能</td>
							</tr>
							<tr>
								<td width="25%" class="td1">常用功能</td>
								<td class="td2">便签;收音机;录音</td>
							</tr>
						</table>
						<h3>包装清单</h3>
						<p id="qingDan">手机（含内置电池） x 1、大电流华为SuperCharge充电器 x 1、USB数据线 x 1、半入耳式线控耳机 x 1、快速指南 x 1、三包凭证 x 1、取卡针 x 1、保护壳 x 1</p>
					</div>
					<a id="shouHouFuWu">
						<div id="shengMing">
							<p class="desc6">1号店承诺</p>
							<p class="desc7">1号店平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！</p>
							<p class="desc8">注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若没有及时更新，请大家谅解！</p>
							<p class="desc6">全国联保</p>
							<p class="desc8">凭质保证书及1号店发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由1号店联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。1号店还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>
							<p class="desc6">权利声明</p>
							<p class="desc7">1号店上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是1号店重要的经营资源，未经许可，禁止非法转载使用。</p>
							<p class="desc7">注：本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>
							<p class="desc6">价格说明</p>
							<p class="desc7"><label>1号店价：</label>商品在1号店平台上，不参加降价让利促销团购等活动时的常规销售价格。</p>
							<p class="desc8"><label>参考价：</label>商品展示的参考价，可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在1号店平台曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价、销售商门店曾经展示过的销售价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>
							<p class="desc7"><label>问题反馈：</label>如有疑问，建议您在购买前联系客服咨询。</p>
						</div>
					</a>
					<a name="pingJia">
						<div id="haoPingLv">
							<div id="aaaa">
								<p id="p1">好评率</p>
								<p id="p2"><label>96</label>%</p>
								<p id="p3">共<%=product.getPingjiaSum() %>人评论</p>
							</div>
							<div id="bbbb">
								<img src="staticTheStore/img/mobile/HUAWEIP10/a.png" />
								<label>就是快(2)</label>
								<label>挺好用(1)</label>
							</div>
						</div>
						<div id="pingLunQu">
							<label><input name="pinglun" type="radio" value="all" checked="checked" />全部(100+)</label>
							<label><input name="pinglun" type="radio" value="shaidan" />晒单(20+)</label>
							<label><input name="pinglun" type="radio" value="zhuiping" />追评(7)</label>
							<label><input name="pinglun" type="radio" value="haoping" />好评(100+)</label>
							<label><input name="pinglun" type="radio" value="zhongping" />中评(2)</label>
							<label><input name="pinglun" type="radio" value="chaping" />差评(2)</label>
							<select>
								<option>按默认</option>
								<option>按时间</option>
							</select>
						</div>
						<div id="kehupinglun">
							<div class="ccc">
								<div class="touxiang"><img src="staticTheStore/img/mobile/HUAWEIP10/kehu1.gif" />
									<p>j***9</p>
								</div>
								<div class="pinglun">
									<div class="a">
										<label>评分：</label>★★★★★
									</div>
									<div class="b">
										<div class="content">内容：</div>
										<div class="contentInfo">
											<p>真心不错，虽然等3几天，但东西让人超级喜欢，也非常不错，准用维知道，华为手机真也做越好，原厂送了膜，和手机壳，都很好，但膜不知防不防爆，但绝对兔高清</p>
										</div>
									</div>
									<div class="c">
										<div class="content">晒单：</div>
										<div class="contentInfo">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan1.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan2.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan3.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan4.jpg">
											<p>钻雕蓝 全网通4G(4GB+64GB)【送原装壳膜】 &nbsp;&nbsp; 2017-04-02 20:55:57 </p>
											<div class="guoXin">
												<img src="staticTheStore/img/mobile/HUAWEIP10/guoXin.jpg" />
											</div>
											<div class="huiFu">
												<p>中恒国信手机旗舰店 ：</p>
												亲爱的华为用户，您好，非常感谢您的大力支持，HUANWEI P10不但拥有多彩时尚的外观，还有具备麒麟960芯片+EMUI5.1智能系统，成功实现了性提升与功耗平衡，此款手机热销机型，性能强，运行流畅，性价比高，手机有任何问题您可以随时与我们客服联系，同时我们也会定期回访，了解您的需求以及遇到的问题，让您购机无忧，享受贵宾般的待遇，期待与您的再次合作哦。
												<p class="desc9">2017-04-11 12:50:16</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="ccc">
								<div class="touxiang"><img src="staticTheStore/img/mobile/HUAWEIP10/kehu2.jpg" />
									<p>j***9</p>
								</div>
								<div class="pinglun">
									<div class="a">
										<label>评分：</label>★★★★★
									</div>
									<div class="b">
										<div class="content">内容：</div>
										<div class="contentInfo">
											<p>手机机身手感非常好，也非常适合女生用，一直喜欢绿色，终于入手了草木绿的手机，包装精美，刚到就迫不及待试了一下，运行速度很快，还有原装的手机壳。卖家也送了充电宝和蓝牙耳机等赠品，感觉非常不错</p>
										</div>
									</div>
									<div class="c">
										<div class="content">晒单：</div>
										<div class="contentInfo">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan5.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan6.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan7.jpg">
											<img src="staticTheStore/img/mobile/HUAWEIP10/shaidan8.jpg">
											<p>草绿色 全网通4G(4GB+64GB) &nbsp;&nbsp;2017-06-02 17:36:43 </p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div id="foot">
			<div id="footer">
				<div class="layout">
					<div id="fcontent">
						<div class="fphoto">
							<img src="staticTheStore/img/mobile/正品.png" />
							<div class="ftxt">
								<h3>正品保障</h3>
								<p>正品行货 放心购买</p>
							</div>
						</div>

						<div class="fphoto">
							<img src="staticTheStore/img/mobile/包邮.png" />
							<div class="ftxt">
								<h3>满68包邮</h3>
								<p>满68元 免运费</p>
							</div>
						</div>

						<div class="fphoto">
							<img src="staticTheStore/img/mobile/售后.png" />
							<div class="ftxt">
								<h3>售后无忧</h3>
								<p>七天无理由退款</p>
							</div>
						</div>

						<div class="fphoto">
							<img src="staticTheStore/img/mobile/准时.png" />
							<div class="ftxt">
								<h3>准时送达</h3>
								<p>送货时间由你做主</p>
							</div>
						</div>
					</div>

					<div id="fcenter">
						<div id="shouHou">
							<ul>
								<li><b>新手入门</b>
									<ul>
										<li>
											<a href="#">购物流程</a>
										</li>
										<li>
											<a href="#">会员制度</a>
										</li>
										<li>
											<a href="#">订单查询</a>
										</li>
										<li>
											<a href="#">发票制度</a>
										</li>
										<li>
											<a href="#">常见问题</a>
										</li>
									</ul>
								</li>

								<li><b>支付方式</b>
									<ul>
										<li>
											<a href="#">货到付款</a>
										</li>
										<li>
											<a href="#">网上支付</a>
										</li>
										<li>
											<a href="#">银行转账</a>
										</li>
										<li>
											<a href="#">礼品卡支付</a>
										</li>
										<li>
											<a href="#">其他支付</a>
										</li>
									</ul>
								</li>

								<li><b>配送服务</b>
									<ul>
										<li>
											<a href="#">配送范围及运费</a>
										</li>
										<li>
											<a href="#">配送进度查询</a>
										</li>
										<li>
											<a href="#">自提服务</a>
										</li>
										<li>
											<a href="#">商品验货与签收</a>
										</li>
									</ul>
								</li>

								<li><b>售后保障</b>
									<ul>
										<li>
											<a href="#">退换货政策</a>
										</li>
										<li>
											<a href="#">退换货流程</a>
										</li>
										<li>
											<a href="#">退款说明</a>
										</li>
										<li>
											<a href="#">延保说明页面</a>
										</li>
										<li>
											<a href="#">联系客服</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<div id="cid">
							<ul>
								<li>APP更优惠
									<ul>
										<br />
										<li><img src="staticTheStore/img/mobile/APPQRcode.jpg" /></li>
									</ul>
								</li>

								<li>加微信查订单
									<ul>
										<br />
										<li><img src="staticTheStore/img/mobile/ewm.jpg" /></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="layout">
					<div id="foot_down">
						<ul>
							<li>
								<a href="#">沪ICP备16050468号</a>
							</li>
							<li>
								<a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;经营证照&nbsp;&nbsp;&nbsp;&nbsp; |</a>
							</li>
							<li>
								<a href="#">互联网药品信息服务资格证&nbsp;&nbsp;&nbsp;&nbsp;|</a>
							</li>
							<li>
								<a href="#">违法和不良信息举报电话：0514-85899118</a>
							</li>
							<li>
								<a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;沪B2-20170039</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div>
				<div class="layout">
					<div id="copyright">
						<p>Copyright© 1号店网上超市 2007-2017，All Rights Reserved</p>
					</div>
				</div>
			</div>
			<div>
				<div class="layout">
					<div id="img_show">
						<ul>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/yinlian.jpg"/> </a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/shanghaigongshang.jpg"/> </a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/wangluoshehui.jpg" /></a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/yinpin.jpg"/> </a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/dajiaping.jpg"/> </a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/msg.webp.jpg" /></a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/chengxin.jpg" /></a></li>
							<li>
								<a href="#"><img src="staticTheStore/img/mobile/pingjia.png" /></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

</html>
