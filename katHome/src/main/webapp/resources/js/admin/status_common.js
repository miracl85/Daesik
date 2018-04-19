	$(document).ready(function() {
		var loadDt = new Date(); 
		var maxDate = loadDt;
		var minDate = new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24); //일주일전

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
		$("#max_date").val(dateToYYYYMMDD(maxDate));
		$("#min_date").val(dateToYYYYMMDD(minDate));
	});
	
	function dateToYYYYMMDD(date) {
		function pad(num) {
	        num = num + '';
	        return num.length < 2 ? '0' + num : num;
	    }
	    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
	}
	