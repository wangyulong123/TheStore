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
  
});
