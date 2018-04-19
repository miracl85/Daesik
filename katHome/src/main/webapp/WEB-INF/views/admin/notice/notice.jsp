<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript" src="${jsUrl}common/ajax.googleapis-jquery.js"></script>
<script type="text/javascript" src="${jsUrl}common/jquery-ui.min.js"></script>
<script type="text/javascript" src="${jsUrl}admin/notice.js"></script>

<input type="hidden" id="now_min_date" name="" value="${minDate}"/>
<input type="hidden" id="now_max_date" name="" value="${maxDate}"/>

<section class="container">
	<div class="topic_form">
		<span class="topic">공지사항</span>
		<ul class="location">
			<li><a href="/admin/notice/" title="공지사항" class="present">공지사항</a></li>
		</ul>
	</div>
	<div class="content">
		<form id="form_notice" action="/admin/notice"  method="post">	
			<select name="sel_up_language" id="sel_up_language" onchange="selectEvent();">
				<option value="K">한국어</option>
				<option value="E">영어</option>
			</select>
			<div class="btn_t_right">	
				<div class="top_search">			
					<fieldset>
						<legend class="blind">통합검색</legend>
						<label for="totalInput" class="blind">검색어 입력</label>
						<input id="search_text" name="search_text" type="text" value="${searchValue}" maxlength="30" onkeypress="event.keyCode==13?noticeSearch():'' " title="검색어 입력란" class="top_search_input">
						<input type="button" value="검색하기" onclick="noticeSearch();" class="nuli-img top_search_btn">
					</fieldset>
				</div>
				<a href="javascript:;" onclick="noticeInsert();" class="btn_add" title="추가">추가</a>
			</div>
			<div class="date">
				<div>
					<input type="text" id="min_date" class="min_date" name="min_date" title="date" value="" onkeydown="if(event.keyCode==8) return false;" readonly />
<!-- 					<button type="button" class="ui-datepicker-trigger" disabled="disabled"></button> -->
				</div>
				<span>~</span>
				<div>
					<input type="text" id="max_date" name="max_date" title="date" value=""  onkeydown="if(event.keyCode==8) return false;" readonly />
					<button type="button" class="ui-datepicker-trigger"  disabled="disabled"></button>
				</div>
			</div>
			<input type="hidden" id="search_type" name="search_type" value="N"/>
			<input type="hidden" id="search_value" name="search_value" value="${searchValue}"/>
			<input type="hidden" id="cur_page" name="cur_page" value="${nPage}"/>
			<input type="hidden" id="seq" name="seq" value=""/>
			<input type="hidden" id="language_value" name="language_value" value="${language}"/>
		</form>
		<table class="tb1 tb_cursor" summary="공지사항 작성 및 콘텐츠 관리 테이블">
			<caption>공지사항 테이블</caption>
			<colgroup>
				<col width="50" />
				<col width="80" />
				<col />
				<col width="100" />
				<col width="100" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">분류</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>					
					<c:when test="${empty resultList}">
						<tr>
							<td colspan="5">no data</td>
						</tr>
					</c:when>					
					<c:when test="${!empty resultList}">
						<c:forEach var="resultList" items="${resultList}" varStatus="status">
							<c:if test="${resultList.adTop == 'on'}">
								<tr class="li_top">
									<td><img src="${imgUrl}admin/comm/ico_top_list.png" alt="top공지"></td>
									<c:if test="${resultList.adType =='P'}">
									<td><span class="ico_news">보도자료</span></td>
									</c:if>
									<c:if test="${resultList.adType =='N'}">
									<td><span class="ico_notice">공지사항</span></td>
									</c:if>
									<td class="al"><a href="javascript:;" title="${resultList.adTitle}" class="reduce" onclick="noticeModifyAndDeleteView(${resultList.adSeq});">${resultList.adTitle}</a></td>
									<td>${resultList.modifyUserId}</td>
									<td>${resultList.modifyDate}</td>
								</tr>
							</c:if>
							<c:if test="${resultList.adTop == null || resultList.adTop == ''}">
								<tr>
									<td>${totalCnt - ((nowPage - 1) * recordCnt + status.index)}</td>
									<c:if test="${resultList.adType =='P'}">
									<td><span class="ico_news">보도자료</span></td>
									</c:if>
									<c:if test="${resultList.adType =='N'}">
									<td><span class="ico_notice">공지사항</span></td>
									</c:if>
									<td class="al"><a href="javascript:;" title="${resultList.adTitle}" class="reduce" onclick="noticeModifyAndDeleteView(${resultList.adSeq});">${resultList.adTitle}</a></td>
									<td>${resultList.modifyUserId}</td>
									<td>${resultList.modifyDate}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
	</div>
	${pageTag}
</section>