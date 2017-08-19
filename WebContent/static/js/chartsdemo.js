/**
 * 
 */






/**
 * 
 */

/*$(function () {

});
*/
$(function () {
$.ajax({
	type:"get",
	//url :"<c:url value='/GetDataServlet'/>",
	url:"/plant/GetDataServlet",
	//data : username,
	success: function(msg) {
		alert(msg);
		var v = eval(msg);
		var jsonobj=eval('('+msg+')');
	    var chart = Highcharts.chart('container', {
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '二氧化碳浓度图表'
	        },
	        subtitle: {
	            text: '请点击按钮查看坐标轴变化'
	        },
	        xAxis: {
	            categories: ['一月', '二月', '三月', '四月', '五月', '六月',
	                         '七月', '八月', '九月', '十月']
	        },
	        yAxis: {
	            labels: {
	                x: -15
	            },
	            title: {
	                text: '项目'
	            }
	        },
	        series: [{
	            name: 'co2',
	            data: jsonobj
	        }],
	        responsive: {
	            rules: [{
	                condition: {
	                    maxWidth: 500
	                },
	                // Make the labels less space demanding on mobile
	                chartOptions: {
	                    xAxis: {
	                        labels: {
	                            formatter: function () {
	                                return this.value.replace('月', '')
	                            }
	                        }
	                    },
	                    yAxis: {
	                        labels: {
	                            align: 'left',
	                            x: 0,
	                            y: -2
	                        },
	                        title: {
	                            text: ''
	                        }
	                    }
	                }
	            }]
	        }
	    });
	    $('#small').click(function () {
	        chart.setSize(400, 300);
	    });
	    $('#large').click(function () {
	        chart.setSize(800, 300);
	    });
	    
	    
	    var chart = Highcharts.chart('container1', {
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '高级响应式图表'
	        },
	        subtitle: {
	            text: '请点击按钮查看坐标轴变化'
	        },
	        xAxis: {
	            categories: ['一月', '二月', '三月', '四月', '五月', '六月',
	                         '七月', '八月', '九月', '十月']
	        },
	        yAxis: {
	            labels: {
	                x: -15
	            },
	            title: {
	                text: '项目'
	            }
	        },
	        series: [{
	            name: '销售',
	            data: v
	        }],
	        responsive: {
	            rules: [{
	                condition: {
	                    maxWidth: 500
	                },
	                // Make the labels less space demanding on mobile
	                chartOptions: {
	                    xAxis: {
	                        labels: {
	                            formatter: function () {
	                                return this.value.replace('月', '')
	                            }
	                        }
	                    },
	                    yAxis: {
	                        labels: {
	                            align: 'left',
	                            x: 0,
	                            y: -2
	                        },
	                        title: {
	                            text: ''
	                        }
	                    }
	                }
	            }]
	        }
	    });

	},
	error : function(msg) {
		alert(msg);
	}
}); 

});