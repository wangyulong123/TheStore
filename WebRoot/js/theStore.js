//清空搜索框中的内容
function form1() {
	var search = document.getElementById("search");
	if(search.value == "请输入关键词") {
		search.value = "";
	}
}

function form11() {
	var text = document.getElementById("text");
	if(text.value == "关键词") {
		text.value = "";
	}
}
//恢复搜索框中的内
function form2() {
	var search = document.getElementById("search");
	if(search.value == "") {
		search.value = "请输入关键词";
	}
}

function form22() {
	var text = document.getElementById("text");
	if(text.value == "") {
		text.value = "关键词";
	}
}
//让listDiv隐藏
function hiddenListDiv() {
	var listDiv = document.getElementById("listDiv");
	listDiv.style.display = "none";
}
//让barcode_big隐藏
function hiddenBarcode_big() {
	var barcode_bigDiv = document.getElementById("barcode_big");
	barcode_bigDiv.style.display = "none";
}
//让barcode_big显示
function display1() {
	var barcode_bigDiv = document.getElementById("barcode_big");
	barcode_bigDiv.style.display = "block";
}
//修改sort1样式
function sort1_Div() {
	var sort1 = document.getElementById("sort1");
	sort1.style.color = "#FF3C3C";
	sort1.style.border = "none";
	sort1.style.backgroundColor = "#fff";
	var sort2 = document.getElementById("sort2");
	sort2.style.color = "#666666";
	sort2.style.backgroundColor = "#F7F7F7";
	sort1_display_hidden.style.display = "block";
	sort2_display_hidden.style.display = "none";
}
//修改sort2样式
function sort2_Div() {
	var sort2 = document.getElementById("sort2");
	sort2.style.color = "#FF3C3C";
	sort2.style.border = "none";
	sort2.style.backgroundColor = "#fff";
	var sort1 = document.getElementById("sort1");
	sort1.style.color = "#666666";
	sort1.style.backgroundColor = "#F7F7F7";
	sort2_display_hidden.style.display = "block";
	sort1_display_hidden.style.display = "none";
}
window.onload = function() {
	hiddenListDiv();
	hiddenBarcode_big();
	sort1_Div();
	document.getElementById("camera_small_1").style.border = "2px solid #999999";
}

//让左右按钮隐藏
function hideButtun() {
	$("#left").css("display", "none");
	$("#right").css("display", "none");
}
//让右按钮显示
function showButtun() {
	$("#right").css("display", "block");
}

