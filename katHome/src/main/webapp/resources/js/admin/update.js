$(document).ready(function() {
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
	
	$("#sel_up_language").val($("#language_value").val());
});

function changeSel() {
	$("#min_date").val("");
	$("#max_date").val("");
	$("#search_text").val("");
	$("#form_update").submit();
}

function updateSearch() {
	$("#form_update").submit();
}

function adminUpdatePage(nPage) {
	$("#cur_page").val(nPage);
	
	$("#form_update").submit();
}

function downloadChk(upSeq, chk) {
	location.href="/admin/updateDownChk?up_seq=" + upSeq + "&sel_up_language=" + $("#sel_up_language").val() + "&download_chk=" + chk;
}

function updateFileChk() {
	var filePath = $("#pup_file").val();
	filePath = filePath.replace(/C:\\fakepath\\/g,'');
	$("#file_name").text(filePath);
	$("#file_name").append('<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>');
	$("#file_update_chk").val("Y");
}

function fileDelete() {
	$("#file_name").hide();
	$("#file_name").text("");
	$("#pup_file").val("");
	$("#file_update_chk").val("Y");
}

function updatePup(stat) {
	var display = $("#pup_update_add").css("display");
	if(display == "block") {
		$("#pup_update_add").hide();
		$(".pup_text").val("");
		$("#file_name").text("");
		$("#pup_file").val("");
		$("#file_update_chk").val("N");
		$(".pup_bg").hide();
	} else {
		$(".btn_save").hide();
		if(stat == "update") {
			$("#up_update_btn").show();
			$("#up_del_btn").show();
			$("#type").val("update");
		} else {
			$("#up_save_btn").show();
			$("#type").val("insert");
		}
		$("#pup_update_add").show();
		$(".pup_bg").show();
	}
}

function updateAdd(stat) {
	$("#pup_lang").val($("#language_value").val());
	
	if(stat == "update") {
		$("#type").val("update");
		
	} else if(stat == "delete") {
		$("#type").val("delete");
		$("#update_form").submit();
		
		return;
	}
	
	if($("#pup_update_title").val() == "") {
		alert("제목을 입력해주세요.");
		$("#pup_update_title").focus();
		return;
	}
	
	if($("#pup_update_intro").val() == "") {
		alert("내용을 입력해주세요.");
		$("#pup_update_intro").focus();
		return;
	}
	
	if($("#pup_file").val() == "" && stat != "update") {
		alert("파일을 등록해주세요.");
		$("#pup_file").focus();
		return;
	}
	
	if($("#pup_update_title").val().length > 50) {
		alert("제목 글자수는  50자로 제한합니다.");  
		$("#pup_update_title").va($("#pup_update_title").val().substring(0,50));  
		$("#pup_update_title").focus();  
		return
	}
	
	if($("#pup_update_intro").val().length > 100) {
		alert("설명 글자수는  100자로 제한합니다.");  
		$("#pup_update_intro").va($("#pup_update_intro").val().substring(0,100));  
		$("#pup_update_intro").focus();  
		return
	}
	$("#update_form").submit();
}

function updateModifyView(seq) {
	
	$.ajax({
		type : "POST",
		url : "/admin/updataDetail",
		data : {"up_seq" : seq},
		dataType : "json",
		success : function(data) {
			if(data != null) {
				
				$("#pup_update_seq").val(data.dto.upSeq);
				$("#pup_update_title").val(data.dto.upTitle);
				$("#pup_update_intro").val(data.dto.upContents);
				if(data.dto.upOrgFileName != null && data.dto.upOrgFileName != "") {
					$("#file_name").text(data.dto.upOrgFileName);
					$("#file_name").append('<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>');
					$("#file_name").show();
				}
			}
			
			
		},
		error : function(data) {
			alert("updateModifyView error");
		},
		complete : function() {
			updatePup('update');
		}
	});
}
