<%@ page language="java"
	import="java.util.*,com.page.PageInfo,com.vo.Product"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>手机品种齐全，价格优惠。&nbsp;-1号店</title>
<link rel="shortcut icon" href="staticTheStore/img/mobile/icon.png" />
<link href="staticTheStore/css/phones.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="staticTheStore/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="staticTheStore/js/phones.js"></script>
</head>

<body>
	<%
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	%>
	<div id="top">
		<div class="layout">
			<div id="left">
				<a href="#"><img src="staticTheStore/img/mobile/place.jpg" />
					送货地址:北京市</a>
			</div>
			<div id="right">
				<div id="msg" class="menu">
					<a href="#" title="aa">Hi,请登录 </a> <a href="#">注册&nbsp;&nbsp;</a>
				</div>
				<div id="mine" class="menu">
					<a href="#"><img src="staticTheStore/img/mobile/dingdan.jpg" />我的订单</a>
				</div>
				<div id="menu">
					<li><a href="#" id="one">充值中心</a>
						<ul id="one1">
							<li><a href="#">话费充值</a></li>
							<li><a href="#">流量充值</a></li>
						</ul></li>
					<li><a href="#" id="two">客户服务</a>
						<ul id="two1">
							<li><a href="#">包裹跟踪</a></li>
							<li><a href="#">常见问题</a></li>
							<li><a href="#">在线退换货</a></li>
							<li><a href="#">配送范围</a></li>
						</ul></li>
					<li><a href="#" id="three">网站导航</a>
						<ul id="three1">
							<li><a href="#">1号商城</a></li>
							<li><a href="#">1号社区</a></li>
							<li><a href="#">网站联盟</a></li>
							<li><a href="#">招商通道</a></li>
							<li><a href="#">企业采购</a></li>
							<li><a href="#">充值中心</a></li>
						</ul></li>
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
					<form id="categoryForm"
						action="PhonesServlet?action=getPageByQuery" method="post">
						<div id="sousuokuang">
							<input id="input1" type="text" placeholder="三门智控冰箱抢免单"
								id="searchCondition" name="searchCondition"
								value="${requestScope.searchCondition}" /> <input id="input2"
								type="image" width="53px" height="41px"
								src="staticTheStore/img/mobile/sousuo.png" alt="Submit" />
							<!-- 								<img src="staticTheStore/img/mobile/sousuo.png" />

 -->
						</div>
					</form>

					<div id="shoppingCar">
						<img src="staticTheStore/img/mobile/shoppingCar.png" />&nbsp;&nbsp;购物车
					</div>
				</div>
				<div id="brand">
					<ul>
						<li><a href="#">手机</a></li>
						<li><a href="#">zuk手机</a></li>
						<li><a href="#">乐视手机乐s3</a></li>
						<li><a href="#">z17</a></li>
						<li><a href="#"> 天机c2016</a></li>
						<li><a href="#"> 微软手机</a></li>
						<li><a href="#"> zxsony</a></li>
						<li><a href="#"> 华为手机p10</a></li>
						<li><a href="#"> 天翼手机</a></li>
						<li><a href="#"> 小米品牌</a></li>
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
					<li><a href="#">1号抢购</a></li>
					<li><a href="#">1号团</a></li>
					<li><a href="#">领券中心</a></li>
					<li><a href="#">商城优选</a></li>
					<li><a href="#">全球进口</a></li>
					<li><a href="#">1号生鲜</a></li>
					<li><a href="#">美妆馆</a></li>
					<li><a href="#">家居馆</a></li>
					<li><a href="#">电器城</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="search2">
		<div class="layout">
			<div id="suoshuleibie1img">
				<img src="staticTheStore/img/mobile/icon1.png">
			</div>
			<div id="sousuoleibie1">
				<a href="#">手机、数码、配件</a> <span>&nbsp;&nbsp;></span>
			</div>
			<div id="sousuoleibie2">
				<a href="#">手机通讯<img title="xiajiantou"
					src="staticTheStore/img/mobile/jiantou.png"></a> <span>&nbsp;&nbsp;></span>
			</div>
			<div id="sousuoleibie3">
				<a href="#">手机<img title="xiajiantou"
					src="staticTheStore/img/mobile/jiantou.png"></a> <span>&nbsp;&nbsp;></span>
			</div>
			<div id="searchPhone">
				<input type="text" id="searchPhone" name="searchPhone"
					placeholder="在结果中查找">
			</div>
		</div>
	</div>

	<div id="category">
		<div class="layout">

			<div id="require1" class="require">
				<div id="pinPai" class="tiaojian">品牌</div>
				<div id="pinPaiMingCheng">
					<iframe id="shoujiIcon" src="staticTheStore/shouji.html"
						width="974px" height="104px" frameborder="0" scrolling="auto"></iframe>
					<div id="morePhone">
						<a href="#" id="aaa">多选</a> <span>更多</span>
					</div>
				</div>

			</div>
			<div id="require2" class="require requires">
				<div id="choice" class="tiaojian">大家都在选</div>
				<div class="zhonglei">
					<ul>
						<li><a href="#">曲面屏</a></li>
						<li><a href="#">商务手机</a></li>
						<li><a href="#">三防手机</a></li>
						<li><a href="#">老人机</a></li>
					</ul>
				</div>
				<div class="mChoices">
					<a href="#"> 多选</a>
				</div>
			</div>
			<div id="require3" class="require requires">
				<div class="layout">

					<div id="net" class="tiaojian">网络制式</div>
					<div class="zhonglei">
						<ul>
							<li><a href="#">全网通</a></li>
							<li><a href="#"> 移动/联通双4G</a></li>
							<li><a href="#"> 移动4G</a></li>
							<li><a href="#"> 电信4G</a></li>
							<li><a href="#">联通4G</a></li>
							<li><a href="#">移动3G</a></li>
							<li><a href="#"> 电信3G</a></li>
							<li><a href="#"> 联通3G</a></li>
							<li><a href="#"> GSM(移动/联通2G)</a></li>
							<li><a href="#"> 电信2G</a></li>
						</ul>
					</div>
					<div class="mChoices">
						<a href="#"> 多选</a>
					</div>
				</div>
			</div>
			<div id="require4" class="require requires">
				<div class="layout">

					<div id="size" class="tiaojian">显示屏尺寸</div>
					<div class="zhonglei">
						<ul>
							<li><a href="#"> 7.0英寸以上</a></li>
							<li><a href="#"> 5.0-7.0英寸</a></li>
							<li><a href="#"> 4.0-4.9英寸</a></li>
							<li><a href="#"> 3.5-3.9英寸</a></li>
							<li><a href="#"> 2.7-3.4英寸</a></li>
							<li><a href="#"> 2.7英寸以下</a></li>
						</ul>
					</div>
					<div class="mChoices">
						<a href="#"> 多选</a>
					</div>
				</div>
			</div>
			<div id="require5" class="require requires">
				<div class="layout">
					<div id="ram" class="tiaojian">运存(RAM)</div>
					<div class="zhonglei">
						<ul>
							<li><a href="#">4GB</a></li>
							<li><a href="#">3GB</a></li>
							<li><a href="#">2GB</a></li>
							<li><a href="#">1.5GB</a></li>
							<li><a href="#">1GB</a></li>
							<li><a href="#">768MB</a></li>
							<li><a href="#">512MB</a></li>
							<li><a href="#">384MB</a></li>
							<li><a href="#">356MB</a></li>
							<li><a href="#">256MB</a></li>
							<li><a href="#">256MB以下</a></li>
						</ul>
					</div>
					<div class="mChoices">
						<a href="#"> 多选</a>
					</div>
				</div>
			</div>
			<div id="require6" class="require requires">
				<div class="layout">

					<div id="price1" class="tiaojian">价格</div>
					<div class="zhonglei">
						<ul>
							<li><a href="#">0-413元</a></li>
							<li><a href="#">413-873元</a></li>
							<li><a href="#">873-1434元</a></li>
							<li><a href="#">1434-2168元</a></li>
							<li><a href="#">2168-4155元</a></li>
							<li><a href="#">4155元以上</a></li>

						</ul>
					</div>
					<div class="mChoices">
						<a href="#"> 多选</a>
					</div>
				</div>
			</div>
			<!-- <div id="require7" class="require requires">
				<div class="layout">
					<div id="more" class="tiaojian">更多筛选项</div>
					<div class="zhonglei">
					<div id="shexiangtou1">	<label>摄像头像素</label>
					</div>
							<div id="shexiangtou">
								<ul>摄像头像素
									<li><a href="#">无摄像头</a></li>
									<li><a href="#">300万以下</a></li>
									<li><a href="#">300-799万</a></li>
									<li><a href="#">800-1199万</a></li>
									<li><a href="#">1200-1599万</a></li>
									<li><a href="#">1600万及以上</a></li>
								</ul>
							</div>
						<li class="xiala2">系统
							<ul>
								<li><a href="#">Android</a></li>
								<li><a href="#">IOS</a></li>
								<li><a href="#">Windowphone</a></li>
								<li><a href="#">非智能手机</a></li>
								<li><a href="#">其他智能系统</a></li>
							</ul>
						</li>
						<li class="xiala2">手机内存
							<ul>
								<li><a href="#">16GB</a></li>
								<li><a href="#">64GB</a></li>
								<li><a href="#">2GB</a></li>
								<li><a href="#">32GB</a></li>
								<li><a href="#">4GB</a></li>
								<li><a href="#">256MB</a></li>
								<li><a href="#">8GB</a></li>
								<li><a href="#">128GB</a></li>
								<li><a href="#">1GB</a></li>
								<li><a href="#">512GB</a></li>
								<li><a href="#">256GB</a></li>
								<li><a href="#">450GB</a></li>
							</ul>
						</li>
						<li class="xiala2">单卡双卡
							<ul>
								<li><a href="#">双卡双待</a></li>
								<li><a href="#">单卡单待</a></li>
								<li><a href="#">单卡多模</a></li>
								<li><a href="#">双卡单待</a></li>
							</ul>
						</li>
					</div>
				</div>
			</div>
		</div> -->
	</div>

	<div id="sort">
		<div class="layout">
			<div id="sortt">
				<div id="sort1">
					<ul>
						<li id="zonghe" class="xuanZhongTiaoJian">综合</li>
						<li >销量<b>⬇</b></li>
						<li id="pid">新品<b>⬇</b></li>
						<li id="pingjiaSum">评论<b>⬇</b></li>
						<li id="price">价格<b>⬇</b></li>

					</ul>
					<div id="jiaGeQingDan">
						<div id="input">
							<input type="text" placeholder="￥"><span>&nbsp;&nbsp;-&nbsp;&nbsp;</span><input
								type="text" placeholder="￥">
						</div>
						<div id="jiaGeLieBiao">
							<p>
								<input id="low" type="text" placeholder="￥"><span>&nbsp;&nbsp;-&nbsp;&nbsp;</span><input
									id="high" type="text" placeholder="￥"><label
									id="qingChu">清除</label><label id="queDing">确定</label>
							</p>
							<ul>
								<li><label>0</label>-<label>79</label>元</li>
								<li><label>80</label>-<label>299</label>元</li>
								<li><label>300</label>-<label>799</label>元</li>
								<li><label>800</label>-<label>1299</label>元</li>
								<li><label>1300</label>-<label>2399</label>元</li>
								<li><label>2400</label>-<label>4599</label>元</li>
								<li><label>4600</label>-<label>2474099</label>元</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="sort2">
					<ul>
						<li><a href="#"><img
								src="staticTheStore/img/mobile/店铺.png">店铺</a></li>
						<li><a href="#"><img
								src="staticTheStore/img/mobile/大图.png">大图</a></li>
						<li>
							<!-- 页数 -->
							<div id="number">
								<span class="fp-txt"> <b><%=pageInfo.getCurrentPage()%></b>
									<em>/</em> <i><%=pageInfo.getTotalPageCount()%></i>
								</span> <a id="fp-prevLink" class="fp-prev"
									href="/ts0.1/PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=pageInfo.getPreviousPage()%>">
									<</a> <a id="fp-nextLink" class="fp-next"
									href="/ts0.1/PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=pageInfo.getNextPage()%>">></a>
							</div>
						
						</li>
					</ul>
				</div>

			</div>

		</div>
	</div>

	<div id="sort3">
		<div class="layout">
			<div id="sort4">
				&nbsp;&nbsp;<input type="checkbox" name="shaixuan"
					value="1HaoZiYing">&nbsp;&nbsp;1号自营&nbsp;&nbsp; <input
					type="checkbox" name="shaixuan" value="ShangJiaBaoYou">&nbsp;&nbsp;商家包邮&nbsp;&nbsp;
				<input type="checkbox" name="shaixuan" value="BaoLeiJia">&nbsp;&nbsp;堡垒价&nbsp;&nbsp;
				<input type="checkbox" name="shaixuan" value="YouHuo">&nbsp;&nbsp;仅显示有货&nbsp;&nbsp;
				<input type="checkbox" name="shaixuan" value="1HaoTuan">&nbsp;&nbsp;1号团&nbsp;&nbsp;
				<input type="checkbox" name="shaixuan" value="ManJian">&nbsp;&nbsp;满减&nbsp;&nbsp;
				<input type="checkbox" name="shaixuan" value="ManZeng">&nbsp;&nbsp;满赠&nbsp;&nbsp;
			</div>
		</div>
	</div>

	<div id="first">
		<div class="layout1">

			<div id="ffirst" class="dot">
				<%
					List<Product> list = (List<Product> )request.getAttribute("list");
																												for(Product product:list){
				%>


				<a href="PhonesServlet?action=getOnePhone&pid=<%=product.getPid()%>"
					target="_blank">
					<div id="first2" class="goods">
						<img src="staticTheStore/img/mobile/HUAWEIP10.jpg" />
						<div class="top-right">
							<img src="staticTheStore/img/mobile/new.png">
						</div>
						<p class="jiage"><%=product.getPrice()%></p>
						<p class="desc1">
							<a href="#"><%=product.getPname()%></a>
						</p>
						<p class="desc2">
							<a href="#"><%=product.getPdesc()%></a>
						</p>
						<div class="sc">
							<a class="shopping"
								href="PhonesServlet?action=getOnePhone&pid=<%=product.getPid()%>"
								target="_blank">查看详情</a>
						</div>
						<p class="pingLun">
							<a href="#" class="estimate"><img
								src="staticTheStore/img/mobile/pingJia.jpg"><%=product.getPingjiaSum()%></a><span><img
								src="staticTheStore/img/mobile/zan.png">&nbsp;98%</span>
						</p>
						<p class="shopName">
							<a href="#"><%=product.getDianpuName()%></a>
						</p>

					</div>
				</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div id="page">
		<div class="layout">
			<div id="manYiDu">
				您对当前页面的结果是否满意？ <a href="#">满意</a> <a href="#">不满意</a>
			</div>
			<div class="pageNumb">
				<div class="p-wrap">
					<span class="p-num"> <a id="previous"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=pageInfo.getPreviousPage()%>"
						class="pn-prev"> <i><</i> <em>上一页</em>
					</a> <%
 	int totalPageCount = pageInfo.getTotalPageCount();
            								int currentPage = pageInfo.getCurrentPage();
            								
            								if(totalPageCount<=10){
            									//全部打印出来
            									for(int i=1;i<=totalPageCount;i++){
 %> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=i%>"><%=i%></a>
						<%
							}
																																																																							
																																																																							
																																																																						}else{
																																																																							//当前页的样式为 class="curr"
																																																																							//打印一部分

																																																																							if(currentPage<=5){
																																																																								//从1开始打印 打印到 当前页数 + 2页
																																																																								for(int i=1;i<=currentPage+2;i++){
						%> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=i%>"><%=i%></a>
						<%
							}
						%> <!--  打印..--> <b class="pn-break">...</b> <!-- 打印最后一页(即总共的页数) -->
						<a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=totalPageCount%>"><%=totalPageCount%></a>
						<%
							}else if(currentPage<totalPageCount-3){//当前页<总页数-3   8
						%> <!--始终打印10个
												先打印1  和 ..  --> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=1">1</a>
						<b class="pn-break">...</b> <%
 	//从当前页-3 开始打印  打印到当前页+2
            										for(int i=currentPage-3;i<=currentPage+2;i++){
 %> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=i%>"><%=i%></a>
						<%
							}
						%> <!--  打印 ..  和最后一页--> <b class="pn-break">...</b> <a
						pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=totalPageCount%>"><%=totalPageCount%></a>
						<%
							}else {//8
						%> <!-- 先 打印 1 和 .. --> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=1">1</a>
						<b class="pn-break">...</b> <%
 	//再打印 当前页-3 到剩下的
            										for(int i=currentPage-3;i<=totalPageCount;i++){
 %> <a pageNum="pageNum"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=i%>"><%=i%></a>
						<%
							}
																																																																							}
																																																																							
																																																																							
																																																																						
																																																																						}
						%> <a id="next"
						href="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}&requestPage=<%=pageInfo.getNextPage()%>"
						class="pn-prev"> <em>下一页</em> <i>></i>
					</a>
					</span> <span class="p-skip">
						<form id="productForm2"
							action="PhonesServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&orderCondition=${orderConditionObj.orderCondition}&ascOrDesc=${orderConditionObj.ascOrDesc}"
							method="post">
							<em>共<b><%=totalPageCount%></b>页&nbsp;&nbsp;到第
							</em> <input class="input-txt" type="text" name="requestPage"
								id="requestPage" value="<%=pageInfo.getCurrentPage()%>" /><em>页</em>
							<a id="submitProductForm2Link" href="javascript:void(0)"
								class="btn btn-default">确定</a>
						</form>
					</span>

				</div>

			</div>
		</div>

	</div>
	</div>

	<div id="introduce">
		<div class="layout1">
			<div id="intro">
				<h2>手机</h2>
				<p>欢迎来到1号店手机购物网页。随着社会的发展，手机已经成为了我们的必需品，它会给我们的生活带来无限的便捷。
					我们不但可以通过手机打电话维持我们的亲情、爱情、友情，还可以用手机上网、看影片、购物、发邮件、转账等等。
					1号店的手机频道为各位精心挑选了各式各样的手机，手机从种类上分有老人机、音乐机、商务机、游戏机等、手机
					的产地有国产手机、港版手机、国外进口手机，手机从网络制式上来分，有GSM、电信2g、电信3g、电信4g、联通3g、
					联通4g、移动3g、移动4g、全网通等，手机的屏幕大小有3.5-3.9英寸、4.0-4.9英寸、5.0-7.0英寸、7.0英寸以上，
					手机的像素有300以下、300-799万、800-1199万、1200万以上，手机系统有安卓、苹果、非智能等、也有双卡双待
					手机、双卡单待手机、单卡手机、品牌方面，我们考虑到大家的需求，为您准备了苹果、华为、三星、步步高、小米、
					诺基亚、中兴、乐视等多个品牌。同时，为了更方便您的选购，我们还准备了手机配件，有耳机、电板、手机壳、
					手机膜、充电器、自拍杆、手机支架等，除了浏览1号店手机页面之外，也欢迎您通过1号店的场景化购物、自动化货架
					1号店社区、搜索列表上的排序工具，以及商品下的评论来寻找您需要的各种产品，祝您购物愉快。</p>
			</div>
		</div>
	</div>

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
								<li><a href="#">购物流程</a></li>
								<li><a href="#">会员制度</a></li>
								<li><a href="#">订单查询</a></li>
								<li><a href="#">发票制度</a></li>
								<li><a href="#">常见问题</a></li>
							</ul></li>

						<li><b>支付方式</b>
							<ul>
								<li><a href="#">货到付款</a></li>
								<li><a href="#">网上支付</a></li>
								<li><a href="#">银行转账</a></li>
								<li><a href="#">礼品卡支付</a></li>
								<li><a href="#">其他支付</a></li>
							</ul></li>

						<li><b>配送服务</b>
							<ul>
								<li><a href="#">配送范围及运费</a></li>
								<li><a href="#">配送进度查询</a></li>
								<li><a href="#">自提服务</a></li>
								<li><a href="#">商品验货与签收</a></li>
							</ul></li>

						<li><b>售后保障</b>
							<ul>
								<li><a href="#">退换货政策</a></li>
								<li><a href="#">退换货流程</a></li>
								<li><a href="#">退款说明</a></li>
								<li><a href="#">延保说明页面</a></li>
								<li><a href="#">联系客服</a></li>
							</ul></li>
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
			<div id="foot_foot">

				<div id="foot_down">
					<ul>
						<li><a href="#">沪ICP备16050468号</a></li>
						<li><a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;经营证照&nbsp;&nbsp;&nbsp;&nbsp;
								|</a></li>
						<li><a href="#">互联网药品信息服务资格证&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
						<li><a href="#">违法和不良信息举报电话：0514-85899118</a></li>
						<li><a href="#">|&nbsp;&nbsp;&nbsp;&nbsp;沪B2-20170039</a></li>
					</ul>
				</div>
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
					<li><a href="#"><img
							src="staticTheStore/img/mobile/yinlian.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/shanghaigongshang.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/wangluoshehui.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/yinpin.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/dajiaping.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/msg.webp.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/chengxin.jpg" /></a></li>
					<li><a href="#"><img
							src="staticTheStore/img/mobile/pingjia.png" /></a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {

			//给排序按钮绑定mouseover事件
			/* 			$("#sort1 ul li").click(function(){
			
			 if(!$(this).attr("class").contains("xuanZhongTiaoJian")){//不是当前使用的条件 才回悬浮变红
			 alert($(this).eq(0).text());
			 //$(this).find(":nth-child(2)").css("background-image","url(img/product/arrow/redDown.png)");
			 } */
			//修改排序的状态图标
			var orderCondition = "${orderConditionObj.orderCondition}";

			var ascOrDesc = "${orderConditionObj.ascOrDesc}";

	 		var currentA = "#sort1>ul>li[id='" + orderCondition + "']";
			// $(currentA).addClass("cur");
			 if ("asc" == ascOrDesc) {//如果是升序		
				$(currentA).find("b").html("⬇");//
				
				$(currentA).addClass("xuanZhongTiaoJian");
				$(currentA).siblings().removeClass("xuanZhongTiaoJian");
			 } else {
				$(currentA).find("b").html("⬆");
				$(currentA).addClass("xuanZhongTiaoJian");
				$(currentA).siblings().removeClass("xuanZhongTiaoJian");
			 }

			var lastAscOrDesc = "${orderConditionObj.ascOrDesc}";
			//给价格超链接绑定事件   第一次点击降序 第二次点击升序  第三次降序 第四次 升序  依次类推
			$("#price")
					.click(
							function() {
								if (lastAscOrDesc == "asc") {//先降序
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=desc";
									location.assign(target);
								} else if (lastAscOrDesc == "desc") {
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=asc";
									location.assign(target);
								
								}
							});

			//按评价数量排序
			$("#pingjiaSum")
					.click(
							function() {
							

								if (lastAscOrDesc == "asc") {//先降序

									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjiaSum&ascOrDesc=desc";

									location.assign(target);
								} else if (lastAscOrDesc == "desc") {

									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjiaSum&ascOrDesc=asc";

									location.assign(target);
								}

							});

			//按销量排序
			$("#xiaoliang")
					.click(
							function() {
								if (lastAscOrDesc == "asc") {
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pid&ascOrDesc=desc";
									location.assign(target);
								} else if (lastAscOrDesc == "desc") {
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pid&ascOrDesc=asc";
									location.assign(target);
								}
							});

			//按上架时间排序
			$("#xinpin")
					.click(
							function() {
								if (lastAscOrDesc == "asc") {
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pid&ascOrDesc=desc";
									location.assign(target);
								} else if (lastAscOrDesc == "desc") {
									var target = "/ts0.1/PhonesServlet?action=getPageByQuery&cid=62&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pid&ascOrDesc=asc";
									location.assign(target);
								}
							});

			var currentPage =
	<%=pageInfo.getCurrentPage()%>
		;
			var totalPageCount =
	<%=pageInfo.getTotalPageCount()%>
		;
			if (currentPage == totalPageCount) {
				//最后一页时 "下一页"和"尾页"不能能用
				$("#fp-nextLink").addClass("disabled");
				$("#next").addClass("disabled");

			}
			if (currentPage == 1) {
				$("#fp-prevLink").addClass("disabled");
				$("#previous").addClass("disabled");
			} else if (currentPage == totalPageCount) {
				//最后一页时 "下一页"和"尾页"不能能用
				$("#fp-nextLink").addClass("disabled");
				$("#next").addClass("disabled");

			}
//给submitProductForm2A超链接绑定事件
		$("#submitProductForm2Link").click(function() {


			//点击这个超链接 提交表单
			$("#productForm2").submit();
		});
			//价格筛选绑定事件
			$("#jiaGeLieBiao>ul>li").click(function() {
				var low = $(this).children().eq(0).html();
				var high = $(this).children().eq(1).html();
				//alert(low);
				//alert(high);
				$("#low").val(low);
				$("#high").val(high);
			});
			//发送价格区间

			$("#queDing")
					.click(
							function() {
								if (low.value != "" && high.value != "") {
									var target = "/ts0.1/PhonesServlet?action=getProductByPrice&cid=62&requestPage=1&orderCondition=price&ascOrDesc=desc&low="
											+ low.value + "&high=" + high.value;
									location.assign(target);
								} else {
									$("#jiaGeLieBiao").hide();
									$("#jiaGeQingDan").show();
								}
							});
			$("#qingChu").click(function() {
				$("#low").val("");
				$("#high").val("");
			});

		});
	</script>
</body>

</html>