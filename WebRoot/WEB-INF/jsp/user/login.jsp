<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>1号店登录</title>	
		
    	<link rel="shortcut icon" href="staticTheStore/img/icon.jpg"/>  
		<script type="text/javascript" src="staticTheStore/js/jquery-2.1.4.js"></script>
		<script type="text/javascript"src="staticTheStore/js/login.js"></script>
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/login.css"/>
	
	</head>
	<body>
	
		<div class="head">			
			<div><a href="#" ><img src="staticTheStore/img/logo.jpg" id="imglogo" /> </a></div>
			<div id="fontlogo"><center>您好,&nbsp;欢迎光临1号店！&nbsp;&nbsp;<a href="loginServlet?action=gotologin">请登录</a>
				&nbsp;&nbsp;&nbsp;&nbsp;</center>
			   <div id="hd_menu">			
					<div id="xuanting"><img  id="help" src="staticTheStore/img/help.png"/>
						<a  id="helpcenter" href="#" >帮助中心&nbsp;</a><img  id="openall" src="staticTheStore/img/openall.png" />
					</div>		
			
            		<div id="xialakuang">
        		     <ul>					
						<li class="fenlei"><a href="#">包裹跟踪</a></li>
						<li class="fenlei"><a href="#">常见问题</a></li>
						<li class="fenlei"><a href="#">在线退换货</a></li>
						<li class="fenlei"><a href="#">在线投诉</a></li>
						<li class="fenlei"><a href="#">配送范围</a></li>		
           		   </ul> 
           	 	</div>
			 </div>	
			</div>
		</div>
			
		<div class="body">
		
			<div ><img src="staticTheStore/img/11.jpg" id="img"/></div>
		
			<center><div id="denglu" name="denglu">
				
					<form action="#" method="post">
				<div id="dengluziti">
					<pre><h4>1号店用户登录                     <a href="loginServlet?action=gotoregist" id="zhucexinzhanghao">注册新账号</a></h4></pre>
				</div>
				
				<div id="title"><input type="text" name="title" id="title"  disabled="disabled"/></div>
	
	<form id="loginForm" action="UserServlet" method="post">		
				
				<div id="shurukuang">
					<label id="label1"><img  src="staticTheStore/img/user.png"/></label>
					<input type="text" name="username" id="username" value="邮箱/手机/用户名" autocomplete="off" onfocus="test();" onblur="test2();" />
				</div>
				
				<div id="mimakuang">
					<label  id="label2"><img  src="staticTheStore/img/mima.png"/></label>
					<input type="text" name="password" id="password" value="密码" oncopy="return false" outcut="return false" onpaste="return false" onfocus="test3();" onblur="test4();"  />
				</div>
				
				
				<div id="wangjimima"><pre><input type="checkbox" name="agree" id="agree" /> 自动登录 <input type="text" name="warn" id="warn" value="请勿在公共电脑上启用" />       <span><a href="#">忘记密码?</a></span></pre>
				</div>
				
			<!--	<div id="dengluanniu"><botton type="button" name="btn2" id="btn1">登录</botton></div>-->
				
				<div ><a href="javascript:void(0)" id="dengluanniu" >登录</a></div>
	</form>			
				<div id="gengduo"><pre>更多合作网站账号登录                                        </pre></div>
				
				<div id="fourlink">
					<ul>
						<li><a href="#"><img src="staticTheStore/img/qq.png" class="imgjianrong"/> </a></li>
						<li><a href="#"><img src="staticTheStore/img/jd.png" class="imgjianrong"/> </a></li>
						<li><a href="#"><img src="staticTheStore/img/wx.png" class="imgjianrong"/> </a></li>
						<li><a href="#"><img src="staticTheStore/img/wb.png" class="imgjianrong"/> </a></li>
						
					</ul>		
				</div>
				
				
				
				<div id="more">更多合作网站  <img id="open" src="staticTheStore/img/zhankai.png"/><img id="close" src="staticTheStore/img/shouqi.png"/></div>
				<div class="morebox" id="morebox" name="morebox">
					<ul class="ul">	
						<li ><span><a href="#"><img src="staticTheStore/img/zfb.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/wy.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/bd.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/zgyd.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/kxw.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/rrw.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/pa.png" class="imgjianrong"/></a></span></li>
						<li><span><a href="#"><img src="staticTheStore/img/mgj.png" class="imgjianrong"/></a></span></li>
					</ul>
				</div>			 
								
				</form>			
				<div>
					<div id="divClass1" name="divClass1"></div>			
				</div>
				
				
			</div></center>
		
		
			<div id="denglu2" name="denglu">
					<div id="saoma">
						<h4 id="biaoti">用<label id="label3">1号店APP</label>登录</h4>			
						<div id="erweima"><img src="staticTheStore/img/QRcode.png"/></div>
						<div id="shuaxin">刷新二维码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						使用帮助</div>
						<div id="shibai">扫描不上，版本过低？</div>
						<div  id="divClass2" name="divClass2"></div>
					</div>
			</div>
		
		
		<div class="tail">
			沪ICP备16050468&nbsp;&nbsp;|&nbsp;&nbsp;沪B2-20170039&nbsp;&nbsp;|&nbsp;&nbsp;营业执照<br /><br />
			Copyright&nbsp;&copy;&nbsp;1号店网上超市&nbsp;2007-2017&nbsp;,&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved
		</div>
	
	
	
	<script type="text/javascript">
	     $(function(){
	       $("#dengluanniu").click(function(){
	       
	       var username = $("#username").val();
	       var password = $("#password").val();
	       if(username=="邮箱/手机/用户名"||password=="密码"){
	           alert(111111111);
	       }else{
	          alert(123);}
	       });
	     });
	      
	      
	      
	</script>
	
	</body>
</html>
