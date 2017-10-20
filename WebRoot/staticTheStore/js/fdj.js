$(function(){
	var icamera_big = $(".camera_big"),
		ifdj_area = $("#fdj_area"),
		icamera_small = $(".camera_small img"),
		tfdj_area = $("#fdj_area img");
	//中图
	var arr = ["img/大图1.jpg","img/大图2.jpg","img/大图3.jpg","img/大图4.jpg","img/大图5.jpg"];
	var oarr = ["img/大图1_600x600.jpg","img/大图2_600x600.jpg","img/大图3_600x600.jpg","img/大图4_600x600.jpg","img/大图5_600x600.jpg"];
	
	icamera_small.each(function(i){
		$(this).click(function(){
			$(".camera_big img").attr("src",arr[i]);
			tfdj_area.attr("src",oarr[i]);
			icamera_small.removeClass("camera_small_1");
			$(this).addClass("camera_small_1");
		})

		$(this).mouseover(function(){
			$(".camera_big img").attr("src",arr[i]);
			tfdj_area.attr("src",oarr[i]);
			icamera_small.removeClass("camera_small_1");
			$(this).addClass("camera_small_1");
		})
		
		icamera_big.mousemove(function(a){
			var evt = a || window.event
			ifdj_area.css('display','block')
			//87是span的一半，保证鼠标在span半透明层的中心
			//top = 鼠标位置坐标Y值 - (span相对于.one窗口的偏移的top值 - 相对于顶部滚动条的距离) - 87;
			//left = 鼠标位置坐标X值 - () - 87;
			var ot = evt.clientY-($(".camera_big").offset().top- $(document).scrollTop())-87;
			var ol = evt.clientX-($(".camera_big").offset().left- $(document).scrollLeft())-87;
			//删掉之后，貌似没什么问题
			
			//var ot = evt.clientY-87;
			//var ol = evt.clientX-87;
			//鼠标坐标分别在边缘情况
			if(ol<=0){
				ol = 0;
			}
			if(ot<=0){
				ot = 0;
			}
			if(ol>=165){
				ol=165
			}
			if(ot>=165){
				ot=165
			}
			
			//半透明层的移动，可以给span起个名字，以免与其它混淆
			$(".camera_big span").css({'left':ol,'top':ot})
			//成比例地移动 
			// 移动比例 =  中图需要移动的距离*(大图宽度/中图宽度)
			var ott = ot/350*600
			var oll = ol/350*600
			//大图中的img成比例移动，且移动方向相反
			tfdj_area.css({'left':-oll,'top':-ott})
		})
		
		//鼠标移出
		icamera_big.mouseout(function(){
			ifdj_area.css('display','none');
		})
		
	})
	
	
	
	
})