function checkCount() {
	//当#count中的内容为1时#minus按钮变灰
	if($("#count").val() == 1) {
		$("#add").css("background-position", "-125px -49px");
		$("#minus").css("background-position", "-149px -74px");
	} else {
		$("#minus").css("background-position", "-125px -74px");
	}
	//当#count中的内容为999时#add按钮变灰
	if($("#count").val() == 999) {
		$("#minus").css("background-position", "-125px -74px");
		$("#add").css("background-position", "-149px -49px");
	} else {
		$("#add").css("background-position", "-125px -49px");
	}
}
$(function() {
	$("#shareDiv").hover(function() {
		$(this).css("border-color", "#CFCFCF");
		$("#shareAddress").css("display", "block");
	}, function() {
		$(this).css("border-color", "#fff");
		$("#shareAddress").css("display", "none");
	});

	$("#checkBox").hover(function() {
		$("#checkBox>a").css("color", "#FF875A");
		$("#check_square").addClass("check_square_2");
	}, function() {
		$("#checkBox>a").css("color", "#666666");
		$("#check_square").removeClass("check_square_2");
	});
	$("#check_square").toggle(function() {
		$(this).addClass("check_square_3");
	}, function() {
		$(this).removeClass("check_square_3");
	});

	$("#charge").hover(function() {
		$("#charge_way").css({
			"border-bottom": "none",
			"border-color": "#EEEEEE",
			"z-index": 1
		});

		$("#charge_detail").css("display", "block");
	}, function() {
		$("#charge_way").css("border-color", "#fff");
		$("#charge_detail").css({
			"display": "none",
			"border": "none"
		});
	});

	$(".canonBrand").hover(function() {
		$(".canonBrand>div").css("background-position", "-229px -120px");
	}, function() {
		$(".canonBrand>div").css("background-position", "-229px -103px");
	});

	$("#list_category").hover(function() {
		$("#listDiv").css("display", "block");
	}, function() {
		$("#listDiv").css("display", "none");
	});

	$("#count").keyup(function() {
		checkCount();
	});

	$("#add").click(function() {
		$("#count").val(parseInt($("#count").val()) + 1);
		if(parseInt($("#count").val()) > 999) {
			$("#count").val(999);
		}
		checkCount();
	});
	$("#minus").click(function() {
		$("#count").val(parseInt($("#count").val()) - 1);
		if(parseInt($("#count").val()) < 1) {
			$("#count").val(1);
		}
		checkCount();
	});

	var $bigImg = $("#camera_big");
	var pid = $(".camera_small").attr("pid");
	var path = $(".camera_small").attr("path");
	$("#camera_small_1").hover(function() {
		$bigImg.attr("src", "staticTheStore/img/productImage/" + path);
		$(this).alterBorderColor("#999999");
		$(this).siblings().alterBorderColor("#fff");
	});
	$("#camera_small_2").hover(function() {
		$bigImg.attr("src", "staticTheStore/img/productImage/" + path);
		$(this).alterBorderColor("#999999");
		$(this).siblings().alterBorderColor("#fff");
	});
	$("#camera_small_3").hover(function() {
		$bigImg.attr("src", "staticTheStore/img/productImage/" + path);
		$(this).alterBorderColor("#999999");
		$(this).siblings().alterBorderColor("#fff");
	});
	$("#camera_small_4").hover(function() {
		$bigImg.attr("src", "staticTheStore/img/productImage/" + path);
		$(this).alterBorderColor("#999999");
		$(this).siblings().alterBorderColor("#fff");
	});
	$("#camera_small_5").hover(function() {
		$bigImg.attr("src", "staticTheStore/img/productImage/" + path);
		$(this).alterBorderColor("#999999");
		$(this).siblings().alterBorderColor("#fff");
	});

	//给所有的li绑定悬停事件 
	var $menu_li = $("div.tab_menu li");
	$menu_li.hover(function() {
		//1.将悬停的li高亮   
		$(this).addClass("selected");
		$(this).siblings().removeClass("selected");
		//2.让对应的div显示
		var clickedLiIndex = $menu_li.index($(this));
		$("div.tab_box>div").eq(clickedLiIndex).show();
		$("div.tab_box>div").eq(clickedLiIndex).siblings().hide();
	});

	//鼠标悬停在box1上时给box1_square1_1换色
	$("#box1_1").hover(function() {
		$("#box1_square1").addClass("box_square_2");
	}, function() {
		$("#box1_square1").removeClass("box_square_2");
	});
	$("#box1_2").hover(function() {
		$("#box1_square2").addClass("box_square_2");
	}, function() {
		$("#box1_square2").removeClass("box_square_2");
	});
	$("#box1_3").hover(function() {
		$("#box1_square3").addClass("box_square_2");
	}, function() {
		$("#box1_square3").removeClass("box_square_2");
	});
	$("#box1_4").hover(function() {
		$("#box1_square4").addClass("box_square_2");
	}, function() {
		$("#box1_square4").removeClass("box_square_2");
	});
	$("#box1_5").hover(function() {
		$("#box1_square5").addClass("box_square_2");
	}, function() {
		$("#box1_square5").removeClass("box_square_2");
	});
	$("#box1_6").hover(function() {
		$("#box1_square6").addClass("box_square_2");
	}, function() {
		$("#box1_square6").removeClass("box_square_2");
	});
	$("#box1_7").hover(function() {
		$("#box1_square7").addClass("box_square_2");
	}, function() {
		$("#box1_square7").removeClass("box_square_2");
	});
	$("#box1_8").hover(function() {
		$("#box1_square8").addClass("box_square_2");
	}, function() {
		$("#box1_square8").removeClass("box_square_2");
	});
	//鼠标点击box1_square1_1上时给box1_square1_1换色
	$(".box_square_1").toggle(function() {
		$(this).addClass("box_square_3");
	}, function() {
		$(this).removeClass("box_square_3");
	});

	var page = 1;
	var i = 4; //每次放4个图片
	var page_count = 2;
	$("#left").click(function() {
		if(!$("#uul1").is(":animated")) { //防止动画积累
			$("#uul1").animate({
				"margin-left": "+=610px"
			}, 500);
			page--;
			if(page == 1) {
				$("#left").fadeOut();
				$("#right").fadeIn();
			}
		}
		if(!$("#uul2").is(":animated")) { //防止动画积累
			$("#uul2").animate({
				"margin-left": "+=311px"
			}, 500);
			page--;
			if(page == 1) {
				$("#left").fadeOut();
				$("#right").fadeIn();
			}
		}
		if(!$("#uul6").is(":animated")) { //防止动画积累
			$("#uul6").animate({
				"margin-left": "+=311px"
			}, 500);
			page--;
			if(page == 1) {
				$("#left").fadeOut();
				$("#right").fadeIn();
			}
		}
		if(!$("#uul7").is(":animated")) { //防止动画积累
			$("#uul7").animate({
				"margin-left": "+=311px"
			}, 500);
			page--;
			if(page == 1) {
				$("#left").fadeOut();
				$("#right").fadeIn();
			}
		}
		if(!$("#uul8").is(":animated")) { //防止动画积累
			$("#uul8").animate({
				"margin-left": "+=311px"
			}, 500);
			page--;
			if(page == 1) {
				$("#left").fadeOut();
				$("#right").fadeIn();
			}
		}
	});

	$("#right").click(function() {
		if(!$("#uul1").is(":animated")) { //防止动画积累
			$("#left").fadeIn();
			$("#uul1").animate({
				"margin-left": "-=610px"
			}, 500);
			page++;
			if(page == page_count) {
				$("#right").fadeOut();
				$("#left").fadeIn();
			}
		}
		if(!$("#uul2").is(":animated")) { //防止动画积累
			$("#left").fadeIn();
			$("#uul2").animate({
				"margin-left": "-=311px"
			}, 500);
			page++;
			if(page == page_count) {
				$("#right").fadeOut();
				$("#left").fadeIn();
			}
		}
		if(!$("#uul6").is(":animated")) { //防止动画积累
			$("#left").fadeIn();
			$("#uul6").animate({
				"margin-left": "-=311px"
			}, 500);
			page++;
			if(page == page_count) {
				$("#right").fadeOut();
				$("#left").fadeIn();
			}
		}
		if(!$("#uul7").is(":animated")) { //防止动画积累
			$("#left").fadeIn();
			$("#uul7").animate({
				"margin-left": "-=311px"
			}, 500);
			page++;
			if(page == page_count) {
				$("#right").fadeOut();
				$("#left").fadeIn();
			}
		}
		if(!$("#uul8").is(":animated")) { //防止动画积累
			$("#left").fadeIn();
			$("#uul8").animate({
				"margin-left": "-=311px"
			}, 500);
			page++;
			if(page == page_count) {
				$("#right").fadeOut();
				$("#left").fadeIn();
			}
		}
	});

	//给所有的li绑定单击事件 
	var $menu2_li = $("div.tab2_menu li");
	$menu2_li.click(function() {
		//1.将点击的li高亮   
		$(this).addClass("selected");
		$(this).siblings().removeClass("selected");
		//2.让对应的div显示
		var clickedLiIndex2 = $menu2_li.index($(this));
		$("div.tab2_box>div").eq(clickedLiIndex2).show();
		$("div.tab2_box>div").eq(clickedLiIndex2).siblings().hide();
	});

	$("#tab2_shoppingcar").hover(function() {
		$("#tab2_shoppingcar").css("background-color", "#000");
		$("#tab2_shoppingcar_pic").show();
		$("#cart_background").show();
	}, function() {
		$("#tab2_shoppingcar").css("background-color", "none");
		$("#tab2_shoppingcar_pic").hide();
		$("#cart_background").hide();
	});
});

window.onscroll = function() {
	var $tab2_menu = $(".tab2_menu");
	var t = document.documentElement.scrollTop || document.body.scrollTop;
	if(t > 1495) {
		$tab2_menu.css({
			"position": "fixed",
			"top": "0",
			"border-right": "none",
			"z-index": "1"
		});
		$("#tab2_canonBrand").css("display", "block");
		$("#white_block").css("display", "block");
		$("#tab2_cart").css("display", "block");

	} else {
		$tab2_menu.css({
			"position": "relative",
			"border-right": "1px solid #E5E5E5"
		});
		$("#tab2_canonBrand").css("display", "none");
		$("#white_block").css("display", "none");
		$("#tab2_cart").css("display", "none");
	}
}