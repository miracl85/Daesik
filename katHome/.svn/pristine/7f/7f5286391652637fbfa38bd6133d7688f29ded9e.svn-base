<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<script type="text/javascript" src="${jsUrl}admin/affiliate.js"></script>
<section class="container">
	<div class="topic_form">
		<span class="topic" title="주요 고객사">주요 고객사</span>
		<ul class="location">
			<li><a href="/admin/affiliate" title="주요 고객사" class="present">주요 고객사</a></li>
		</ul>
	</div>
	<div class="content">
		<form>
			<p class="total_number" title="총 고객사: ${totalCnt}개">· 총 고객사: ${totalCnt}개</p>
			<div class="btn_t_right none">
				<a href="javascript:;" onclick="affPup();" class="btn_add" title="추가">추가</a>		
			</div>
		</form>
		<table class="tb1 tb_cursor" summary="주요고객사 관리 테이블">
			<caption>주요고객사 관리 테이블</caption>
			<colgroup>
				<col width="50" />
				<col width="350" />
				<col width="200" />
				<col />
				<col width="50" />
				<col width="50" />
				<%-- <col width="100" /> --%>
			</colgroup>
			<thead>
				<tr>
					<th scope="col" title="No.">No.</th>
					<th scope="col" title="URL">URL</th>
					<th scope="col" title="사이트명">사이트명</th>
					<th scope="col" title="설명">설명</th>
					<th scope="col" title="로고">로고</th>
					<th scope="col" title="삭제">삭제</th>
					<!-- <th scope="col">순서</th> -->
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty rtList}">
						<tr>
							<td colspan="6">no data</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${rtList}" varStatus="status">
							<tr>
								<td title="${totalCnt - ((nPage - 1) * recordCnt + status.index)}">${totalCnt - ((nPage - 1) * recordCnt + status.index)}</td>
								<td class="al" style="cursor: pointer;" onclick="affDetail(${list.affSeq});" title="${list.affUrl}">${list.affUrl}</td>
								<td class="al" style="cursor: pointer;" onclick="affDetail(${list.affSeq});" title="${list.affTitle}">${list.affTitle}</td>
								<td class="al" style="cursor: pointer;" onclick="affDetail(${list.affSeq});" title="${list.affIntro}">${list.affIntro}</td>
								<td>
									<c:if test="${list.fileSeq != 0}">
										<a href="javascript:;" class="btn_logo yes" title="로고 있음">Y</a>
									</c:if>
									<c:if test="${list.fileSeq == 0}">
										<a href="javascript:;" class="btn_logo no" title="로고 없음">N</a>
									</c:if>
								</td>
								<td><a href="javascript:;" class="btn_list_delete" onclick="affDel(${list.affSeq}, ${list.fileSeq});" title="삭제">삭제</a></td>
							<!-- 	<td>
									<a href="javascript:;" class="btn_arrow_up" title="위로">순서 위로</a>
									<a href="javascript:;" class="btn_arrow_down" title="아래로">순서 밑으로</a>
								</td> -->
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				
			</tbody>
		</table>
	</div>
	<div class="paging">
		${pageTag}
	</div>
</section>

<!-- 주요고객사 추가 팝업창  -->
<div class="pup_wrap" id="pup_aff_add" style="display: none;">
	<strong class="pup_tit" id="pup_tit" title="주요고객사 관리">주요고객사 관리</strong>
	<div class="pup_body">
		<div class="pup_cont">
		<form action="/admin/affInsert" id="aff_form" method="post" enctype="multipart/form-data">
				<input type="hidden" id="pup_aff_type" name="pup_aff_type" value="">
				<input type="hidden" id="pup_aff_seq" name="pup_aff_seq" value="0">
				<input type="hidden" id="pup_file_seq" name="pup_file_seq" value="0">
				<input type="hidden" id="file_update_chk" name="file_update_chk" value="N">
				<table class="tb2" summary="주요고객사 관리 테이블">
					<caption>주요고객사 관리 테이블</caption>
					<colgroup>
						<col width="150" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th title="URL">URL</th>
							<td><input type="text" id="pup_aff_url" value="http://" name="pup_aff_url" maxlength="50" class="site_ipt pup_text"/></td>
						</tr>
						<tr>
							<th title="사이트명">사이트명</th>
							<td><input type="text" id="pup_aff_title" name="pup_aff_title" maxlength="50" class="site_ipt pup_text"/></td>
						</tr>
						<tr>
							<th title="설명">설명</th>
							<td><textarea rows="5" id="pup_aff_intro" name="pup_aff_intro" maxlength="200" cols="70" class="site_txt pup_text"></textarea></td>
						</tr>
						<tr>
							<th title="로고">로고</th>
							<td>
								<span class="file_no_img" style="display: none;"><img src="${imgUrl}admin/comm/noImg.gif" id="pup_file_img" title="noImg"></span>
								<div class="file_insert">
									<input type="file" id="pup_file" name="file" class="site_ipt" onchange="affFileChk(); updateFileChk();"/>
									<p class="file_name" id="file_name"></p>
									<p class="site_example"title="*권장사이즈 310*150 px">*권장사이즈 310*150 px</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
		<div class="pup_bottom">
			<a href="javascript:;" id="aff_save_btn" class="btn_save" onclick="affAdd();" title="확인">확인</a>
			<a href="javascript:;" id="aff_update_btn" class="btn_save" style="display: none;" onclick="affAdd('update');" title="수정">수정</a>
			<a href="javascript:;" class="btn_cancel" onclick="affPup();" title="취소">취소</a>
		</div>
	</div>
	<a href="javascript:;" class="btn_pup_close" title="닫기" onclick="affPup();">닫기</a>
</div>
<div class="pup_bg"></div>