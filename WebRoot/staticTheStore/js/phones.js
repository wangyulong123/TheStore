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
		
		//给排序按钮绑定mouseover事件
		$(".filter .f-sort a").mouseover(function(){
			
			if(!$(this).attr("class").contains("cur")){//不是当前使用的条件 才回悬浮变红
				$(this).find(":nth-child(2)").css("background-image","url(img/product/arrow/redDown.png)");
			}
			
			
			
			$(this).siblings(":not([class*='cur'])").find(":nth-child(2)").css("background-image","url(img/product/arrow/grayDown.png)");
		
			
			
		});
		
		
		//修改排序的状态图标
		var orderCondition = "${orderConditionObj.orderCondition}";
		
		var ascOrDesc = "${orderConditionObj.ascOrDesc}";
		
		
/*		
		var currentA = ".f-sort>a[id='" + orderCondition + "']";
		$(currentA).addClass("cur");
		
		if("asc"==ascOrDesc){//如果是升序
			
			$(currentA).find("b").attr("class","orderArrow curUp");//添加升序样式
			
			
		}else{
			
			$(currentA).find("b").attr("class","orderArrow curDown");//添加升序样式
			
			
			
		}*/
		
		var  lastAscOrDesc = "${orderConditionObj.ascOrDesc}";
		//给价格超链接绑定事件   第一次点击降序 第二次点击升序  第三次降序 第四次 升序  依次类推
		$("#jiage").click(function(){
			
			if(lastAscOrDesc=="asc"){//先降序
				alert("降序");
				/*var target = "UserProductServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=desc";
				
				location.assign(target);*/
			}else if(lastAscOrDesc=="desc"){
				alert("升序");			
			/*	var target = "UserProductServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=asc";
			
				location.assign(target);*/
			}
			
		});
		
		$("#pingjiaSum").click(function(){
			
			if(lastAscOrDesc=="asc"){//先降序
				
				var target = "UserProductServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjiaSum&ascOrDesc=desc";
				
				location.assign(target);
			}else if(lastAscOrDesc=="desc"){
				
				var target = "UserProductServlet?action=getPageByQuery&cid=${requestScope.cid}&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjiaSum&ascOrDesc=asc";
			
				location.assign(target);
			}
			
		});
		
		
		
	});