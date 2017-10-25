(function(window){
	var defaults = {
		floorClass : '.scroll-floor',
		navClass : '.scroll-nav',
		activeClass : 'active',
		activeTop : 50,
		scrollTop : 50,
		delayTime : 200
	};
	
	var $body = $('body'),data = [];
	function getItem(_list,newOptions){
		_list.each(function() {
            var item = {};
            item.$obj = $body.find(this);
            item.$activeTop = $body.find(this).offset().top - newOptions.activeTop;
            item.$scrollTop = $body.find(this).offset().top + newOptions.scrollTop;
            
            data.push(item);
        });
	}
	
	function scrollActive(_list,newOptions){
		var nowScrollTop = $(window).scrollTop();
		$.each(data,function(i,item){
			if(nowScrollTop > item.$activeTop){
				_list.removeClass(newOptions.activeClass).eq(i).addClass(newOptions.activeClass);
			}
		});
	}
	
	var scroll_floor = window.scrollFloor = function(options){
		var newOptions = $.extend({}, defaults, options);
		var floorList = $body.find(newOptions.floorClass),navList = $body.find(newOptions.navClass);
		
		getItem(floorList,newOptions);
		scrollActive(navList,newOptions);
		
        $(window).bind('scroll',function(){scrollActive(navList,newOptions);});
        
        navList.bind('click',function(){
        	var _index = $body.find(this).index();
        	
        	$('html,body').animate({'scrollTop' : data[_index].$scrollTop},newOptions.delayTime);
        });
        
		
	}
		scrollFloor({
				floorClass : '.scroll-floor',       //楼层盒子class;默认为'.scroll-floor'
				navClass : '.scroll-nav',           //导航盒子class;默认为'.scroll-nav'
				activeClass : 'active',             //导航高亮class;默认为'active'
				delayTime:200,                      //点击导航，滚动条滑动到该位置的时间间隔;默认为200
				activeTop:100,                      //楼层到窗口的某个位置时，导航高亮（设置该位置）;默认为100
				scrollTop:0                         //点击导航，楼层滑动到窗口的某位置;默认为100
			});
	
})(window);