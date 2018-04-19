<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script type="text/javascript" src="${jsUrl}common/jquery-ui.min.js"></script>
<script type="text/javascript" src="${jsUrl}notice.js"></script>

<section class="content">
	<div class="sub_head community">
		<div class="sub_head_inner">
			<strong><spring:message code="common.notice"/><!--공지사항--></strong>
			<p><spring:message code="notice.content1"/><br><spring:message code="notice.content2"/><!--KAT의 주요 공지사항을 나타내는 페이지입니다.<br/>회사소식을 확인하실 수 있습니다.--></p>
			<a href="javascript:;" onclick="mainMenuArrow('civi');" title="<spring:message code="business.commercial"/>" class="left_list_arrow"><spring:message code="business.commercial"/><!--민수사업--></a>
			<a href="javascript:;" onclick="mainMenuArrow('intro');" title="<spring:message code="company.common.introduction"/>" class="right_list_arrow"><spring:message code="company.common.introduction"/><!--회사소개--></a>
		</div>
	</div>
	<div class="sub_content">
		<div class="sub_cont_inner">
			<div class="community_search">
				<p><spring:message code="notice.duration"/><!--특정기간을 설정하거나 키워드 검색을 통해 원하는 공지사항, 보도자료를 검색할 수 있습니다.--></p>
				<div class="search_value">
					<div class="period">
						<a href="javascript:;" class="selected" id="all" onclick="dateSelete(0);" title="<spring:message code="notice.all"/>"><spring:message code="notice.all"/><!-- 전체 --></a>
						<a href="javascript:;" class="" id="one_month" onclick="dateSelete(1);" title="<spring:message code="notice.1month"/>"><spring:message code="notice.1month"/><!-- 1개월 --></a>
						<a href="javascript:;" class="" id="three_month" onclick="dateSelete(3);" title="<spring:message code="notice.3months"/>"><spring:message code="notice.3months"/><!-- 3개월 --></a>
					</div>
					<div class="date">
						<div>
							<input type="text" id="min_date" name="min_date" title="<spring:message code="notice.start"/>" readonly><!--시작일-->
						</div>
						<span>~</span>
						<div>
							<input type="text" id="max_date" name="max_date" title="<spring:message code="notice.end"/>" readonly ><!--종료일-->
						</div>
					</div>
					<fieldset class="item_search">
						<legend><spring:message code="notice.search"/><!--검색--></legend>
						<div class="item">
							<label class="search_label"><spring:message code="notice.search.enter"/><!--검색어 입력--></label> 
							<input type="text" id="search_value" maxlength="30" title="<spring:message code="notice.search.enter"/>" class="search_txt" onkeydown="if(event.keyCode==13)dateCheck();" value="">
						</div>
						<input type="button" value=<spring:message code="notice.search"/> class="top_search_btn" onclick="dateCheck();" title="<spring:message code="notice.search"/>">
					</fieldset>
				</div>
			</div>
			
			<!-- 게시글 처리 -->
			<div class="nodata_notice_box" id="nodata_notice_box" style="display: none;">
				<strong>No Data Available</strong>
				<p>게시글이 없습니다.</p>
			</div>
			<div class="notice_wrap" id="notice_wrap"></div>
			<!-- 페이징 처리 -->
			<div class="paging"></div>
			
			
			<div class="bottom_search">
				<fieldset class="item_search">
					<legend><spring:message code="notice.search"/><!--검색--></legend>
					<div class="item">
						<label class="search_label"><spring:message code="notice.search.enter"/><!--검색어 입력--></label>
						<input type="text" id="m_search_value" maxlength="30" title="<spring:message code="notice.search.enter"/>" class="search_txt" onkeydown="if(event.keyCode==13)dateCheck();" value="">
					</div>
					<input type="button" value="<spring:message code="notice.search"/>" class="top_search_btn" onclick="mobileDateCheck();" title="<spring:message code="notice.search"/>">
				</fieldset>
				<div class="search_value">
					<p><spring:message code="notice.duration"/><!--특정기간을 설정하거나 키워드 검색을 통해 원하는 공지사항, 보도자료를 검색할 수 있습니다.--></p>
					<div class="period">
						<a href="javascript:;" class="selected" id="m_all" onclick="mobileDateSelete(0);" title="<spring:message code="notice.all"/>"><spring:message code="notice.all"/><!--전체--></a>
						<a href="javascript:;" class="" id="m_one_month" onclick="mobileDateSelete(1);" title="<spring:message code="notice.1month"/>"><spring:message code="notice.1month"/><!--1개월--></a>
						<a href="javascript:;" class="" id="m_three_month" onclick="mobileDateSelete(3);" title="<spring:message code="notice.3months"/>"><spring:message code="notice.3months"/><!--3개월--></a>
					</div>
					<div class="date">
						<div>
							<input type="text" id="m_min_date" name="m_min_date" title="<spring:message code="notice.start"/>" readonly><!--시작일-->
						</div>
						<span>~</span>
						<div>
							<input type="text" id="m_max_date" name="m_max_date" title="<spring:message code="notice.end"/>" readonly><!--종료일-->
						</div>
					</div>
				</div>
			</div>
			<input type="button" class="btn_open" value="<spring:message code="notice.open"/>" onclick="openBottomSearch();">
		</div>
		
		
		
		<!-- 리모콘 -->
		<div class="remote">
			<!-- <a href="javascript:;" class="btn_company_download" onclick="companyData();" title="<spring:message code="common.remote.introduction"/>"><spring:message code="common.remote.introduction"/></a>
			<a href="javascript:;" class="btn_company_video" onclick="pupShowHide('movie');" title="<spring:message code="common.remote.promotionVideo"/>"><spring:message code="common.remote.promotionVideo"/></a> -->
			<a href="http://gw.soltworks.com/" target="_blank" class="btn_company_groupware" title="<spring:message code="common.remote.groupware"/>"><spring:message code="common.remote.groupware"/><!--그룹웨어--></a>
			<div class="share_util">
				<a href="javascript:;" class="btn_company_share" title="<spring:message code="common.share"/>"><spring:message code="common.share"/><!--공유하기--></a>
				<ul class="share_form">
					<li>
						<a href="javascript:shareFacebook('http://www.katkorea.co.kr/');" class="btn_facebook" title="<spring:message code="common.share.facebook"/>"><spring:message code="common.share.facebook"/><!--페이스북--></a>
					</li>
					<li>
						<a href="javascript:shareTwitter('http://www.katkorea.co.kr/');" class="btn_twitter" title="<spring:message code="common.share.twitter"/>"><spring:message code="common.share.twitter"/><!--트위터--></a>
					</li>
				</ul>
			</div>
			<a href="javascript:remoteTop();;" class="btn_top" title="TOP">TOP</a>
		</div>
		<!-- //리모콘 -->
	</div>
