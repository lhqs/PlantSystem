<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head lang="en">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="../static/img/plant1.ico">
<link rel="stylesheet" href="../static/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/dist/css/bootstrap-theme.css">
<script src="../static/bootstrap/lib/jquery-2.1.1.min.js"></script>
<script src="../static/dist/js/bootstrap.min.js"></script>
<title>user page</title>
</head>
<body>


	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><Strong>种植系统</Strong></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/plant/jsp/demo3.jsp">主界面<span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">当前环境参数</a></li>
					<li><a href="/plant/jsp/dataShow.jsp">动态数据展示</a></li>
					<li><a href="#">操作日志</a></li>
					<li><a href="#">监控界面</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">终端下发 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">temp-one</a></li>
							<li><a href="#">temp-two</a></li>
							<li><a href="#">temp-three</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">temp-four</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">temp-five</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="temp-test-save">
					</div>
					<!-- <button type="submit" class="btn btn-default">Submit</button> -->
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span> <c:choose>
									<c:when test="${empty sessionScope.username}">
					欢迎您：游客&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:when>
									<c:otherwise>
					欢迎您:${sessionScope.username}&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:otherwise>
								</c:choose>
						</span></a></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">设置<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<!-- <li><a href="#">添加用户</a></li> -->
							<li><a href="#" class="btn btn-primary btn-lg" data-toggle="modal"
									data-target="#myModal">添用户</a></li>
							<!-- <li><a href="#" ><a type="button"
									class="btn btn-primary btn-lg" data-toggle="modal"
									data-target="#myModal">添加用户</a> </a></li>
							<li><a href="/plant/jsp/userNanager.jsp">用户管理</a></li> -->
							<li><a href="#">修改密码</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">忘记密码</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<c:url value='/ExitServlet'/>">退出系统</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-inverse">
						<thead class="thead-inverse">
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Username</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭界面</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>