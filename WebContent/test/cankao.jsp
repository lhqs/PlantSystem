<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

$(function () {
        $.ajax({
            type: 'post',
            url: 'storeData',
            async: true,
            cache: false,
            dataType: 'json',
            success: function (data) {
                /*这种方式可以，但是感觉多次一举了*/
                /* var abc = [];
                 for(var i=0;i<data.length;i++){
                 var bcd={};
                 bcd.name=data[i].name;
                 bcd.data=data[i].data;
                 abc.push(bcd);
                 }*/
                /*这种方式尽管可以做到，但是毫无疑问太麻烦了！*/
                /*取店名(如果col里已经有店名了，就不在放进去，实现去重)*/
                var col = [];
                for (var i = 0; i < data.length; i++) {
                    if (col.indexOf(data[i].storeName) > -1) {
                        continue;
                    }
                    col.push(data[i].storeName);
                }
                /*取时间段，同理*/
                var xcate=[];
                for (var i = 0; i < data.length; i++) {
                    if (xcate.indexOf(data[i].statisTime) > -1) {
                        continue;
                    }
                    xcate.push(data[i].statisTime);
                }
                /*循环取出每个店的所有数据，分店存储为对象，再添加到一个array中，充当series的内容*/
                var alldat=[];
                for (var j = 0; j < col.length; j++) {
                    var each={};
                    var singledat = [];
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].storeName == col[j]) {
                            singledat.push(data[i].durFlow);
                        }
                    }
                    each.name=col[j];
                    each.data=singledat;
                    alldat.push(each);
                }
                console.log(alldat);
                $('#container').highcharts({
                    chart: {
                        //type=bar为柱图,type=line为线图
                        type: 'bar',
                        borderRadius: 6,
                        borderColor: '#4572A7',
                        backgroundColor: '#EEEEEE    '
                    },
                    title: {
                        text: 'Historic World Population by Region'
                    },
                    subtitle: {
                        text: 'Source: Wikipedia.org'
                    },
                    xAxis: {
                        categories: xcate,
                        title: {
                            text: null
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Population (millions)',
                            align: 'high'
                        },
                        labels: {
                            overflow: 'justify'
                        }
                    },
                    tooltip: {
                        valueSuffix: ' millions'
                    },
                    plotOptions: {
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'top',
                        x: -40,
                        y: 100,
                        floating: true,
                        borderWidth: 1,
                        backgroundColor: '#FFFFFF',
                        shadow: true
                    },
                    credits: {
                        enabled: false
                    },
                    series: alldat
                });
            }
        });
    });
    </script>
</body>
</html>