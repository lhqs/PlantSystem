<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../static/js/jquery-2.0.3.js"></script>
<script src="../static/js/highcharts.js"></script>
<title>temp test</title>
</head>
<body>
	<div>测试使用</div>

	<div id="test1"></div>
	<hr />


	<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>


	<script type="text/javascript">
	$(document).ready(function(){
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/DataParamRequest'/>",
				data : "name=lhqs",
				success : function(data) {
					//$.alert("提示：")
					var arr = [];
					var arr1 = [];
					var jsdata = JSON.parse(data);
					document.getElementById("test1").innerHTML = data;
					var jsdata = JSON.parse(data);
					var len = jsdata.dataInfo.length;

					for (var i = 0; i < len; i++) {
						arr[i] = jsdata.dataInfo[i].carbon;
						arr1[i] = jsdata.dataInfo[i].did;
					}
					alert(arr);
					alert(arr1);
					var title = {
							text : '每月平均carbon'
						};
						var subtitle = {
							text : 'Source: lhqs1314.cn'
						};
						var xAxis = {
							categories : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
									'Aug', 'Sep', 'Oct' ]
						};
						var yAxis = {
							title : {
								text : 'Temperature (\xB0C)'
							}
						};
						var plotOptions = {
							line : {
								dataLabels : {
									enabled : true
								},
								enableMouseTracking : false
							}
						};
						var credits = {
						     enabled:false // 禁用版权信息
						}
						var series = [ {
							name : 'carbon',
							data : arr
						}, {
							name : 'temperature',
							data : arr1
						} ];

						var json = {};

						json.title = title;
						json.subtitle = subtitle;
						json.xAxis = xAxis;
						json.yAxis = yAxis;
						json.series = series;
						json.plotOptions = plotOptions;
						json.credits = credits;
						$('#container').highcharts(json);		
				},
				error : function(msg) {
					alert("request-data-->" + msg);
				}
			
			});
		});
	</script>
</body>
</html>