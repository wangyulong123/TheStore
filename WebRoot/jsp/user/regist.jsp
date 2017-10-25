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
		<title>注册1号店</title>	
		<link rel="shortcut icon" href="img/icon.jpg"/>  	
		<script type="text/javascript" src="js/jquery-2.1.4.js"></script>		
		<script type="text/javascript" src="js/regist.js"></script>	
		<script type="text/javascript" src="js/login.js"></script>	
		<script type="text/javascript" src="js/leftTime.js"></script>
		<script type="text/javascript" src="js/leftTime.min.js"></script>		
		<link rel="stylesheet" type="text/css" href="css/regist.css"/>	
	</head>
	
	<body>	
	<div class="head">			
			<div><a href="#" ><img src="img/logo.jpg" id="imglogo" /> </a></div>
			<div id="fontlogo"><center>您好,&nbsp;欢迎光临1号店！&nbsp;&nbsp;<a href="login.html">请登录</a>
				&nbsp;&nbsp;&nbsp;&nbsp;</center>
			   <div id="hd_menu">			
					<div id="xuanting"><img  id="help" src="img/help.png"/>
						<a  id="helpcenter" href="#" >帮助中心&nbsp;</a><img  id="openall" src="img/openall.png" />
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
		
			<div><img src="img/r_icon.png" id="r_icon"/></div>
			
			<div id="zhuce">
				<h2>1号店注册</h2>			
		    	<form id="#" action="#" method="post">
		
				<div id="div1">
					<span id="yonghu"></span><input type="text" name="username" autocomplete="off" id="username" value=""/>
					<span id="user1">用户名</span>	
				</div>
				
						<div id="user11">
							<i class="i2"></i>
							<div >4-20位字符，可由中文、英文、数字或符号"_"组成</div>
						</div>
						<div id="user12">
							<i class="i1"></i>
							<div>用户不能为空</div>
						</div>
						<div id="user13">
							<i class="i1"></i>
							<div>请输入正确的用户名，用户名应为4-20位字符</div>
						</div>
						<div id="user14">
							<i class="i1"></i>
							<div>请输入正确的用户名，用户名不能全为数字</div>
						</div>
	
						<div id="user15">
							<i class="i1"></i>
							<div>用户名格式错误，请输入正确用户名</div>
						</div>
						<div  id="success1">
							<img src="img/success.png"  />
						</div>
						
					
				
				<div>
					<span></span><input type="text" autocomplete="off" name="phone" id="phone" value="" >
					<span  id="phone1">手机号</span>
				</div>
							<div id="phone11">
								<i class="i2"></i>
								<div>请输入正确的手机号码，以便接收订单通知，或找回密码</div>
						</div>
				
				
						<div id="phone12">
								<i class="i2"></i>
								<div>格式错误，请输入正确的手机号码</div>
						</div>
						<div id="success2">
							<img src="img/success.png"  />
						</div>
				
				
				<div>
					<span><input type="text" name="yanzhengma" id="yanzhengma" value=""/></span>
					
					<div id="huoqu">获取验证码</div>
					
					<span  id="yanzheng">短信验证码</span>
					
					</div>
				
				
				<div>
					<span></span><input type="password" name="password1" id="password1" value="" />
					<span  id="set1">设置密码</span>
					
					
					<span id="passstrength"></span>
				
				</div>
				
							<div id="password11">
								<i class="i2"></i>
								<div>6-20位大小写英文字母、符号或数字的组合</div>
							</div>
							<div id="password12">
								<i class="i1"></i>
								<div>密码不能为空</div>
							</div>              	
                  	        <div id="password13">
								<i class="i1"></i>
								<div>密码不能全为数字</div>
							</div>
							<div id="password14">
								<i class="i1"></i>
								<div>密码为6-20位字符</div>
							</div>
						
                        	<div id="success3">
							<img src="img/success.png"  />
							</div>	
							
							<div id="passwordlow">
								<i class="i2"></i>
								<img src="img/low.png"  />
							</div>
							<div id="passwordmid">
								<i class="i2"></i>
								<img src="img/middle.png"  />
							</div>
							<div id="passwordstr">
								<i class="i2"></i>
								<img src="img/strong.png"  />
							</div>
							
				
				<div>
					<span></span><input type="password" name="password2" id="password2" value="" placeholder="" />
					<span  id="set2">确认密码</span>
				</div>
							<div id="password22">
								<i class="i2"></i>
								<div>请再次输入密码</div>
							</div>
							<div id="password23">
								<i class="i1"></i>
								<div>两次密码不一致</div>
							</div>
							<div id="success4">
							<img src="img/success.png"  />
							</div>
							
							
				
				
				<div id="dianjifuwu"><pre>点击注册，表示您同意1号店<a href="#">《服务协议》</a>                  </pre>
				</div>
				
				<center><div id="agree"><a class="class1" href="#">同意协议并注册</a></div></center>
			
		</form>
				
			</div>			
		</div>
		
		
	<div class="tail">
			沪ICP备16050468&nbsp;&nbsp;|&nbsp;&nbsp;沪B2-20170039&nbsp;&nbsp;|&nbsp;&nbsp;营业执照<br /><br />
			Copyright&nbsp;&copy;&nbsp;1号店网上超市&nbsp;2007-2017&nbsp;,&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved
		</div>
		
	</body>
</html>
