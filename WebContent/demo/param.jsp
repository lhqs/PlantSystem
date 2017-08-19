<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当前环境参数</title>
<%@include file="/demo/header.jsp"%>
</head>
<body>
	<script src="../common/chartsdemo.js"></script>
	<div class="jumbotron">
		<div class="container">
			<!-- <button data-toggle="modal" data-target="#myModal">
				<a>添加</a> </button> -->
				
				
				<div id="container"></div>
				<div id="container1"></div>
				<button id="large">放大</button>
				<button id="small">缩小</button>
				<input type=button value=刷新 onclick=history.go(-0)> 
		</div>
	</div>




<!-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户管理</h4>
				</div>
				<div id="container"></div>
				<div id="container1"></div>
				<button id="large">放大</button>
				<button id="small">缩小</button>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" onclick="add_info()" class="btn btn-primary">提交更改</button>
				</div>

			</div>
		</div>
	</div> -->
</body>
</html>