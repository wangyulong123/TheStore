$(function() {
	//鼠标悬浮图片和链接的切换
	$("#table td").hover(function() {
		if($(this).children("a").is(":hidden")) {
			$(this).children("a").show()
			$(this).children("div").hide();
			$(this).removeClass("trBianKuang");
		} else {
			$(this).children("a").hide();
			$(this).children("div").show();
			$(this).addClass("trBianKuang");
		}
	});
	
		//单击时背景色变换
	$("#sort1>ul>li").click(function(){
		
			$(this).addClass("xuanZhongTiaoJian");
			$(this).siblings().removeClass("xuanZhongTiaoJian");
			
		});
	$("#pageNumb>a").click(function(){
		
			$(this).addClass("xuanZhongTiaoJian");
			$(this).siblings().removeClass("xuanZhongTiaoJian");
			
		});	
	
	//点击价格区间时显示下拉价格
		//获取焦点时 显示div
		$("#input>input").focus(function(){
			$(this).parent().hide()
			$("#jiaGeLieBiao").show();
			$("#jiaGeLieBiao>input").val();
			
		//点击确定时 影藏div
			$("#queDing").click(function(){
				$("#jiaGeLieBiao").hide();
				$("#input").show();
				});
			
		});
});