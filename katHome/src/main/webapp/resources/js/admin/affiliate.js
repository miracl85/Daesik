$(document).ready(function(){

});

function adminAffPage(pNum) {
	location.href="/admin/affiliate?curPage=" + pNum;
}

function affAdd(stat) {
	var urlVal = $("#pup_aff_url").val();
	var siteVal = $("#pup_aff_title").val();
	var introVal = $("#pup_aff_intro").val();
	
	if(!valChk(urlVal)) {
		alert("url을 입력해 주세요.");
		$("#pup_aff_url").focus();
		return;
	} else if(!valChk(siteVal)) {
		alert("사이트명을 입력해 주세요.");
		$("#pup_aff_title").focus();
		return;
	} else if(!valChk(introVal)) {
		alert("설명을 입력해 주세요.");
		$("#pup_aff_intro").focus();
		return;
	}
	
	if($("#pup_aff_url").val().length > 50) {
		alert("URL 글자수는  50자로 제한합니다.");  
		$("#pup_aff_url").va($("#pup_aff_url").val().substring(0,50));  
		$("#pup_aff_url").focus();  
		return
	}
	
	if($("#pup_aff_title").val().length  > 50) {
		alert("사이트명 글자수는  50자로 제한합니다.");  
		$("#pup_aff_title").va($("#pup_aff_url").val().substring(0,50));  
		$("#pup_aff_title").focus();  
		return
	}
	
	if($("#pup_aff_intro").val().length > 200) {
		alert("사이트명 글자수는  200자로 제한합니다.");  
		$("#pup_aff_intro").va($("#pup_aff_url").val().substring(0,200));  
		$("#pup_aff_intro").focus();  
		return
	}
	
	if(stat == "update") {
		$("#pup_aff_type").val("update");
	} else {
		$("#pup_aff_type").val("insert");
	}
	
	
	
	$("#aff_form").submit();
}

function affDetail(affSeq) {
	$.ajax({
		type : "POST",
		url : "/admin/affDetail",
		dataType : "json",
		data : {"affSeq" : affSeq},
		success : function(data) {
			var uploadUrl = "";
			$(".pup_text").val("");
			$("#pup_file").prop("type","radio");
			$("#pup_file").prop("type","file");
			
			$("#pup_aff_seq").val(data.result.affSeq);
			$("#pup_file_seq").val(data.result.fileSeq);
			$("#pup_aff_url").val(data.result.affUrl);
			$("#pup_aff_title").val(data.result.affTitle);
			$("#pup_aff_intro").val(data.result.affIntro);
			
			if(data.result.fileOrgnm != null && data.result.fileOrgnm != "") {
				uploadUrl = $("#upload_url").val();
				var imgUrl = uploadUrl + "affiliate/" + data.result.fileStrnm; 
				$("#pup_file_img").attr("src", imgUrl);
				$("#pup_file_img").attr("title", data.result.fileOrgnm);
				$("#file_name").text(data.result.fileOrgnm);
				$("#file_name").append('<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>');
				$("#file_name").show();
			} else {
				uploadUrl = $("#img_url").val();
				$("#pup_file_img").attr("src", uploadUrl + "admin/comm/noImg.gif");
				$("#pup_file_img").attr("title", "noImg");
			}
			$(".file_no_img").show();
			
			
			affPup('update');
			
		},
		error : function(data) {
			
		},
		complete : function(data) {
			
		}
			
	});
}

function updateFileChk() {
	var filePath = $("#pup_file").val();
	filePath = filePath.replace(/C:\\fakepath\\/g,'');
	$("#file_name").text(filePath);
	$("#file_name").append('<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>');
	
}

function affFileChk() {
	if($("#pup_file").val() != "" ) {
		var ext = $('#pup_file').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			$("#pup_file").replaceWith( $("#pup_file").clone(true) );
			return;

		} else {
			$("#file_update_chk").val("Y");
		}
	}
}

function fileDelete() {
	$("#file_name").text("");
	$("#pup_file").val("");
	$("#file_update_chk").val("Y");
}

function affPup(stat) {
	var pupDisplay = $("#pup_aff_add").css("display");
	$(".btn_save").hide();
	
	if(pupDisplay == "block") {
		$("#pup_aff_add").hide();
		$(".pup_text").val("");
		$("#aff_save_btn").show();
		$("#file_name").text("");
		$("#pup_file").val("");
		$(".pup_bg").hide();
		$(".file_no_img").hide();
		$(".file_insert").addClass("file_insert_padd");
	} else {
		if(stat == "update") {
			$(".file_insert").removeClass("file_insert_padd");
			$("#aff_update_btn").show();
		} else {
			$("#pup_aff_url").val("http://");
			$(".file_insert").addClass("file_insert_padd");
			$("#aff_save_btn").show();
		}
		$("#pup_aff_add").show();
		$("#pup_aff_url").focus();
		$(".pup_bg").show();
	}
}

function affDel(seq, fileSeq) {
	if(confirm("삭제하시겠습니까?")) {
		$("#pup_aff_type").val("delete");
		$("#pup_aff_seq").val(seq);
		$("#pup_file_seq").val(fileSeq);
		$("#aff_form").submit();
	}
	
}
