$(document).ready(function(){
	//상단 대메뉴 하이라이트 효과
	var pathName = $(location).attr("pathname");
	$(".top_menu").removeClass("active");
	
	if((pathName.indexOf("katDiffusion") > -1) || (pathName.indexOf("katCivilian") > -1)) {
		$("#diff_top").addClass("active");
	} else if(pathName.indexOf("katCmnt") > -1) {
		$("#cmnt_top").addClass("active");
	} else if(pathName.indexOf("katIntroduce") > -1) {
		$("#intro_top").addClass("active");
	}
	subMenuEvent();
	
	$(document).mouseup(function(e) {
		var container = $("#pup_site_map");
		if(container.has(e.target).length == 0 ) {
			container.hide();
		}
	});
	
	//네비게이션 슬라이드 업다운
	$(".gnb").hover(
		function() {
	    	$(".nav_dep2").stop().slideDown(50);
	    	$('.nav_bg').stop().slideDown(50);
	    },
	    function() {
	    	$(".nav_dep2").stop().slideUp(25);
	    	$('.nav_bg').stop().slideUp(25);
	    }
	 );
	$(".gnb ul li a").focus(function(){
    	$(".nav_dep2").stop().slideDown();
    	$('.nav_bg').stop().slideDown();
	});
	$(".gnb ul li a").blur(function(){
    	$(".nav_dep2").stop().slideUp();
    	$('.nav_bg').stop().slideUp();
	});
	
});

//sub menu
function subMenuEvent() {
	var subMenu = $("#hidden_sub_menu").val();
	$(".sub_menu").removeClass("active");
	$("#sub_" + subMenu).addClass("active");
	
	tabEvent(subMenu);
}

//메뉴 서브메뉴 하이라이트 효과를 위한 변경 값들
//sub_서브메뉴, 서브메뉴_li, 서브메뉴_tab_view
function tabEvent(param) {
	$(".tab-content").removeClass("active");
	$(".sub_ul li").removeClass("active");
	$(".sub_menu").removeClass("active");
	
	$("#sub_" + param).addClass("active");
	$("#" + param + "_li").addClass("active");
	$("#" + param + "_tab_view").addClass("active");

	$("#hidden_sub_menu").val(param);
	if(param == "way") {
		locatioinTap1();
	}
	
}

function mainMenuArrow(menu) {
	switch(menu) {
		case "intro" :
			location.href = "katIntroduce";
			break;
		
		case "cmnt" :
			location.href = "katCmnt";
			break;
			
		case "diff" :
			location.href = "katDiffusion";
			break;
			
		case "civi" :
			location.href = "katCivilian";
			break;
	}
}

function shareFacebook(url) {
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
}

function shareTwitter(url) {
	window.open("http://twitter.com/intent/tweet?text=" + url);
}

//파일 존재여부 확인
function fileChk(fileSeq) {
	var fileY = false;
	$.ajax({
		type : "POST",
		url : "/fileChk",
		data : {"fileSeq" : fileSeq},
		dataType : "json",
		success : function(data) {
			fileY = data.fileChked; 
			alert("fileChk success");
		},
		error : function() {
			alert("fileChk error");
		}
	});
	
	return fileY;
}

//회사소개 자료
function companyData() {
	location.href="/companyFile";
}

//네비게이션 TOP
function remoteTop() {
	$(".remote").css("top","60px");
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	$(".btn_top").attr("disabled", true);
}

//팝업 이벤트
function pupShowHide(status) {
	var display = $("#" + status + "_pup").css("display");
	if(display == "block") {
		$("#" + status + "_pup").hide();
		$(".pup_bg").css("display","none");
		$("body").css('position','static').css('width','100%').css('overflow-y','auto');
		
	} else {
		$("#" + status + "_pup").show();
		$(".pup_bg").css("display","block");
		$("body").css('position','fixed').css('width','100%').css('overflow-y','scroll');
		
	}
}

function urlEvent(menu) {
	var url = "";
	if(menu == "kebinet") {
		url = "/katDiffusion?subMenu=kebinet";
	} else if(menu == "consol") {
		url = "/katDiffusion?subMenu=consol";
	} else if(menu == "robot") {
		url = "/katCivilian?subMenu=robot";
	} else if(menu == "smt") {
		url = "/katCivilian?subMenu=smt";
	} 
	location.href = url;
}

function siteMap() {
	var winWidth = $(window).width();
	var display = $("#pup_site_map").css("display");
	
	if(display == "block") {
		if(414 >= winWidth) {
			$(".content").show();
		}
		$("#pup_site_map").hide();
		$(".btn_sitemap").removeClass("active");
	} else {
		if(414 >= winWidth) {
			$(".content").hide();
		}
		$("#pup_site_map").show();
		$(".btn_sitemap").addClass("active");
	}
}

function readyAlert() {
	alert("준비중입니다.");
}

/* 풋터 - 패밀리사이트 바로가기 새창 띄우기 */
function familyEvent(){
	var val = $("#family_id").val();
	
	if(val != "") {
		window.open(val,'win','');
	}
}
