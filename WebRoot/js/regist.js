$(function(){
//一次点击后，不再改变位置的元素
	$("#username").one("click",function(){
		$("#user1").animate({left:"-=92px"},200);
	});
	
	$("#phone").one("click",function(){
		$("#phone1").animate({left:"-=92px"},200);
	});
	
	$("#yanzhengma").one("click",function(){
		$("#yanzheng").animate({left:"-=121px"},200);
	});
	
	$("#password1").one("click",function(){
		$("#set1").animate({left:"-=107px"},200);
	});
	
	$("#password2").one("click",function(){
		$("#set2").animate({left:"-=107px"},200);
	});
//倒计时获取短信验证码
	   //60秒倒计时
			$("#huoqu").on("click",function(){
							var _this=$(this);
							if(!$(this).hasClass("on")){
								$.leftTime(60,function(d){
									if(d.status){
										_this.addClass("on");
										_this.html((d.s=="00"?"60":d.s)+"秒后重新获取");
									}else{
										_this.removeClass("on");
										_this.html("获取验证码");
									}
								});
							}
						});
	  
//点击后出现的提示
	$("#username").focus(function(){
		$("#user11").slideDown();
		$("#user12").hide();	
		$("#user13").hide();
		$("#user14").hide();
		$("#user15").hide();
		$("#success1").hide();
		$("#username").css("border-color","#DEDEDE");
	});
//用户名验证
var regExp1 =/^[0-9]*$/;
var regExp2 =/^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
		$('#username').blur(function(){
			if(this.value==""){
				$("#user11").hide();
				$("#user12").show(600);
				$("#username").css("border-color","red");
			}else if(this.value.length<4||this.value.length>20){
				$("#user13").show(800);
				$("#user11").hide();
				$("#user12").hide();	
				$("#username").css("border-color","red");
			}else if(regExp1.test($(this).val())){
				$("#user14").show(800);
				$("#user11").hide();
				$("#user12").hide();
				$("#user13").hide();
				$("#username").css("border-color","red");
			}else if(!regExp2.test($(this).val())){
				$("#user15").show(800);
				$("#user11").hide();
				$("#user12").hide();
				$("#user13").hide();
				$("#user14").hide();
				$("#username").css("border-color","red");
			}else{
				$("#success1").show();				
				$("#user11").hide();
				$("#user12").hide();
				$("#user13").hide();
				$("#user14").hide();
				$("#user15").hide();
				$("#username").css("border-color","#DEDEDE");
			}
		});
		
//手机号码验证	
var regExp3=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|17[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
	$('#phone').focus(function(){
			$("#phone11").slideDown();
			$("#phone12").hide();	
			$("#success2").hide();
			$("#phone").css("border-color","#DEDEDE");
	});
	
	$('#phone').blur(function(){
		if(this.value=="" ){
			$("#phone12").show(600);
			$("#phone11").hide();
		    $("#phone").css("border-color","red");
		}else if(regExp3.test($(this).val())){
			$("#phone").css("border-color","#DEDEDE");
			$("#phone11").hide();
			$("#success2").show();
			$("#phone12").hide();
			
		}else{
			$("#phone12").show(600);
			$("#phone11").hide();
			$("#success2").hide();
			$("#phone").css("border-color","red");
		}
		
	});

//设置密码验证
     $('#password1').focus(function(){
			$("#password11").slideDown();
			$("#password12").hide();
			$("#password13").hide();
			$("#password14").hide();
			$("#success3").hide();
			$("#password1").css("border-color","#DEDEDE");
			
			$("#passwordlow").hide();
			$("#passwordmid").hide();
			$("#passwordstr").hide();
			
	});
		$('#password1').blur(function(){
			if(this.value==""){
				$("#password11").hide();
				$("#password12").show(600);
				 $("#passwordlow").hide();
 				 $("#passwordmid").hide();
                 $("#passwordstr").hide();
				$("#password1").css("border-color","red");
			}else if(this.value.length<6||this.value.length>20){
				$("#password14").show(600);
				$("#password11").hide();
				$("#password12").hide();
				$("#password13").hide();
				
				$("#passwordlow").hide();
 				 $("#passwordmid").hide();
                 $("#passwordstr").hide();
                 
				$("#password1").css("border-color","red");
			}else if(regExp1.test($(this).val())){
				$("#password13").show(600);
				$("#password11").hide();
				$("#password12").hide();
				$("#password14").hide();
				
				$("#passwordlow").hide();
 				 $("#passwordmid").hide();
                 $("#passwordstr").hide();
				$("#password1").css("border-color","red");
			}else{
				$("#success3").show();
				$("#password11").hide();
				$("#password12").hide();
				$("#password13").hide();
				$("#password14").hide();
				
				 $("#passwordlow").hide();
 				 $("#passwordmid").hide();
                 $("#passwordstr").hide();
				$("#password1").css("border-color","#DEDEDE");
			}
			
		});
//确认密码验证
 	$('#password2').focus(function(){
 		$("#password22").slideDown();
 		$("#password23").hide();
 		$("#success4").hide();
 		$("#password2").css("border-color","#DEDEDE");
	});


	$('#password2').blur(function(){	
		if(!$(this).val || $(this).val() != $("#password1").val() ){    
            $("#password23").show();
            $("#password22").hide();
			$("#success4").hide();
        	$("#password2").css("border-color","red");
        }else if(this.value==""){
        	$("#password22").slideDown();
 			$("#password23").hide();
 			$("#success4").hide();
 			$("#password2").css("border-color","red");
        }else{  
            $("#success4").show();
            $("#password23").hide();
            $("#password22").hide();
            $("#password2").css("border-color","#DEDEDE");
        }  
    		
	});
	
//密码强度验证 ，提示 信息隐藏，强度信息显示出来
	$('#password1').keyup(function(e) {
     //密码为八位及以上并且字母数字特殊字符三项都包括
     var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
     //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
     var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
     var enoughRegex = new RegExp("(?=.{6,}).*", "g");
 
 		if (false == enoughRegex.test($(this).val())) {
			 $("#passwordlow").show();
			 $("#passwordmid").hide();
			 $("#passswordstr").hide();
			 $("#password11").hide();
 		} else if (strongRegex.test($(this).val())) {
 				$("#passwordstr").show();
 				$("#password11").hide();
 				$("#passwordmid").hide();
 				$("#passwordlow").hide();
 		} else if (mediumRegex.test($(this).val())) {
 				$("#passwordmid").show();
 				$("#password11").hide();
 				$("#passwordlow").hide();
 				$("#passwordstr").hide();
 		} else {
 				$("#password11").hide();
  				$("#passwordlow").show();
  				$("#passwordmid").hide();
  				$("#passwordstr").hide();
 		}
 		return true;
		});

});