<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<script type="text/javascript" src="${jsUrl}admin/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${jsUrl}admin/jquery-ui-1.11.4.custom/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${jsUrl}admin/jquery-ui-1.11.4.custom/jquery-ui.structure.css" />

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm/json2.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm/json_parse.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm/json_parse_state.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm/google_chart.js"></script>

<section class="container">
	<div class="topic_form">
		<span class="topic">대시보드</span>
		<ul class="location">
			<li><a href="/admin/dashBoard" title="대시보드" class="present">대시보드</a></li>
		</ul>
	</div>
	<div class="content">
		<button id="auth-button" class="btn_authorize" style="display: none;">Authorize</button>
		<div class="date">
			<div>
				<input type="text" id="min_date" name="min_date" title="date" onkeydown="if(event.keyCode==8) return false;" readonly />
			</div>
			<span>~</span>
			<div>
				<input type="text" id="max_date" name="max_date" title="date" onkeydown="if(event.keyCode==8) return false;" readonly />
			</div>
			<input type="button" value="btn" onclick="queryTotalReporting();" class="btn_date_search" title="검색"/>
		</div>
		
		<div class="stats_form">
			<div>
				<strong>일별 접속통계</strong>
				<div class="stats_cont">
					<div id="sessions_container" style="min-width:310px; height:350px; margin: 0 auto"></div>
				</div>
			</div>
			<div class="part first">
				<strong>국가별 접속 통계</strong>
				<div class="stats_cont">
					<div id="area_container" style="min-width: 310px; height:350px; max-width: 600px; margin: 0 auto"></div>
				</div>
			</div>
			<div class="part">
				<strong>브라우저별 접속통계</strong>
				<div class="stats_cont">
					<div id="browser_container" style="min-width: 310px; height:350px; max-width: 600px; margin: 0 auto"></div>
				</div>
			</div>
		</div>
		
		<textarea cols="80" rows="20" id="query-output" style="display: none;"></textarea>
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
		
 		/* 국가별 접속 통계 */
		gapi.client.analytics.data.ga.get({
			'ids': 'ga:' + '170455979',
	    	'start-date': minDate,
	    	'end-date': maxDate,
	    	'metrics': 'ga:sessions',
	    	'dimensions': 'ga:country',
	    	'sort': '-ga:sessions',
			'max-results': '5'
	  	}).then(function(response) {
	    	var formattedJson = JSON.stringify(response.result, null, 2);
	    	var json_parse = JSON.parse(formattedJson);
	    	areaChart(json_parse);
	  	}).then(null, function(err) {
	      // Log any errors.
	      console.log(err);
	  	});
		
		/* 사용자 접속 통계 */
		gapi.client.analytics.data.ga.get({
			'ids': 'ga:' + '170455979',
			'start-date': minDate,
	    	'end-date': maxDate,
	    	'metrics': 'ga:sessions',
	    	'dimensions': 'ga:date'
	  	}).then(function(response) {
	    	var formattedJson = JSON.stringify(response.result, null, 2);
	    	var json_parse = JSON.parse(formattedJson);
	    	sessionsChart(json_parse);
	  	}).then(null, function(err) {
	      // Log any errors.
	      console.log(err);
	  	});
		http:
		
		/* 브라우저별 접속 통계 */
		gapi.client.analytics.data.ga.get({
			'ids': 'ga:' + '170455979',
			'start-date': minDate,
	    	'end-date': maxDate,
	    	'metrics': 'ga:sessions',
	    	'dimensions': 'ga:browser',
	    	'sort': '-ga:sessions',
	  	    'max-results': '5'
	  	}).then(function(response) {
	    	var formattedJson = JSON.stringify(response.result, null, 2);
	    	var json_parse = JSON.parse(formattedJson);
	    	browserChart(json_parse);
	  	}).then(null, function(err) {
	      // Log any errors.
	      console.log(err);
	  	}); 
	}
	//setTimeout("queryTotalReporting()",1000);
	document.getElementById('auth-button').addEventListener('click', authorize);
	</script>	
	<script src="https://apis.google.com/js/client.js?onload=authorize"></script>