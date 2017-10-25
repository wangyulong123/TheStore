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
			}
			#userPay fieldset{
				position:relative;
				left:200px;
				top:-20px;
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
			
			#btn1{
				border-radius:5px;
				background-color:#A2A2A2;
				position:relative;
				left:100px;
				font-size:13px;
			}
		</style>
	</head>

	<body>
		<form id="userPay" action="https://www.yeepay.com/app-merchant-proxy/node" method="post">
			<div>
				<img src="imgs/payhead.png" />
			</div>
			
			<input type="hidden" name="pd_FrpId" value="${pd_FrpId }" />
			<input type="hidden" name="p0_Cmd" value="${p0_Cmd }" />
			<input type="hidden" name="p1_MerId" value="${p1_MerId }" />
			<input type="hidden" name="p2_Order" value="${p2_Order }" />
			<input type="hidden" name="p3_Amt" value="${p3_Amt }" />
			<input type="hidden" name="p4_Cur" value="${p4_Cur }" />
			<input type="hidden" name="p5_Pid" value="${p5_Pid }" />
			<input type="hidden" name="p6_Pcat" value="${p6_Pcat }" />
			<input type="hidden" name="p7_Pdesc" value="${p7_Pdesc }" />
			<input type="hidden" name="p8_Url" value="${p8_Url }" />
			<input type="hidden" name="p9_SAF" value="${p9_SAF }" />
			<input type="hidden" name="pa_MP" value="${pa_MP }" />
			<input type="hidden" name="pr_NeedResponse" value="${pr_NeedResponse }" />
			<input type="hidden" name="hmac" value="${hmac }" />
			
			<pre>
				<div id="getPayment">
			订单金额：<span name="amount">${p3_Amt } </span>元                        订单编号：<span name="orderId">${p2_Order }</span> 	                  商户名称：<span name="merchantName">1号店网上支付</span>
					
			交易种类：直接消费                       交易币种：<span name="currency">人民币</span>
					<div style="position:absolute;top:-10px;right: 10px;">
						<img src="imgs/paystyle.png" />
					</div>
				</div>
			</pre>
		
			<fieldset>
				<legend><b>银联支付</b></legend>
				<div>
					<label>选择银行卡</label><br/>
					<div style="width:500px;position:relative;left:100px;">
					 	<INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET" checked="checked">建设银行
						<INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET">招商银行<em> </em>
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET">工商银行
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET">农业银行
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET">中国民生银行总行<br/>
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET" >光大银行 
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET">交通银行<em> </em>
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET">北京银行
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET">兴业银行 
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET">上海浦东发展银行<br/>
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET">中信银行
					    <INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET">深圳发展银行
					</div>
					<table width="300" height="150px" border="0" align="center" cellpadding="5"
						cellspacing="0" style="position:absolute;right:10px;top:40px;">
						<tr>
							<td bgcolor="#F4F8FF"><span class="STYLE5"> 温馨提示</span></td>
						</tr>
						<tr>
							<td>
								<ul>
									<li>建行客户需到柜面签约网上银行才能支付</li>
									<li>请关闭弹出窗口拦截功能</li>
									<li>务必使用Google Chrome、FireFox或IE5.0以上浏览器</li>
									<li>支付出错时勿按浏览器“后退”键</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
				<div>
					<label>银行卡类型</label><br/>
					<div style="position:relative;left:100px;">
						<input type="radio" name="CardType" value="JianSheCard" checked="checked"/>储蓄卡
						<input type="radio" name="CardType" value="ChinaCard"/>信用卡
					</div>
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