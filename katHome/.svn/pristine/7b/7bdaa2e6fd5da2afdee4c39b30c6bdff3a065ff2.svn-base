$(document).ready(function(){

	var pathName = $(location).attr("pathname");
	$("#stats_list").hide();
	if((pathName.indexOf("notice") > -1) || (pathName.indexOf("noticeInsertView") > -1) || (pathName.indexOf("noticeModifyView") > -1)) {
		$("#notice").addClass("active");
	} else if((pathName.indexOf("update") > -1) || (pathName.indexOf("updateInsertView") > -1) || (pathName.indexOf("updateModifyView") > -1)) {
		$("#update").addClass("active");
	} else if(pathName.indexOf("history") > -1) {
		$("#history").addClass("active");
	} else if(pathName.indexOf("statistics") > -1) {
		$("#statistics").addClass("active");
		$("#stats_list").show();
		if(pathName.indexOf("Os") > -1) {
			$("#statistics_os").addClass("active");
		} else if(pathName.indexOf("Device") > -1) {
			$("#statistics_device").addClass("active");
		} else if(pathName.indexOf("Mobile") > -1) {
			$("#statistics_mobile").addClass("active");
		} else if(pathName.indexOf("Country") > -1) {
			$("#statistics_country").addClass("active");
		} else if(pathName.indexOf("Page") > -1) {
			$("#statistics_page").addClass("active");
		}
		
	} else if(pathName.indexOf("affiliate") > -1) {
		$("#affiliate").addClass("active");
	}
});

function valChk(text) {
	if($.trim(text) == "") {
		return false;
	}
	
	return true;
}
