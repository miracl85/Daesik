$(document).ready(function() {
	/*var formType = $("#notice_form_type").val();
	
	if(formType == "M") {
		$("#min_date").val($("#now_min_date").val());
		$("#max_date").val($("#now_max_date").val());	
		$("#search_text").val($("#search_value").val());	
		$("#sel_up_language").val($("#language_value").val()).prop("selected", true);
		$("#form_notice").attr("action","/admin/notice");
		$("#form_notice").submit();
	} else if(formType == "I" || formType == "D"){
		$("#form_notice").attr("action","/admin/notice");
		$("#sel_up_language").val($("#language_value").val()).prop("selected", true);
		
		$("#form_notice").submit();
	} 
	
	if($("#now_min_date").val() != "-") {
		$("#min_date").val($("#now_min_date").val());			
	}
	if($("#now_max_date").val() != "-") {
		$("#max_date").val($("#now_max_date").val());			
	}
	if($("#search_value").val() != "-") {
		$("#search_text").val($("#search_value").val());			
	}
	
	$("#sel_up_language").val($("#language_value").val()).prop("selected", true);
	if($("#language_value").val() == "") {
		$("#sel_up_language").val("K").prop("selected", true);
	}*/
	
	$("#sel_up_language").val($("#language_value").val());
	$("#min_date").val($("#now_min_date").val());
	$("#max_date").val($("#now_max_date").val());	
	
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
		    	$("#min_date").datepicker("option" ,"max_date" ,seletedDate);
		    }
		});
	});
});

function noticeInsert() {
	$("#form_notice").attr("action","/admin/noticeInsertView");
	$("#form_notice").submit();
}

function adminNoticePage(pageNum) {
	$("#cur_page").val(pageNum);
	$("#form_notice").submit();
}

function selectEvent() {
	var langVal = $("#sel_up_language").val();
	location.href="/admin/notice?sel_up_language=" + langVal;
}

function noticeSearch() {
    $("#form_notice").attr("action","/admin/notice");
	$("#form_notice").submit();
}

function noticeModifyAndDeleteView(adSeq) {
	$("#seq").val(adSeq);
	$("#form_notice").attr("action","/admin/noticeDetail");
	$("#form_notice").submit();
}