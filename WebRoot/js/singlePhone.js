$(function() {
	/**************************查看更多、规格及包装 跳转*******************************/
	$("#chaKan").click(function() {
		$("#guiGeCanShu").css({
			"display": "none"
		});
		$("#guiGeCanShu").hide();
		$("#images").css({
			"display": "none"
		});
		$("#images").hide();
		$("#canShuXiangQing").css({
			"diaplay": "block"
		});
		$("#canShuXiangQing").show();
	});

	$("#guiGeJiBaoZhuang").click(function() {
		$("#guiGeCanShu").hide();
		$("#images").hide();
		$("#canShuXiangQing").show();
	});

	/********************滚动至标题栏时，标题栏置顶***************************/

	/*获取标题栏距离顶部的距离*/
	var tabMain = $("#shouJiDetail").offset().top;
	/*获取滚动条事件*/
	$(window).scroll(function() {
		/*判断滚动条与顶部的距离*/
		var scrollH = $(this).scrollTop();
		if(scrollH >= tabMain) {
			$("#shouJiDetail").css({
				"position": "fixed",
				"top": 0
			});
		} else {
			$("#shouJiDetail").css({
				"position": "relative"
			});
		}
	});

	/*	/***************************选择手机颜色特效***************************/
	$("#colorChoice>div").click(function() {
		if($(this).attr("class") == "border") {
			$(this).removeClass("border");
			$(this).addClass("man_nameandadr_1_1");
			$(this).siblings().removeClass("man_nameandadr_1_1");
			$(this).siblings().addClass("border");
		} else {
			$(this).removeClass("man_nameandadr_1_1");
			$(this).addClass("border");
		}
	});

	$("#banben>div").click(function() {
		if($(this).attr("class") == "border") {
			$(this).removeClass("border");
			$(this).addClass("man_nameandadr_1_1");
			$(this).siblings().removeClass("man_nameandadr_1_1");
			$(this).siblings().addClass("border");
		} else {
			$(this).removeClass("man_nameandadr_1_1");
			$(this).addClass("border");
		}
	});

	//商品数量的加减
	$(".up>img").hover(function() {
		$(this).addClass("bianshou");
	});

	$(".up>img").click(function() {

		$(this).addClass("bianshou");
		var text_number = $(this).parent().parent().parent().find("input").val();
		text_number++;
		if(text_number > 1) {

			$(this).parent().next().children().attr("src", "images/down2.png");
		}
		if(text_number <= 1) {

			$(this).parent().next().children().attr("src", "iamges/down1.png");
		}
		$(this).parent().parent().parent().find("input").val(text_number);

	});

	$(".down>img").hover(function() {
		$(this).addClass("bianshou");
	});

	$(".down>img").click(function() {

		$(this).addClass("bianshou");
		var text_number = $(this).parent().parent().parent().find("input").val();

		if(text_number > 1) {
			$(this).attr("src", "images/down2.png");
			text_number--;
		}else{
			$(this).attr("src", "images/down1.png");
		}
		$(this).parent().parent().parent().find("input").val(text_number);

	});

});