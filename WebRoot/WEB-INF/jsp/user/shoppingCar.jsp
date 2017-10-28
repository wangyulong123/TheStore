<%@ page language="java" import="java.util.*,com.vo.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>1号店-提交订单</title>
<link rel="shortcut icon" href="img/icon.png" />
<link rel="stylesheet" type="text/css" href="css/theStore.css" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<style type="text/css">
* {
	margin: 0px;
}

.alldiv {
	width: 990px;
	height: auto;
	background: pink;
	margin: 0px auto;
}

body {
	width: 1349px;
	font: 12px/150% Arial, Verdana, "\5b8b\4f53";
	color: #666;
	padding: 0px;
}

a {
	text-decoration: none;
	color: #666;
}

a:HOVER {
	color: #c91623;
}

em, i, u {
	font-style: normal;
}

/*最上面导航条*/
/*最上面一条的type 开始*/
#shortcut {
	width: 100%;
	height: 30px;
	line-height: 30px;
	background: #F1F1F1;
}

.fl {
	float: left;
}

#shortcut .w {
	width: 990px;
	height: 30px;
	margin: 0 auto;
	background: #F1F1F1;
}

#shortcut li {
	float: left;
	height: 30px;
	padding: 0 2px;
}

#shortcut li.dorpdown {
	z-index: 13;
}

#shortcut #ttbar-mycity {
	padding-left: 0;
}

#shortcut li.dorpdown:hover {
	padding: 0 1px;
}

#shortcut li.dropdown {
	position: relative;
	padding-left: 0px;
	z-index: 1;
}

#shortcut .dt {
	float: left;
	padding: 0 8px;
}

#shortcut #ttbar-mycity .dt {
	padding: 0 25px 0 10px;
}

.cw-icon {
	position: relative;
	cursor: default;
	zoom: 1;
}

#shortcut li.dorpdown:hover .dt {
	background: #fff;
	border: solid #ddd;
	border-width: 0 1px;
	cursor: default;
}

#ttbar-mycity:hover .dt {
	padding: 0 24px 0 9px;
}

#shortcut .ci-right {
	position: absolute;
	display: block;
	top: 12px;
	right: 8px;
	height: 7px;
	overflow: hidden;
	font: 400 15px/15px consolas;
	color: #6A6A6A;
	transition: transform .1s ease-in 0s;
	-webkit-transition: -webkit-transform .1s ease-in 0s;
}

#shortcut li.dorpdown:hover .ci-right {
	transform: rotate(180deg);
	-webkit-transform: rotate(180deg);
}

#shortcut .ci-right s {
	position: relative;
	top: -7px;
	text-decoration: none;
}

#shortcut .dorpdown-layer {
	display: none;
	position: absolute;
	line-height: 24px;
	width: 301px; //
	padding: 10px 0 10px 10px;
	top: 30px;
	background: #fff;
	border: 1px solid #ddd;
}

#shortcut li.dorpdown:hover .dorpdown-layer {
	display: block;
	z-index: 2;
}

#shortcut #ttbar-mycity .dd-spacer {
	left: 0;
	width: 98px;
}

#shortcut .dd-spacer {
	position: absolute;
	top: -7px;
	height: 10px;
	background: #fff;
	overflow: hidden;
}

#shortcut #ttbar-mycity .item {
	float: left;
	width: 60px;
	padding: 2px 0;
}

#shortcut #ttbar-mycity .item a {
	float: left;
	padding: 0 8px;
}

a.selected {
	background: #C81623;
	color: #fff;
}

.selected {
	z-index: =1;
	background: #C81623;
	color: #fff;
}

.notselected {
	z-index: =1;
	background: #fff;
}

#shortcut .item a:hover {
	background: #F4F4F4;
}

.fr {
	float: right;
}

#shortcut #ttbar-login {
	margin-right: 10px;
}

#shortcut #ttbar-login .link-login {
	font-family: "verdana,simsun";
}

#shortcut .style-red {
	color: #C81623;
}

#shortcut li.spacer {
	width: 1px;
	height: 12px;
	margin-top: 9px;
	padding: 0;
	background: #ddd;
	overflow: hidden;
}

#ttbar-myjd .dorpdown-layer {
	width: 280px;
}

#ttbar-myjd .userinfo {
	padding: 10px 0 10px 15px;
	overflow: hidden;
}

#ttbar-myjd .u-pic {
	float: left;
	margin-right: 10px;
}

#ttbar-myjd .u-pic img {
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
}

#ttbar-myjd .u-name {
	padding: 6px 0 0;
	font-weight: 700;
}

#ttbar-myjd .otherlist {
	width: 255px;
	padding: 0 0 0 15px;
	margin: 5px 0;
	overflow: hidden;
	margin-bottom: 10px;
}

#ttbar-myjd .otherlist .fore1, #ttbar-myjd .otherlist .fore2 {
	float: left;
	width: 126px;
}

#ttbar-myjd .dd-spacer {
	left: 0;
	width: 82px;
}

#shortcut #ttbar-apps .dt {
	padding-left: 25px;
	padding-right: 25px;
}

#shortcut #ttbar-myjd .dt, #shortcut #ttbar-atte .dt, #shortcut #ttbar-serv .dt,
	#shortcut #ttbar-navs .dt {
	width: 49px;
	padding-right: 25px;
}

.cw-icon .i, .cw-icon i {
	display: block;
	position: absolute;
	overflow: hidden;
}

#shortcut #ttbar-apps .dt .ci-left {
	top: 5px;
	left: 7px;
	width: 15px;
	height: 20px;
	background: url(img/images2/jd2015img.png) 0 0 no-repeat;
}

#shortcut #ttbar-apps:hover .dt .ci-left {
	background: url(img/images2/jd2015img.png) 0 -25px no-repeat;
}

#shortcut #ttbar-apps .dd-inner {
	position: relative;
	width: 250px;
	height: 186px;
	overflow: hidden;
	background: url(img/images2/erweimamany.png);
}

#ttbar-apps .dd-spacer {
	left: 0;
	height: 7px;
	width: 98px;
}

#shortcut #ttbar-atte .dd-spacer, #shortcut #ttbar-serv .dd-spacer {
	left: 0;
	height: 7px;
	width: 82px;
}

#shortcut #ttbar-apps .dd {
	width: 250px;
}

#shortcut #ttbar-apps .dd a {
	display: block;
	position: absolute;
	width: 56px;
	height: 44px;
	overflow: hidden;
	text-indent: -500px;
}

#shortcut #ttbar-apps .dd .link {
	width: 100px;
	height: 20px;
	overflow: hidden;
}

