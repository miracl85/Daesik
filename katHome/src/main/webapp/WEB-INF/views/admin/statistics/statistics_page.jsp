<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<script type="text/javascript" src="${jsUrl}jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css" href="${jsUrl}jquery-ui-1.11.4.custom/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${jsUrl}jquery-ui-1.11.4.custom/jquery-ui.structure.css" />
<link rel="stylesheet" type="text/css" href="${cssUrl}admin/tab/blue/style.css" />
<link rel="stylesheet" type="text/css" href="${cssUrl}admin/tab/green/style.css" />

<script type="text/javascript" src="${jsUrl}admin/comm/json2.js"></script>
<script type="text/javascript" src="${jsUrl}admin/commjson_parse.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm/json_parse_state.js"></script>
<script type="text/javascript" src="${jsUrl}admin/status_common.js"></script>
<script type="text/javascript" src="${jsUrl}admin/statistice_page.js"></script>
<script type="text/javascript">
	var index;  // cell index
	var toggleBool; // sorting asc, desc 
		function tableSort(tbody, index){
			$(".sort").removeClass("btn_down");
			$(".sort").removeClass("btn_up");
	 		this.index = index;
	 		if(toggleBool){
	 			/* dese */
	 			$("#sort_"+index).addClass("btn_up");
	 			
	  			toggleBool = false;
	 		} else {
	 			/* asc */
	 			$("#sort_"+index).addClass("btn_down");
	  			toggleBool = true;
	 		}
	 
		var datas= new Array();
	 	var tbodyLength = tbody.rows.length;
	 	
	 	for(var i=0; i<tbodyLength; i++){
	  		datas[i] = tbody.rows[i];
	 	}
	 
	 	// sort by cell[index] 
	 	datas.sort(compareCells);
	 	for(var i=0; i<tbody.rows.length; i++){
	  		// rearrange table rows by sorted rows
	  		tbody.appendChild(datas[i]);
	 	} 
	}
	
	function compareCells(a,b) {
		var aVal = a.cells[index].innerText;
		var bVal = b.cells[index].innerText;
		 
		aVal = aVal.replace(/\,/g, '');
		bVal = bVal.replace(/\,/g, '');
	
		if(toggleBool){
			var temp = aVal;
		 	aVal = bVal;
		  	bVal = temp;
		}
	
	 	if(aVal.match(/^[0-9]+$/) && bVal.match(/^[0-9]+$/)){
	  		return parseFloat(aVal) - parseFloat(bVal);
	 	} else {
		  	if (aVal < bVal){
		   		return -1;
		  	} else if (aVal > bVal){
		  		return 1;
		 	} else {
		  		return 0; 
		 	}  
		}
	 }
</script>
<section class="container">
	<div class="topic_form">
		<span class="topic">통계</span>
		<ul class="location">
			<li><a href="/admin/statisticsOs" title="통계">통계</a></li>
			<li><a href="/admin/statisticsPage" title="페이지별 접속통계" class="present">페이지별 접속통계</a></li>
		</ul>
	</div>
	<div class="content">
		<button id="auth-button" class="btn_authorize" style="display: none;">Authorize</button>
		<div class="date">
			<div>
				<input type="text" id="min_date" name="min_date" title="date" readonly />
			</div>
			<span>~</span>
			<div>
				<input type="text" id="max_date" name="max_date" title="date" readonly />
			</div>
			<input type="button" value="btn" onclick="queryTotalReporting();" class="btn_date_search" title="검색"/>
		</div>
		
		<table class="tb1" summary="페이지별 접속통계">
			<caption>페이지별 접속통계 테이블</caption>
			<colgroup>
				<col />
				<col />
				<col />
				<col />
			</colgroup>
			<thead>
				<tr style="cursor:pointer">
					<th scope="col" onclick="tableSort(page_contents,0);" title="page">page<a href="javascript:;" id="sort_0" class="sort"></a></th>
					<th scope="col" onclick="tableSort(page_contents,1);" title="menu">menu<a href="javascript:;" id="sort_1" class="sort"></a></th>
					<th scope="col" onclick="tableSort(page_contents,2);" title="users">users<a href="javascript:;" id="sort_2" class="sort"></a></th>
					<th scope="col" onclick="tableSort(page_contents,3);" title="Avg.Time on Page">Avg.Time on Page<a href="javascript:;" id="sort_3" class="sort"></a></th>
				</tr>
			</thead>
			<tbody id="page_contents">
			</tbody>
		</table>
	</div>
