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
		<title>注册1号店</title>	
		<link rel="shortcut icon" href="staticTheStore/img/icon.jpg"/>  	
		<script type="text/javascript" src="staticTheStore/js/jquery-2.1.4.js"></script>		
		<script type="text/javascript" src="staticTheStore/js/regist.js"></script>	
		<script type="text/javascript" src="staticTheStore/js/login.js"></script>	
		<script type="text/javascript" src="staticTheStore/js/leftTime.js"></script>
		<script type="text/javascript" src="staticTheStore/js/leftTime.min.js"></script>		
		<link rel="stylesheet" type="text/css" href="staticTheStore/css/regist.css"/>	
		
		<link rel="stylesheet" type="text/css"  href="staticTheStore/css/jquery.idcode.css"/>
	
	
	</head>
	
	<body>	
	
	
		
<div id="registview">
	<div class="head">			
			<div><a href="#" ><img src="staticTheStore/img/logo.jpg" id="imglogo" /> </a></div>
			<div id="fontlogo"><center>您好,&nbsp;欢迎光临1号店！&nbsp;&nbsp;<a href="LoginServlet?action=gotologin">请登录</a>
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
		
			<div><img src="staticTheStore/img/r_icon.png" id="r_icon"/></div>
			
			<div id="zhuce">
				<h2>1号店注册</h2>			
		    	<form id="#" action="MailServlet" method="post">
		
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
					<div id="user16">
							<i class="i1"></i>
							<div>用户名已存在</div>
						</div>    
						<div  id="success1">
							<img src="staticTheStore/img/success.png"  />
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
							<img src="staticTheStore/img/success.png"  />
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
							<img src="staticTheStore/img/success.png"  />
							</div>	
							
							<div id="passwordlow">
								<i class="i2"></i>
								<img src="staticTheStore/img/low.png"  />
							</div>
							<div id="passwordmid">
								<i class="i2"></i>
								<img src="staticTheStore/img/middle.png"  />
							</div>
							<div id="passwordstr">
								<i class="i2"></i>
								<img src="staticTheStore/img/strong.png"  />
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
							<img src="staticTheStore/img/success.png"  />
							</div>
							
							
								
<!-- 图形验证码  -->	
				<div id="tuxingcode"><input type="text" id ="Txtidcode" class ="txtVerification"/>
				<span id="setcode">验证码</span>
				&nbsp;&nbsp;<span id="idcode"></span>
					 <input type="button" id="butn" value="提交"/></center></div>
							<div id="success5">
							    <img src="staticTheStore/img/success1.png"  />
							</div>
							<div id="reinput">
								<i class="i1"></i>
								<div>请重新输入</div>
							</div>
				
				<div id="dianjifuwu"><pre>点击注册，表示您同意1号店<a href="#">《服务协议》</a>                  </pre>
				</div>

				
			<!--<center><div id="agree"><a class="class1" href="#">同意协议并注册</a></div></center>  	
			<center><div><button type="submit" id="agree" class="class1"  >同意协议并注册</button></div></center>-->
			      
			      <center><a id="agree" >同意协议并注册</a></center>
		</form>
				
			</div>			
		</div>
		
		
	<div class="tail">
			沪ICP备16050468&nbsp;&nbsp;|&nbsp;&nbsp;沪B2-20170039&nbsp;&nbsp;|&nbsp;&nbsp;营业执照<br /><br />
			Copyright&nbsp;&copy;&nbsp;1号店网上超市&nbsp;2007-2017&nbsp;,&nbsp;All&nbsp;&nbsp;Rights&nbsp;&nbsp;Reserved
		</div>
		
		
</div>	

  <div id="querenemail">
         <form action="MailServlet" method="post">
		    <div id="shuruemail">
		              <div id="lastdiv">邮箱验证<br/>此邮箱用于激活您的账号,<br/>填写后我们会发送激活邮件到您的邮箱中,<br/>请及时查收
		                <br/> 
		                <br/>
		              <input type="text" class="yincang" name="from" value="thestore1@sina.com"/>
   					  <input type="text" class="yincang" name="subject" value="1号店用户账号激活"/>
   					  
   		              
   		           <!--    <input id="lastwrite" name="content" cols="50" rows="10" placeholder="请再次输入您的用户名" /> -->
   		              <input id="shuruname" name="content"  placeholder="请在此再次输入您的用户名"/><br/>
   		              <input id="lastwrite" type="text" name="to" type="text" placeholder="请在此处填写邮箱" />   		              
		              <br/> <input type="submit" id="jihuo" value="立即激活"/>
		              </div>
		    </div>
		</form> 
		  
  </div>	
  
<script type="text/javascript">
$(function(){
	$("#agree").click(function(){
	 var username=$("#username").val();
	 var password=$("#password1").val();
	 var telphone=$("#phone").val();
	 
		if(($("#success1").is(':visible'))&&($("#success2").is(':visible'))&&($("#success3").is(':visible'))&&($("#success4").is(':visible'))&&($("#success5").is(':visible'))){
			
			 location.assign("/ts0.1/UserServlet?action=addUser&username="+username+"&password="+password+"&telphone="+telphone);
			 $("#querenemail").fadeIn();	  
		}
	});
	
	$("#phone").blur(function(){
	   var phone = $("#phone").val();
	   if($("#success2").is(':visible')){
	    	//location.assign("CodeServlet?action=addPhone&phone="+phone);
	    	
	  }	
    });
    
   $("#huoqu").click(function(){
   
      var telphone=$("#phone").val();
      
    
    
   });
    
     
 
     	
});
     </script>	
     
<script src="staticTheStore/js/jquery.idcode.js"></script>
<script>
    $.idcode.setCode();   //加载生成验证码方法
    $("#butn").click(function(){
        var IsBy = $.idcode.validateCode()  //调用返回值，返回值结果为true或者false
        if(IsBy){
               $("#success5").show();
               $("#reinput").hide();
        }else {
               $("#success5").hide();
               $("#reinput").show(600);
        }
    })
</script>
     
	</body>
</html>

