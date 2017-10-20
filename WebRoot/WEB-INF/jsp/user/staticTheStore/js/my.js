$(function(){
	
	
	/********************滚动至标题栏时，标题栏置顶***************************/
	
	/*获取标题栏距离顶部的距离*/
	var tabMain = $("#banner").offset().top;
	/*获取滚动条事件*/
	$(window).scroll(function(){
		/*判断滚动条与顶部的距离*/
		var scrollH = $(this).scrollTop();
		if(scrollH>=tabMain){
			$("#banner").css({"position":"fixed","top":0});
		}else{
			$("#banner").css({"position":"relative"});
		}
	});   

	
	
	//鼠标悬浮图片和链接的切换
	$("#hot_center_foot>ul>li").hover(function(){
		if($(this).children("a").is(":hidden")){
			$(this).children("img").hide();
  		    $(this).children("a").show();
			$(this).addClass("bk_class");
			
  		 }else{
  		   $(this).children("a").hide();
		   $(this).children("img").show();
		   $(this).removeClass("bk_class");
  		 }
		});
		
		
		
	//单击时背景色变换
	$("#nav_center>ul>li").click(function(){
		
			$(this).addClass("back_color");
			$(this).siblings().removeClass("back_color");
			
		});
		
	//商品数量的加减
	$(".up>img").hover(function(){
		$(this).addClass("bianshou");
		});
	
	$(".up>img").click(function(){
		
		$(this).addClass("bianshou");
		var text_number = $(this).parent().parent().find("input").val();
		text_number++;
		if(text_number>1){
			
			$(this).parent().next().children().attr("src","../imges/down2.png");
			}
		if(text_number<=1){
			
			$(this).parent().next().children().attr("src","../imges/down1.png");
			}
		$(this).parent().parent().find("input").val(text_number);
		
		});
		
		
		
		
		
			$(".down>img").hover(function(){
		$(this).addClass("bianshou");
		});
	
	$(".down>img").click(function(){
		
		$(this).addClass("bianshou");
		var text_number = $(this).parent().parent().find("input").val();
		
		if(text_number>1){
			$(this).attr("src","../imges/down2.png");
			text_number--;
			}
		if(text_number<=1){
			text_number = text_number;
			$(this).attr("src","../imges/down1.png");
			alert("该商品一件起售");
			}
		$(this).parent().parent().find("input").val(text_number);
		
		});
		
		
		//获取焦点时 显示div
		$("#nav_price>input").focus(function(){
			$(this).parent().hide()
			$("#div_show").show();
			$("#div_show>input").val();
			
		//点击确定时 影藏div
			$("#sure>a").click(function(){
				$("#div_show").hide();
				$("#nav_price").show();
				});
			
			});
			
			
		
	});
	
	

		
