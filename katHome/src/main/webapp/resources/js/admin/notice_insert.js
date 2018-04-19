$(document).ready(function() {
	var obj = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: obj,
		elPlaceHolder: "editor",
		sSkinURI: "/resources/js/editor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger : true,
			fOnBeforeUnload : function(){
			
			}
		},fOnAppLoad : function(){
			var contents = $("#notice_contents").html();
			obj.getById["editor"].exec("PASTE_HTML", [contents]);
		}	 
	});	
			
	$("#save_btn").click(function() {
		$("#save_btn").prop("disabled", true);
		obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		var title = $("#notice_title").val();
		var editor = $("#editor").val();
		$("#editor").val(editor.replace(/<p>&nbsp;<\/p>/gi, ""));
		$("#editor").val(editor.replace(/<p>/gi, '<p style="line-height: 1.5;">'));
		$("#editor").val(editor.replace(/<div>/gi, "<div style='line-height: 1.5;'>"));
		
		title = $.trim(title);
		editor = editor.replace(/[<][^>]*[>]/gi, "");
		editor = editor.replace(/&nbsp;/gi, "");
		editor = $.trim(editor);
		
		if(title == "") {
			$("#contents_val").hide();
			$("#title_text").text("제목을 입력해주세요.");
			$("#title_val").show();
			$("#notice_title").focus();
			$("#save_btn").prop("disabled", false);
			return;
		}
		if(title.search("javascript") != -1) {	
			$("#contents_val").hide();
			$("#title_text").text("제목에 스크립트를 입력할 수 없습니다.");
			$("#title_val").show();				
			$("#notice_title").focus();
			$("#save_btn").prop("disabled", false);
			return;
		}
		if(title.search(/[<][^>]*[>]/gi) != -1) {		
			$("#contents_val").hide();
			$("#title_text").text("제목에 HTML 태그를 입력할 수 없습니다.");
			$("#title_val").show();	
			$("#notice_title").focus();
			$("#save_btn").prop("disabled", false);
			return;
		}
		if($("#editor").val().search(/<img/gi) == -1) {
			if(editor == "<p>&nbsp;</p>" || editor == "" || editor == null || editor == "&nbsp;") {
				obj.getById["editor"].exec("FOCUS");
				$("#save_btn").prop("disabled", false);
				$("#title_val").hide();
				$("#contents_text").text("내용을 입력해주세요.");
				$("#contents_val").show();
				alert();
				return;
			}
		}			
		if(editor.length > 40000) {
			$("#title_val").hide();
			$("#contents_text").text("내용을 40000자 이하로 작성해주세요. (현재 " + editor.length + "자)");
			$("#contents_val").show();
			obj.getById["editor"].exec("FOCUS");
			$("#save_btn").prop("disabled", false);
			return;	
		}
		
		$("#notice_frm").submit();
	});
	
	$("#notice_title").keypress(function(e) {
		$("#title_val").hide();
	});
	
	var type = $("#type").val();
	
	if(type == "M") {
		$("#save_btn").text("수정");
		$("#save_btn").attr("title", "수정");
		$("#delete_btn").show();
	}
	
	$("#notice_title").focus();
	
});

function noticeDelete(url ,seq ,language) {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		window.location = url+"?seq="+seq+"&language="+language;
	}	
}

function titleKeyup() {		
	if(event.keyCode==8) {
		$("#title_val").hide();
	}
}

function fileSelect() {
	var filePath = $("#file").val();
	filePath = filePath.replace(/C:\\fakepath\\/g,'');
	$("#notice_file").text(filePath);
	$("#notice_file").append('<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>');
}

function fileAlertOff() {
	$("#contents_val").hide();
}

function checkUploadFileExt(objFile) {
	if($("#file").val() != "") {
		var ext = $("#file").val().split('.').pop().toLowerCase();
		if($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg', 'pdf','zip' ]) == -1) {
			$("#title_val").hide();
			$("#contents_text").text("첨부파일은 gif, jpg, jpeg, png, pdf, zip 파일만 가능합니다.");
			$("#contents_val").show();
			fileDelete();
			return;
		} else {
			$("#file_update_chk").val("Y");
		}
	}		
}

function fileDelete() {
	$("#notice_file").hide();
	$("#notice_file").text("");
	$("#file").val("");
	$("#file_check").val("");
	$("#file_update_chk").val("Y");
}

function noticeCancel(url) {
	var nowPage = $("#cur_page").val();
	var searchValue = $("#search_value").val();
	
	if(searchValue == "" || searchValue =="undefined" || searchValue == null) {
		searchValue = "-";
	}
	window.location = url+"/"+nowPage+"/"+searchValue;
}
