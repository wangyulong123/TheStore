//用户名输入与密码输入事件
			function test(){
				var username= document.getElementById("username");
				if(username.value=="邮箱/手机/用户名")
				{
					username.value="";
				}
			}
			function test2(){
				var username= document.getElementById("username");
				if(username.value=="")
				{
					username.value="邮箱/手机/用户名";
				}
			}
			function test3(){
				var password=document.getElementById("password");
				if(password.value=="密码"){
					password.type="password";
					password.value="";
				}
			}
			function test4(){
				if(password.value==""){
					password.type="text";
					password.value="密码";
				}
			}




$(function(){
	
//输入用户名和密码边框高亮变色
	$('#username').focus(function(){
	 
		$("#shurukuang").css("border","1px solid  #AAAAAA");
	});
	$('#username').blur(function(){
		$("#shurukuang").css("border-color","#DEDEDE");
		
	});
	$('#password').focus(function(){
	 
		$("#mimakuang").css("border","1px solid  #AAAAAA");
	});
	$('#password').blur(function(){
		$("#mimakuang").css("border-color","#DEDEDE");
		
	});
	
//用户名框输入格式验证
	var regExp1 =/^[0-9]*$/;
	var regExp2 =/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
			$('#username').blur(function(){
				if(this.value==""){
					$("#shurukuang").css("border-color","red");
				}else if(this.value.length<4||this.value.length>20){
					$("#shurukuang").css("border-color","red");
				}else if(regExp1.test($(this).val())){
					$("#shurukuang").css("border-color","red");
				}else if(!regExp2.test($(this).val())){
					$("#shurukuang").css("border-color","red");
				}else{
					$("#shurukuang").css("border-color","#DEDEDE");
				}
			});
//密码框格式验证
			$('#password').blur(function(){
				if(this.value==""){
					$("#mimakuang").css("border-color","red");
				}else if(this.value.length<6||this.value.length>20){
					$("#mimakuang").css("border-color","red");
				}else if(regExp1.test($(this).val())){
					$("#mimakuang").css("border-color","red");
				}else{
					$("#mimakuang").css("border-color","#DEDEDE");
				}
			});
	
//二维码与账号登录界面切换
	$("#divClass1").click(function(){
		$("#denglu2").show();
		$("#denglu").hide();
	});
	$("#divClass2").click(function(){
		$("#denglu").show();
		$("#denglu2").hide();
	})
	
//logo帮助中心悬停显示隐藏的下拉框if($div.is(":visible")){
         $('#xuanting').hover(function() {
            $("#xialakuang").css('display', 'block');
            $("#hd_menu").css("border","1px solid #DEDEDE");
            $("#xuanting").css("border-bottom","1px solid #DEDEDE");
			$("#xialkaung").css("border-bottom","1px solid #DEDEDE");
        }, function() {
           $("#xialakuang").css('display', 'none');
           $("#hd_menu").css("border","none");
           $("#xuanting").css("border-bottom","none");
        });
            $("#xialakuang").hover(function() {
                $(this).css('display', 'block');
                $("#hd_menu").css("border","1px solid #DEDEDE");
                $("#xuanting").css("border-bottom","1px solid #DEDEDE");
		        $("#xialkaung").css("border-bottom","1px solid #DEDEDE");
            }, function() {
                $(this).css('display', 'none');
                $("#hd_menu").css("border","none");
                $("#xuanting").css("border-bottom","none");
            });
	
//自动登录提示用语
  	$("#agree").click(function(){
  	if($(this).prop("checked")==true){
  		$("#warn").css("color","red");
  	}else{
  		$("#warn").css("color","white");
  	}
  });
  
  
//更多合作网站下拉框完整显示与隐藏
  $("#more").bind("click",function(){	
   	 $("#morebox").toggle();
 	 $("#open").toggle();
 	 $("#close").toggle();
 
  });
 
//登录按钮悬停变色
//同意协议并注册按钮鼠标悬停变色，点击判断
	$("#dengluanniu").mouseover(function(){
		$("#dengluanniu").css("backgroundColor","#D72226");
	});
	$("#dengluanniu").mouseout(function(){
		$("#dengluanniu").css("backgroundColor","#FF3C3C");
	});
  
  
});
