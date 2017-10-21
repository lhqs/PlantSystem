<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%@include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="../static/img/plant1.ico">
<link rel="stylesheet" href="../static/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/dist/css/bootstrap-theme.css">
<script src="../static/bootstrap/lib/jquery-2.1.1.min.js"></script>
<script src="../static/dist/js/bootstrap.min.js"></script>

<!-- <script src="../static/js/jquery-2.0.3.js"></script> -->
<script src="../static/js/highcharts.js"></script>
<script src="../static/themes/dark-unica.js"></script>
<script src="../static/js/exporting.js"></script>
<style type="text/css">


body {
	margin: 0px;
}

div {
	color: black;
}
.navbar {
	margin:0px
}
</style>    

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${basePath}/demo/main.jsp"><Strong>种植系统</Strong></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${basePath}/demo/main.jsp">主界面<span class="sr-only">(current)</span></a></li>
        <li><a href="${basePath}/demo/pictable.jsp">当前环境参数</a></li>
        <li><a href="${basePath}/demo/dynamicdata.jsp">动态数据展示</a></li>
        <li><a href="${basePath}/demo/statistics.jsp">历史数据统计</a></li>
        <li><a href="${basePath}/demo/userList.jsp">管理员列表</a></li>
        <li><a href="${basePath}/demo/operator.jsp">操作日志</a></li>
        <li><a href="${basePath}/demo/moniter.jsp">监控界面</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">终端下发 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">连接</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">排风</a></li>
            <li><a href="#">加热</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">断开终端连接</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="">
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">移动端应用下载<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="http://lhqs1314.cn/app/plant-android.apk">Andriod版本</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="http://lhqs1314.cn/app/plant-ios.ipa">iOS版本</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">选项设置<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../login.jsp">登陆</a></li>
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