$(function () {
	
	$("#zhankai").bind("click",function () {
		if($("#fuxianjin").is(":visible")){
			$("#zhankai").html("展开 ︿");
			$("#fuxianjin").hide();
		}else{
			$("#zhankai").html("收缩 ﹀");
			$("#fuxianjin").show();
		}
	});
	
//	$("li").click(function () {
//		//添加选中样式
//		$("li").addClass("sel");
//		//并移除兄弟节点的选中
//		 $("li").siblings().removeClass("sel");
//		 
//	});
	
});