#shortcut #ttbar-apps .dd .link1, #shortcut #ttbar-apps .dd .link2,
	#shortcut #ttbar-apps .dd .link3 {
	left: 92px;
	top: 6px;
	background-position: 0 -44px;
}

#shortcut #ttbar-apps .dd .link3 {
	top: 104px;
	background-position: -1px -66px;
}

#shortcut #ttbar-apps .dd .link4, #shortcut #ttbar-apps .dd .link5 {
	left: 99px;
	top: 23px;
	width: 136px;
	color: #c21a21;
	text-indent: 0;
	cursor: default;
}

#shortcut #ttbar-apps .dd .link5 {
	top: 120px;
}

#shortcut #ttbar-apps .jdapp-ios, #shortcut #ttbar-apps .wyapp-ios {
	top: 46px;
	left: 92px;
}

#shortcut #ttbar-apps .jdapp-android, #shortcut #ttbar-apps .wyapp-android
	{
	top: 46px;
	left: 147px;
}

#shortcut #ttbar-apps .dd-inner {
	position: relative;
	width: 250px;
	height: 186px;
	overflow: hidden;
	background: url(img/images2/erweimamany.png);
}

#shortcut #ttbar-apps .jdapp-ipad, #shortcut #ttbar-apps .wyapp-ipad {
	width: 45px;
	top: 46px;
	left: 202px;
}

#shortcut #ttbar-apps .wyapp-android, #shortcut #ttbar-apps .wyapp-ios {
	top: 143px;
}

#shortcut #ttbar-atte .dt, #shortcut #ttbar-serv .dt {
	width: 49px;
	padding-right: 25px;
}

#shortcut #ttbar-atte .dd, #shortcut #ttbar-serv .dd {
	width: 82px;
	padding-bottom: 8px;
}

#shortcut #ttbar-atte .dd {
	padding-left: 0;
}

#shortcut #ttbar-serv .dd {
	width: 170px;
}

#shortcut #ttbar-serv .item-business, #shortcut #ttbar-serv .item-client
	{
	font-weight: 700;
	padding-left: 10px;
}

#shortcut #ttbar-atte .item, #shortcut #ttbar-serv .item {
	display: inline-block;
	width: 70px;
	padding-left: 15px;
}

#shortcut #ttbar-serv .item {
	padding-left: 10px;
}

#shortcut #ttbar-serv .item-business {
	border-top: 1px dotted #ccc;
	padding-top: 5px;
	margin-top: 5px;
}

#shortcut #ttbar-navs .dd-spacer {
	right: 0px;
	height: 7px;
	width: 82px;
}

#shortcut #ttbar-navs dt {
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 6px;
}

#shortcut #ttbar-navs .dt {
	width: 49px;
	padding-right: 25px;
}

#shortcut #ttbar-navs .dd {
	right: 1px;
	width: 1210px;
	padding: 20px 0 16px;
}

#shortcut #ttbar-navs dl {
	float: left;
	width: 201px;
	padding-left: 20px;
	border-left: 1px solid #ddd;
}

#shortcut #ttbar-navs dl {
	width: 259px;
}

#shortcut #ttbar-navs dl.fore1 {
	border-left: none;
	width: 347px;
}

#shortcut #ttbar-navs .fore2 {
	display: block;
}

#shortcut #ttbar-navs .item {
	float: left;
	width: 100px;
}

#shortcut #ttbar-navs .item {
	width: 86px;
}
/*最上面一条的type 结束*/
/*搜索部分 type 开始*/
#logo {
	position: relative;
	z-index: 12;
	float: left;
	width: 362px;
	height: 60px;
	padding: 20px 0;
}

/*������ĵ���������*/
.div-top {
	width: 990px;
	margin: 0px auto;
	height: 30px;
	background-color: #F1F1F1;
}

.div-top-sendTo {
	display: inline-block;
	line-height: 30px;
	padding: 0 25px 0 10px;
}

.div-top-ul {
	display: inline-block;
	list-style: none;
	margin: 0px;
	padding: 0px;
}
/*.ci-right {
    position: absolute;
    display: block;
    top: 12px;
    left: 255px;
    height: 7px;
    overflow: hidden;
    font: 400 15px/15px consolas;
    color: #6A6A6A;
    transition: transform .1s ease-in 0s;
    -webkit-transition: -webkit-transform .1s ease-in 0s;
}*/
.user {
	height: 30px;
	line-height: 30px;
	display: inline-block;
	width: 123px;
	float: right;
	padding: 0px 2px;
}

.div-top1 {
	float: right;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	width: 76px;
	text-align: center;
	padding: 0px 2px;
}

.div-top2 {
	float: right;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	width: 58px;
	text-align: center;
	padding: 0px 2px;
}

.div-top3 {
	float: right;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	width: 92px;
	text-align: center;
	padding: 0px 2px;
}

.div-top4 {
	float: right;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	width: 88px;
	text-align: center;
	padding: 0px 2px;
}

.spacer {
	width: 1px;
	height: 12px;
	padding: 0px;
	background: #ddd;
	overflow: hidden;
	float: right;
	margin-top: 9px;
}

.logo {
	width: 990px;
	margin: 0px auto;
	display: block;
	/* float: left;
	position: relative; */
	width: 985px;
	padding: 15px 0 10px;
	padding-left: 5px;
	margin-left: 180px;
}

.link2 {
	overflow: hidden;
	display: block;
	position: absolute;
	width: 100px;
	height: 40px;
	line-height: 99em;
	top: 16px;
	right: 0;
	background: #fff;
	float: left;
}

.logo b {
	display: block;
	position: absolute;
	width: 100px;
	height: 40px;
	line-height: 99em;
	top: -8;
	right: 0;
	background: url(img/images2/gouwuche.png) #fff no-repeat;
	float: left;
}

.div-logo-form {
	display: inline-block;
	float: right;
	border: 2px solid #ED1B23;
	height: 24px;
	position: relative;
	top: 20px;
}

form {
	padding: 0px;
	margin: 0px;
}
/*未登录*/
.nologin-tip {
	border: 1px solid #edd28b;
	background: #fffdee;
	padding: 10px 20px;
	line-height: 25px;
	width: 948px;
	margin: 0px auto;
	margin-top: 95px;
	margin-bottom: 20px;
	color: #f70;
	display: block;
}

s {
	font-style: normal;
}

.wicon {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
	margin-right: 10px;
	width: 16px;
	height: 16px;
	overflow: hidden;
	background: url(img/images2/icon16.png) 0 0 no-repeat;
}

