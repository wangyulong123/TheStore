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
		<title>1号店-支付</title>
		<link rel="shortcut icon" href="img/icon.png"/>
		<link rel="stylesheet" type="text/css" href="css/querendingdan.css"/>
		<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
				$(function(){
					var span1;
					var t = 10;
					
					window.setInterval(gotoshouye,1000);
					
					function gotoshouye () {
						span1 = document.getElementById("span1");
						span1.innerHTML = t;
						if(t>=0){
							--t;
						}
						if(t==-1){
							location.assign("jsp/HomePage/index.jsp");
							t=10;
						}
					}
				});
				
		</script>
	</head>
	<body>
		<a name="top"></a>
		<div id="all">
			<div id="top">
				<a id="logo" href="#"><img src="img/yhd.png"/></a>
				<div id="bg_head4">
				</div>
			</div>
			
			<div class="main">
				<div style="width:1100px;height:450px;position: relative;">
					<div style="position: absolute;left:30%;top:10%;"><img src="img/submitSuccess.png"/></div>
					<div style="font-size:26px;position: absolute;left:40%;top:20%;">
						<b>恭喜您！已成功支付此订单！</b><span style="font-size:16px;">查看 <a href="DingdanServlet?action=examineOrder">历史订单</a></span>
					</div>
					<div style="font-size:16px;position: absolute;left:45%;top:40%;">
						
						<br/>
						  <span id="span1" style="font-size:18px;">10</span> 秒后	<a href="jsp/HomePage/index.jsp">返回首页</a>
					</div>
				</div>
				<br/>
				
			</div>
			
			
			<div id="fixedImg">
				
				<a href="" class="fankui"><img id="fkh" src="img/fankuihover.png" alt="用户反馈" title="用户反馈"/><br/><img src="img/fankui.png"/></a><br/>
				<a href="#top" class="huidingbu"><img src="img/fanhuidingbu.png" /><br/><img id="hdb" src="img/dingbuhover.png" alt="返回顶部" title="返回顶部"/></a><br/>
				
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
