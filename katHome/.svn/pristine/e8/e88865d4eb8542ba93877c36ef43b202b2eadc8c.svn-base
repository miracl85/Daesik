<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt2" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<script type="text/javascript" src="${jsUrl}common/tabcontent.js"></script>
<script type="text/javascript" src="${jsUrl}admin/history.js"></script>

<section class="container">
	<div class="topic_form">
		<span class="topic">회사연혁</span>
		<ul class="location">
			<li><a href="/admin/history" title="회사연혁" class="present">회사연혁</a></li>
		</ul>
	</div>
	<div class="content">
		<div class="tab_box">
			<ul class="tabs">
				<li class="history_tab selected" id="history_add" title="추가"><a href="javascript:;" onclick="tabEvent('add');">추가</a></li>
				<li class="history_tab" id="history_his" title="연혁"><a href="javascript:;" onclick="tabEvent('his');">연혁</a></li>
			</ul>
		</div>
		
		<input type="hidden" id="tab_type" value="${type}">
		
		<!-- 추가 -->
		<div id="historyView1" >
			<form id="form_add_history" action="/admin/historyInsert" method="post">
				<div class="year_topic">
					<jsp:useBean id="now_year" class="java.util.Date" />
					<fmt2:formatDate value="${now_year}" pattern="yyyy" var="now_year"/>
					<strong>· 년도선택 </strong>
					<select name="sel_year" id="sel_year" class="sel_year">
						<c:forEach var="i" begin="0" end="${now_year - 1983}">
						    <c:set var="yearOption" value="${now_year - i}" />
						    <option value="${yearOption}">${yearOption}</option>
						</c:forEach>
					</select>
					<a href="javascript:;" class="btn_year add" onclick="addHistoryRow();" title="추가">추가</a>
				</div>				
				<table class="tb1" summary="회사연혁 정보 추가">
					<caption>공지사항 테이블</caption>
					<colgroup>
						<col width="100" />
						<col />
						<col />
						<col width="45" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">월</th>
							<th scope="col">한글</th>
							<th scope="col">영문</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="history_tbody">
						<tr id="history_tr1">
							<td>
								<c:set var="rowNum" value="1"/>
								<select name="add_month${rowNum}" id="add_month${rowNum}">
									<c:forEach var="month" begin="1" end="12" step="1">
										<option value="${month}">${month}</option>
									</c:forEach>
								</select>
							</td>
							<td>
								<input type="text" name="add_ko${rowNum}" id="add_ko${rowNum}" maxlength="100" onkeypress="historyKeypress();" onkeyup="historyKeyup();"/>
								
							</td>
							<td>
								<input type="text" name="add_en${rowNum}" id="add_en${rowNum}" maxlength="100" onkeypress="historyKeypress();" onkeyup="historyKeyup();" />
								<p id="title_val" class="contents_val title" style="display:none;">
									<span class="ico_exclamation"></span>
									<span id="title_text"></span>
								</p>
							</td>
							<td><a href="javascript:;" class="btn_list_delete" onclick="deleteHistoryRow(${rowNum});">삭제</a></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="add_rowNum" id="add_rowNum" value="">
				<input type="hidden" name="hs_dt_seq_val" id="hs_dt_seq_val" value="">
				<input type="hidden" name="hs_year_val" id="hs_year_val" value="">
				<input type="button" value="저장" class="btn_saves" onclick="addHistory();" />
			</form>
		</div>		
		<!-- //추가 -->
		
		<!-- 연혁 -->
		<div id="historyView2">
			<c:forEach var="year" items="${yearList}">
				<div class="year_topic year_delete">
					<strong>${year.hsYear}</strong> 
					<a href="javascript:;" class="btn_year all_delete" onclick="historyYearDelete(${year.hsYear});">일괄삭제</a>
				</div>
				<table class="tb1" summary="회사연혁 정보 추가">
					<caption>공지사항 테이블</caption>
					<colgroup>
						<col width="100" />
						<col width="400" />
						<col />
						<col width="45" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">월</th>
							<th scope="col">한글</th>
							<th scope="col">영문</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}">
							<c:if test="${year.hsYear eq result.hsYear}">
								<tr>
									<td>${result.hsDtYymm}</td>
									<td class="sample-text" title="${fn:escapeXml(result.hsDtKo)}">${result.hsDtKo}</td>
									<td class="sample-text" title="${fn:escapeXml(result.hsDtEn)}">${result.hsDtEn}</td>
									<td><a href="javascript:;" class="btn_list_delete" onclick="historyDelete(${result.hsDtSeq});">삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
		</div>
		<!-- //삭제 -->
	</div>
</section>