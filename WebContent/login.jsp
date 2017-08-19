<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登陆种植系统</title>
<link rel="shortcut icon" href="./static/img/plant1.ico">
<script src="./static/js/jquery-2.0.3.js"></script>
<link rel="stylesheet" type="text/css" href="./static/css/normalize.css">
<link rel="stylesheet" type="text/css" href="./static/css/demo.css">
<link rel="stylesheet" type="text/css" href="./static/css/component.css">

</head>

<body>
	<div class="container demo">
		<div class="content">
			<div id="large-header" class="large-header" style="height: 579px;">
				<canvas id="demo-canvas" width="1270" height="579"></canvas>
				<div class="logo_box">
					<h3>
						<b>登陆种植系统</b>
					</h3>

					<div class="input_outer">
						<span class="u_user"></span> <input id="username" name="logname"
							class="text" style="color: #FFFFFF !important" type="text"
							placeholder="请输入账户">
					</div>
					<div class="input_outer">
						<span class="us_uer"></span> <input id="password" name="logpass"
							class="text"
							style="color: #FFFFFF !important; position: absolute; z-index: 100;"
							value="" type="password" placeholder="请输入密码">
					</div>
					<div class="mb2">
						<a id="login" class="act-but submit" href="javascript:;"
							style="color: #FFFFFF">登录</a>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="./static/js/TweenLite.min.js"></script>
	<script src="./static/js/EasePack.min.js"></script>
	<script src="./static/js/rAF.js"></script>
	<script src="./static/js/show.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#login').click(function() {
				var username = $('#username').val();
				var password = $('#password').val();
				if (username == "") {
					alert("请输入用户名");
					return; 
				}
				if (password == "") {
					alert("请输入密码");
					return; 
				}
				$.ajax({
					type : "post",
					url : "<c:url value='/LoginHandleServlet'/>",
					data : {
						"username" : username,
						"password" : password
					},
					error : function() {
						alert("登陆出错！");
					},
					success : function(data) { 
						var jsdata = JSON.parse(data);
						if (jsdata.success) {
							window.location.href = "${basePath}/demo/main.jsp";
						}  else {
							alert(jsdata.msg);
							window.location.href = "${basePath}";
						}
					}
				});

			});

		});
	</script>
</body>

</html>