.btn-1 {
	font-family: arial, "Microsoft YaHei";
	display: inline-block;
	*display: inline;
	*zoom: 1;
	height: 25px;
	line-height: 25px;
	background-color: #e74649;
	background-image: -moz-linear-gradient(top, #e74649, #df3134);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #e74649),
		color-stop(1, #df3134));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649',
		endColorstr='#df3134', GradientType='0');
	-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649',
		endColorstr='#df3134');
	background-image: linear-gradient(to top, #e74649 0, #df3134 100%);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color: #fff;
	font-size: 12px;
	font-weight: 400;
	padding: 0 10px;
	vertical-align: middle;
	cursor: pointer;
	border: 0;
	float: none;
	-webkit-transition: all .2s ease-out;
	-moz-transition: all .2s ease-out;
	transition: all .2s ease-out;
}

.ml10 {
	margin-left: 10px;
}
/*������*/
.itxt {
	border: 0;
	line-height: 18px;
	width: 270px;
	padding: 3px 5px;
}

.button {
	display: inline-block;
	vertical-align: top;
	width: 48px;
	height: 24px;
	background: #ED1B23;
	text-align: center;
	color: #fff;
	font-weight: 700;
	border: 0px;
}

.div2 {
	height: 26px;
	margin: 0 auto;
	width: 990px;
	position: relative;
	margin-bottom: 5px;
	padding-top: 5px;
}

.div2login {
	margin-top: 95px;
}

.div2-1 { 
	float: left;
	position: relative;
	font-weight: 700;
	font-size: 16px;
	height: 26px;
	line-height: 26px;
	text-align: center;
	cursor: pointer;
}

.toRed {
	color: #C81623;
}

.w-line {
	width: 990px;
	margin: 0 auto;
	position: relative;
	height: 1px;
	background: #e0e0e0;
}

.floater {
	position: absolute;
	height: 2px;
	background: #e4393c;
	left: 0;
	width: 80px;
	overflow: hidden;
}

.switch {
	font-weight: 700;
	font-size: 16px;
	line-height: 26px;
	text-align: center;
	cursor: pointer;
}

.number {
	font-family: verdana;
	font-size: 14px;
}

.sendTo {
	display: inline-block;
	float: right;
}

.sendToHere {
	float: right;
	position: relative;
	top: -5px;
	height: 23px;
	background: #fff;
	border: 1px solid #CECBCE;
	padding: 0 22px 0 4px;
	line-height: 23px;
	overflow: hidden;
}

.sendToHere div {
	display: inline-block;
}

.sendToHere b {
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	width: 17px;
	height: 24px;
	background-image: url(img/images2/down.png);
	background-position: 0 0;
	overflow: hidden;
	margin-bottom: 10px;
}

.div2-line {
	position: relative;
	width: 990px;
	margin: 0px auto;
	/* height: 1px;*/
	background: #e0e0e0;
}

.item-header {
	background: #fff;
	position: relative;
	z-index: 2;
	height: 26px;
}

.cart-tbody .item-header {
	padding: 5px 10px;
	line-height: 26px;
	color: #999;
	display: inline-block;
	display: block;
}

.item-header .f-txt {
	float: left;
	width: 750px;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.item-header .full-icon {
	position: relative;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	vertical-align: middle;
	background: #f48719;
	border: 1px solid #f48719;
	color: #fff;
	padding: 1px 10px;
	height: 16px;
	line-height: 16px;
	margin: 0 10px 0 5px;
}

.item-header .full-icon b {
	display: block;
	position: absolute;
	width: 5px;
	height: 6px;
	left: -1px;
	bottom: -5px;
	background: url(img/images2/car) 0 0 no-repeat;
	overflow: hidden;
}

.cart-tbody .item-header .btn-1 {
	height: 19px;
	line-height: 19px;
	padding: 0 5px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.btn-1 {
	font-family: arial, "Microsoft YaHei";
	display: inline-block;
	*display: inline;
	*zoom: 1;
	height: 25px;
	line-height: 25px;
	background-color: #e74649;
	background-image: -moz-linear-gradient(top, #e74649, #df3134);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #e74649),
		color-stop(1, #df3134));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649',
		endColorstr='#df3134', GradientType='0');
	-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649',
		endColorstr='#df3134');
	background-image: linear-gradient(to top, #e74649 0, #df3134 100%);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color: #fff;
	font-size: 12px;
	font-weight: 400;
	padding: 0 10px;
	vertical-align: middle;
	cursor: pointer;
	border: 0;
	float: none;
	-webkit-transition: all .2s ease-out;
	-moz-transition: all .2s ease-out;
	transition: all .2s ease-out;
}

.ml20 {
	margin-left: 20px;
}

.item-header a.ftx-05 {
	color: #333;
}

.ftx-05, .ftx05 {
	color: #005ea7;
}

.item-header .f-price {
	float: left;
	min-width: 100px;
	text-align: right;
	font-family: verdana;
	line-height: 13px;
	color: #333;
}

.item-header .f-price strong {
	color: #333;
	font-weight: 400;
}

.div3 {
	width: 990px;
	display: inline-block;
	display: block;
	height: 32px;
	line-height: 32px;
	margin: 10px auto;
	margin-top: 0px;
	padding: 5px 0;
	background: #f3f3f3;
	border: 1px solid #e9e9e9;
	border-top: 0;
	background-color: #f3f3f3;
	margin-bottom: 11px;
}

.jdcheckbox {
	float: left;
	position: relative;
	vertical-align: middle;
	_vertical-align: 0px;
	margin: 0px 5px 2px 12px;
	padding: 0;
}

.cart-checkbox div {
	display: inline-block;
	position: relative;
	top: 0px;
}

.t-goods {
	margin-left: 74px;
}

.t-price {
	margin-left: 437px;
}

.t-quantity {
	margin-left: 65px;
}

.t-sum {
	margin-left: 81px;
}

.t-action {
	margin-left: 37px;
}

/*������Ʒ��Ϣ*/
.goods {
	width: 990px;
	margin: 0px auto;
	/*height: 141px;*/
}

.shop {
	line-height: 30px;
	height: 30px;
	font-weight: 700;
	border-bottom: solid 2px;
}

.shop-mes {
	position: relative;
	top: -1px;
}

.self-shop {
	position: relative;
	left: -1px;
}

.shop-a {
	display: inline-block;
	position: relative;
	top: 4px;
	left: -1px;
	height: 18px;
	line-height: 18px;
}

.shop div {
	float: right;
	display: inline-block;
	position: relative;
	font-weight: 400;
}

.self-shop-name {
	width: 54px;
	height: 18px;
	background: url(img/images2/all2.png) 0 -177px no-repeat;
	overflow: hidden;
	line-height: 18px;
	color: #e4393c;
}

.tips-icon {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 18px;
	height: 18px;
	margin: -3px 0 0 5px;
	background: url(img/images2/tips-ico.png) no-repeat;
	overflow: hidden;
	vertical-align: middle;
}

.item-list {
	border-style: solid;
	border-width: 1px 1px 1px;
	_border-width: 1px;
	border-color: #aaa #f1f1f1 #f1f1f1;
	background: #fff;
}

.buygoods {
	position: relative;
	top: -1px;
	height: 108px;
	width: 990px;
	margin: 0px auto;
}

.buygoodsselected {
	background: #fff4e8;
}

.cell {
	float: left;
	padding: 15px 0 10px;
}

.p-checkbox {
	position: absolute;
	/*left: -960px;*/
	top: 5;
	width: 30px;
	min-height: 10px;
	_height: 10px;
}

.p-goods {
	width: 300px;
	height: 86px;
	display: inline-block;
	position: relative;
	left: 312px;
	top: -35px;
}

.p-img {
	width: 80px;
	height: 80px;
	/*position: relative;
    left: -209px;
    top:1px;*/
	margin-right: 10px; /
	border: 1px solid #eee; /
	background: #fff;
	padding: 0; /
	text-align: center; /
	overflow: hidden;
	position: absolute;
	top: 10px;
	left: 40px;
}

.p-name {
	width: 208px;
	height: 40px;
	line-height: 20px;
	overflow: hidden;
	position: absolute;
	left: 145px;
	top: 10px;
}

.p-name2 {
	width: 208px;
	height: 40px;
	line-height: 20px;
	overflow: hidden;
}

.p-name a {
	color: #333;
	height: 20px;
}

.p-extend {
	position: absolute;
	left: 150px;
	top: 50px;
}

.p-extend i {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 17px;
	height: 16px;
	vertical-align: middle;
	overflow: hidden;
	background: url(img/images2/all2.png) no-repeat;
	background-position: -27px -23px;
	margin-right: 7px;
}

.p-extend a {
	color: #aaa;
}

.baozhang {
	position: relative;
	top: -9px;
}

.jd-service {
	display: inline-block;
	vertical-align: middle;
}

.p-div2 {
	width: 100px;
	height: 80px;
	line-height: 20px;
	overflow: hidden;
	padding: 15px 10px 0;
	position: absolute;
	left: 355px;
}

.props-txt {
	width: 100px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	cursor: default;
}

.p-div3 {
	position: absolute;
	left: 590px;
}

.p-div3 strong {
	color: #333;
	font-family: verdana;
	line-height: 20px;
	text-align: right;
	font-weight: 400;
}

/*������������*/
.quantity-form {
	position: absolute;
	overflow: hidden;
	height: 22px;
	width: 80px;
	top: 14px;
	left: 680px;
}

.decrement, .increment {
	display: inline-block;
	border: 1px solid #cacbcb;
	border-right: 0;
	height: 18px;
	line-height: 18px;
	padding: 1px 0;
	width: 16px;
	text-align: center;
	color: #666;
	margin: 0;
	background: #fff;
}

.increment {
	float: right;
	border-right: 1px solid #cacbcb;
	border-left: none;
}

.p-quantity-itxt {
	border: 1px solid #cacbcb;
	display: inline-block;
	position: absolute;
	left: 17px;
	top: 0;
	width: 46px;
	line-height: 18px;
	text-align: center;
	padding: 1px;
	margin: 0;
	font-size: 12px;
	font-family: verdana;
	color: #333;
	-webkit-appearance: none;
}

.p-sum {
	text-align: right;
	font-family: verdana;
}

.p-sum strong {
	color: #333;
	font-weight: 700;
}

.div4 {
	position: absolute;
	left: 815px;
}

/*����*/
.p-ops {
	width: 75px;
}

.a1 {
	display: inline-block;
}

.div5 {
	position: absolute;
	left: 900px;
}

/*����*/
.check {
	width: 990px;
	height: 52px;
	margin: 0px auto;
	margin-top: 19px;
	border: 1px solid #f0f0f0;
	position: relative;
}

.selectall {
	float: left;
	height: 18px;
	*width: 60px;
	line-height: 18px;
	padding: 16px 0 16px 9px;
	white-space: nowrap;
	position: relative;
	left: -11px;
}

.selectall-box {
	display: inline-block;
	position: relative;
	top: 1px;
}

.check .operation {
	float: left;
	height: 50px;
	width: 310px;
	line-height: 50px;
	position: relative;
	top: -16px;
}

.operation a {
	display: inline-block;
	float: left;
	margin-left: 20px;
	color: #666;
}

/*�����Ұ벿��*/
.toolbar-right {
	position: relative;
	height: 52px;
	right: 0;
	top: -1px;
	width: 610px;
	top: -53px;
	left: 561px;
}

.amount-sum {
	float: right;
	color: #999;
	height: 44px;
	line-height: 20px;
	margin: 7px 0 0;
	cursor: pointer;
	position: relative;
	left: -321px;
	top: -1px;
}

.amount-sum em {
	color: #e4393c;
	font-family: verdana;
	font-weight: 700;
	margin: 0 3px;
}

.amount-sum b.up {
	background-position: -45px -91px;
}

.amount-sum b {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 9px;
	height: 5px;
	background: url(img/images2/all2.png) -45px -91px;
	overflow: hidden;
	vertical-align: middle;
	margin: -5px 0 0 5px;
	-webkit-transition: all .2s ease-in 0s;
	-moz-transition: all .2s ease-in 0s;
	transition: all .2s ease-in 0s;
}

.txt {
	float: left;
	width: 110px;
	text-align: right;
	color: #999;
}

.toolbar-right-money {
	position: absolute;
	left: 299px;
	top: 7px;
}

.price {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	text-align: right;
	font-family: verdana;
}

.price-sum {
	line-height: 20px;
	color: #666;
}

.price-sum {
	line-height: 20px;
	color: #666;
}

.price-sum div {
	white-space: nowrap;
}

.amount-sum {
	float: right;
	color: #999;
	height: 44px;
	line-height: 20px;
	margin: 7px 0 0;
	cursor: pointer;
}

.price em {
	font-size: 16px;
	color: #e4393c;
	font-weight: 700;
}

.btn-area {
	float: right;
	position: relative;
	left: 99px;
}

.submit-btn {
	display: block;
	position: relative;
	width: 96px;
	height: 52px;
	line-height: 52px;
	color: #fff;
	text-align: center;
	font-size: 18px;
	font-family: "Microsoft YaHei";
	background: #e54346;
	overflow: hidden;
}

.submit-btn b {
	display: block;
	position: absolute;
	width: 96px;
	height: 52px;
	top: 0;
	left: 0;
	overflow: hidden;
	background: url(img/images2/jiesuan.png) 0 0 no-repeat;
}

.toolbar-right-money-span {
	display: inline-block;
	position: relative;
	top: 3px;
}

.w {
	width: 990px;
	margin: 0 auto;
}

#c-tabs-new {
	overflow: visible;
}

#c-tabs-new {
	position: relative;
	top: -31px;
}

#c-tabs-new .mt {
	margin-bottom: 10px;
	position: relative;
	top: -3px;
}

#c-tabs-new .c-item {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	padding-bottom: 3px;
	border-bottom: 2px solid #fff;
}

