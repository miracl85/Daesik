$(document).ready(function(){
	var subMenu = $("#hidden_sub_menu").val();
	affSelect();
	historySelect();
	if(subMenu == "way") {
		locatioinTap1();
	}
});

var imgUrl = $("#img_url").val();

function locatioinTap1() {
	var mapContainer = document.getElementById('locatioin_tap1'),
    mapOption = {
        center: new daum.maps.LatLng(35.247603, 128.6228966),
        level: 3,
        mapTypeId : daum.maps.MapTypeId.ROADMAP
    };

	var map = new daum.maps.Map(mapContainer, mapOption);
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();
	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPLEFT);	

	var markerImageUrl = imgUrl + 'company/ico_logo.png',
	    markerImageSize = new daum.maps.Size(51, 62), // 마커 이미지의 크기
	    markerImageOptions = {
	        offset : new daum.maps.Point(25,75),
	        alt: "창원 1공장",
	        shape: "poly",
	        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
	    };

	var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(35.247603, 128.6228966),
	    image : markerImage,
	    map: map
	});
}

function locatioinTap2() {
	var mapContainer = document.getElementById('locatioin_tap2'),
    mapOption = {
        center: new daum.maps.LatLng(35.185035, 128.7066093),
        level: 3,
        mapTypeId : daum.maps.MapTypeId.ROADMAP
    };

	var map = new daum.maps.Map(mapContainer, mapOption);
	var mapTypeControl = new daum.maps.MapTypeControl();
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPLEFT);	

	var markerImageUrl = imgUrl + 'company/ico_logo.png',
	    markerImageSize = new daum.maps.Size(51, 62),
	    markerImageOptions = {
	        offset : new daum.maps.Point(25,75),
	        alt: "창원 2공장",
	        shape: "poly",
	        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
	    };

	var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(35.185035, 128.7066093),
	    image : markerImage,
	    map: map
	});
}

function locatioinTap3() {
	var mapContainer = document.getElementById('locatioin_tap3'),
    mapOption = {
        center: new daum.maps.LatLng(37.4857059574, 126.8955115489),
        level: 3,
        mapTypeId : daum.maps.MapTypeId.ROADMAP
    };

	var map = new daum.maps.Map(mapContainer, mapOption);
	var mapTypeControl = new daum.maps.MapTypeControl();
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPLEFT);	

	var markerImageUrl = imgUrl + 'company/ico_logo.png',
	    markerImageSize = new daum.maps.Size(51, 62),
	    markerImageOptions = {
	        offset : new daum.maps.Point(25,75),
	        alt: "서울 연구소",
	        shape: "poly",
	        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
	    };

	var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(37.4857059574, 126.8955115489),
	    image : markerImage,
	    map: map
	});
}


function affSelect(curPage) {

	$.ajax({
		type : "POST",
		url : "/katIntroduce/affList",
		dataType : "json",
		data : {"curPage" : curPage},
		success : function(data) {
			var cont = "";
			$("#guest_board").html("");
			
			if(data.rtList.length == 0) {
				cont += "<div class='nodata_notice_box'>";
				cont += "	<strong title='No Data Available'>No Data Available</strong>";
				cont += "	<p title='게시글이 없습니다.'>게시글이 없습니다.</p>";
				cont += "</div>";
			} else {
				cont = affMake(data.rtList);
			}
			$("#guest_board").html(cont);
			$(".paging").html(data.pageTag);
		},
		error : function(data) {
			alert("affSelect 관리자에게 문의하세요.");
		},
		complete : function(data) {
			
		}
	});
}

function affMake(rtList) {
	var filePath = $("#file_path_url").val();
	var size = rtList.length;
	var affSeq = "";
	var affTitle = "";
	var affUrl = "";
	var affIntro = "";
	var affOrgnm = "";
	var affStrnm = "";
	var result = "";
	var cont = "";
	
	for(var i=0; i<size; i++) {
		result = rtList[i];
		affSeq = result.affSeq;
		affTitle = result.affTitle;
		affUrl = result.affUrl;
		affIntro = result.affIntro;
		affFile = result.upOrgFileName;
		affOrgnm = result.fileOrgnm;
		affStrnm = result.fileStrnm;
//		onerror="this.src='error.gif';
		cont += "<div class='customer_box'>";
		cont += "	<span class='logo_box'>";
		cont += "		<span><img src='" + filePath + "affiliate/" + affStrnm + "' onerror=this.src='/resources/img/sub/product_delay.png'></span>";
		cont += "	</span>";
		cont += "	<div class='customer_info'>";
		cont += "		<strong title='" + affTitle + "'>" + affTitle + "</strong>";
		cont += "		<span class='web_info'>WEB SITE</span>";
		cont += "		<p class='info_web_txt' title='" + affUrl + "'>" + affUrl + "</p>";
		cont += "		<span class='intro_info'>INTRODUCE</span>";
		cont += "		<p class='info_txt' title='" + affIntro + "'>" + affIntro + "</p>";
		cont += "		<a href='" + affUrl + "' class='btn_website' title='홈페이지 바로가기'>홈페이지 바로가기<span></span></a>";
		cont += "	</div>";
		cont += "</div>";
	}
	
	return cont;
}

function historySelect() {

	$.ajax({
		type : "POST",
		url : "/katIntroduce/his",
		success : function(msg) {
			$("#ul_history").text("");
			historyMake(msg);
		},
		error : function(data) {
			alert("HistorySelect 관리자에게 문의하세요.");
		}
	});
}

function historyMake(msg) {
	var lang = msg.language;
	var result = msg.resultList;
	var resultSize = result.length;
	var contents = "";
	var mYear = "";
	var sYear = "";
	
	for(var i=0; i<resultSize; i++) {
		var hsYear = result[i].hsYear;
		var hsYymm = result[i].hsDtYymm;
		var hsKo = result[i].hsDtKo;
		var hsEn = result[i].hsDtEn;
		
		if(hsYear != mYear ) {
			contents += "<li>";
			contents += "  	<span title='" + hsYear + "'>" + hsYear + "'s</span>";
			contents += "  	<div class='history_data'>";
			mYear = hsYear;
		}
		contents += "    			<dl>";
		if(hsYymm != sYear) {
			if(hsYymm.length == 4) {
				contents += "			<dt><strong title='" +  hsYymm + "'>" + hsYymm + "'s</strong></dt>";
				sYear = hsYymm;
			} else {
				var year =  hsYymm.substr(0,4) + ".";
				var month = hsYymm.substr(4,6) + ".";
				contents += "      	<dt><strong title='" + year + "" + month + "'>" + year + month + "</strong></dt>";
				sYear = hsYymm;
			}
		} else {
			contents += "				<dt><strong>" + "" + "</strong></dt>";
		}
		if(lang == "ko") {
			contents += "      		<dd title='" + hsKo +"'>" + hsKo + "</dd>";
		} else if(lang == "en") {
			contents += "      		<dd title='" + hsEn +"'>" + hsEn + "</dd>";
		}
			contents += "  	</dl>";
	}
	contents += "				</div>";
	contents += "			</li>";
	
	$("#ul_history").append(contents);
}
