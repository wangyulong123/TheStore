$(document).ready(function() {

	$(".side ul li").hover(function() {
		$(this).find(".sidebox").stop().animate({
			"width": "90px"
		}, 200).css({
			"opacity": "1",
			"filter": "white(opacity=100)",
			"background": "red"
		})
	}, function() {
		$(this).find(".sidebox").stop().animate({
			"width": "34px"
		}, 200).css({
			"opacity": "1",
			"filter": "white(opacity=80)",
			"background": "#000"
		})
	});

});

//回到顶部
function goTop() {
	$('html,body').animate({
		'scrollTop': 0
	}, 600);
}