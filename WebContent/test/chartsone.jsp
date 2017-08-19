<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../static/js/jquery-2.0.3.js"></script>
<script src="../static/js/highcharts.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var chart = null; // 定义全局变量
	$(document).ready(function() {
	  chart = new Highcharts.Chart({
	    chart: {
	      renderTo: 'container',
	      type: 'spline',
	      events: {
	        load: requestData // 图表加载完毕后执行的回调函数
	      }
	    },
	    title: {
	      text: 'Live random data'
	    },
	    xAxis: {
	      type: 'datetime',
	      tickPixelInterval: 150,
	      maxZoom: 20 * 1000
	    },
	    yAxis: {
	      minPadding: 0.2,
	      maxPadding: 0.2,
	      title: {
	        text: 'Value',
	        margin: 80
	      }
	    },
	    series: [{
	      name: '随机数据',
	      data: []
	    }]
	  });
	  
	  function requestData() {
		  $.ajax({
		    url: "http://lhqs1314.cn/test.php",
		    success: function(point) {
		    	
		      var series = chart.series[0],
		        shift = series.data.length > 20; // 当数据点数量超过 20 个，则指定删除第一个点

		      chart.series[0].addPoint(point, true, shift);

		      // 一秒后继续调用本函数
		      setTimeout(requestData, 1000);
		    },
		    cache: false
		  });
		}
	  
	});	
	</script>
</body>
</html>