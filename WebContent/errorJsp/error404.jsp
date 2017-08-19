<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%pageContext.setAttribute("con", request.getContextPath()); %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../static/img/plant1.ico">
<link href="${con }/errorJsp/css/style.css" rel='stylesheet' type='text/css'/>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>404 error page</title>
</head>
<body>
	<body>
	<div class="top-bar-agile">
		<div class="logo-agileits">
			<a href="#"><img src="${con }/errorJsp/images/logo.png" alt="error " /></a>
		</div>
		<div class="nav-agileinfo">
			<ul>
				<li><a href="${con }/index.html">初始页</a></li>
				<li><a href="${con }/login.jsp">登录</a></li>
				<li><a href="#">提交反馈</a></li>
				<li><a href="${con }/ExitServlet">退出</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="content-w3">
		<h1>404</h1>
		<h2>Something went wrong</h2>
		<p>当你看到这个页面时， 说明你的访问路径有误，或者说是你的访问路径不可用</p>
	</div>
	<div class="footer-w3ls">
		<p> &copy; 2017 error page ! .  All Rights Reserved  |  Design by 东北农业大学 - 物联网工程系 </p>
	</div>
</body>
</body>
</html>