.extra-1-1 {
	position: absolute;
	left: 90px;
}

.extra-1-2 {
	position: absolute;
	left: 176px;
}

#c-tabs-new .c-item.curr {
	color: #e4393c;
	font-weight: 700;
	border-color: #e4393c;
}

#c-tabs-new a:HOVER {
	color: #e4393c;
	font-weight: 700;
	border-color: #e4393c;
}

/*�Ƽ��ֻ��*/
#c-tabs-new .mc {
	overflow: visible;
	height: 326px;
}

#c-tabs-new .c-panel {
	position: relative;
	width: 100%;
	height: 100%;
}

#c-tabs-new .goods-list ul {
	display: inline-block;
	display: block;
	width: 100%;
	height: 100%;
	padding: 0px;
}

ul {
	list-style: none;
	padding: 0px;
}

#c-tabs-new .goods-list li {
	float: left;
	margin: 0px;
	padding: 0px;
}

#c-tabs-new .goods-list-tab {
	position: absolute;
	right: 0;
	top: -26px;
	width: 52px;
}

#c-tabs-new .goods-list-tab .curr {
	width: 26px;
	background: #e4393c;
}

#c-tabs-new .goods-list-tab .s-item {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 8px;
	height: 8px;
	overflow: hidden;
	background: #aaa;
	vertical-align: middle;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	position: relative;
}

