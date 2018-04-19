<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="${jsUrl}common/ajax.googleapis-jquery.js"></script>
<script type="text/javascript" src="${jsUrl}common/jquery-ui.min.js"></script>
<script type="text/javascript" src="${jsUrl}admin/update.js"></script>

<section class="container">
	<div class="topic_form">
		<span class="topic">회사자료 업데이트</span>
		<ul class="location">
			<li><a href="/admin/update" class="present" title="회사자료 업데이트">회사자료 업데이트</a></li>
		</ul>
	</div>
	<div class="content">
		<form id="form_update" action="/admin/update" method="post">
			<select name="sel_up_language" id="sel_up_language" onchange="changeSel();">
				<option value="K">한국어</option>
				<option value="E">영어</option>
				<option value="C">중국어</option>
			</select>
			<div class="btn_t_right">
				<div class="top_search">
					<fieldset>
						<legend class="blind">통합검색</legend>
						<label for="totalInput" class="blind">검색어 입력</label>
						<input id="search_text" name="search_text" type="text" value="${searchValue}" maxlength="30" title="통합검색어 입력란" class="top_search_input" onkeypress="pressEnter();">
						<input type="button" value="검색하기" class="nuli-img top_search_btn" onclick="updateSearch();">
					</fieldset>
				</div>
				<a href="javascript:;" class="btn_add" title="추가" onclick="updatePup();" >추가</a>
			</div>
			<div class="date">
				<div>
					<input type="text" id="min_date" name="min_date" title="date" value="${minDate}" onkeydown="if(event.keyCode==8) return false;" readonly />
					<button type="button" class="ui-datepicker-trigger" disabled="disabled"></button>
				</div>
				<span>~</span>
				<div>
					<input type="text" id="max_date" name="max_date" title="date" value="${maxDate}" onkeydown="if(event.keyCode==8) return false;" readonly />
					<button type="button" class="ui-datepicker-trigger"  disabled="disabled"></button>
				</div>
			</div>
			<input type="hidden" id="cur_page" name="cur_page" value="${curPage}"/>
			<input type="hidden" id="search_value" name="search_value" value="${searchValue}"/>
			<input type="hidden" id="language_value" name="language_value" value="${language}"/>
		</form>
	
		<table class="tb1 tb_cursor" summary="공지사항 작성 및 콘텐츠 관리 테이블">
			<caption>공지사항 테이블</caption>
			<colgroup>
				<col width="50" />
				<col width="80" />
				<col />
				<col width="100" />
				<col width="110" />
				<col width="110" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">분류</th>
					<th scope="col">자료명</th>
					<th scope="col">작성자</th>
					<th scope="col">업데이트 날짜</th>
					<th scope="col">다운로드 지정</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>		
					<c:when test="${empty resultList}">
						<tr>
							<td colspan="6">no data</td>
						</tr>
					</c:when>
					<c:when test="${!empty resultList}">						
						<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<c:if test="${resultList.upDownload == 'Y'}">
								<tr class="li_top">
									<td><img src="${imgUrl}admin/comm/ico_top_download.png" alt="다운로드 지정"></td>
									<c:if test="${resultList.upLanguage =='K'}">
									<td><span class="">한국어</span></td>
									</c:if>
									<c:if test="${resultList.upLanguage =='E'}">
									<td><span class="">영어</span></td>
									</c:if>
									<c:if test="${resultList.upLanguage =='C'}">
									<td><span class="">중국어</span></td>
									</c:if>
									<td class="al sample-text" onclick="updateModifyView(${resultList.upSeq});"><a href="javascript:;" title="${resultList.upTitle}" class="reduce" >${resultList.upTitle}</a></td>
									<td>${resultList.createUserId}</td>
									<td>${resultList.modifyDate}</td>
									<td><input type="checkbox" id="ck_download_y" onclick="downloadChk('${resultList.upSeq}','Y');" checked /></td>
									<input type="hidden" id="download_y_seq" value="${resultList.upSeq}">
								</tr>
							</c:if>
							<c:if test="${resultList.upDownload == 'N'}">
								<tr>
									<td>${totalCnt - ((curPage - 1) * recordCnt + status.index)}</td>
									<c:if test="${resultList.upLanguage =='K'}">
									<td><span class="">한국어</span></td>
									</c:if>
									<c:if test="${resultList.upLanguage =='E'}">
									<td><span class="">영어</span></td>
									</c:if>
									<c:if test="${resultList.upLanguage =='C'}">
									<td><span class="">중국어</span></td>
									</c:if>
									<td class="al"><a href="javascript:;" title="${resultList.upTitle}" class="reduce" onclick="updateModifyView(${resultList.upSeq});">${resultList.upTitle}</a></td>
									<td>${resultList.createUserId}</td>
									<td>${resultList.modifyDate}</td>
									<td><input type="checkbox" class="ck_download_n" onclick="downloadChk('${resultList.upSeq}', 'N');" /></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:when>					
				</c:choose>
			</tbody>
		</table>
	</div>	
	${pageTag}
	
<!-- 회사업데이트 추가 팝업창  -->
<div class="pup_wrap" id="pup_update_add" style="display: none;">
	<strong class="pup_tit" id="pup_tit" title="회사자료 업데이트">회사자료 업데이트 관리</strong>
	<div class="pup_body">
		<div class="pup_cont">
		<form action="/admin/updateInsert" id="update_form" method="post" enctype="multipart/form-data">
				<input type="hidden" id="pup_update_seq" name="pup_update_seq" value="0">
				<input type="hidden" id="pup_up_download" name="pup_up_download" value="N">
				<input type="hidden" id="pup_lang" name="pup_lang" value="">
				<input type="hidden" id="file_update_chk" name="file_update_chk" value="N">
				<input type="hidden" id="type" name="type" value="insert">
				<table class="tb2" summary="회사자료 업데이트 관리 테이블">
					<caption>주요고객사 관리 테이블</caption>
					<colgroup>
						<col width="150" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th title="URL">제목</th>
							<td><input type="text" id="pup_update_title" name="pup_update_title" maxlength="50" class="site_ipt pup_text"/></td>
						</tr>
						<tr>
							<th title="설명">설명</th>
							<td><textarea rows="5" id="pup_update_intro" name="pup_update_cont" maxlength="100" cols="70" class="site_txt pup_text"></textarea></td>
						</tr>
						<tr>
							<th title="자료">자료</th>
							<td>
								<input type="file" id="pup_file" name="file" class="site_ipt" onchange="updateFileChk();"/>
								<p class="file_name" id="file_name"></p>								
							</td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
		<div class="pup_bottom">
			<a href="javascript:;" id="up_save_btn" class="btn_save" onclick="updateAdd();" title="확인">확인</a>
			<a href="javascript:;" id="up_update_btn" class="btn_save" style="display: none;" onclick="updateAdd('update');" title="수정">수정</a>
			<a href="javascript:;" id="up_del_btn" class="btn_deletes" style="display: none;" onclick="updateAdd('delete');" title="삭제">삭제</a>
			<a href="javascript:;" class="btn_cancel" onclick="updatePup();" title="취소">취소</a>
		</div>
	</div>
	<a href="javascript:;" class="btn_pup_close" title="닫기" onclick="updatePup();">닫기</a>
</div>
<div class="pup_bg"></div>
</section>
