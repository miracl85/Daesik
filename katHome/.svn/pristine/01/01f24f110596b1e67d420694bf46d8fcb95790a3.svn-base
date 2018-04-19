$(document).ready(function() {
	$(function(){
		$("#min_date").datepicker({
			inline: true,
			prevText: '이전달',
			nextText: '다음달',
		    dateFormat: "yy-mm-dd",             
		    monthNames: [ '01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    maxDate : 0,
		    closeText: '닫기',
	        currentText: '오늘',
		    onClose:function(seletedDate) {
			    	$("#max_date").datepicker("option" ,"minDate" ,seletedDate);
		    }
		});
		
		$("#max_date").datepicker({
			inline: true,
			prevText: '이전달',
			nextText: '다음달',
		    dateFormat: "yy-mm-dd",             
		    monthNames: [ '01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    closeText: '닫기',
	        currentText: '오늘',
		    onClose:function(seletedDate) {
			    	$("#min_date").datepicker("option" ,"maxDate" ,seletedDate);
		    }
		});
		
		$("#m_min_date").datepicker({
			inline: true,
			prevText: '이전달',
			nextText: '다음달',
		    dateFormat: "yy-mm-dd",             
		    monthNames: [ '01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    maxDate : 0,
		    closeText: '닫기',
	        currentText: '오늘',
		    onClose:function(seletedDate) {
			    	$("#m_max_date").datepicker("option" ,"m_min_date" ,seletedDate);
		    }
		});
		
		$("#m_max_date").datepicker({
			inline: true,
			prevText: '이전달',
			nextText: '다음달',
		    dateFormat: "yy-mm-dd",             
		    monthNames: [ '01월', '02월', '03월', '04월', '05월', '06월', '07월', '08월', '09월', '10월', '11월', '12월' ],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    closeText: '닫기',
	        currentText: '오늘',
		    onClose:function(seletedDate) {
			    	$("#m_min_date").datepicker("option" ,"m_max_date" ,seletedDate);
		    }
		});
	});
	
	openNotice();
	
});

function dateCheck() {
	var minDate = $("#min_date").val();
	var maxDate = $("#max_date").val();
	
	if(maxDate != "") {	//maxDate != null 을 넣으면 true로 들어감... why?
		if(minDate == null || minDate == "") {
			alert("시작일을 지정해 주세요.");
			return;
		}
	}
	if(minDate != "") {
		if(maxDate == null || maxDate == "") {
			alert("종료일을 지정해 주세요.");
			return;
		}
	}

	openNotice();
}

function mobileDateCheck() {
	var minDate = $("#m_min_date").val();
	var maxDate = $("#m_max_date").val();
	
	if(maxDate != "") {
		if(minDate == null || minDate == "") {
			alert("시작일을 지정해 주세요.");
			return;
		}
	}
	if(minDate != "") {
		if(maxDate == null || maxDate == "") {
			alert("종료일을 지정해 주세요.");
			return;
		}
	}

	openNotice();
}


function openNotice(nowPage) {

	var minDate = $("#min_date").val();
	var maxDate = $("#max_date").val();
	var searchValue = $("#search_value").val();
	
	var noticeWidth = window.matchMedia("screen and (max-width: 767px)");
	if(noticeWidth.matches) {
		searchValue = $("#m_search_value").val();
	}
	
	$.ajax({
		type: "GET",
		url: "/katCmnt/noticeView",
		data: {
					nowPage : nowPage,
					searchValue : searchValue,
					startDate : minDate,
					endDate : maxDate
				},
		success:function(msg) {
			$("#notice_wrap").text("");
			noticeText(msg);
		}
	});
}

function noticeText(msg) {
	var result = msg.resultList;
	var resultSize = result.length;
	var contents = "";
	var type = "";
	var classType = "";

	if(msg.mobileCk == "Y") {
		$(".notice_print").css("display","none");
	}
	$("#nodata_notice_box").hide();
		
	if(resultSize == 0) {
		$("#nodata_notice_box").show();
	} else {
		for(var index = 0; index < resultSize; index++) {
			if(result[index].adType == "N") {
				type = "공지사항";
				classType = "bullet_notice";
			} else {
				type = "보도자료";
				classType = "bullet_notice news";
			}
			var text = result[index].adContents.replace(/[<][^>]*[>]/gi, "");
			
			if(index == 0 && result[index].adTop == "on") {
				contents += "<div class='notice_box top_notice' onclick='noticePup("+result[index].adSeq+");' title='"+result[index].adTitle+"'>";
				contents +=	"<span class='"+classType+"'>" + type + "</span>";
				contents += 	"<strong>"+result[index].adTitle+"</strong>";
				contents += 	"<a href='javascript:;' class='txt_box'>";
				contents += 		"<p class='dot1' style='height:86px;'>"+text+"</p>";
				contents += 	"</a>";
				contents += 	"<a class='btn_view_more'>더보기</a>";
				contents += "</div>";
			} else {
				contents += "<div class='notice_box' onclick='noticePup("+result[index].adSeq+");' title='"+result[index].adTitle+"'>";
				contents += 	"<span class='"+classType+"'>" + type + "</span>";
				contents += 	"<strong>"+result[index].adTitle+"</strong>";
				contents += 	"<a href='javascript:;' class='txt_box'>";
				contents += 		"<p class='dot1' style='height:86px;'>"+text+"</p>";
				contents += 	"</a>";
				contents += 	"<a class='btn_view_more'>더보기</a>";
				contents += "</div>";
			}
		}
	}
	
	$("#notice_wrap").html(contents);
	$(".paging").html(msg.paging);
	$("#top_logo").focus();
		
}

function noticePup(seq) {

	$.ajax({
		type: "GET",
		url: "/katCmnt/noticePup?adSeq=" + seq,
		success:function(msg) {
			var result = msg.result;

			if(result.adType == "N") {
				$("#pup_tit").text("공지사항");
			} else {
				$("#pup_tit").text("보도자료");
			}
			
			$("#popup_title").text(result.adTitle);
			$("#popup_title").attr("title", result.adTitle);
			$("#popup_date").text(result.createDate);
			$("#popup_contents").html(result.adContents);
			
			if(result.adOrgFileName != null) {
				$("#add_file_box").show();
				$("#download_file").text(result.adOrgFileName);
				$("#download_file").prop("title", result.adOrgFileName);
				$("#file_name").val(result.adFileName);
			} else {
				$("#add_file_box").hide();
			}
		},
		error : function() {
			
		},
		complete : function() {
			$("#pup_wrap").show();
			$("#pup_bg").show();
			$("body").css('position','fixed').css('width','100%').css('overflow-y','scroll');
		}
	});
	
	
}

function addFile() {
	if($('#file_open_check').val() == "Y"){
		$("#btn_add_open").text('접기');
		$("#add_file_list").show();
		$("#file_open_check").val("N");
	} else {
		$("#add_file_list").hide();
		$("#btn_add_open").text('열기');
		$("#file_open_check").val("Y");
	}
}

function pupClose() {
	$("#pup_wrap").hide();
	$(".popup_onOff").text("");
	$("#pup_wrap").hide();
	$("#pup_bg").hide();
	$("#add_file_list").hide();
	$("#btn_add_open").text('열기');
	$("#file_open_check").val("Y");
	$("body").css('position','static').css('width','100%').css('overflow-y','auto');
}

function dateSelete(type) {

	var url = "";
	var startDate = "";
	var endDate = "";
	var sDate = new Date();
	var eDate = new Date();
	var searchValue = $("#search_value").val();
	
	if(searchValue == "undefined" || searchValue == null) {
		searchValue = "";
	}
	
	if(type == "0") {
		$("#all").addClass("selected");
		$("#one_month").removeClass("selected");
		$("#three_month").removeClass("selected");
		
		$("#min_date").val("");
		$("#max_date").val("");
		
	} else {
		if(type == "1") {
			$("#all").removeClass("selected");
			$("#one_month").addClass("selected");
			$("#three_month").removeClass("selected");
			
			sDate.setMonth(sDate.getMonth()-1);
			
		} else if(type == "3") {
			$("#all").removeClass("selected");
			$("#one_month").removeClass("selected");
			$("#three_month").addClass("selected");
			
			sDate.setMonth(sDate.getMonth()-3);
		}
		
		startDate = $("#min_date").val($.datepicker.formatDate('yy-mm-dd',sDate)); 
		endDate = $("#max_date").val($.datepicker.formatDate('yy-mm-dd',eDate));
	}
	
	$.ajax({
		type: "GET",
		url: "/katCmnt/noticeView",
		data: {
			searchValue : searchValue,
			startDate : startDate,
			endDate : endDate
		},
		success:function(msg) {
			$("#notice_wrap").text("");
			noticeText(msg);
		}
	});
	
}

function mobileDateSelete(type) {

	var url = "";
	var startDate = "";
	var endDate = "";
	var sDate = new Date();
	var eDate = new Date();
	var searchValue = $("#m_search_value").val();
	
	if(searchValue == "undefined" || searchValue == null) {
		searchValue = "";
	}
	
	if(type == "0") {
		$("#m_all").addClass("selected");
		$("#m_one_month").removeClass("selected");
		$("#m_three_month").removeClass("selected");
		
		$("#m_min_date").val("");
		$("#m_max_date").val("");
		
	} else {
		if(type == "1") {
			$("#m_all").removeClass("selected");
			$("#m_one_month").addClass("selected");
			$("#m_three_month").removeClass("selected");
			
			sDate.setMonth(sDate.getMonth()-1);
			
		} else if(type == "3") {
			$("#m_all").removeClass("selected");
			$("#m_one_month").removeClass("selected");
			$("#m_three_month").addClass("selected");
			
			sDate.setMonth(sDate.getMonth()-3);
		}
		
		startDate = $("#m_min_date").val($.datepicker.formatDate('yy-mm-dd',sDate)); 
		endDate = $("#m_max_date").val($.datepicker.formatDate('yy-mm-dd',eDate));
	}
	
	$.ajax({
		type: "GET",
		url: "/katCmnt/noticeView",
		data: {
			searchValue : searchValue,
			startDate : startDate,
			endDate : endDate
		},
		success:function(msg) {
			$("#notice_wrap").text("");
			noticeText(msg);
		}
	});
	
}

function noticeContentPrint() {
	var win = window.open();
	var printArea = $("#popup_contents").html();
	
	win.document.write("<html><head><title></title>");
	win.document.write("</head><body>");
	win.document.write(printArea);
	win.document.write("</body></html>");
	win.document.close();
	win.focus();
	win.print();
	win.close();
}

function fileDownload() {
	var fileName = $("#file_name").val();
	var orgFileName = $("#download_file").text();
		
	location.href = "/katCmnt/fileDownload?fileName=" + fileName
													+"&orgFileName=" + orgFileName;
}

/* 공지사항 - 하단 검색 접기 펴기 */
function openBottomSearch() {
	if($('.btn_open').val() == "열기"){
		$(".bottom_search .search_value").show();
		$(".btn_open").addClass('active');
		$(".btn_open").val("접기");
	} else {
		$(".bottom_search .search_value").hide();
		$(".btn_open").removeClass('active');
		$(".btn_open").val("열기");
	}
}

