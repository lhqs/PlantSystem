<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>动态数据展示区</title>
<%@include file="/demo/header.jsp" %>
</head>
<body>

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