</section>

<div class="pup_wrap" style="display: none;" id="pup_wrap">
	<strong class="pup_tit pup_text" id="pup_tit"></strong>
	<div class="pup_body">
		<div class="pup_cont_head">
			<strong id="popup_title" class="popup_onOff"></strong>
			<div class="pup_head_util">
				<span class="notice_date" id="popup_date" class="popup_onOff"></span>
				<span class="notice_print" title="<spring:message code="notice.print"/>" onclick="noticeContentPrint();"><spring:message code="notice.print"/><!--인쇄--></span>
			</div>
		</div>
		<div class="pup_cont">
			<div class="add_file_box" id="add_file_box" style="display: none;">
				<div class="add_file_tit">
					<strong><spring:message code="notice.file.download"/><!--첨부파일 다운로드--></strong>
					<input type="hidden" id="file_open_check" value="Y">
					<a href="javascript:;" class="btn_add_open" id="btn_add_open" title="<spring:message code="notice.open"/>" onclick="addFile();"><spring:message code="notice.open"/><!--열기--></a>
				</div>
				<input type="hidden" id="file_name" value="">
				<div class="add_file_list" id="add_file_list">
					<a href="javascript:;" class="btn_download" id="download_file" class="popup_onOff" onclick="fileDownload();"></a>
				</div>
			</div>
			<div class="pup_scroll_area" id="popup_contents" class="popup_onOff pup_text" >
			</div>
		</div>
	</div>
	<a href="javascript:;" class="btn_pup_close" title="<spring:message code="notice.close"/>" onclick="pupClose();"><spring:message code="notice.close"/><!--닫기--></a>
</div>

<!--팝업 배경-->
<div class="pup_bg" id="pup_bg" onclick="pupClose();"></div>
