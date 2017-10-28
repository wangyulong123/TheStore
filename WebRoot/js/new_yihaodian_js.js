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

/*-------------------------------------------------------------------*/
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
/*---------下拉个人特权----------------------------------------------------*/
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
/*---------------------------------------------------------*/
;$(function(){
	$(".shezhi").hover(function(){
		
		$(this).find("span.shezhixiala").show();

	},function(){
		$(this).find("span.shezhixiala").hide();
	});
});
/*---------------------------------------------------------*/

/*---------------------------------------------------------*/