#c-tabs-new .goods-list-tab .curr {
	width: 26px;
	background: #e4393c;
}

#c-tabs-new .goods-list .item {
	position: relative;
	width: 206px;
	padding: 20px;
	background: #fff;
	margin: -1px 0 0 -1px;
	border: 1px dashed #cacaca;
	overflow: hidden;
}

.pp-img {
	width: 160px;
	margin: 0 auto;
}

img {
	border: 0;
	vertical-align: middle;
}

#c-tabs-new .goods-list .p-name {
	height: 36px;
	line-height: 18px;
	margin: 5px 0;
	overflow: hidden;
	left: 0px;
}

#c-tabs-new .goods-list .p-price {
	width: 100px;
	margin: 5px 0 2px; //
	overflow: hidden;
	text-align: center;
}

.p-price-pos {
	position: relative;
	left: 55px;
}

#c-tabs-new .goods-list .p-price strong {
	font-size: 14px;
	color: #d91f20;
	font-family: verdana;
	font-weight: 400;
}

#c-tabs-new .goods-list .p-btn {
	margin: 10px 0 0;
	text-align: center;
}

#c-tabs-new .goods-list .btn-append {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	height: 28px;
	line-height: 28px;
	padding: 0 20px;
	border: 1px solid #999;
	color: #666;
	text-align: center;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#c-tabs-new {
	position: relative;
}

.btn-append b {
	display: inline-block;
	height: 18px;
	width: 18px;
	margin-right: 5px;
	background-position: 0 -57px;
	background-repeat: no-repeat;
	overflow: hidden;
	vertical-align: middle;
}

.btn-append b {
	background-image: url(img/images2/gift.png);
}

.backpanel-inner {
	position: fixed;
	z-index: 999;
	left: 50%;
	margin-left: 495px;
	bottom: 51px;
}

.backpanel-inner .bp-item {
	width: 38px;
	height: 38px;
	background: #fff;
}

.backpanel-inner .bp-item .myfollow, .backpanel-inner .bp-item .survey,
	.backpanel-inner .bp-item .tohelp {
	background-position: 0 0;
	line-height: 14px;
	background-image: none;
	text-decoration: none;
	background-color: #aaa;
	color: #fff;
}

.backpanel-inner .bp-item {
	width: 38px;
	height: 38px;
	background: #fff;
}

.backpanel-inner .bp-item .backtop {
	background-position: 0 -55px;
}

.backpanel-inner .bp-item a {
	display: block;
	background-image: url(img/images2/xiangshang.png);
	background-color: #aaa;
	background-repeat: no-repeat;
	padding: 5px 0 0 7px;
	color: #fff;
	height: 33px;
	line-height: 1000px;
	overflow: hidden;
	margin-top: 5px;
}

/*����*/
#service-2014 {
	margin-bottom: 20px;
	position: relative;
	top: -30px;
}

#service-2014 .slogen .item {
	display: inline-block;
	position: absolute;
	left: 50%;
	top: 20px;
	width: 245px;
	height: 54px;
	text-align: left;
	vertical-align: middle;
	font: 400 18px/50px "microsoft yahei";
}

.slogen {
	position: relative;
	height: 54px;
	padding: 20px 0;
	margin-bottom: 14px;
	background: #F5F5F5;
	text-align: center;
}

#service-2014 .slogen .fore1 i {
	background-image: url(img/images2/duo.png);
}

#service-2014 .slogen .fore2 i {
	background-image: url(img/images2/kuai.png);
}

#service-2014 .slogen .fore3 i {
	background-image: url(img/images2/hao.png);
}

#service-2014 .slogen .fore4 i {
	background-image: url(img/images2/sheng.png);
}

#service-2014 .slogen .fore1 {
	margin-left: -490px;
}

#service-2014 .slogen .item i {
	display: block;
	position: absolute;
	top: 0;
	left: 10px;
	width: 220px;
	height: 54px;
	background-repeat: no-repeat;
	background-position: 0 0;
}

#service-2014 .slogen .item b {
	padding: 0 10px;
	font-size: 24px;
	color: #C81623;
}

#service-2014 .slogen .fore2 {
	margin-left: -245px;
}

#service-2014 .slogen .fore3 {
	margin-left: 0;
}

