var tijiaodingdan = (function () {
	var queding;
	var shouhuoxinxi;
	var uname;
	var unameSpan;
	var xiangxidizhi;
	var xxdzSpan;
	var phone;
	var phoneSpan;
	var quhao;
	var guding;
	var fenjihao;
	var biaoqian;
	var biaoqianSpan;
	var jia;
	var fumujia;
	var gongsi;
	var xuexiao;
	$(function(){
		queding = document.getElementById("queding");
		queding.onclick = checkAll;
		shouhuoxinxi = document.getElementById("shouhuoxinxi");
		addressInit('select1', 'select2', 'select3');
		//收货人
		uname = document.getElementById("uname");
		unameSpan = uname.nextSibling;
		uname.onfocus = mouseInUname;
		uname.onblur = mouseOutUname;
		uname.onkeyup = checkName;
		
		//详细地址
		xiangxidizhi = document.getElementById("xiangxidizhi");
		xxdzSpan = xiangxidizhi.nextSibling.nextSibling;
		xiangxidizhi.onfocus = mouseInXXDZ;
		xiangxidizhi.onblur = mouseOutXXDZ;
		xiangxidizhi.onkeyup = checkXXDZ;
		
		//常用手机号码
		phone = document.getElementById("phone");
		phoneSpan = document.getElementById("phoneSpan");
		phone.onfocus = mouseInPhone;
		phone.onblur = mouseOutPhone;
		phone.onkeyup = checkPhone;
		
		//固定电话
		quhao = document.getElementById("quhao");
		guding = document.getElementById("guding");
		fenjihao = document.getElementById("fenjihao");
		quhao.onfocus = mouseInQuhao;
		guding.onfocus = mouseInGuding;
		fenjihao.onfocus = mouseInFenjihao;
		quhao.onblur = mouseOutQuhao;
		guding.onblur = mouseOutGuding;
		fenjihao.onblur = mouseOutFenjihao;
		quhao.onkeyup = checkGH;
		guding.onkeyup = checkGH;
		fenjihao.onkeyup = checkGH;
		
		//地址标签
		biaoqian = document.getElementById("biaoqian");
		biaoqian.onfocus = mouseInBiaoqian;
		biaoqian.onblur = mouseOutBiaoqian;
		biaoqianSpan = biaoqian.nextSibling;
		
		jia = document.getElementById("jia");
		fumujia = document.getElementById("fumujia");
		gongsi = document.getElementById("gongsi");
		xuexiao = document.getElementById("xuexiao");
		
		jia.onclick = jiaClick;
		fumujia.onclick = fumujiaClick;
		gongsi.onclick = gongsiClick;
		xuexiao.onclick = xuexiaoClick;
		
	});
	
	function checkAll () {
		uname.onblur();
		xiangxidizhi.onblur();
		phone.onblur();
		
		//通过span的 error属性 的个数 判断有没有错误的信息
		var errorSpanArr = document.getElementsByClassName("error");
		
		if(errorSpanArr.length>0){//有错误的信息
			//不提交表单
alert('请正确填写信息！');
		}else{
			//提交表单
alert('正确');
			shouhuoxin.submit();
		}
	}
	
	function trim (txt) {
		var afterTxt = txt.replace(/^\s*/,'').replace(/\s*$/,'');
		return afterTxt;
	}
	
	//收货人
	function mouseInUname () {
		uname.value = "";
		checkName();
	}
	
	function mouseOutUname () {
		checkName();
	}
	
	function checkName () {
		unameSpan.innerHTML ="";
		if (uname.value=="" || trim(uname.value)=="" || uname.value=="姓名") {
			unameSpan.innerHTML ="请输入收货人姓名";
			unameSpan.className = "error";
		}else if(trim(uname.value).length>20){
			unameSpan.innerHTML ="收货人姓名 不能超过20个字符";
			unameSpan.className = "error";
		}else{
			unameSpan.className ="success";
		}
	}
	
	//详细地址
	function mouseInXXDZ () {
		xiangxidizhi.value = "";
		checkXXDZ();
	}
	
	function mouseOutXXDZ () {
		checkXXDZ();
	}
	
	function checkXXDZ () {
		xxdzSpan.innerHTML ="";
		if (xiangxidizhi.value=="" || trim(xiangxidizhi.value)=="" || xiangxidizhi.value=="街道名称/编号 楼宇名称 单位 房间") {
			xxdzSpan.innerHTML ="请输入收货地址";
			xxdzSpan.className = "error";
		}else{
			xxdzSpan.className ="success";
		}
	}
	
	//常用手机号码
	function mouseInPhone() {
		phone.value = "";
		checkPhone();
	}
	
	function mouseOutPhone () {
		checkPhone();
		if(phone.value==""){
			phone.value="常用手机号码";
		}
	}
	
	function checkPhone () {
		phoneSpan.innerHTML ="";
		if (phone.value=="" || trim(phone.value)=="" || phone.value=="常用手机号码") {
			phoneSpan.innerHTML ="请填写您的联系方式：手机或电话";
			phoneSpan.className = "error";
		}else if(!isPhone(trim(phone.value))){
			phoneSpan.innerHTML = "手机号码格式不正确，请确认	";
			phoneSpan.className = "error";
		}else{
			phoneSpan.className ="success";
		}
	}
	
	function isPhone (phone) {
		var regExp = /^(15[0-9]{1}|18[0-9]{1}|13[0-9]{1})\d{8}$/;
		var flag = regExp.test(phone);
		return flag;
	}
	
	//固定电话
	function mouseInQuhao () {
		quhao.value ="";
		checkGH();
	}
	
	function mouseInGuding () {
		guding.value="";
		checkGH();
	}
	
	function mouseInFenjihao() {
		fenjihao.value="";
		checkGH();
	}
	
	function mouseOutQuhao () {
		checkGH();
		if(quhao.value ==""){
			quhao.value="区号";
		}
	}
	
	function mouseOutGuding () {
		checkGH();
		if(guding.value==""){
			guding.value="电话号码";
		}
	}
	
	function mouseOutFenjihao() {
		checkGH();
		if(fenjihao.value==""){
			fenjihao.value = "分机号";
		}
	}
	    
	//分机号可以为空
	function checkGH () {
		phoneSpan.innerHTML ="";
		if(quhao.value=="" || trim(quhao.value) == ""  ){
			phoneSpan.innerHTML="固定电话格式错误(区号)，请参考021-12345678";
			phoneSpan.className = "error";
		}else if(guding.value ==""||trim(guding.value) == "" ){
			phoneSpan.innerHTML="固定电话部分(电话号码)不能为空 ";
			phoneSpan.className = "error";
		}else if(!isGH(trim(guding.value))){
			phoneSpan.innerHTML="固定电话格式错误(电话号码)，请参考021-12345678";
			phoneSpan.className = "error";
		}else{
			phoneSpan.className = "success";
		}
		
	}
	//7 或 8 位
	function isGH (gh) {
		var regExp=/^\d{7,8}$/;
		var flag = regExp.test(gh);
		return flag;
	}
	
	
	//地址标签
	function mouseInBiaoqian () {
		biaoqian.value = "";
	}
	
	function mouseOutBiaoqian () {
		checkBiaoqian();
	}
	
	function checkBiaoqian () {
		biaoqianSpan.innerHTML ="";
		biaoqianSpan.className = "success";
	}
	
	function jiaClick () {
		biaoqian.value ="";
		biaoqian.value ="家";
		checkBiaoqian();
	}
	
	function fumujiaClick () {
		biaoqian.value ="";
		biaoqian.value ="父母家";
		checkBiaoqian();
	}
	
	function gongsiClick () {
		biaoqian.value ="";
		biaoqian.value ="公司";
		checkBiaoqian();
	}
	
	function xuexiaoClick () {
		biaoqian.value ="";
		biaoqian.value ="学校";
		checkBiaoqian();
	}
	
	
})();



