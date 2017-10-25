    /*  调整falsh幻灯片的位置*/
      $(function(){
	 $("#carousel-example-generic").css({
			"width":"1200px",
			"height":"400px",
			/*"position":"absolute",
			"left":"200px",
			"top":"200px",*/
			"float":"left",
			"margin":"auto",
			"z-index":"1"});
			/*倒计时*/
	  $.leftTime("2019/10/9 15:00:00",function (d) {
					if(d.status){
						var $dateShow1 = $("#dateShow1");
						$dateShow1.find(".h").html(d.h);
						$dateShow1.find(".m").html(d.m);
						$dateShow1.find(".s").html(d.s);

					}
				});		
		  var cityPicker = new HzwCityPicker({
						        data: data,
						        target: 'cityChoice',
						        valType: 'k-v',
						        hideCityInput: {
						            name: 'city',
						            id: 'city'
						        },
						        hideProvinceInput: {
						            name: 'province',
						            id: 'province'
						        },
						        callback: function(){
						            
						        }
						    });
						
						    cityPicker.init();	
	
	
      })