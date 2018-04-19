	
	function pageCreateTable(data) {
	
		var listSize = data.rows.length;
		var contents = "";
		for(var index = 0; index < listSize; index++){
			var page = data.rows[index][0];
			var users = data.rows[index][2];
			var avgTime = parseInt(data.rows[index][1]);
			
			if(avgTime != "0" || avgTime != "0.0") {
				contents +=	"<tr>" +
								"<td>"+page+"</td>" +
								"<td>"+pageName(page)+"</td>" +
								"<td>"+users+"</td>" +
								"<td>"+avgTime+"</td>" +
							"</tr>";
			}	
		}
		
		$("#page_contents").html(contents);
	}
	
	function pageName(page) {
		
		var urlName = "";
		
		if(page == "/katCmnt") {
			urlName = "공지사항";
		} else if(page == "/katCivilian?subMenu=smt") {
			urlName = "칩마운터";
		} else if(page == "/katCivilian?subMenu=robot") {
			urlName = "협동로봇";
		} else if(page == "/katDiffusion?subMenu=consol") {
			urlName = "콘솔";
		}  else if(page == "/katDiffusion" || apge == "/katDiffusion?subMenu=kebinet") {
			urlName = "캐비닛";
		} else if(page == "/katIntroduce?subMenu=way") {
			urlName = "오시는길";
		} else if(page == "/katIntroduce?subMenu=guest") {
			urlName = "주요 고객사";
		} else if(page == "/katIntroduce?subMenu=sub") {
			urlName = "계열사";
		} else if(page == "/katIntroduce?subMenu=ci") {
			urlName = "C.I 소개";
		} else if(page == "/katIntroduce?subMenu=his") {
			urlName = "주요연혁";
		} else if(page == "/katIntroduce") {
			urlName = "기업소개";
		} else if(page == "/") {
			urlName = "홈페이지 메인";
		}
		
		return urlName;
	}