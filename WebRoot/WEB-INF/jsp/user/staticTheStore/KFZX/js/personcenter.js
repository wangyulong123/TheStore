$(function(){
	$(".top_top_dizhi>.tou").bind("click",function(){		
		var $chengshi = $(this).next();		
		if(!$chengshi.is(":animated")){			
			if($chengshi.is(":visible")){//div是显示的				
				$(".tou").css("background-color","#e9e9e9");
				//隐藏
				$chengshi.hide();
			}else{
				$(".tou").css("background-color","white");
				$(".tou").css("border-left","1 solid #DBDBDB");
				$(".tou").css("border-right","1 solid #DBDBDB");
				//显示
				$chengshi.show();
			};
		};
	});
});

//--------------------------------------------------------------------------
;$(function(){
	$(".kefu").hover(function(){
		
		$(this).find("div.kefu_juti").show();

		$(".kefu").css("background-color","#FFFFFF");
		$(".kefu").css("border-left", "1px solid #B6B6CA");
		$(".kefu").css("border-right", "1px solid #B6B6CA");

		
	},function(){
		$(this).find("div.kefu_juti").hide();
		$(".kefu").css("border-left", "1px solid #E9E9E9");
		$(".kefu").css("border-right", "1px solid #E9E9E9");
		$(".kefu").css("background-color","#E9E9E9");
	});
});
//--------------------------------------------------------------------------
;$(function(){
	$(".li_one").hover(function(){
		
		$(this).find("div.xinjin_div").show();

		$(".li_one").css("background-color","#FFFFFF");
		$(".li_one").css("border-left", "1px solid #B6B6CA");
		$(".li_one").css("border-right", "1px solid #B6B6CA");

		
	},function(){
		$(this).find("div.xinjin_div").hide();
		$(".li_one").css("border-left", "1px solid #E9E9E9");
		$(".li_one").css("border-right", "1px solid #E9E9E9");
		$(".li_one").css("background-color","#E9E9E9");
	});
});
//--------------------------------------------------------------------------
;$(function(){
	$(".chongzhi").hover(function(){
		
		$(this).find("div.chongzhi_son").show();

		$(".chongzhi").css("background-color","#FFFFFF");
		$(".chongzhi").css("border-left", "1px solid #B6B6CA");
		$(".chongzhi").css("border-right", "1px solid #B6B6CA");

		
	},function(){
		$(this).find("div.chongzhi_son").hide();
		$(".chongzhi").css("border-left", "1px solid #F4F4F4");
		$(".chongzhi").css("border-right", "1px solid #F4F4F4");
		$(".chongzhi").css("background-color","#F4F4F4");
	});
});
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------

;$(function(){
	$(".daohang").hover(function(){
		
		$(this).find("div.daohang_son").show();

		$(".daohang").css("background-color","#FFFFFF");
		$(".daohang").css("border-left", "1px solid #B6B6CA");
		$(".daohang").css("border-right", "1px solid #B6B6CA");

		
	},function(){
		$(this).find("div.daohang_son").hide();
		$(".daohang").css("border-left", "1px solid #F4F4F4");
		$(".daohang").css("border-right", "1px solid #F4F4F4");
		$(".daohang").css("background-color","#F4F4F4");
	});
});

//--------------------------------------------------------------------------
;$(function(){
	$(".top_botton_shangpinfenlei").hover(function(){
		
		$(this).find("span.span_shangpin").show();
	},function(){
		$(this).find("span.span_shangpin").hide();
	});
});

//-------------------------------中间列表显示-------------------------------------------------
//中间左边箭头小图标变化
/*中间左边*/
$(function(){
	$("#middle_middle_left_two_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_three_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_four_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_five_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_six_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_seven_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_eight_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
$(function(){
	$("#middle_middle_left_nine_A").bind("click",function(){
		
		var $xianshiul = $(this).next();
		
		if(!$xianshiul.is(":animated")){
			
			if($xianshiul.is(":visible")){//div是显示的
	
				//隐藏
				$xianshiul.hide(200);
			}else{
				
				//显示
				$xianshiul.show(200);
			};
		};
	});
});
/*---------------------------------------------------------------*/