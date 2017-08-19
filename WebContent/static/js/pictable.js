/**
 * 
 */

$(document).ready(function() {  
	drawTemp();
    setInterval("drawTemp();", 10000);  
}); 

function drawTemp() {
	$.ajax({
		type:"get",
		//url :"<c:url value='/DataInfoListServlet'/>",
		url:"/plant/DataInfoListServlet",
		success: function(msg) {
			var v = eval(msg);
			var myarr =[];
			var humid = [],temper=[],illu=[];
			for(var i = 0; i < v.length; i++){
				myarr[i]= v[i].carbon;
				humid[i]= v[i].humidity;
				temper[i] = v[i].temperature;
				illu[i]= v[i].illumination;
			}
			var cararr = eval("["+myarr+"]");
			var humid = eval("["+humid+"]");
			var temper = eval("["+temper+"]");
			var illu = eval("["+illu+"]");
			
		    var chart = Highcharts.chart('container1', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '二氧化碳浓度图表'
		        },
		        subtitle: {
		            text: '图表展示的为最近数据，请点击按钮查看坐标轴变化(注：十秒钟刷新一次)'
		        },
		        xAxis: {
		            categories: ['一', '二', '三', '四', '五', '六',
                        '七', '八', '九', '十','十一','十二','十三','十四']
		        },
		        yAxis: {
		            labels: {
		                x: -15
		            },
		            title: {
		                text: '浓度值'
		            }
		        },
		        series: [{
		            name: 'co2',
		            data: cararr
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
		                                return this.value.replace(' ', '')
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
		   
		    var chart = Highcharts.chart('container2', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '空气湿度图表'
		        },
		        subtitle: {
		            text: '图表展示的为最近数据，请点击按钮查看坐标轴变化(注：十秒钟刷新一次)'
		        },
		        xAxis: {
		            categories: ['一', '二', '三', '四', '五', '六',
                        '七', '八', '九', '十','十一','十二','十三','十四']
		        },
		        yAxis: {
		            labels: {
		                x: -15
		            },
		            title: {
		                text: '湿度值'
		            }
		        },
		        series: [{
		            name: '湿度',
		            data: humid
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
		    
		    
		    
		    
		    
		    var chart = Highcharts.chart('container3', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '温度图表'
		        },
		        subtitle: {
		            text: '图表展示的为最近数据，请点击按钮查看坐标轴变化(注：十秒钟刷新一次)'
		        },
		        xAxis: {
		            categories: ['一', '二', '三', '四', '五', '六',
                        '七', '八', '九', '十','十一','十二','十三','十四']
		        },
		        yAxis: {
		            labels: {
		                x: -15
		            },
		            title: {
		                text: '温度值'
		            }
		        },
		        series: [{
		            name: '温度',
		            data: temper
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
		                                return this.value.replace(' ', '')
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
		    
		    
		    
		    
		    var chart = Highcharts.chart('container4', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '光照强度图表'
		        },
		        subtitle: {
		            text: '图表展示的为最近数据，请点击按钮查看坐标轴变化(注：十秒钟刷新一次)'
		        },
		        xAxis: {
		            categories: ['一', '二', '三', '四', '五', '六',
                        '七', '八', '九', '十','十一','十二','十三','十四']
		        },
		        yAxis: {
		            labels: {
		                x: -15
		            },
		            title: {
		                text: '光照强度值'
		            }
		        },
		        series: [{
		            name: '光照强度',
		            data: illu
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
		                                return this.value.replace('', '')
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

}
