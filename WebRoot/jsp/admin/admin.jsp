<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<head>
		<base href="<%=basePath%>">
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>1号店后台管理系统</title>
	
	<link rel="shortcut icon" href="staticTheStore/img/icon.jpg">
	<!-- font icons -->
	<link rel="stylesheet" type="text/css" href="staticTheStore/css/organicfoodicons.css" />
	<!-- demo styles -->
	<link rel="stylesheet" type="text/css" href="staticTheStore/css/demo.css" />
	<!-- menu styles -->
	<link rel="stylesheet" type="text/css" href="staticTheStore/css/component.css" />
	<style type="text/css">
	.jdh{
	text-align: center;
	}
  canvas{
  position:absolute;
  top:60;
  left:0;
  background-color:black;
  
}  
  #c{
   width: 1220px;
   height: 600px;
  }
 /* .main{
   width: 1200px;
   height: 630px;
   background:url("img/桌面.jpeg") 0 0 repeat;
  background-size: 100%;
    
  }
  .main-center{

   width: 1200px;
   height: 630px;
   background-color: black;
    opacity:0.2; 
   filter:Alpha(opacity=10); 
   text-align: center;
     position:static; 
    *zoom:1;
  
     } */
     .main{
      width: 1200px;  
    height: 630px;  
    line-height: 50px;  
    text-align: center; 
     }
     .main:BEFORE{
     background:url("staticTheStore/img/桌面.jpeg") no-repeat;  
    background-size: cover;  
    width: 1200px;  
    height: 630px;  
    content: "";  
    position: absolute;  
    top: 40;  
    left: 0;  
    opacity:0.9; 
    z-index: -1;/*-1 可以当背景*/  
    -webkit-filter: blur(3px);  
    filter: blur(0px);  
     }
   .main-a{
   color:white;
   font-size: 120px;
   position: relative;
   top:210px;
   
   text-decoration: none;
   text-shadow: 0 0 20px red;
   filter:shadow(Color=#0000ff,Direction=10,Strength=10);
   }
  .main-a:HOVER{
  color:red;
  }
	</style>
	<script src="staticTheStore/js/modernizr-custom.js"></script>
	   
	   
</head>

<body>
	<!-- Main container -->
	<div class="container">
		<!-- Blueprint header -->
		<header class="bp-header cf">
			<div class="dummy-logo" >
				<div > <img src="staticTheStore/img/thestore.png" style="width:150px;height:130px;position:relative;bottom:20px;right:10px;" ></div>
<!-- 				<h2 class="dummy-heading" style="color: white;">京东</h2> -->
			</div>
			<div class="bp-header__main">
			
				<h1 class="bp-header__title">1号店,为了更好的生活</h1>
				
			</div>
		</header>
		 
		<nav id="ml-menu" class="menu" >
			
			<div class="menu__wrap">
				<ul data-menu="main" class="menu__level">
				
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-1" href="#">商品种类管理</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-2" href="#">商品管理</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-3" href="#">订单管理</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-4" href="#">用户管理</a></li>
				</ul>
				<!-- Submenu 1 -->
				<ul data-menu="submenu-1" class="menu__level">
		
					<li class="menu__item" ><a class="menu__link"  href="JDDispatcherServlet?target=admin/category/addCategory.jsp" target="mainIFrame">添加一级商品管理</a></li>
					<li class="menu__item"><a class="menu__link" href="CategoryServlet?action=getAllByPage&requestPage=1" target="mainIFrame">管理一级商品种类</a></li>
					<li class="menu__item"><a class="menu__link" href="Category2Servlet?action=getCategory1ForAddCategory2" target="mainIFrame">添加二级商品种类</a></li>
					<li class="menu__item"><a class="menu__link" href="Category2Servlet?action=getAllByPage&requestPage=1" target="mainIFrame">管理二级商品种类</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-1-1" href="#">待开发</a></li>
				</ul>
				<!-- Submenu 1-1 -->
				<ul data-menu="submenu-1-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="CategoryServlet1?action=getAllByPage&requestPage=1" target="mainIFrame"">一级商品管理系统</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Dried Veggies</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Our Brand</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Homemade</a></li>
				</ul>
				<!-- Submenu 2 -->
				<ul data-menu="submenu-2" class="menu__level">
								
					<li class="menu__item"><a class="menu__link" href="ProductServlet?action=getAllCategorysForAddProduct" target="mainIFrame">添加商品</a></li>
					<li class="menu__item"><a class="menu__link" href="ProductServlet?action=getAllByPage&target=uploadImg&requestPage=1" target="mainIFrame">上传照片</a></li>
					<li class="menu__item"><a class="menu__link" href="ProductServlet?action=shangxiajia&target=productOnSaleMain&requestPage=1" target="mainIFrame">上架/下架</a></li>
					<li class="menu__item"><a class="menu__link"href="ProductServlet?action=getAllByPage&target=productMain&requestPage=1" target="mainIFrame">管理商品</a>
					<li class="menu__item"><a class="menu__link" href="#">待开发</a></li>
				</ul>
				<!-- Submenu 2-1 -->
				<ul data-menu="submenu-2-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">Exotic Mixes</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Wild Pick</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Vitamin Boosters</a></li>
				</ul>
				<!-- Submenu 3 -->
				<ul data-menu="submenu-3" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">查看订单</a></li>
					<li class="menu__item"><a class="menu__link" href="#">修改订单</a></li>

					<li class="menu__item"><a class="menu__link" data-submenu="submenu-3-1" href="#">待开发</a></li>
				</ul>
				<!-- Submenu 3-1 -->
				<ul data-menu="submenu-3-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">Starter Kit</a></li>
					<li class="menu__item"><a class="menu__link" href="#">The Essential 8</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Bolivian Secrets</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Flour Packs</a></li>
				</ul>
				<!-- Submenu 4 -->
				<ul data-menu="submenu-4" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">用户添加</a></li>
					<li class="menu__item"><a class="menu__link" href="UsernameServlet?action=getlockAll&requestPage=1" target="mainIFrame">用户加锁与解锁</a></li>
					<li class="menu__item"><a class="menu__link" href="#">用户修改</a></li>
					<li class="menu__item"><a class="menu__link" href="UsernameServlet?action=getAllByPage&requestPage=1" target="mainIFrame">用户查询</a></li>
					<li class="menu__item"><a class="menu__link" data-submenu="submenu-4-1" href="#">待开发</a></li>
				</ul>
				<!-- Submenu 4-1 -->
				<ul data-menu="submenu-4-1" class="menu__level">
					<li class="menu__item"><a class="menu__link" href="#">Nut Mylk Packs</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Amino Acid Heaven</a></li>
					<li class="menu__item"><a class="menu__link" href="#">Allergy Free</a></li>
				</ul>
			</div>
		</nav>
		<div class="content">

			<h2 class="jdh" >TheStore后台管理系统</h2>
			<div class="main" >
			
			 <a class="main-a" >Hello,world!</a>
			
			
			</div>
		    <!--  <canvas id="c"></canvas> -->
		 <iframe name="mainIFrame" src="" width="1200px" height="635px" style="position:absolute ;top: 40px;  z-index:1;" frameborder="0" >
	   			 
	   		</iframe> 
		</div>
	</div>
  <script src="staticTheStore/js/index.js"></script>

	<script src="staticTheStore/js/classie.js"></script>
	<script src="staticTheStore/js/dummydata.js"></script>
	<script src="staticTheStore/js/main.js"></script>
	<script>
	(function() {
		var menuEl = document.getElementById('ml-menu'),
			mlmenu = new MLMenu(menuEl, {
				
			
			});

		// mobile menu toggle
		var openMenuCtrl = document.querySelector('.action--open'),
			closeMenuCtrl = document.querySelector('.action--close');

		openMenuCtrl.addEventListener('click', openMenu);
		closeMenuCtrl.addEventListener('click', closeMenu);

		function openMenu() {
			classie.add(menuEl, 'menu--open');
		}

		function closeMenu() {
			classie.remove(menuEl, 'menu--open');
		}

		// simulate grid content loading
		var gridWrapper = document.querySelector('.content');

		function loadDummyData(ev, itemName) {
			ev.preventDefault();

			closeMenu();
			/* gridWrapper.innerHTML = '';
			classie.add(gridWrapper, 'content--loading');
			setTimeout(function() {
				classie.remove(gridWrapper, 'content--loading');
				gridWrapper.innerHTML = '<ul class="products">' + dummyData[itemName] + '<ul>';
			}, 700); */
		}
	})();
	</script>
</body>

</html>
		