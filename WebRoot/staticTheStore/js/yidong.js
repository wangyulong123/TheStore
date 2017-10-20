$(function () {
				var page = 1;
				var i = 4; //每次放4个图片
				var len = $("#shangpin ul li").length;
				var page_count = Math.ceil(len / i) ;
				
				$("#left").click(function () {
					if(!$("#uul").is(":animated")){//防止动画积累
							
						if(page == 1){

						}else{
							$("#right").css("visibility","visible");
							$("#uul").animate({"margin-left":"+=1024px"},500);
							page--;
							
							if(page == 1){
								$("#left").css("visibility","hidden");
								$("#right").css("visibility","visible");
							}
						}
							
							
					}
					
				});
				
				$("#right").click(function () {
					if(!$("#uul").is(":animated")){//防止动画积累
						
						if(page == page_count){
							
						}else{
							$("#left").css("visibility","visible");
							$("#uul").animate({"margin-left":"-=1024px"},500);
							page++;
							if(page == page_count){
								$("#right").css("visibility","hidden");
								$("#left").css("visibility","visible");
							}
						}
							
							
					}
				});
				
});
			