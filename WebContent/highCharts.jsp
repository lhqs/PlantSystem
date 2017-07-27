<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./static/js/highcharts.js"></script>
<script src="./static/js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="./static/js/ajaxutils.js"></script>
<title>highCharts demostration</title>
</head>
<body>
<div>this is ajax request </div>
<script type="text/javascript">
window.onload = function() {
	var btn = document.getElementById("btn");
	btn.onclick = function() {
		/*
		1. ajax
		*/
		ajax(
			{
				url:"<c:url value='/GetDataServlet'/>",
				type:"json",
				callback:function(data) {
					document.getElementById("h3").innerHTML = data;
					alert(data[0].h2);
					alert(data[1].h2);
				}
			}
		);
	};
};
</script>
<button id="btn">点击这里</button>
<h3 id="h3"></h3>
</body>
</html>