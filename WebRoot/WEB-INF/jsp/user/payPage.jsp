<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>1号店-网上支付</title>
		<style type="text/css">
			* {
				font-family: verdana;
				font-size: 96%;
			}
			
			label {
				width: 10em;
				float: left;
			}
			#userPay{
				width:950px;
				position: relative;
				left: 200px;
				top:-25px;
			}
			
			fieldset> div {
				margin-bottom: 10px;
			}
			
			div:first-of-type {
				margin-top: 5px;
			}
			
			fieldset span {
				color: red;
				margin-left: 5px;
			}
			
			span.error {
				background: url("imgs/unchecked.gif") no-repeat 0px center;
				padding-left: 18px;
			}
			
			span.success {
				background: url("imgs/checked.gif") no-repeat 0px center;
				padding-left: 18px;
			}
			
			em {
				font-weight: bold;
				padding-right: 1em;
				vertical-align: top;
				white-space: pre;
			}
			#getPayment{
				background:#ECF0F1;
				width:950px;
				height:200px;
				position: relative;
				left: 200px;
			}
		</style>

		<script type="text/javascript">
			var userCardIdInput;
			var password1Input;  
			var password2Input;
			var phoneInput;

			window.onload = function() {

				//给 银行卡号 绑定onblur事件
				userCardIdInput = document.getElementById("userCardId");
				userCardIdInput.onblur = checkUserCardId;
				userCardIdInput.onkeyup = checkUserCardId;
				//给设置密码绑定onblur事件
				password1Input = document.getElementById("password1");
				password1Input.onblur = checkPassword1;
				password1Input.onkeyup = checkPassword1;
				
				//给确认密码绑定onblur事件
				password2Input = document.getElementById("password2");
				password2Input.onblur = checkPassword2;
				password2Input.onkeyup = checkPassword2;
				
				//给手机号 文本框绑定onblur事件
				phoneInput = document.getElementById("phone");
				phoneInput.onblur = checkPhone;
				phoneInput.onkeyup = checkPhone;
				//给 "确认支付"按钮 绑定事件
				var btn1 = document.getElementById("btn1");
				btn1.onclick = confirm;
			}

			function trim(txt) {
				var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");
				return afterTrimTxt;
			}

			function isCardId(cardNumber) {
				var regularExpression = /d{19}}/;
				if (regularExpression.test(cardNumber)) {
					return true;
				} else {
					return false;
				}
			}
			function isPhone(phoneNumber) {
				var regularExpression = /^(186\d{8})$|^(13[4-9]\d{8})$|^(15[0-2]\d{8})$/;
				if (regularExpression.test(phoneNumber)) {
					return true;
				} else {
					return false;
				}
			}

			//验证银行卡号
			function checkUserCardId() {

				//1.银行卡号不能为空
				var userCardId = userCardIdInput.value;

				var mySpan = userCardIdInput.nextSibling;

				mySpan.innerHTML = "";

				if (trim(userCardId) == "") {
					//提示 "请输入银行卡号"
					mySpan.innerHTML = "请输入银行卡号";
					mySpan.className = "error";
				} else if (userCardId.length != 19) {
					mySpan.innerHTML = "银行卡号错误";
					mySpan.className = "error";
				} else {
					//验证通过
					//弄一个 "对勾"
					mySpan.className = "success";
				}

			}
			
			function checkPassword1 () {
					
				var password1 = password1Input.value;

				var mySpan = password1Input.nextSibling;

				mySpan.innerHTML = "";

				if (trim(password1) == "") {
					//提示 "密码不能为空"
					mySpan.innerHTML = "密码不能为空";
					mySpan.className = "error";
				} else if (password1.length != 6) {
					mySpan.innerHTML = "密码错误";
					mySpan.className = "error";
				} else {
					//验证通过
					//弄一个 "对勾"
					mySpan.className = "success";
				}
			}
			
			function checkPassword2 () {
				
				var password1 = document.getElementById("password1").value;
				
				var password2 = password2Input.value;

				var mySpan = password2Input.nextSibling;

				mySpan.innerHTML = "";

				if (trim(password2) == "") {
					//提示 "密码不能为空"
					mySpan.innerHTML = "确认密码不能为空";
					mySpan.className = "error";
				} else if (password1!=password2) {
					mySpan.innerHTML = "两次密码输入不一致";
					mySpan.className = "error";
				} else {
					//验证通过
					//弄一个 "对勾"
					mySpan.className = "success";
				}
			}
			
			function checkPhone() {

				var phone = phoneInput.value;

				var mySpan = phoneInput.nextSibling;

				mySpan.innerHTML = "";

				if (phone != "" && !isPhone(phone)) {

					mySpan.innerHTML = "手机号格式不正确";
					mySpan.className = "error";
				} else {
					mySpan.className = "success";
				}

				if (trim(phone) == '') {
					mySpan.className = "";
				}

			}

			function confirm() {
				//验证所有信息
				userCardIdInput.onblur();
				password1Input.onblur();
				password2Input.onblur();
				phoneInput.onblur();

				var spanArr = document.getElementsByClassName("error");
				
				//没有错误的话提交表单
				//通过span为error的个数判断有没有错误
				if (spanArr.length > 0) {
					//不提交
				} else {
					//提交
					var userPay = document.getElementById("userPay");
					userPay.action = "handler.html";
					userPay.submit();
				}
			}
		</script>
	</head>

	<body>
		<div>
			<img src="imgs/payhead.png" />
		</div>
		<pre>
			<div id="getPayment">
		订单金额：<span id="price">999 </span>元               订单编号：<span id="orderNumber">228265382</span> 	            商户名称：<span id="merchantName">商户名称123</span>
				
		交易银行：<span id="dealBank">建设银行</span> 	     交易种类：直接消费                       交易币种：<span id="dealCurrency">人民币</span>
				<div style="position:absolute;top:-10px;right: 10px;">
					<img src="imgs/paystyle.png" />
				</div>
			</div>
		</pre>
		
		<form id="userPay" action="#" method="post">
			<fieldset>
				<legend>网上支付</legend>
				<div>
					<label>选择银行卡</label>
					<input type="radio" name="Bank" value="JianSheBank" checked="checked"/>建设银行
					<input type="radio" name="Bank" value="ChinaBank"/>中国银行
				</div>
				<div>
					<label>卡类型</label>
					<input type="radio" name="CardType" value="JianSheCard" checked="checked"/>储蓄卡
					<input type="radio" name="CardType" value="ChinaCard"/>信用卡
				</div>
				<div>
					<label>银行卡号</label><em>*</em>
					<input type="text" name="userCardId" id="userCardId" /><span></span>
				</div>
				
				<div>
					<label>支付密码</label><em>*</em>
					<input type="password" name="password1" id="password1" /><span></span>
				</div>
				
				<div>
					<label>确定密码</label><em>*</em>
					<input type="password" name="password2" id="password2" /><span></span>
				</div>

				<div>
					<label>银行预留手机号</label><em>*</em>
					<input type="text" name="phone" id="phone" /><span></span>
				</div>

				<div>
					<input type="submit" id="btn1" value="确认支付" />
				</div>
			</fieldset>

		</form>
		
		<div style="position: relative;left: 200px;">
			<img src="imgs/payfoot.png"/>
		</div>
	</body>

</html>