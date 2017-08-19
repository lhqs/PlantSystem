<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Foundation 实例</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.bootcss.com/foundation/5.5.3/css/foundation.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/foundation/5.5.3/js/foundation.min.js"></script>
<script src="https://cdn.bootcss.com/foundation/5.5.3/js/vendor/modernizr.js"></script>
</head>
<body>
	<nav class="top-bar" data-topbar>
		<ul class="title-area">
			<li class="name">
				<h1><a href="index.html">种植系统首页</a></h1>
			</li>
			<!-- 小屏幕上折叠按钮: 去掉 .menu-icon 类，可以去除图标。    如果需要只显示图片，可以删除 "Menu" 文本 -->
			<li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
		</ul>

		<section class="top-bar-section">
			<ul class="left">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="/plant/test/1.jsp">功能区一</a></li>
				<li><a href="#">功能区二</a></li>
				<li><a href="#">功能区三</a></li>
			</ul>
		</section>
	</nav>
	
	
	<div>
		<div>空气温度:<span></span>  </div>
		<div>湿度:<span></span>  </div>
		<div>光照强度: <span></span> </div>
		<div>二氧化碳浓度:<span></span>  </div>
		<div> </div>
	</div>
	
	<div>
		
	</div>
	
	
	
	
	<!-- 初始化 Foundation JS -->
	<script>
		$(document).ready(function() {
			$(document).foundation();
		})
	</script>
</body>
</html>
