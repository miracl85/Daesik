	$(document).ready(function() {
		
		var loadDt = new Date(); 
		var maxDate = loadDt;
		var minDate = new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24); //일주일전
		
		$("#min_date").val(dateToYYYYMMDD(minDate));
		$("#max_date").val(dateToYYYYMMDD(maxDate));
		
		$(function(){
			$("#min_date").datepicker({
				inline: true,
			    showOtherMonths: true,
			    showMonthAfterYear: true,
			    dateFormat: "yy-mm-dd",             
			    monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			    maxDate : 0,
			    onClose:function(seletedDate) {
			    	$("#max_date").datepicker("option" ,"minDate" ,seletedDate);
			    }
			});
		});
		
		$(function(){
			$("#max_date").datepicker({
				inline: true,
			    showOtherMonths: true,
			    showMonthAfterYear: true,
			    dateFormat: "yy-mm-dd",             
			    monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],
			    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			    maxDate : 0,
			    onClose:function(seletedDate) {
			    	$("#min_date").datepicker("option" ,"maxDate" ,seletedDate);
			    }
			});
		});
		
	});
	
	function getColors() {
		Highcharts.getOptions().plotOptions.pie.colors = (function () {
		    var colors = [],
		        base = Highcharts.getOptions().colors[0],
		        i;

		    for (i = 0; i < 10; i += 1) {
		        colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		    }
		    return colors;
		}());
	}
	

	function dateToYYYYMMDD(date) {
		function pad(num) {
	        num = num + '';
	        return num.length < 2 ? '0' + num : num;
	    }
	    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	}
	
	function areaChart(data) {
	
		var listSize = data.rows.length;

		var seriesData = [];

		for(var index = 0; index < listSize; index++){
			var tempName = data.rows[index][0];
			var tempY = data.rows[index][1];
			if(data.rows[index][0] == "(not set)") {
			    seriesData.push({ name: "unknown", y: parseInt(tempY) });
			} else {
			    seriesData.push({ name: tempName, y: parseInt(tempY) });		
			}
			
		}

		Highcharts.chart('area_container', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '국가별 접속 통계'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    credits: {
	            enabled: false
	        },
		    series: [{
		        name: 'Area',
		        data: seriesData
		    }]
		});
	}
	
	function browserChart(data) {
		var listSize = data.rows.length;

		var seriesData = [];

		for(var index = 0; index < listSize; index++){
			var tempName = data.rows[index][0];
			var tempY = data.rows[index][1];
		    seriesData.push({ name: tempName, y: parseInt(tempY) });
		}

		Highcharts.chart('browser_container', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '브라우저별 접속통계'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    credits: {
	            enabled: false
	        },
		    series: [{
		        name: 'Browser',
		        data: seriesData
		    }]
		});
	}
	
	function sessionsChart(data) {
		
		var listSize = data.rows.length;
		var cArr = new Array();
		var dArr = new Array();

		for(var index = 0; index < listSize; index++) {
			var tempName = JSON.stringify(data.rows[index][0]);
			var tempY = data.rows[index][1];
			var year = tempName.substring(1,5);
			var month = tempName.substring(5,7);
			var day = tempName.substring(7,9);
		
			cArr.push(year+"-"+month+"-"+day);
			dArr.push(parseInt(tempY));
		}
		
		Highcharts.chart('sessions_container', {
		    chart: {
		        type: 'areaspline'
		    },
		    title: {
		        text: '일별 접속통계'
		    },
		    xAxis: {
		        categories: cArr,
		    },
		    yAxis: {
		    },
		    tooltip: {
		        shared: true,
		        valueSuffix: '명'
		    },
		    credits: {
		        enabled: false
		    },
		    plotOptions: {
		        areaspline: {
		            fillOpacity: 0.5
		        }
		    },
		    credits: {
	            enabled: false
	        },
		    series: [{
		        name: 'Sessions',
		        data: dArr
		    }]
		});
	}