#service-2014 .slogen .fore4 {
	margin-left: 245px;
}

#service-2014 dl {
	float: left;
	width: 222px;
}

#service-2014 dt {
	padding: 6px 0;
	font: 400 16px/24px "microsoft yahei";
}

#service-2014 dd {
	line-height: 20px;
}

#service-2014 dl.fore5 {
	width: 100px;
}

.clear, .clr {
	display: block;
	overflow: hidden;
	clear: both;
	height: 0;
	line-height: 0;
	font-size: 0;
}

/*�ײ���Ȩ��*/
#footer-2014 {
	border-top: 1px solid #E5E5E5;
	padding-top: 20px;
	text-align: center;
}

#footer-2014 .links a {
	margin: 0 10px;
}

#footer-2014 .copyright {
	margin: 10px 0;
}

#footer-2014 .authentication a {
	margin: 0 5px;
	text-decoration: none;
}

img {
	border: 0;
	vertical-align: middle;
}

.all-bottom {
	width: 0px;
	height: 15px;
}

#ft_wrap {
	position: relative;
	left: 60px;
}
</style>

</head>

<body>
	<div id="loginDiv">
		<%
			User user = (User)session.getAttribute("user");
			if(user==null){
				//显示 "Hi,请登录"	
		%>
		<span>Hi,请</span>
		<a href="jsp/HomePage/Login.jsp">登录</a>
		<a class="regist" href="jsp/user/regist.jsp">注册</a>
		<%
			}else{
			//显示 "Hi,XXX" 退出
		%>
		<span style="color:#666;">Hi,<%=user.getNickname()%></span>
		<a href="LoginServlet?action=logout" class="regist">退出</a>
		<%
			}
		%>
		<div id="orderDiv">
			<a href="#" target="_blank">我的订单</a>
		</div>
		<div class="secmenuDiv">
			<ul class="nav">
				<li><a href="" target="_blank">充值中心</a>
					<ul>
						<li><a href="" target="_blank">话费充值</a></li>
						<li class="line_bottom"><a href="" target="_blank">流量充值</a></li>
					</ul></li>
				<li><a href="" target="_blank">客户服务</a>
					<ul>
						<li><a href="" target="_blank">包裹跟踪</a></li>
						<li><a href="" target="_blank">常见问题</a></li>
						<li><a href="" target="_blank">在线退换货</a></li>
						<li class="line_bottom"><a href="" target="_blank">配送范围</a></li>
					</ul></li>
				<li><a href="" target="_blank">网站导航</a>
					<ul>
						<li><a href="" target="_blank">1号商城</a></li>
						<li><a href="" target="_blank">1号社区</a></li>
						<li><a href="" target="_blank">网站联盟</a></li>
						<li><a href="" target="_blank">招商通道</a></li>
						<li><a href="" target="_blank">企业采购</a></li>
						<li class="line_bottom"><a href="" target="_blank">充值中心</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

	<!-- 1号图标 -->
	<div class="logo">
		<div style="width: 270px;float: left;position: relative;">
			<a href="//www.jd.com/" class="link1"><img src="img/1hd.png"
				alt="1号商城" /></a> <a href="#none" class="link2"><b></b>购物车</a>
		</div>
		<div class="div-logo-form" style="display:inline-block;float: right;">
			<div style="padding: 0px;margin: 0px;">
				<form action="getter">
					<input style="color: rgb(153, 153, 153);" class="itxt" type="text"
						value="自营" /> <input class="button" value="搜索" type="button" />
				</form>
			</div>
		</div>
	</div>
	
	<div class="nologin-tip">
		<span class="wicon"></span> 您还没有登录！登录后购物车的商品将保存到您账号中 <a
			class="btn-1 ml10" href="jsp/HomePage/Login.jsp"
			clstag="clickcart|keycount|xincart|cart_pageTopLogin">立即登录</a>
	</div>

	<!-- 标题处 -->
	<div class="div2">
		<a href="#" class="toRed"><em class="div2-1 ">全部商品&nbsp;</em><span
			class="number switch">1</span></a> 
		<div class="sendToHere">
			<div>北京朝阳区</div>
			<b class="div2-b"></b>
		</div>
		<div class="sendTo">配送至：</div>

	</div>
	<div class="w-line">
		<div style="width: 82px; left: 0px;" class="floater"></div>
	</div>
	<div class="div2-line"></div>
	<div class="div3">
		<div class="cart-checkbox">
			<input checked="checked" id="selectAll2" class="jdcheckbox"
				type="checkbox" style="position: relative;top:1px;"> <label
				class="checked" for="">全选</label>
			<div class="t-goods">商品</div>
			<div class="t-price">单价(元)</div>
			<div class="t-quantity">数量</div>
			<div class="t-sum">小计(元)</div>
			<div class="t-action">操作</div>
		</div>
	</div>

	
	<!-- 1号商店-->
	<div class="goods">
		
		<!--1号自营那一条-->
		<div class="shop">
			<div class="shop-mes">
				<span>购满￥99.00&nbsp;免运费</span> <span class="tips-icon"></span>
			</div>
		</div>
	<%	
		List<Product> list = (List<Product>)session.getAttribute("list");
		double productTotalPrice = 0;
		//String count = request.getParameter("count");
		if(list!=null){
			for(Product product:list){
				//int shoppingCarSum = Integer.parseInt(count);
				int shoppingCarSum = product.getShoppingSum();
				double price = product.getPrice();
				double singleProductTotalPrice = price * shoppingCarSum;
				productTotalPrice = productTotalPrice + singleProductTotalPrice;
		%>
		<!--单品-->	
    		<div class="buygoods buygoodsselected item-list">
					<!--图片及名称-->
	    		<div class="p-checkbox cell" >
	    			<input checked="checked" id="selectGoods" class="jdcheckbox"type="checkbox"/>
					</div>
						<!-- 手机图片 -->
						<div class="p-img">
							<a target="_blank" ><img alt="" src="img/productImage/<%=product.getShoppingCarImg()%>"/></a>
						</div>
						<div class="p-name">
							<a  href="//item.jd.com/1601978.html" target="_blank"><%=product.getPname()%></a>
						</div>
						<div class="p-extend">
							<span class="promise"><i></i><a>购买礼品包装</a></span><br/>
							<span class="promise" ><i style="background-position: 0 -23px;"></i><a class="jd-service" href="#none">购买增值保障</a></span>
						</div>
							<div class="p-div2">
								<div class="props-txt" title="黑">颜色：黑</div>
								<div class="props-txt" title="标准(16GB)">尺码：标准(16GB)</div>
							</div>
							<div class="cell p-price p-div3" ><strong><%=price %></strong></div>
							<div class="quantity-form">
									<a class="decrement">-</a>
									<input value="<%=shoppingCarSum %>" type="text" autocomplete="off" class="p-quantity-itxt" />
									<a class="increment">+</a>
							</div>
				
							<div class="cell p-sum div4"><strong><%=singleProductTotalPrice%></strong></div>	
							<div class="cell p-ops div5">
								<!--单品onclick="deleteFromCar(<%=product.getPid() %> -->
								<a id="shoppingCarDelete" href="ShoppingCarServlet?action=delete&pid=<%=product.getPid() %>")">删除</a>
								<a class="a1">移到我的关注</a>
							</div>
    					</div>
	
 </div>
 <%				
    		}
    	}
    %>
	<!-- 结算 -->
	<div class="check" id="selectall_div">
		<div class="selectall">
			<div style="float: left;" class="cart-checkbox">
				<input id="selectAll1" checked="checked"
					class="jdcheckbox selectall-box" type="checkbox"> <label
					class="checked" for="">全选</label>
			</div>
			<div class="operation">
				<a href="#none" class="remove-batch">删除选中的商品</a> <a href="#none"
					class="follow-batch">移到我的关注</a>
			</div>
		</div>
	</div>
	<div class="toolbar-right">
		<div class="amount-sum">
			已选择<em>1</em>件商品<b class="up"></b>
		</div>
		<div class="toolbar-right-money">
			<span class="txt">总价（不含运费）：</span> <span class="price sumPrice"><em>￥<%=productTotalPrice%></em></span><br/>

			<span class="txt toolbar-right-money-span ">已节省：</span> <span
				class="price totalRePrice toolbar-right-money-span">-￥0.00</span>
		</div>
		<div class="btn-area">
			<a class="submit-btn" href="OrderServlet?action=checkOrder">去结算<b></b></a>
		</div>
	</div>

	<!-- 猜你喜欢 -->
	<div class="w">
		<div class="m m1" id="c-tabs-new">
			<div class="mt">
				<div class="extra-1">
					<a href="#none" class="c-item curr">猜你喜欢</a> <a href="#none"
						class="c-item extra-1-1">我的关注</a> <a href="#none"
						class="c-item extra-1-2">最近浏览</a>
				</div>
			</div>
			<div style="position: relative;" class="mc c-panel-main">
				<div style="position: absolute; z-index: 1; opacity: 1;"
					class="c-panel ui-switchable-panel-selected" id="guess-products">
					<div class="goods-list-tab">
						<a href="#none" class="s-item curr">&nbsp;</a> <a href="#none"
							class="s-item">&nbsp;</a> <a href="#none" class="s-item">&nbsp;</a>
					</div>
				</div>
				<div style="position: absolute; z-index: 1; opacity: 1;"
					class="goods-list c-panel ui-switchable-panel-selected">
					<ul>
						<li>
							<div class="item">
								<div style="width: 160px;margin: 0 auto;">
									<a target="_blank" href="#"><img src="img/images2/tj1.jpg"
										alt="派滋 小米note手机壳 透明硅胶软保护套" height="160" width="160"></a>

								</div>
								<div class="p-name2">
									<a target="_blank" href="#">派滋 小米note手机壳 透明硅胶软保护套<br></a>
								</div>

								<div class="p-price p-price-pos">
									<strong><em>￥</em><i>19.00</i></strong>
								</div>
								<div class="p-btn">
									<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div style="width: 160px;margin: 0 auto;">
									<a target="_blank" href="#"><img src="img/images2/tj2.jpg"
										alt="派滋 小米note手机壳 透明硅胶软保护套" height="160" width="160"></a>

								</div>
								<div class="p-name2">
									<a target="_blank" href="#">阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套
										适用于小米NOTE/顶配版<br>
									</a>
								</div>

								<div class="p-price p-price-pos">
									<strong><em>￥</em><i>29.00</i></strong>
								</div>
								<div class="p-btn">
									<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div style="width: 160px;margin: 0 auto;">
									<a target="_blank" href="#"><img src="img/images2/tj3.jpg"
										alt="派滋 小米note手机壳 透明硅胶软保护套" height="160" width="160"></a>

								</div>
								<div class="p-name2">
									<a target="_blank" href="#">耐尔金（NILLKIN）小米note
										磨砂手机保护壳/保护套/手机套 黑色<br>
									</a>
								</div>

								<div class="p-price p-price-pos">
									<strong><em>￥</em><i>35.00</i></strong>
								</div>
								<div class="p-btn">
									<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
								</div>
							</div>
						</li>
						<li>
							<div class="item">
								<div style="width: 160px;margin: 0 auto;">
									<a target="_blank" href="//item.jd.com/2290998.html"><img
										src="img/images2/tj4.jpg" alt="派滋 小米note手机壳 透明硅胶软保护套"
										height="160" width="160"></a>

								</div>
								<div class="p-name2">
									<a target="_blank" href="//item.jd.com/2290998.html">幻响（i-mu）小米Note
										钢化膜 抗蓝光 防爆玻璃膜 手机保护贴膜 5.7英寸 弧边<br>
									</a>
								</div>

								<div class="p-price p-price-pos">
									<strong><em>￥</em><i>29.00</i></strong>
								</div>
								<div class="p-btn">
									<a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 右边悬浮 -->
	<div class="w">
		<div class="backpanel-inner">
			<div id="bp-follow" class="bp-item ">
				<a target="_blank" class="survey" href="#">我的关注</a>
			</div>
			<div class="bp-item " id="bp-faq">
				<a href="#" class="survey" target="_blank">常见问题</a>
			</div>
			<div class="bp-item " id="bp-survery">
				<a href="#" class="survey" target="_blank">我要反馈</a>
			</div>
			<div style="display: block;" class="bp-item " id="bp-backtop">
				<a href="#top" class="backtop">返回顶部</a>
			</div>
		</div>
	</div>

	<!--最底部-->
	<div id="ft_wrap" class="scroll-floor floor7">
		<div class="ft_wrap_top">
			<a href="#"> <img src="图片/正常保障.png" /> <b>正品保障</b> <span>正品行货
					放心选购</span>
			</a> <a href="#"> <img src="图片/满68.png" /> <b>满68包邮</b> <span>满68元
					免运费</span>
			</a> <a href="#"> <img src="图片/售后无忧.png" /> <b>售后无忧</b> <span>7天无理由退货</span>
			</a> <a href="#"> <img src="图片/准时送达.png" /> <b>准时送达</b> <span>收货时间由你做主</span>
			</a>
		</div>
		<div class="ft_wrap_center">
			<div class="ft_wrap_center_left">
				<dl>
					<dt>新手入门</dt>
					<dd>
						<a href="#" style="color: black;">购物流程</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">会员制度</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">发票制度</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">订单查询</a>
					</dd>
					<dd>
						<a href="" style="color: black;">常见问题</a>
					</dd>

				</dl>
				<dl>
					<dt>新手入门</dt>
					<dd>
						<a href="#" style="color: black;">支付方式</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">货到付款</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">网上支付</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">银行转账</a>
					</dd>
					<dd>
						<a href="" style="color: black;">礼品卡支付</a>
					</dd>
					<dd>
						<a href="" style="color: black;">其他支付</a>
					</dd>
				</dl>
				<dl>
					<dt>配送服务</dt>
					<dd>
						<a href="#" style="color: black;">配送范围及运费</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">配送进度查询</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">自提服务</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">商品验收与签收</a>
					</dd>

				</dl>
				<dl>
					<dt>售后保障</dt>
					<dd>
						<a href="#" style="color: black;">退换货政策</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">退换货流程</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">退款说明</a>
					</dd>
					<dd>
						<a href="#" style="color: black;">延保说明页面</a>
					</dd>
					<dd>
						<a href="" style="color: black;">联系客服</a>
					</dd>

				</dl>

			</div>
			<!--二维码-->
			<div class="ft_wrap_center_right">
				<div class="ft_wrap_center_right_left"</div>
				<p>APP更优惠</p>
				<img src="图片/APP.png" />
			</div>
			<div class="ft_wrap_center_right_left"</div>
			<p>加微信查订单</p>
			<img src="图片/APP.png" />
		</div>

	</div>

	</div>
	<!--最底下-->
	<div id="foot" class="ft_wrap_under">
		<p class="foot_p	">
			<a href="#">关于一号店</a>| <a href="#">我们的团队</a>| <a href="#">网站联盟</a>| <a
				href="#">热门搜索</a>| <a href="#">友情链接</a>| <a href="#">1号点社区</a>| <a
				href="#">商家登录</a>| <a href="#">供应商登录</a>| <a href="#">放心搜</a>| <a
				href="#">1号店新品</a>| <a href="#">开放平台</a>| <a href="#">沃尔玛</a>|

		</p>
		<p>
			<a href="#">沪ICP备16050468号</a>| <a href="#">沪B2-20170039</a>| <a
				href="#">经营证照</a>| <a href="#">互联网药品信息服务资格证</a>| <a href="#">违法和不良信息举报电话：0514-85899118</a>|
		</p>
		<p>
			<a href="#">Copyright© 1号店网上超市 2007-2017，All Rights Reserved</a>

		</p>
		<small class="ft_wrap_small"> <span
			style="display:inline-block;position:relative;width:auto; height: 32px;margin: 0 4px;"></span>
			<img src="图片/可信网站.png" /> <img src="图片/银联.png" /> <img
			src="图片/上海.png" /> <img src="图片/网络.png" /> <img src="图片/纠纷.png" />
			<img src="图片/视频.png" /> <img src="图片/上海上.png" /> </span>
		</small>
	</div>
	</div>
	</div>
	</div>
	</div>


