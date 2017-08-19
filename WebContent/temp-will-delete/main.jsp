<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="../static/dist/js/bootstrap.min.js" ></script>
<title>main page</title>
</head>
<body>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><Strong>种植系统</Strong></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/plant/jsp/demo3.jsp">主界面<span class="sr-only">(current)</span></a></li>
        <li><a href="#">当前环境参数</a></li>
        <li><a href="/plant/jsp/dataShow.jsp">动态数据展示</a></li>
        <li><a href="#">操作日志</a></li>
        <li><a href="#">监控界面</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">终端下发 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="temp-test-save">
        </div>
        <!-- <button type="submit" class="btn btn-default">Submit</button> -->
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span>
        	<c:choose>
				<c:when  test="${empty sessionScope.username}">
					欢迎您：游客&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:when>
				<c:otherwise>
					欢迎您:${sessionScope.username}&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:otherwise>
		    </c:choose>
          </span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">设置<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">注销</a></li>
            <li><a href="#">管理</a></li>
            <li><a href="#">修改密码</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">忘记密码</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="<c:url value='/ExitServlet'/>">退出系统</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>



              
</body>
</html>