</section>


<script>
	var CLIENT_ID = '673017650902-eom302b3hffg4o3hvegn1eqhuk87aepq.apps.googleusercontent.com';
	var SCOPES = ['https://www.googleapis.com/auth/analytics.readonly'];	
	function authorize(event) {
		var useImmdiate = event ? false : true;
	 
		var authData = {
			client_id: CLIENT_ID,
			scope: SCOPES,
			immediate: useImmdiate
	    };
	    gapi.auth.authorize(authData, function(response) {
			var authButton = document.getElementById('auth-button');
			if (response.error) {
				
				$("#auth-button").show();
	        	authButton.hidden = false;
	      	}
	      	else {
	      		authButton.hidden = true;
	        	queryAccounts();
	      	}
		});
	}
	function queryAccounts() {
		gapi.client.load('analytics', 'v3').then(function() {
		gapi.client.analytics.management.accounts.list().then(handleAccounts);
		});
	}
	function handleAccounts(response) {
		if (response.result.items && response.result.items.length) {
	    	var firstAccountId = response.result.items[0].id;
	    	queryProperties(firstAccountId);
		} else {
		console.log('No accounts found for this user.');
		}
	}
	function queryProperties(accountId) {
		gapi.client.analytics.management.webproperties.list({'accountId': accountId}).then(handleProperties).then(null, function(err) {
		console.log(err);
		});
	}
	function handleProperties(response) {
		if (response.result.items && response.result.items.length) {
		var firstAccountId = response.result.items[0].accountId;
	    var firstPropertyId = response.result.items[0].id;
	    queryProfiles(firstAccountId, firstPropertyId);
	    } else {
	    console.log('No properties found for this user.');
	  	}
	}
	function queryProfiles(accountId, propertyId) {
	  gapi.client.analytics.management.profiles.list({
	      'accountId': accountId,
	      'webPropertyId': propertyId
	  })
	  .then(handleProfiles)
	  .then(null, function(err) {
	      console.log(err);
	  });
	}
	function handleProfiles(response) {
		if (response.result.items && response.result.items.length) {
	    var firstProfileId = response.result.items[0].id;
	    queryCoreReportingApi(firstProfileId);
	    queryTotalReporting();
	  } else {
	    console.log('No views (profiles) found for this user.');
	  }
	}
	
	function queryCoreReportingApi(profileId) {
		gapi.client.analytics.data.ga.get({
			'ids': 'ga:' + profileId,
	    	'start-date': '7daysAgo',
	    	'end-date': 'today',
	    	'metrics': 'ga:sessions'
	  	}).then(function(response) {
	    	var formattedJson = JSON.stringify(response.result, null, 2);
	    	document.getElementById('query-output').value = formattedJson;
	  	}).then(null, function(err) {
	      // Log any errors.
	      console.log(err);
	  	});
	} 

	function queryTotalReporting() {
		var minDate = $("#min_date").val();
		var maxDate = $("#max_date").val();
		
		/* 페이지별 접속통계 */
		gapi.client.analytics.data.ga.get({
			'ids': 'ga:' + '170455979',
			'start-date': minDate,
	    	'end-date': maxDate,
	    	'metrics': 'ga:avgTimeOnPage, ga:users',
	    	'dimensions': 'ga:pagePath',
	    	'sort': '-ga:avgTimeOnPage',
	  	}).then(function(response) {
	  		var formattedJson = JSON.stringify(response.result, null, 2);
	    	var json_parse = JSON.parse(formattedJson);
	    	$(".sort").removeClass("btn_down");
			$(".sort").removeClass("btn_up");
	    	$("#page_contents").html("");
	    	$("#page_contents").html("<tr><td colspan='2'>No Data</td></tr>");
	    	pageCreateTable(json_parse);
	  	}).then(null, function(err) {
	      // Log any errors.
	      console.log(err);
	  	});  
	
	}
	//setTimeout("queryTotalReporting()",1000);
	document.getElementById('auth-button').addEventListener('click', authorize);
	</script>
	
	<script src="https://apis.google.com/js/client.js?onload=authorize"></script>