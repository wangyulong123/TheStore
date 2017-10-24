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
		<!-- 佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍-1号店 -->
		<title>${product.pname }</title>
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
	</head>

	<body>
		<div id="wholeDiv">
			<div id="loginDiv">
				<!-- <span>Hi,请</span>
				<a href="#">登录</a>
				<a class="regist" href="#">注册</a> -->
				<%
					User user = (User)session.getAttribute("user");
					if(user==null){
						//显示 "Hi,请登录"	
				%>
				<span>Hi,请</span>
				<a href="UserServlet?action=login">登录</a>
				<a class="regist" href="jsp/user/regist.jsp">注册</a>
				<%
					}else{
					//显示 "Hi,XXX" 退出
				%>
				<span style="color:#666;">Hi,<%=user.getNickname()%></span>
				<a href="UserServlet?action=logout" class="regist">退出</a>
				<%
					}
				%>
				<div id="orderDiv">
					<a href="DingdanServlet?action=examineOrder" target="_blank">我的订单</a>
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

			<div id="logoDiv">
				<div id="yiHaoDianDiv">
					<a href="jsp/user/一号店首页.jsp"><img src="img/1号店自营.png" width="200px" height="110px" /></a>
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

			<div id="mainDiv">
				<div class="digit_strong">
					<pre><a href="#"><strong>手机、数码、配件</strong></a>  >  <a href="#">数码摄影</a>  >  <a href="#">单反相机</a>  >  <a href="#">Canon/佳能</a>  >  佳能(Canon)EOS M6(EF-M 15-45mm f/3.5-6.3 IS STM) 微型单电套机 黑色 高速对焦 高速连拍</pre>
				</div>
				<div class="canonBrand">
					<div></div>
					<a href="#" target="_blank"><b>佳能品牌馆</b></a>
				</div>
				<div id="self_runPicture"></div>
				<div id="keywordDiv">
					<form action="#" method="post">
						<input type="text" id="text" value="关键词" onfocus="form11();" onblur="form22();" />
						<div id="searchStore">
							<a href="#" target="_blank">搜本店</a>
						</div>
					</form>
				</div>
				<div id="enterStore">
					<a href="#">进入店铺</a>
				</div>
				<div>
					<div class="camera_big">
						<!-- src="img/大图1.jpg" -->
						<img id="camera_big" src="img/productImage/${product.detailLargeImg}">
						<!-- 佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍 -->
						<a href="#" title="${product.pname }"><span></span></a>
						<!--跟随鼠标移动的盒子-->
					</div>
					<div class="camera_small">
						<!-- src="img/小图1.jpg" -->
						<div id="camera_small_1"><img id="camera_small_1" src="img/productImage/${product.detailSmallImg1}" /></div>
						<div id="camera_small_2"><img id="camera_small_2" src="img/productImage/${product.detailSmallImg2}" /></div>
						<div id="camera_small_3"><img id="camera_small_3" src="img/productImage/${product.detailSmallImg3}" /></div>
						<div id="camera_small_4"><img id="camera_small_4" src="img/productImage/${product.detailSmallImg4}" /></div>
						<div id="camera_small_5"><img id="camera_small_5" src="img/productImage/${product.detailSmallImg5}" /></div>
					</div>
					<div id="fdj_area"><img src="img/大图1_600x600.jpg" /></div>
				</div>

				<div id="number">商品编号<em> </em>0631020365</div>
				<div id="shareDiv">
					<div id="sharePicture"><img src="img/分享.png" /> </div>
					分享<em> </em><img src="img/下箭头.png" />
					<div id="shareAddress">
						<a href="#" title="分享到新浪微博">
							<div id="sina"></div>
						</a>
						<a href="#" title="分享到腾讯微博">
							<div id="tencent"></div>
						</a>
					</div>
				</div>
				<div id="collection">
					<div><img src="img/关注.png" /></div>
					关注<em> </em>13
				</div>
				<div id="checkBox">
					<div id="check_square" class="check_square_1"></div>
					<a href="">对比</a>
				</div>
				<!-- 佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍 -->
				<div id="intruduce"><b>${product.pname }</b></div>
				<!-- 动心瞬间高速捕捉 全像素双核CMOS AF与DIGIC 7带来高精度追踪自动对焦 -->
				<div>${product.pdesc }</div>
				<div id="price">
					<label style="font-size: 12px;color: #666666;margin-left: 9px;">价格</label>
					<label style="font-family: '黑体';font-size: 18px;color: #E60012;margin-left: 30px;"><strong>¥</strong></label>
					<!-- 4499 -->
					<label style="font-family: '黑体';font-size: 28px;color: #E60012;"><strong>${product.price }</strong></label>
				</div>
				<div id="transportation_expense">
					<label style="font-size: 12px;color: #666666;margin-left: 66px;">支持</label>
					<a href="#" target="_blank">货到付款</a>
					<label style="font-size: 12px;color: #DCC7C2;">|</label>
					<a href="#" target="_blank">免运费</a>
				</div>
				<div id="favorable_rate">
					<a href="#" style="margin-left: 66px;position:relative;top:8px;"><img src="img/赞.png" /></a>
					<a href="#" style="font-size: 12px;color: #666666;text-decoration: none;">好评率<strong style="color: #FF875A;">100%</strong></a>
					<a href="#" style="font-size: 12px;color: #B3B2B2;text-decoration: none;">[评论<strong style="color: #FF875A;">${product.pingjiaSum }</strong>条]</a>
					<a href="#" style="margin-left: 60px;position:relative;top:8px;"><img src="img/金币.png" /></a>
					<a href="#" style="font-size: 12px;color: #666666;text-decoration: none;">送金币<strong style="color: #FF875A;">899</strong></a>
				</div>
				<div id="sale_service">
					<label style="font-size: 12px;color: #666666;margin-left: 9px;">售后</label>
					<div>
						<select name="售后">
							<option value="199"><img src/>特惠1年延长：¥199</option>
							<option value="199"><img src/>主要零部件延保2年保修：¥149</option>
							<option value="199"><img src/>特惠2年延保：¥169</option>
						</select>
						<a href="#">服务说明</a>
					</div>
				</div>
				<div id="areaDiv">
					<label style="font-size: 12px;color: #666666;margin-left: 9px;margin-top: 18px;display: block;">送货至</label>
					<div id="selectMenu" data-toggle="distpicker">
						<select name="province" style="width:105px;" data-province="---- 选择省 ----"></select>
						<select name="city" style="width:90px;" data-city="---- 选择市 ----"></select>
						<select name="district" style="width:80px;" data-district="---- 选择区 ----"></select>
						<label style="font-size: 12px;color: #666666;"><b style="color: #333333;">现货</b>，18:00前完成订单，预计1天送达</label>
					</div>
					<div id="freight">本商品由1号店自营提供<em> </em>
						<a href="#">运费说明</a>
					</div>
					<div id="sumDiv">
						<form>
							<input type="text" name="count" id="count" autocomplete="off" value="1" />
						</form>
					</div>
					<div id="add"></div>
					<div id="minus"></div>
					<a onclick="addShoppingCart()">
						<div id="shoppingCart_red">
							<div id="r1"><img src="img/whitecar.png" /></div>
							<div id="r2"><b>加入购物车</b></div>
						</div>
					</a>
					<a href="#">
						<div id="buyDiv">立即购买</div>
					</a>
					<div id="securityDiv">
						<label style="font-size: 12px;color: #666666;margin-left: 9px;margin-top: 18px;display: block;">保障</label>
						<div id="s1"></div>
						<div id="s11">
							<a href="#" title="支持7天无理由退货">支持7天无理由退货</a>
						</div>
						<div id="s2"></div>
						<div id="s22">
							<a href="#" title="数10万商品“1战式”购齐，正品行货“假一赔三”">正品保障</a>
						</div>
						<div id="s3"></div>
						<div id="s33">
							<a href="#" title="了解详情请点击查看">增票服务</a>
						</div>
						<div id="charge">
							<div id="charge_way">
								<label>支付方式</label>
								<div id="charge_down"><img src="img/下箭头.png" /></div>
							</div>
							<div id="charge_detail">
								<div id="charge1">货到付款</div>
								<div id="charge2">礼品卡支付</div>
								<div id="charge3">网上支付</div>
								<div id="charge4">银行转账</div>
							</div>
						</div>
					</div>
				</div>
				<div id="rightDiv_top">
					<label style="font-size: 15px;color:#666666">看了还看&nbsp;&nbsp;</label>
					<a><img src="img/刷新.png" />换一批</a>
				</div>
				<div id="rightDiv_bottom">
					<div id="camera1">
						<div id="img1">
							<a href="#"><img src="img/佳能_120x120.jpg" /></a>
						</div>
						<a href="#" target="_blank" title="佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 银色 高速对焦 高速连拍">佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 银色 高速对焦 高速连拍</a>
						<div id="money1">¥4399</div>
					</div>
					<div id="camera2">
						<div id="img2">
							<a href="#"><img src="img/尼康_120x120.jpg" /></a>
						</div>
						<a href="#" target="_blank" title="尼康（Nikon） D5300 单反机身 黑色">尼康（Nikon） D5300 单反机身 黑色</a>
						<div id="money2">¥2799</div>
					</div>
					<div id="camera3">
						<div id="img3">
							<a href="#"><img src="img/nikang_120x120.jpg" /></a>
						</div>
						<a href="#" target="_blank" title="尼康（Nikon） D610 单反机身">尼康（Nikon） D610 单反机身</a>
						<div id="money3">¥7199</div>
					</div>
				</div>
				<div onmouseover="display1()" onmouseout="hiddenBarcode_big()">
					<div id="phone_buy">
						<div id="barcode"></div>
						<div>手机购买＜</div>
					</div>
					<div id="barcode_big">
						<div style="margin-top:11px"><img src="img/barcode_big.png" /></div>
						<div>移动端下单更多优惠</div>
					</div>
				</div>

			</div>

			<div id="otherDiv">
				<div id="other_left">
					<div id="canonBrand2">
						<div id="canon_link">
							<a href="#" title="佳能品牌馆"><b>佳能品牌馆</b></a>
						</div>
						<div id="self_runPicture2"></div>
					</div>
					<div id="concern_store">
						<a href="#">
							<div id="concern1">佳能品牌馆欢迎您 </div>
						</a>
						<a href="#">
							<div id="concern2">关注店铺</div>
						</a>
						<a href="#">
							<div id="concern3">进入店铺</div>
						</a>
					</div>
					<div id="sort">
						<div id="sort1" onclick="sort1_Div()">相关分类</div>
						<div id="sort2" onclick="sort2_Div()">推荐品牌</div>
					</div>
					<div id="sort1_display_hidden">
						<div id="sort1_list1" class="sort1_list">
							<a href="#" title="单反相机">·<em> </em>单反相机</a>
							<a href="#" title="镜头" style="position: absolute;left: 93px;">·<em> </em>镜头</a>
						</div>
						<div id="sort1_list2" class="sort1_list">
							<a href="#" title="数码相机">·<em> </em>数码相机</a>
							<a href="#" title="存储卡" style="position: absolute;left: 93px;">·<em> </em>存储卡</a>
						</div>
						<div id="sort1_list3" class="sort1_list">
							<a href="#" title="单电微单相机">·<em> </em>单电微单相机</a>
							<a href="#" title="清洁用品" style="position: absolute;left: 93px;">·<em> </em>清洁用品</a>
						</div>
						<div id="sort1_list4" class="sort1_list">
							<a href="#" title="摄像机">·<em> </em>摄像机</a>
							<a href="#" title="镜头附件" style="position: absolute;left: 93px;">·<em> </em>镜头附件</a>
						</div>
						<div id="sort1_list5" class="sort1_list">
							<a href="#" title="电池及充电器">·<em> </em>电池及充电器</a>
							<a href="#" title="闪光灯及手柄" style="position: absolute;left: 93px;">·<em> </em>闪光灯及手柄</a>
						</div>
					</div>
					<div id="sort2_display_hidden">
						<div id="sort2_list1" class="sort1_list">
							<a href="#" title="佳能/Canon">·<em> </em>佳能/Canon</a>
							<a href="#" title="尼康/Nikon" style="position: absolute;left: 93px;">·<em> </em>尼康/Nikon</a>
						</div>
						<div id="sort2_list2" class="sort1_list">
							<a href="#" title="索尼/SONY">·<em> </em>索尼/SONY</a>
						</div>
					</div>
					<div id="other_camera">
						<div class="other1">购买了此商品的用户还买了</div>
						<div id="other_camera1">
							<div id="other_img">
								<a href="#"><img src="img/佳能_115×115.jpg" /></a>
							</div>
							<a href="#" target="_blank" title="佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 银色 高速对焦 高速连拍">佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 银色 高速对焦 高速连拍</a>
							<div id="other_money"><b>¥4399</b></div>
						</div>
						<a href="#">
							<div id="other_car">加入购物车</div>
						</a>
					</div>
					<div id="leaderboard">
						<div class="other1">周销量排行榜</div>
						<div id="div1">
							<div id="one"></div>
							<a href="#">
								<div class="img"><img src="img/one_img.jpg" /></div>
							</a>
							<div class="money">¥7199</div>
							<div class="discrib">
								<a href="#" target="_blank">尼康（Nikon） D610 单反机身</a>
							</div>
						</div>
						<div id="div2">
							<div id="two"></div>
							<a href="#">
								<div class="img"><img src="img/two_img.jpg" /></div>
							</a>
							<div class="money">¥8499</div>
							<div class="discrib">
								<a href="#" target="_blank">佳能（Canon）EOS M5 （EF-M 18-150mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍 </a>
							</div>
						</div>
						<div id="div3">
							<div id="three"></div>
							<a href="#">
								<div class="img"><img src="img/three_img.jpg" /></div>
							</a>
							<div class="money">¥4499</div>
							<div class="discrib">
								<a href="#" target="_blank">佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍 </a>
							</div>
						</div>
						<div id="div4">
							<div id="four"></div>
							<a href="#">
								<div class="img"><img src="img/four_img.jpg" /></div>
							</a>
							<div class="money">¥8299</div>
							<div class="discrib">
								<a href="#" target="_blank">佳能（Canon）EOS 77D 单反机身（EF-S 18-200mm f/3.5-5.6 IS 镜头）</a>
							</div>
						</div>
						<div id="div5">
							<div id="five"></div>
							<a href="#">
								<div class="img"><img src="img/five_img.jpg" /></div>
							</a>
							<div class="money">¥4399</div>
							<div class="discrib">
								<a href="#" target="_blank">佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 银色 高速对焦 高速连拍</a>
							</div>
						</div>
					</div>
				</div>
				<div id="other_right1">
					<div id="favoriteBrands"><b style="color: #FE3C3C;">丨</b><em> </em>顾客最喜爱商品排行榜</div>
					<div id="favorateGoods">
						<div id="good1" class="goods">
							<div id="crown_one"></div>
							<a href="#" target="_blank" title="图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）">
								<div class="crown_img"><img src="img/crown_img1.jpg" /></div>
							</a>
							<div class="crown_discrib">
								<a href="#" target="_blank" title="图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）">图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）</a>
							</div>
							<div class="crown_money">¥4099</div>
							<a href="#">
								<div class="crown_car">查看详情</div>
							</a>
						</div>
						<div id="good2" class="goods">
							<div id="crown_two"></div>
							<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">
								<div class="crown_img"><img src="img/crown_img2.jpg" /></div>
							</a>
							<div class="crown_discrib">
								<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">SP 128G 苹果笔记本扩容卡 xDrive L13</a>
							</div>
							<div class="crown_money">¥479</div>
							<a href="#">
								<div class="crown_car">加入购物车</div>
							</a>
						</div>
						<div id="good3" class="goods">
							<div id="crown_three"></div>
							<a href="#" target="_blank" title="曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯">
								<div class="crown_img"><img src="img/crown_img3.jpg" /></div>
							</a>
							<div class="crown_discrib">
								<a href="#" target="_blank" title="曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯">曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯</a>
							</div>
							<div class="crown_money">¥339</div>
							<a href="#">
								<div class="crown_car">加入购物车</div>
							</a>
						</div>
						<div id="good4" class="goods">
							<div class="crown_four_five">4</div>
							<a href="#" target="_blank" title="易捕碟（ExpoDisc）77mm 白平衡滤镜色">
								<div class="crown_img"><img src="img/crown_img4.jpg" /></div>
							</a>
							<div class="crown_discrib">
								<a href="#" target="_blank" title="易捕碟（ExpoDisc）77mm 白平衡滤镜色">易捕碟（ExpoDisc）77mm 白平衡滤镜色</a>
							</div>
							<div class="crown_money">¥399</div>
							<a href="#">
								<div class="crown_car">查看详情</div>
							</a>
						</div>
						<div id="good5" class="goods">
							<div class="crown_four_five">5</div>
							<a href="#" target="_blank" title="适马（SIGMA） 18-35mm F1.8 DC HSM 标准变焦镜头（ 尼康卡口）">
								<div class="crown_img"><img src="img/crown_img5.jpg" /></div>
							</a>
							<div class="crown_discrib">
								<a href="#" target="_blank" title="适马（SIGMA） 18-35mm F1.8 DC HSM 标准变焦镜头（ 尼康卡口）">适马（SIGMA） 18-35mm F1.8 DC HSM 标准变焦镜头（ 尼康卡口）</a>
							</div>
							<div class="crown_money">¥3799</div>
							<a href="#">
								<div class="crown_car">查看详情</div>
							</a>
						</div>
					</div>
				</div>
				<div id="other_right2">
					<div id="choice_match">选择搭配</div>
					<div id="block"></div>
					<div id="combo_price">
						<div id="combo">
							<p style="font-size: 13px;">已选购<label style="color: #FF875A;">0</label>件搭配</p>
							<p style="font-size: 13px;"><b>套餐价：</b></p>
							<b><p style="font-size: 15px;color: #E60021;">¥<label style="font-family:'arial';font-size: 25px;color: #E60021;">4499</label></p></b>
						</div>
						<a>
							<div id="combo_car">加入购物车</div>
						</a>
					</div>
					<div class="tab">
						<div class="tab_menu">
							<ul>
								<li class="selected">精品</li>
								<li>镜头</li>
								<li onmousemove="hideButtun()" onmouseout="showButtun()">数码相机</li>
								<li onmousemove="hideButtun()" onmouseout="showButtun()">存储卡</li>
								<li onmousemove="hideButtun()" onmouseout="showButtun()">单电微单相机</li>
								<li>清洁用品</li>
								<li>摄像机</li>
								<li>镜头附件</li>
							</ul>
						</div>

						<a href="#" target="_blank">
							<div id="camera_box"><img src="img/camera_box.jpg" /></div>
						</a>
						<div id="camera_box_price"><b>¥4499</b></div>
						<div id="plus_sign"><b>+</b></div>
						<div id="left"> ＜ </div>
						<div id="right"> ＞ </div>
						<div class="tab_box">
							<div id="box_div1">
								<ul id="uul1">
									<li class="boxes">
										<div id="box1_1">
											<a href="#" target="_blank" title="适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口">
												<div class="tab_box_img"><img src="img/tab_box_img1.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口">适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口（ 尼康卡口）</a>
											</div>
											<div id="box1_square1" class="box_square_1"></div>
											<div class="tab_box_money">¥9699</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_2">
											<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">
												<div class="tab_box_img"><img src="img/tab_box_img2.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">SP 128G 苹果笔记本扩容卡 xDrive L13</a>
											</div>
											<div id="box1_square2" class="box_square_1"></div>
											<div class="tab_box_money">¥479</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_3">
											<a href="#" target="_blank" title="Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽">
												<div class="tab_box_img"><img src="img/tab_box_img3.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽">Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽</a>
											</div>
											<div id="box1_square3" class="box_square_1"></div>
											<div class="tab_box_money">¥21</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_4">
											<a href="#" target="_blank" title="B+W MRC-UV 62mm 多层镀膜UV滤镜">
												<div class="tab_box_img"><img src="img/tab_box_img4.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="B+W MRC-UV 62mm 多层镀膜UV滤镜">B+W MRC-UV 62mm 多层镀膜UV滤镜</a>
											</div>
											<div id="box1_square4" class="box_square_1"></div>
											<div class="tab_box_money">¥319</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_5">
											<a href="#" target="_blank" title="浪客拍（ROGUE）闪光灯色片 滤色片 通用摄影套装色片">
												<div class="tab_box_img"><img src="img/tab_box_img5.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="浪客拍（ROGUE）闪光灯色片 滤色片 通用摄影套装色片">浪客拍（ROGUE）闪光灯色片 滤色片 通用摄影套装色片</a>
											</div>
											<div id="box1_square5" class="box_square_1"></div>
											<div class="tab_box_money">¥295</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_6">
											<a href="#" target="_blank" title="曼富图(manfrotto)MB BP-D1 大疆DJI精灵无人机航拍机单反相机双肩包摄影包">
												<div class="tab_box_img"><img src="img/tab_box_img6.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="曼富图(manfrotto)MB BP-D1 大疆DJI精灵无人机航拍机单反相机双肩包摄影包">曼富图(manfrotto)MB BP-D1 大疆DJI精灵无人机航拍机单反相机双肩包摄影包</a>
											</div>
											<div id="box1_square6" class="box_square_1"></div>
											<div class="tab_box_money">¥1044</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_7">
											<a href="#" target="_blank" title="富图宝(Fotopro) BT-1 手机拍照遥控器 通用苹果/安卓系统 黑色">
												<div class="tab_box_img"><img src="img/tab_box_img7.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="富图宝(Fotopro) BT-1 手机拍照遥控器 通用苹果/安卓系统 黑色">富图宝(Fotopro) BT-1 手机拍照遥控器 通用苹果/安卓系统 黑色</a>
											</div>
											<div id="box1_square7" class="box_square_1"></div>
											<div class="tab_box_money">¥25</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_8" style="background: yellow;z-index: 2;">
											<a href="#" target="_blank" title="Apple 苹果 iMac MNE02CH/A 21.5英寸'台式一体机 IMAC 3.4QC/8GB/1TB FD/RP560-CHN">
												<div class="tab_box_img"><img src="img/tab_box_img8.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Apple 苹果 iMac MNE02CH/A 21.5英寸'台式一体机 IMAC 3.4QC/8GB/1TB FD/RP560-CHN">Apple 苹果 iMac MNE02CH/A 21.5英寸"台式一体机 IMAC 3.4QC/8GB/1TB FD/RP560-CHN</a>
											</div>
											<div id="box1_square8" class="box_square_1"></div>
											<div class="tab_box_money">¥10588</div>
										</div>
									</li>
								</ul>
							</div>
							<div id="box_div2" class="hide">
								<ul id="uul2">
									<li class="boxes">
										<div id="box1_1">
											<a href="#" target="_blank" title="适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口">
												<div class="tab_box_img"><img src="img/tab_box_img1.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口">适马（SIGMA）12-24 mm F4 DG HSM ART系列 恒定光圈 广角变焦镜头 尼康卡口（ 尼康卡口）</a>
											</div>
											<div id="box1_square1" class="box_square_1"></div>
											<div class="tab_box_money">¥9699</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_2">
											<a href="#" target="_blank" title="图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）">
												<div class="tab_box_img"><img src="img/tab_box2_img2.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）">图丽（TOKINA） AT-X 16-28mm F2.8 PRO FX 广角镜头 尼康卡口（黑色）</a>
											</div>
											<div id="box1_square2" class="box_square_1"></div>
											<div class="tab_box_money">¥4099</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_3">
											<a href="#" target="_blank" title="适马（SIGMA） 35mm F1.4 DG HSM 定焦镜头（尼康卡口）">
												<div class="tab_box_img"><img src="img/tab_box2_img3.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="适马（SIGMA） 35mm F1.4 DG HSM 定焦镜头（尼康卡口）">适马（SIGMA） 35mm F1.4 DG HSM 定焦镜头（尼康卡口）</a>
											</div>
											<div id="box1_square3" class="box_square_1"></div>
											<div class="tab_box_money">¥4599</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_4">
											<a href="#" target="_blank" title="腾龙（Tamron）18-270mm F/3.5-6.3 Di II VC PZD 镜头 尼康口">
												<div class="tab_box_img"><img src="img/tab_box2_img4.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="腾龙（Tamron）18-270mm F/3.5-6.3 Di II VC PZD 镜头 尼康口">腾龙（Tamron）18-270mm F/3.5-6.3 Di II VC PZD 镜头 尼康口</a>
											</div>
											<div id="box1_square4" class="box_square_1"></div>
											<div class="tab_box_money">¥2480</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_5">
											<a href="#" target="_blank" title="适马（SIGMA）85 mm F1.4 DG HSM ART系列 恒定光圈 标准人像定焦大光圈镜头 尼康卡口">
												<div class="tab_box_img"><img src="img/tab_box2_img5.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="适马（SIGMA）85 mm F1.4 DG HSM ART系列 恒定光圈 标准人像定焦大光圈镜头 尼康卡口">适马（SIGMA）85 mm F1.4 DG HSM ART系列 恒定光圈 标准人像定焦大光圈镜头 尼康卡口</a>
											</div>
											<div id="box1_square5" class="box_square_1"></div>
											<div class="tab_box_money">¥6999</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_6">
											<a href="#" target="_blank" title="富士(Fujifilm) XF23mmF2 R WR 镜头 富士 23 F2 定焦镜 黑色">
												<div class="tab_box_img"><img src="img/tab_box2_img6.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="富士(Fujifilm) XF23mmF2 R WR 镜头 富士 23 F2 定焦镜 黑色">富士(Fujifilm) XF23mmF2 R WR 镜头 富士 23 F2 定焦镜 黑色</a>
											</div>
											<div id="box1_square6" class="box_square_1"></div>
											<div class="tab_box_money">¥2950</div>
										</div>
									</li>
								</ul>
							</div>
							<div id="box_div3" class="hide" onmousemove="hideButtun()" onmouseout="showButtun()">
								<div id="box1_1" class="boxes">
									<a href="#" target="_blank" title="柯达（Kodak）FZ152 数码相机">
										<div class="tab_box_img"><img src="img/tab_box3_img1.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="柯达（Kodak）FZ152 数码相机">柯达（Kodak）FZ152 数码相机</a>
									</div>
									<div id="box1_square1" class="box_square_1"></div>
									<div class="tab_box_money">¥734</div>
								</div>
								<div id="box1_2" class="boxes">
									<a href="#" target="_blank" title="宝丽来（Polaroid）Z2300 拍立得数码相机 即拍即得 宝蓝色 限量款">
										<div class="tab_box_img"><img src="img/tab_box3_img2.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="宝丽来（Polaroid）Z2300 拍立得数码相机 即拍即得 宝蓝色 限量款">宝丽来（Polaroid）Z2300 拍立得数码相机 即拍即得 宝蓝色 限量款</a>
									</div>
									<div id="box1_square2" class="box_square_1"></div>
									<div class="tab_box_money">¥1499</div>
								</div>
								<div id="box1_3" class="boxes">
									<a href="#" target="_blank" title="尼康（NIKON） Coolpix A100 便携数码相机（2005万像素 2.7英寸屏 5倍光学变焦 26mm广角）黑色">
										<div class="tab_box_img"><img src="img/tab_box3_img3.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="尼康（NIKON） Coolpix A100 便携数码相机（2005万像素 2.7英寸屏 5倍光学变焦 26mm广角）黑色">尼康（NIKON） Coolpix A100 便携数码相机（2005万像素 2.7英寸屏 5倍光学变焦 26mm广角）黑色</a>
									</div>
									<div id="box1_square3" class="box_square_1"></div>
									<div class="tab_box_money">¥599</div>
								</div>
							</div>
							<div id="box_div4" class="hide" onmousemove="hideButtun()" onmouseout="showButtun()">
								<div id="box1_1" class="boxes">
									<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">
										<div class="tab_box_img"><img src="img/tab_box_img2.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="SP 128G 苹果笔记本扩容卡 xDrive L13">SP 128G 苹果笔记本扩容卡 xDrive L13</a>
									</div>
									<div id="box1_square1" class="box_square_1"></div>
									<div class="tab_box_money">¥479</div>
								</div>
							</div>
							<div id="box_div5" class="hide" onmousemove="hideButtun()" onmouseout="showButtun()">
								<div id="box1_1" class="boxes">
									<a href="#" target="_blank" title="尼康（Nikon）J5+1 尼克尔 VR 10-30mm f/3.5-5.6 PD镜头 白色">
										<div class="tab_box_img"><img src="img/tab_box5_img1.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="尼康（Nikon）J5+1 尼克尔 VR 10-30mm f/3.5-5.6 PD镜头 白色">尼康（Nikon）J5+1 尼克尔 VR 10-30mm f/3.5-5.6 PD镜头 白色</a>
									</div>
									<div id="box1_square1" class="box_square_1"></div>
									<div class="tab_box_money">¥2199</div>
								</div>
								<div id="box1_2" class="boxes">
									<a href="#" target="_blank" title="富士（FUJIFILM）X100F 数码旁轴相机 银色">
										<div class="tab_box_img"><img src="img/tab_box5_img2.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="富士（FUJIFILM）X100F 数码旁轴相机 银色">富士（FUJIFILM）X100F 数码旁轴相机 银色</a>
									</div>
									<div id="box1_square2" class="box_square_1"></div>
									<div class="tab_box_money">¥8600</div>
								</div>
								<div id="box1_3" class="boxes">
									<a href="#" target="_blank" title="适马（Sigma） DP3 Quattro DP3Q 便携式适马数码相机 DPQ系列">
										<div class="tab_box_img"><img src="img/tab_box5_img3.jpg" /></div>
									</a>
									<div class="tab_box_discrib">
										<a href="#" target="_blank" title="适马（Sigma） DP3 Quattro DP3Q 便携式适马数码相机 DPQ系列">适马（Sigma） DP3 Quattro DP3Q 便携式适马数码相机 DPQ系列</a>
									</div>
									<div id="box1_square3" class="box_square_1"></div>
									<div class="tab_box_money">¥4299</div>
								</div>
							</div>
							<div id="box_div6" class="hide">
								<ul id="uul6">
									<li class="boxes">
										<div id="box1_1">
											<a href="#" target="_blank" title="Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽">
												<div class="tab_box_img"><img src="img/tab_box6_img1.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽">Loukin 路尔新 W-02 电脑屏幕清洁湿巾 液晶 iphone6 iphone6plus触摸屏清洁 50 抽</a>
											</div>
											<div id="box1_square1" class="box_square_1"></div>
											<div class="tab_box_money">¥21</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_2">
											<a href="#" target="_blank" title="Loukin 路尔新 LW-01 白板清洁液 白板清洁 办公产品 白板 涂鸦板等通用">
												<div class="tab_box_img"><img src="img/tab_box6_img2.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Loukin 路尔新 LW-01 白板清洁液 白板清洁 办公产品 白板 涂鸦板等通用">Loukin 路尔新 LW-01 白板清洁液 白板清洁 办公产品 白板 涂鸦板等通用</a>
											</div>
											<div id="box1_square2" class="box_square_1"></div>
											<div class="tab_box_money">¥9.9</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_3">
											<a href="#" target="_blank" title="ZEISS德国卡尔蔡司专业光学拭镜纸 20片便携装">
												<div class="tab_box_img"><img src="img/tab_box6_img3.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="ZEISS德国卡尔蔡司专业光学拭镜纸 20片便携装">ZEISS德国卡尔蔡司专业光学拭镜纸 20片便携装</a>
											</div>
											<div id="box1_square3" class="box_square_1"></div>
											<div class="tab_box_money">¥24</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_4">
											<a href="#" target="_blank" title="Hello Kitty 屏幕清洁套装（专属限量版） 电脑清洁 LKT-01">
												<div class="tab_box_img"><img src="img/tab_box6_img4.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Hello Kitty 屏幕清洁套装（专属限量版） 电脑清洁 LKT-01">Hello Kitty 屏幕清洁套装（专属限量版） 电脑清洁 LKT-01</a>
											</div>
											<div id="box1_square4" class="box_square_1"></div>
											<div class="tab_box_money">¥88</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_5">
											<a href="#" target="_blank" title="ZEISS蔡司 光学屏幕清洁擦 套装">
												<div class="tab_box_img"><img src="img/tab_box6_img5.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="ZEISS蔡司 光学屏幕清洁擦 套装">ZEISS蔡司 光学屏幕清洁擦 套装</a>
											</div>
											<div id="box1_square5" class="box_square_1"></div>
											<div class="tab_box_money">¥99</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_6">
											<a href="#" target="_blank" title="Loukin 路尔新 L-F1 泡沫清洁套装 电脑 苹果笔记本 小米电视 显示器清洁">
												<div class="tab_box_img"><img src="img/tab_box6_img6.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Loukin 路尔新 L-F1 泡沫清洁套装 电脑 苹果笔记本 小米电视 显示器清洁">Loukin 路尔新 L-F1 泡沫清洁套装 电脑 苹果笔记本 小米电视 显示器清洁</a>
											</div>
											<div id="box1_square6" class="box_square_1"></div>
											<div class="tab_box_money">¥21</div>
										</div>
									</li>
								</ul>
							</div>
							<div id="box_div7" class="hide">
								<ul id="uul7">
									<li class="boxes">
										<div id="box1_1">
											<a href="#" target="_blank" title="GoPro HERO 5 Black 运动摄像机 4K高清 语音控制 防抖防水 新手套餐">
												<div class="tab_box_img"><img src="img/tab_box7_img1.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="GoPro HERO 5 Black 运动摄像机 4K高清 语音控制 防抖防水 新手套餐">GoPro HERO 5 Black 运动摄像机 4K高清 语音控制 防抖防水 新手套餐</a>
											</div>
											<div id="box1_square1" class="box_square_1"></div>
											<div class="tab_box_money">¥3049</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_2">
											<a href="#" target="_blank" title="GoPro运动摄像机配件Hand Wrist Strap手+腕带">
												<div class="tab_box_img"><img src="img/tab_box7_img2.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="GoPro运动摄像机配件Hand Wrist Strap手+腕带">GoPro运动摄像机配件Hand Wrist Strap手+腕带</a>
											</div>
											<div id="box1_square2" class="box_square_1"></div>
											<div class="tab_box_money">¥418</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_3">
											<a href="#" target="_blank" title="GoPro HERO5 黑狗5 专用电池 HERO5原装电池+国产双充">
												<div class="tab_box_img"><img src="img/tab_box7_img3.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="GoPro HERO5 黑狗5 专用电池 HERO5原装电池+国产双充">GoPro HERO5 黑狗5 专用电池 HERO5原装电池+国产双充</a>
											</div>
											<div id="box1_square3" class="box_square_1"></div>
											<div class="tab_box_money">¥199</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_4">
											<a href="#" target="_blank" title="Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包＋原装三项">
												<div class="tab_box_img"><img src="img/tab_box7_img4.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包＋原装三项">Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包＋原装三项</a>
											</div>
											<div id="box1_square4" class="box_square_1"></div>
											<div class="tab_box_money">¥888</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_5">
											<a href="#" target="_blank" title="Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包 ＋原装浮力棒s">
												<div class="tab_box_img"><img src="img/tab_box7_img5.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包 ＋原装浮力棒">Gopro Hero5 / Hero4 / Hero3+ 专用 原装收纳包 套装 内含 GOPRO原装收纳包 ＋原装浮力棒</a>
											</div>
											<div id="box1_square5" class="box_square_1"></div>
											<div class="tab_box_money">¥588</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_6">
											<a href="#" target="_blank" title="SP Hero 3 / 4 / 5 微单自拍杆 36英寸手持自拍杆GoPro自拍杆 相机自拍杆">
												<div class="tab_box_img"><img src="img/tab_box7_img6.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="SP Hero 3 / 4 / 5 微单自拍杆 36英寸手持自拍杆GoPro自拍杆 相机自拍杆">SP Hero 3 / 4 / 5 微单自拍杆 36英寸手持自拍杆GoPro自拍杆 相机自拍杆</a>
											</div>
											<div id="box1_square6" class="box_square_1"></div>
											<div class="tab_box_money">¥249</div>
										</div>
									</li>
								</ul>
							</div>
							<div id="box_div8" class="hide">
								<ul id="uul8">
									<li class="boxes">
										<div id="box1_1">
											<a href="#" target="_blank" title="B+W MRC-UV 62mm 多层镀膜UV滤镜">
												<div class="tab_box_img"><img src="img/tab_box8_img1.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="B+W MRC-UV 62mm 多层镀膜UV滤镜">B+W MRC-UV 62mm 多层镀膜UV滤镜</a>
											</div>
											<div id="box1_square1" class="box_square_1"></div>
											<div class="tab_box_money">¥319</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_2">
											<a href="#" target="_blank" title="曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯">
												<div class="tab_box_img"><img src="img/tab_box8_img2.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯">曼富图（Manfrotto）LUMIE MUSE流明6珠摄影便携LED闪光灯</a>
											</div>
											<div id="box1_square2" class="box_square_1"></div>
											<div class="tab_box_money">¥339</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_3">
											<a href="#" target="_blank" title="B+W 77MRC SILM CPL 多膜超薄偏振镜">
												<div class="tab_box_img"><img src="img/tab_box8_img3.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="B+W 77MRC SILM CPL 多膜超薄偏振镜">B+W 77MRC SILM CPL 多膜超薄偏振镜</a>
											</div>
											<div id="box1_square3" class="box_square_1"></div>
											<div class="tab_box_money">¥1088</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_4">
											<a href="#" target="_blank" title="豪雅（HOYA ) CPL 55mm CIR-PL Slim 超薄环形偏光镜 偏振镜">
												<div class="tab_box_img"><img src="img/tab_box8_img4.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="豪雅（HOYA ) CPL 55mm CIR-PL Slim 超薄环形偏光镜 偏振镜">豪雅（HOYA ) CPL 55mm CIR-PL Slim 超薄环形偏光镜 偏振镜</a>
											</div>
											<div id="box1_square4" class="box_square_1"></div>
											<div class="tab_box_money">¥139</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_5">
											<a href="#" target="_blank" title="豪雅（HOYA） HMC 55mm UV(C)专业UVl滤镜 多层镀膜抗紫外线超薄">
												<div class="tab_box_img"><img src="img/tab_box8_img5.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="豪雅（HOYA） HMC 55mm UV(C)专业UVl滤镜 多层镀膜抗紫外线超薄">豪雅（HOYA） HMC 55mm UV(C)专业UVl滤镜 多层镀膜抗紫外线超薄</a>
											</div>
											<div id="box1_square5" class="box_square_1"></div>
											<div class="tab_box_money">¥69</div>
										</div>
									</li>
									<li class="boxes">
										<div id="box1_6">
											<a href="#" target="_blank" title="豪雅（HOYA）77mm PRO1D 减光镜 ND16">
												<div class="tab_box_img"><img src="img/tab_box8_img6.jpg" /></div>
											</a>
											<div class="tab_box_discrib">
												<a href="#" target="_blank" title="豪雅（HOYA）77mm PRO1D 减光镜 ND16">豪雅（HOYA）77mm PRO1D 减光镜 ND16</a>
											</div>
											<div id="box1_square6" class="box_square_1"></div>
											<div class="tab_box_money">¥287</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="other_right3">
					<div class="tab2">
						<div id="tab2_canonBrand">
							<div id="tab2_canon_link">
								<a href="#" title="佳能品牌馆"><b>佳能品牌馆</b></a>
							</div>
							<div id="tab2_self_runPicture"></div>
						</div>
						<div id="white_block"></div>
						<div class="tab2_menu">
							<div id="tab2_shoppingcar">
								<div id="cart_background"></div>
								<a href="#">
									<div id="tab2_cart">加入购物车</div>
								</a>
								<div id="tab2_shoppingcar_pic">
									<div id="shoppingcar_img">
										<img src="img/cart_picture.jpg" />
									</div>
									<label>佳能（Canon）EOS M6 （EF-M 15-45mm f/3.5-6.3 IS STM） 微型单电套机 黑色 高速对焦 高速连拍</label>
									<div id="shoppingcar_money">¥4499</div>
								</div>
							</div>
							<ul>
								<li class="selected">商品介绍</li>
								<li>规格及包装</li>
								<li>售后服务</li>
								<li>评价<em> </em><label style="color: #FF3C3C;">${product.pingjiaSum }</label></li>
								<li>商品问答</li>
							</ul>
						</div>
						<div class="tab2_box">
							<div>
								<div id="picture1"><img src="img/picture1.jpg" /></div>
								<div class="picture"><img src="img/picture0.jpg" /></div>
								<div class="picture"><img src="img/picture2.jpg" /></div>
								<div class="picture"><img src="img/picture3.jpg" /></div>
								<div class="picture"><img src="img/picture4.jpg" /></div>
								<div class="picture"><img src="img/picture5.jpg" /></div>
								<div class="picture"><img src="img/picture6.jpg" /></div>
								<div class="picture"><img src="img/picture7.jpg" /></div>
								<div class="picture"><img src="img/picture8.jpg" /></div>
								<div class="picture"><img src="img/picture9.jpg" /></div>
								<div class="picture"><img src="img/picture10.jpg" /></div>
								<div class="picture"><img src="img/picture11.jpg" /></div>
								<div class="picture"><img src="img/picture12.jpg" /></div>
								<div class="picture"><img src="img/picture13.jpg" /></div>
								<div class="picture"><img src="img/picture14.jpg" /></div>
								<div class="picture"><img src="img/picture15.jpg" /></div>
								<div class="picture"><img src="img/picture16.jpg" /></div>
								<div class="picture"><img src="img/picture17.jpg" /></div>
								<div class="picture"><img src="img/picture18.jpg" /></div>
								<div class="picture"><img src="img/picture19.jpg" /></div>
								<div class="picture"><img src="img/picture20.jpg" /></div>
								<div class="picture"><img src="img/picture21.jpg" /></div>
								<div class="picture"><img src="img/picture22.jpg" /></div>
								<div class="picture"><img src="img/picture23.jpg" /></div>
								<div class="picture"><img src="img/picture24.jpg" /></div>
								<div class="picture"><img src="img/picture25.jpg" /></div>
								<div id="comprehensive_introduction">
									<p>【商品名称】：佳能（Canon）EOS M6（EF-M 15- 45mm f/3.5-6.3 IS STM）微型单电套机 黑色 高速对 焦 高速连拍</p>
									<p>【商品品牌】：佳能（Canon）</p>
									<p>【型号】：EOS M6</p>
									<p>【颜色】：黑色</p>
									<p>【镜头】：EF-M 15-45mm f/3.5-6.3 IS STM</p>
								</div>
							</div>
							<div class="hide">规格及包装</div>
							<div class="hide">售后服务</div>
							<div class="hide">评价</div>
							<div class="hide">商品问答</div>
						</div>
						<div id="together_buy">
							<div id="buy_desc">购买了此商品的用户经常一起买</div>
							<div class="buyDiv">
								<a href="#" title="单反相机"><img src="img/buy_img1.jpg" /></a>
								<a href="#" title="单反相机">单反相机</a>
							</div>
							<div class="buyDiv">
								<a href="#" title="镜头"><img src="img/buy_img2.jpg" /></a>
								<a href="#" title="镜头">镜头</a>
							</div>
							<div class="buyDiv">
								<a href="#" title="数码相机"><img src="img/buy_img3.jpg" /></a>
								<a href="#" title="数码相机">数码相机</a>
							</div>
							<div class="buyDiv">
								<a href="#" title="存储卡"><img src="img/buy_img4.jpg" /></a>
								<a href="#" title="存储卡">存储卡</a>
							</div>
							<div class="buyDiv">
								<a href="#" title="单电微单相机"><img src="img/buy_img5.jpg" /></a>
								<a href="#" title="单电微单相机">单电微单相机</a>
							</div>
							<div class="buyDiv">
								<a href="#" title="清洁用品"><img src="img/buy_img6.jpg" /></a>
								<a href="#" title="清洁用品">清洁用品</a>
							</div>
						</div>
						<div id="information_error">
							<label>如果如发现商品介绍信息有误，您可以点击【</lable>
							<a href="#" target="_blank">信息纠错</a> 
							<lable>】反馈给我们，谢谢。</label>
						</div>
						<div id="server_promise">
							<p class="tit">服务承诺</p>
							<p class="con">网站所售产品均为厂商正品，如有任何问题可与我们客服人员联系，我们会在第一时间跟您沟通处理。我们将争取以更具竞争力的价格、更优质的服务来满足您最大的需求。开箱验货：请根据本页面开箱验货标准进行验收。如存在包装破损等影响签收的因素，请您可以拒收全部商品（包括赠品）；为了保护您的权益，建议您尽量不要委托他人代为签收；如由他人代为签收商品而没有在配送人员在场的情况下验货，则视为您所订购商品的包装无任何问题。</p>
							<p class="tit">温馨提示</p>
							<p class="con">由于部分商品包装更换较为频繁，因此您收到的货品有可能与图片不完全一致，请您以收到的商品实物为准，同时我们会尽量做到及时更新，由此给您带来不便多多谅解，谢谢！</p>
							<p class="tit">价格说明</p>
							<p class="con">
								<strong>1号店价：</strong>
								<label>商品在1号店平台上，不参加降价让利促销团购等活动时的常规销售价格。</label>
								<br>
								<strong>1号团：</strong>
								<label>商品在1号店平台上，参加团购活动的团购商品的销售价格。</label>
								<br>
								<strong>参考价：</strong>
								<label>商品展示的参考价，可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在1号店平台曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价、销售商门店曾经展示过的销售价等可能会与您购物时展示的不一致，该价格仅供您参考。</label>
								<br>
								<strong>问题反馈：</strong>
								<label>如有疑问，建议您在购买前联系客服咨询。</label>
								<br>
							</p>
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
			</div>

			<div id="blackbarDiv"></div>
			<script type="text/javascript">
				$(function(){
					var count = $("#count").val(); 
				});
				function addShoppingCart(){
				
					location.assign("/ts0.1/ShoppingCarServlet?action=getProduct&pid=${product.pid}&count=" + $("#count").val());
				}
			</script>
	</body>

</html>