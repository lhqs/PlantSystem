<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
</head>
<body>
	<%@include file="/demo/header.jsp"%>
<div class="jumbotron">
	<div class="container">


		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">登录用户</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname" placeholder="请输入用户名称">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">登录密码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="lastname" placeholder="请输入登录密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary btn-lg btn-block">确认添加</button>
				</div>
			</div>
		</form>


	</div>
</div>	
</body>
</html>