</body>


<script src="js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>

<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	$(function() {
		var isnoLogin = $("#ttbar-login").hasClass("nologin");
		if (isnoLogin) {//没有登陆
			$("#ttbar-login").addClass("nologin");
			$(".nologin-tip").show();
			$(".div2").removeClass("div2login");
		}  else {
			$("#ttbar-login").removeClass("nologin");
			$(".nologin-tip").hide();
			$(".div2").addClass("div2login");
		} 
	});
	$(function() {
		<!--选中店铺-->

		<!--送至北京-->
		Cookie_name = "span_name";//定义一个cookie
		if ($.cookie(Cookie_name)) {//如果该cookie已经存在
			$(".area-text").text($.cookie(Cookie_name));//将span内的地点改为读取到的cookie值
		}
		var $text;
		$(".area-content-list a").click(function() {
			$(".area-content-list a").removeClass("selected");
			$(this).addClass("selected");
			$text = $(this).text();
			//删除原有的cookie
			$.cookie(Cookie_name, null, {
				path : '/'
			});
			//保存新的cookie
			$.cookie(Cookie_name, $text, {
				path : '/',
				expires : 10
			});
			$(".area-text").text($.cookie(Cookie_name));
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$(".jdcheckbox").click(function() {
			if ($(this).prop("checked") == true) {
				$(this).parents(".item-list").addClass("buygoodsselected");
				var checked = $(".buygoods").find("jdcheckbox");
				if (checked.prop("checked") == false) {
					$("#selectAll2").prop("checked", false);
					$("#selectAll1").prop("checked", false);
				}
			} else {
				$(this).parents(".item-list").removeClass("buygoodsselected");
				if ($("#selectAll2").prop("checked") == true) {
					$("#selectAll2").prop("checked", false);
				}
				if ($("#selectAll1").prop("checked") == true) {
					$("#selectAll1").prop("checked", false);
				}
			}
		});

		$("#selectAll2").click(
				function() {
					if ($(this).prop("checked") == true) {
						$(this).parents(".div3").next(".goods").find(
								".jdcheckbox").prop("checked", true);
						$(this).parents(".div3").next(".goods").find(
								".item-list").addClass("buygoodsselected");
						$("#selectAll1").prop("checked", true);
					} else {
						$(this).parents(".div3").next(".goods").find(
								".jdcheckbox").prop("checked", false);
						$(this).parents(".div3").next(".goods").find(
								".item-list").removeClass("buygoodsselected");
						$("#selectAll1").prop("checked", false);
					}
				});

		$("#selectAll1").click(
				function() {
					if ($(this).prop("checked") == true) {
						$(this).parents("#selectall_div").prev(".goods").find(
								".jdcheckbox").prop("checked", true);
						$(this).parents("#selectall_div").prev(".goods").find(
								".item-list").addClass("buygoodsselected");
						$("#selectAll2").prop("checked", true);
					} else {
						$(this).parents("#selectall_div").prev(".goods").find(
								".jdcheckbox").prop("checked", false);
						$(this).parents("#selectall_div").prev(".goods").find(
								".item-list").removeClass("buygoodsselected");
						$("#selectAll2").prop("checked", false);
					}
				});
	})

	/*$(function(){
		$(".div4").each(function(){
			alert($(".div4").text());
		});
	});*/
</script>
</html>
