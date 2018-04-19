var rowNum = 1;
$(document).ready(function(){
		var type = $("#tab_type").val();
		tabEvent(type);
});

function tabEvent(tab) {
	$(".history_tab").removeClass("selected");
	$("#history_" + tab).addClass("selected");
	
	if(tab == "add") {
		$("#historyView2").hide();
		$("#historyView1").show();
	} else {
		$("#historyView1").hide();
		$("#historyView2").show();
	}
}

function addHistoryRow() {
	rowNum++;
	var tr = "<tr id='history_tr" + rowNum + "'>";
		tr += "	 <td>";
		tr += "    <select name='add_month" + rowNum + "' id='add_month" + rowNum + "'>";
		
		for(var month=1; month<13; month++) {
		tr += "        <option value='" + month + "'>" + month + "</option>";
		}
		
		tr += "    </select>";
		tr += "	 </td>";
		tr += "	 <td>";
		tr += "    <input type='text' name='add_ko" + rowNum + "' id='add_ko" + rowNum + "' maxlength='50' />";
		tr += "	 </td>";
		tr += "	 <td>";
		tr += "    <input type='text' name='add_en" + rowNum + "' id='add_en" + rowNum + "' maxlength='50' />";
		tr += "	 </td>";
		tr += "	 <td>";
		tr += "    <a href='javascript:;' class='btn_list_delete' onclick='deleteHistoryRow(" + rowNum + ");'>삭제</a>";
		tr += "	 </td>";
		tr += "</tr>";
		
	$("#history_tbody").append(tr);
}

function deleteHistoryRow(rowNum) {
	$("#history_tr" + rowNum).remove();
}

function historyDelete(hsDtSeq) {
	if(confirm("해당 연혁을 삭제하시겠습니까?") == true) {
		$("#hs_dt_seq_val").val(hsDtSeq);
		$("#form_add_history").attr("action","/admin/historyDelete");
		$("#form_add_history").submit();
	} else {
		return false;
	}
}

function historyYearDelete(hsYear) {
	if(confirm(hsYear + "년 연혁을 모두 삭제하시겠습니까?") == true) {
		$("#hs_year_val").val(hsYear);
		$("#form_add_history").attr("action","/admin/historyYearDelete");
		$("#form_add_history").submit();
	} else {
		return false;
	}
}

function addHistory() {
	for(var idx=1; idx<=rowNum; idx++) {
		var addKo = $("#add_ko"+idx).val();
		var addEn = $("#add_en"+idx).val();
		
		addKo = $.trim(addKo);
		addEn = $.trim(addEn);
		
		if(addKo == "") {
			$("#title_text").text("연혁(한글)을 입력하세요.");
			$("#title_val").show();
			$("#add_ko"+idx).val("");
			$("#add_ko"+idx).focus();
			return false;
		}
		if(addEn == "") {
			$("#title_text").text("연혁(영문)을 입력하세요.");
			$("#title_val").show();
			$("#add_en"+idx).val("");
			$("#add_en"+idx).focus();
			return false;
		}
		if(addKo.search("javascript") != -1) {
			$("#title_text").text("연혁에 스크립트를 입력할 수 없습니다.");
			$("#title_val").show();
			$("#add_ko"+idx).focus();
			return false;
		}
		if(addKo.search(/[<][^>]*[>]/gi) != -1) {
			$("#title_text").text("연혁에 HTML 태그를 입력할 수 없습니다.");
			$("#title_val").show();				
			$("#add_ko"+idx).focus();
			return false;
		}
		if(addEn.search("javascript") != -1) {		
			$("#title_text").text("연혁에 스크립트를 입력할 수 없습니다.");
			$("#title_val").show();
			$("#add_en"+idx).focus();
			return false;
		}
		if(addEn.search(/[<][^>]*[>]/gi) != -1) {	
			$("#title_text").text("연혁에 HTML 태그를 입력할 수 없습니다.");
			$("#title_val").show();		
			$("#add_en"+idx).focus();
			return false;
		}				
	}
	
	$("#add_rowNum").val(rowNum);
				
	if(confirm("연혁을 추가하시겠습니까?") == true) {
		$("#form_add_history").submit();
	} else {
		return false;
	}
}