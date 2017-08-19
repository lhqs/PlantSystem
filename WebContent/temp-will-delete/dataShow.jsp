<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../static/img/plant1.ico">

<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="../static/img/plant1.ico">
<link rel="stylesheet" href="../static/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/dist/css/bootstrap-theme.css">
<script src="../static/bootstrap/lib/jquery-2.1.1.min.js"></script>
<script src="../static/dist/js/bootstrap.min.js"></script>

<script src="../static/js/jquery-2.0.3.js"></script>
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
</style>
<title>动态数据展示区</title>
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
				<li><a href="/plant/jsp/demo3.jsp">主界面<span class="sr-only">(current)</span></a></li>
				<li><a href="#">当前环境参数</a></li>
				<li class="active"><a href="#">动态数据展示</a></li>
				<li><a href="#">操作日志</a></li>
				<li><a href="#">监控界面</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">终端下发 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">One more separated link</a></li>
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
				<li><a href="#"><c:choose>
							<c:when test="${empty sessionScope.username}">
					欢迎您：游客&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:when>
							<c:otherwise>
					欢迎您:${sessionScope.username}&nbsp;&nbsp;&nbsp;&nbsp; 
				</c:otherwise>
						</c:choose></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">设置<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">注销</a></li>
						<li><a href="#">添加管理员</a></li>
						<li><a href="#">修改密码</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<c:url value='/ExitServlet'/>">退出系统</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>


	<div id="humidity" style="min-width: 400px; height: 400px"></div>
	<div>注： 有效数据从x轴0刻度开始</div>
	<div id="carbon" style="min-width: 400px; height: 400px"></div>
	<div>注： 有效数据从x轴0刻度开始</div>
	<div id="temperature" style="min-width: 400px; height: 400px"></div>
	<div>注： 有效数据从x轴0刻度开始</div>
	<div id="illumination" style="min-width: 400px; height: 400px"></div>


	<script type="text/javascript">
		Highcharts.setOptions({
			global : {
				useUTC : false
			}
		});
		function activeLastPointToolip(chart) {
			var points = chart.series[0].points;
			chart.tooltip.refresh(points[points.length - 1]);
		}
		$('#humidity').highcharts(
				{
					chart : {
						type : 'spline',
						animation : Highcharts.svg,
						marginRight : 10,
						events : {
							load : function() {
								var series = this.series[0], chart = this;
								setInterval(function() {
									var x;
									$.ajax({
										type : "GET",
										url : "<c:url value='/GetDataParam'/>",
										//data : "",
										success : function(data) {
											var jsdata = JSON.parse(data);

											y = parseFloat(jsdata.humidity);
											series.addPoint([ x, y ], true,
													true);
											activeLastPointToolip(chart)
										}
									});
								}, 4000);
							}
						}
					},
					title : {
						text : '动态模拟实时湿度数据'
					},
					xAxis : {
						//type : 'datetime',
						tickPixelInterval : 150
					},
					yAxis : {
						title : {
							text : '湿度'
						},
						plotLines : [ {
							color : '#808080'
						} ]
					},
					tooltip : {
						formatter : function() {
							return '<b>' + this.series.name + '</b><br/>'
									+ Highcharts.numberFormat(this.y, 2);
						}
					},
					legend : {
						enabled : false
					},
					exporting : {
						enabled : true
					},
					credits : {
						enable : false
					},
					series : [ {
						name : '湿度',
						data : (function() {
							var data = [], i;
							for (i = -19; i <= 0; i += 1) {
								data.push({
									x : i++,
									y : i + 20
								});
							}
							return data;
						}())
					} ]
				}, function(c) {
					activeLastPointToolip(c)
				});
	</script>


	<script type="text/javascript">
		Highcharts.setOptions({
			global : {
				useUTC : false
			}
		});
		function activeLastPointToolip(chart) {
			var points = chart.series[0].points;
			chart.tooltip.refresh(points[points.length - 1]);
		}
		$('#carbon').highcharts(
				{
					chart : {
						type : 'spline',
						animation : Highcharts.svg,
						marginRight : 10,
						events : {
							load : function() {
								var series = this.series[0], chart = this;
								setInterval(function() {
									var x;
									$.ajax({
										type : "GET",
										url : "<c:url value='/GetDataParam'/>",
										success : function(data) {
											var jsdata = JSON.parse(data);
											y = parseFloat(jsdata.carbon);
											series.addPoint([ x, y ], true,
													true);
											activeLastPointToolip(chart)
										}
									});
								}, 4000);
							}
						}
					},
					title : {
						text : '动态模拟实时二氧化碳浓度数据'
					},
					xAxis : {
						//type : 'datetime',
						tickPixelInterval : 150
					},
					yAxis : {
						title : {
							text : 'CO2浓度'
						},
						plotLines : [ {
							color : '#808080'
						} ]
					},
					tooltip : {
						formatter : function() {
							return '<b>' + this.series.name + '</b><br/>'
									+ Highcharts.numberFormat(this.y, 2);
						}
					},
					legend : {
						enabled : false
					},
					exporting : {
						enabled : true
					},
					credits : {
						enable : false
					},
					series : [ {
						name : 'CO2浓度',
						data : (function() {
							var data = [], i;
							for (i = -19; i <= 0; i += 1) {
								data.push({
									x : i++,
									y : i + 20
								});
							}
							return data;
						}())
					} ]
				}, function(c) {
					activeLastPointToolip(c)
				});
	</script>


	<script type="text/javascript">
		Highcharts.setOptions({
			global : {
				useUTC : false
			}
		});
		function activeLastPointToolip(chart) {
			var points = chart.series[0].points;
			chart.tooltip.refresh(points[points.length - 1]);
		}
		$('#temperature').highcharts(
				{
					chart : {
						type : 'spline',
						animation : Highcharts.svg,
						marginRight : 10,
						events : {
							load : function() {
								var series = this.series[0], chart = this;
								setInterval(function() {
									var x;
									$.ajax({
										type : "GET",
										url : "<c:url value='/GetDataParam'/>",
										//data : "",
										success : function(data) {
											var jsdata = JSON.parse(data);

											y = parseFloat(jsdata.temperature);
											series.addPoint([ x, y ], true,
													true);
											activeLastPointToolip(chart)
										}
									});
								}, 4000);
							}
						}
					},
					title : {
						text : '动态模拟实时温度数据'
					},
					xAxis : {
						//type : 'datetime',
						tickPixelInterval : 150
					},
					yAxis : {
						title : {
							text : '温度'
						},
						plotLines : [ {
							color : '#808080'
						} ]
					},
					tooltip : {
						formatter : function() {
							return '<b>' + this.series.name + '</b><br/>'
									+ Highcharts.numberFormat(this.y, 2);
						}
					},
					legend : {
						enabled : false
					},
					exporting : {
						enabled : true
					},
					credits : {
						enable : false
					},
					series : [ {
						name : '温度',
						data : (function() {
							var data = [], i;
							for (i = -19; i <= 0; i += 1) {
								data.push({
									x : i++,
									y : i + 20
								});
							}
							return data;
						}())
					} ]
				}, function(c) {
					activeLastPointToolip(c)
				});
	</script>

	<script type="text/javascript">
		Highcharts.setOptions({
			global : {
				useUTC : false
			}
		});
		function activeLastPointToolip(chart) {
			var points = chart.series[0].points;
			chart.tooltip.refresh(points[points.length - 1]);
		}
		$('#illumination')
				.highcharts(
						{
							chart : {
								type : 'spline',
								animation : Highcharts.svg,
								marginRight : 10,
								events : {
									load : function() {
										var series = this.series[0], chart = this;
										setInterval(
												function() {
													var x;
													$
															.ajax({
																type : "GET",
																url : "<c:url value='/GetDataParam'/>",
																//data : "",
																success : function(
																		data) {
																	var jsdata = JSON
																			.parse(data);

																	y = parseFloat(jsdata.illumination);
																	series
																			.addPoint(
																					[
																							x,
																							y ],
																					true,
																					true);
																	activeLastPointToolip(chart)
																}
															});
												}, 4000);
									}
								}
							},
							title : {
								text : '动态模拟实时关照强度数据'
							},
							xAxis : {
								//type : 'datetime',
								tickPixelInterval : 150
							},
							yAxis : {
								title : {
									text : '关照强度'
								},
								plotLines : [ {
									color : '#808080'
								} ]
							},
							tooltip : {
								formatter : function() {
									return '<b>'
											+ this.series.name
											+ '</b><br/>'
											+ Highcharts
													.numberFormat(this.y, 2);
								}
							},
							legend : {
								enabled : false
							},
							exporting : {
								enabled : true
							},
							credits : {
								enable : false
							},
							series : [ {
								name : '关照强度',
								data : (function() {
									var data = [], i;
									for (i = -19; i <= 0; i += 1) {
										data.push({
											x : i++,
											y : i + 20
										});
									}
									return data;
								}())
							} ]
						}, function(c) {
							activeLastPointToolip(c)
						});
	</script>

</body>
</html>