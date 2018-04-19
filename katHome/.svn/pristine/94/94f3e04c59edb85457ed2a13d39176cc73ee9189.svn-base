<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<!-- footer -->
<footer>
	<ul class="foot_info">
		<!-- <li>
			<a href="javascript:;" title="<spring:message code="common.remote.introduction"/>"  onclick="companyData();" class="com_down"><spring:message code="common.remote.introduction"/></a>
		</li>
		<li>
			<a href="javascript:;" title="<spring:message code="common.remote.promotionVideo"/>" onclick="pupShowHide('movie');" class="com_video"><spring:message code="common.remote.promotionVideo"/></a>
		</li> -->
		<li>
			<a href="http://gw.soltworks.com/" target="_blank" title="GROUPWARE" class="com_groupware">GROUPWARE</a>
		</li>
		<li class="fl_right">
			<select onchange="familyEvent();" name="go1" id="family_id">
				<option value="" title="Family site">Family site</option>
				<option value="http://soltworks.com" title="SOLTWORKS">SOLTWORKS</option>
			</select>
		</li>
	</ul>
	<address>
		<div>
			<p title=""><spring:message code="common.footer.changwon"/><!--창원 본사: 51389 경상남도 창원시 의창구 죽전로 85(팔용동)--> <span><a href="tel:055-299-0536" title="<spring:message code="common.footer.tel.changwon.title"/>"><spring:message code="common.footer.tel"/><!--전화--> : 055-299-0536,</a></span> <spring:message code="common.footer.fax"/><!--팩스--> : 055-299-0538</span></p>
			<p title=""><spring:message code="common.footer.changwon2"/><!--창원 2공장: 51542 경상남도 창원시 성산구 곰절길 28번길 2 (성주동)--> <span><a href="tel:055-299-0536" title="<spring:message code="common.footer.tel.changwon2.title"/>"><spring:message code="common.footer.tel"/><!--전화--> : 055-299-0536,</a><spring:message code="common.footer.fax"/><!--팩스--> : 055-299-0538</span></p>
			<p title=""><spring:message code="common.footer.seoul"/><!--서울 연구소: 08380 서울시 구로구 디지털로33길 11 에이스테크노타워8차 401호, 1207호--></p>

			<a href="mailto:management@katkorea.co.kr" class="email" title="e-mail:management@katkorea.co.kr">E-mail : management@katkorea.co.kr</a>
			<p class="copy">© KAT KOREA., all rights reserved</p>
		</div>
		<img src="${imgUrl}comm/logo_kat_soltworks_group.PNG" alt="<spring:message code="common.katSolt"/>" title="<spring:message code="common.katSolt"/>"/><!--KAT 솔트웍스그룹-->
		<img src="${imgUrl}comm/logo_kosdaq.gif" alt="<spring:message code="common.kosdaq"/>" title="<spring:message code="common.kosdaq"/>"  class="margin_t"/><!--코스닥 상장 법인-->
	</address>
	<div id="movie_pup" class="pup_wrap video" style="display:none;">
		<strong class="pup_tit" title="<spring:message code="common.remote.promotionVideo"/>"><spring:message code="common.remote.promotionVideo"/><!--회사홍보 동영상--></strong>
		<a href="javascript:;" class="btn_pup_close" onclick="pupShowHide('movie');"></a>
		<div class="video_cont">
			<iframe src="https://docs.google.com/file/d/0B0UP1RnBpkzySk5YYW1WTTZBVVE/preview?pli=1" style="border: 0px currentColor; border-image: none;"></iframe>
		</div>
	</div>
	<div class="pup_bg"  onclick="pupShowHide('movie');"></div>
</footer>
<!-- //footer -->