<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<script type="text/javascript" src="${jsUrl}editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${jsUrl}admin/notice_insert.js"></script>
<section class="container">
	<div class="topic_form">
		<span class="topic">공지사항</span>
		<ul class="location">
			<li><a href="/admin/notice" class="present" title="공지사항">공지사항</a></li>
		</ul>
	</div>
	<form action="/admin/noticeInsert" method="post" id="notice_frm" enctype="multipart/form-data">
		<input type="hidden" id="seq" name="seq" value="${seq}"/>
		<div class="content">
			<table class="tb1 tb_row" summary="공지사항 추가 테이블" style="position:relative;">
				<caption>공지사항 추가 테이블</caption>
				<colgroup>
					<col width="100" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" class="in_size" title="제목을 입력해 주세요." name="notice_title" id="notice_title" value="${fn:escapeXml(resultDto.adTitle)}" maxlength="60" onkeydown="if(event.keyCode==13) return false;" onkeyup="titleKeyup();"/> 
							<c:if test="${resultDto.adTop != null }">
								<label><input type="checkbox" id="notice_top" name="notice_top" checked="checked"/>TOP 공지</label>
							</c:if>
							<c:if test="${resultDto.adTop == null }">
								<label><input type="checkbox" id="notice_top" name="notice_top"/>TOP 공지</label>
							</c:if>
							<p id="title_val" class="contents_val title" style="display:none;">
								<span class="ico_exclamation"></span>
								<span id="title_text">제목을 입력해주세요.</span>
							</p>
						</td>
					</tr>
					<tr>
						<th>언어 설정</th>
						<td>
							<select name="sel_up_language" id="sel_up_language" class="input_width">
							<c:choose>
								<c:when test="${language == 'E'}">
									<option value="K">한국어</option>
								<option value="E" selected="selected">영어</option>
								</c:when>
								<c:otherwise>
									<option value="K" selected="selected">한국어</option>
									<option value="E">영어</option>
								</c:otherwise>
							</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>
							<select id="notice_type" name="notice_type" class="input_width">
							<c:if test="${resultDto.adType =='N'}">
								<option value="N" selected="selected">공지사항</option>
								<option value="P">보도자료</option>
							</c:if>
							<c:if test="${resultDto.adType =='P'}">
								<option value="N">공지사항</option>
								<option value="P" selected="selected">보도자료</option>
							</c:if>
							<c:if test="${resultDto.adType == null}">
								<option value="N">공지사항</option>
								<option value="P">보도자료</option>
							</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="txt_form">
							<textarea name="editor" id="editor" rows="10" cols="100"></textarea>
							<p id="contents_val" class="contents_val" style="display: none;">
								<span class="ico_exclamation"></span>
								<span id="contents_text">내용을 입력해주세요.</span>
							</p>
						</td>
					</tr>
					<tr>
						<th>파일 업로드</th>
						<td>
							<input type="file" id="file" name="file" onchange="fileSelect(); checkUploadFileExt(this);"  onclick="fileAlertOff();"/> 
							<c:if test="${resultDto.adOrgFileName == null}">
								<span id="notice_file">
								</span>
							</c:if>
							<c:if test="${resultDto.adOrgFileName != null}">
								<span id="notice_file">
								${resultDto.adOrgFileName}<a href="javascript:;" class="btn_file_delete" title="삭제" onclick="fileDelete();">삭제</a>
								</span>
							</c:if>	
							<input type="hidden" id="file_check" name="file_check" value="${resultDto.adOrgFileName}">
							<input type="hidden" id="delete_check" name="delete_check" value="">
						</td>
					</tr>
				</tbody>
			</table>
			<div class="tb_bottom">
				<a href="javascript:history.back();" class="btn_cancel" title="취소">취소</a>
				<a href="javascript:;" onclick="noticeDelete('/admin/noticeContDelete',${seq},'${language}')" class="btn_deletes" title="삭제" id="delete_btn" style="display: none;">삭제</a>
				<a href="javascript:;" class="btn_save" title="저장" id="save_btn">저장</a>
			</div>
		</div>
		<input type="hidden" id="type"  name="type" value="${type}"/>
		<input type="hidden" id="cur_page"  name="cur_page" value="${nowPage}"/>
		<input type="hidden" id="file_update_chk"  name="file_update_chk" value="N"/>
		<%-- <input type="hidden" id="min_date" name="min_date" value="${nowMinDate}"/>
		<input type="hidden" id="max_date" name="max_date" value="${nowMaxDate}"/>
		<input type="hidden" id="search_value"  name="search_text" value="${searchValue}"/> --%>
		<input type="hidden" id="editer_value"  name="editer_value" value="N"/>
	</form>
	<div style="display: none;" id="notice_contents">${resultDto.adContents}</div>
</section>