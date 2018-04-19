<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<header>
	<input type="hidden" id="hidden_sub_menu" value="${subMenu}">
	<h1><a href="/" id="top_logo" title="KAT"><img src="${imgUrl}comm/logo.png" alt="logo"></a></h1>
	<nav class="gnb">
		<ul>
			<li>
				<div class="nav_dep2 nav_illust_box">
					<p><spring:message code="main.1p.title"/><!--사람을 위한 기술가치의 실현--></p>
				</div>
			</li>
			<li>
				<a href="/katIntroduce" id="intro_top" class="top_menu" title="<spring:message code="company.common.introduction"/>"><spring:message code="company.common.introduction"/><!--회사소개--></a>
				<div class="nav_dep2">
					<ul>
						<li id="sub_intro" class="sub_menu active">
							<a href="/katIntroduce" title="<spring:message code="company.common.companyOverview"/>"><spring:message code="company.common.introduction"/><!--기업개요--></a>
						</li>
						<li id="sub_his" class="sub_menu">
							<a href="/katIntroduce?subMenu=his" title="<spring:message code="company.common.history"/>"><spring:message code="company.common.history"/><!--주요연혁--></a>
						</li>
						<li id="sub_ci" class="sub_menu">
							<a href="/katIntroduce?subMenu=ci" title="<spring:message code="company.common.ci"/>"><spring:message code="company.common.ci"/><!--C.I 소개--></a>
						</li>
						<li id="sub_sub" class="sub_menu">
							<a href="/katIntroduce?subMenu=sub" title="<spring:message code="company.common.subsidiaryCompany"/>"><spring:message code="company.common.subsidiaryCompany"/><!--계열사--></a>
						</li>
						<li id="sub_guest" class="sub_menu">
							<a href="/katIntroduce?subMenu=guest" title="<spring:message code="company.common.majorPartner"/>"><spring:message code="company.common.majorPartner"/><!--주요 고객사--></a>
						</li>
						<li id="sub_way" class="sub_menu">
							<a href="/katIntroduce?subMenu=way" title="<spring:message code="company.common.contactUs"/>"><spring:message code="company.common.contactUs"/><!--오시는 길--></a>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<a href="/katDiffusion" id="diff_top" class="top_menu" title="<spring:message code="common.Business"/>"><spring:message code="common.Business"/><!--사업영역--></a>
				<div class="nav_dep2 solution">
					<ul>
						<li id="" class="solution01">
							<a href="/katDiffusion" title="<spring:message code="business.defense"/>"><spring:message code="business.defense"/><!--방산사업--></a>
							<ul>
								<li id="sub_kebinet" class="sub_menu">
									<a href="/katDiffusion?subMenu=kebinet" title="<spring:message code="business.defense.cabinet"/>">-<spring:message code="business.defense.cabinet"/><!--캐비닛--></a>
								</li>
								<li id="sub_consol" class="sub_menu">
									<a href="/katDiffusion?subMenu=consol" title="<spring:message code="business.defense.console"/>">-<spring:message code="business.defense.console"/><!--콘솔--></a>
								</li>
							</ul>
						</li>
						<li class="solution02">
							<a href="/katCivilian" title="<spring:message code="business.commercial"/>"><spring:message code="business.commercial"/><!--민수사업--></a>
							<ul>
								<li id="sub_smt" class="sub_menu">
									<a href="/katCivilian?subMenu=smt" title="<spring:message code="business.commercial.chip"/>">-<spring:message code="business.commercial.chip"/><!--칩마운터--></a>
								</li>
								<li id="sub_robot" class="sub_menu">
									<a href="/katCivilian?subMenu=robot" title="<spring:message code="business.commercial.robot"/>">-<spring:message code="business.commercial.robot"/><!--협동로봇--></a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</li>
			<li>
				<a href="/katCmnt" id="cmnt_top" class="top_menu" title="<spring:message code="common.community"/>"><spring:message code="common.community"/><!--커뮤니티--></a>
				<div class="nav_dep2 community">
					<ul>
						<li>
							<a href="/katCmnt" title="<spring:message code="common.notice"/>"><spring:message code="common.notice"/><!--공지사항--></a>
							<ul>
								<li id="sub_cmnt" class="sub_menu">
									<a href="/katCmnt" title="<spring:message code="common.notice"/>">-<spring:message code="common.notice"/><!--공지사항--></a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</li>
		</ul>
		<div class="nav_bg"></div>
	</nav>
	<div class="util">
		<span class="language">
			<a href="javascript:;" id="lang_kr" class="" onclick="changeLanguage('/changeLanguage?lang=ko');" title="<spring:message code="common.ko"/>">KR</a>
			<a href="javascript:;" id="lang_en" class="" onclick="changeLanguage('/changeLanguage?lang=en');" title="<spring:message code="common.en"/>">EN</a>
		</span>
		<a href="http://gw.soltworks.com" class="btn_groupware" target="_blank" title="<spring:message code="common.remote.groupware"/>">GroupWare</a><!--GroupWare-->
		<a href="javascript:;" class="btn_sitemap" onclick="siteMap();" title="<spring:message code="common.site.map"/>"><!-- 사이트 맵 -->
			<span></span>
			<span></span>
			<span></span>
		</a>
	</div>
</header>

<section class="site_map" id="pup_site_map" style="display: none;">
	<div class="site_map_body">
		<div class="site_part">
			<div class="site_topic company">
				<p title="Company Intriduction">Company Intriduction</p>
				<strong title="<spring:message code="company.common.introduction"/>"><spring:message code="company.common.introduction"/><!--회사소개--></strong>
			</div>
			<ul>
				<li><a href="/katIntroduce" title="<spring:message code="company.common.companyOverview"/>">- <spring:message code="company.common.companyOverview"/><!--기업소개--></a></li>
				<li><a href="/katIntroduce?subMenu=his" title="<spring:message code="company.common.history"/>">- <spring:message code="company.common.history"/><!--주요연혁--></a></li>
				<li><a href="/katIntroduce?subMenu=ci" title="<spring:message code="company.common.ci"/>">- <spring:message code="company.common.ci"/><!--C.I 소개--></a></li>
				<li><a href="/katIntroduce?subMenu=sub" title="<spring:message code="company.common.subsidiaryCompany"/>">- <spring:message code="company.common.subsidiaryCompany"/><!--계열사--></a></li>
				<li><a href="/katIntroduce?subMenu=guest" title="<spring:message code="company.common.majorPartner"/>">- <spring:message code="company.common.majorPartner"/><!--주요 고객사--></a></li>
				<li><a href="/katIntroduce?subMenu=way" title="<spring:message code="company.common.contactUs"/>">- <spring:message code="company.common.contactUs"/><!--오시는 길--></a></li>
			</ul>
		</div>
		<div class="site_part">
			<div class="site_topic business">
				<p title="field of business">field of business</p>
				<strong title="<spring:message code="common.Business"/>"><spring:message code="common.Business"/><!--사업영역--></strong>
			</div>
			<div class="business_ul business_left">
				<strong title="<spring:message code="business.defense"/>"><spring:message code="business.defense"/><!--방산사업--></strong>
				<ul>
					<li><a href="/katDiffusion?subMenu=kebinet" title="<spring:message code="business.defense.cabinet"/>">- <spring:message code="business.defense.cabinet"/><!--캐비닛--></a></li>
					<li><a href="/katDiffusion?subMenu=consol" title="<spring:message code="business.defense.console"/>">- <spring:message code="business.defense.console"/><!--콘솔--></a></li>
				</ul>
			</div>
			<div class="business_ul business_right">
				<strong title="<spring:message code="business.commercial"/>"><spring:message code="business.commercial"/><!--민수사업--></strong>
				<ul>
					<li><a href="/katCivilian?subMenu=smt" title="<spring:message code="business.commercial.chip"/>">- <spring:message code="business.commercial.chip"/><!--칩마운터--></a></li>
					<li><a href="/katCivilian?subMenu=robot" title="<spring:message code="business.commercial.robot"/>">- <spring:message code="business.commercial.robot"/><!--협동로봇--></a></li>
				</ul>
			</div>
		</div>
		<div class="site_part last">
			<div class="site_topic community">
				<p title="community">community</p>
				<strong title="<spring:message code="common.community"/>"><spring:message code="common.community"/><!--커뮤니티--></strong>
			</div>
			<ul>
				<li><a href="/katCmnt" title="<spring:message code="common.notice"/>">- <spring:message code="common.notice"/><!--공지사항--></a></li>
			</ul>
		</div>
		<ul class="site_util">
			<li>
				<a href="javascript:;" class="ico_site_util01 ico_disabled" onclick="readyAlert();" title="<spring:message code="common.remote.introduction"/>"><spring:message code="common.remote.introduction"/><!--회사소개 자료--></a>
			</li>
			<li>
				<a href="javascript:;" class="ico_site_util02 ico_disabled" onclick="readyAlert();" title="<spring:message code="common.remote.promotionVideo"/>"><spring:message code="common.remote.promotionVideo"/><!--회사홍보 동영상--></a>
			</li>
			<li class="mobile_ck">
				<a href="http://gw.soltworks.com/" class="ico_site_util03" target="_blank" title="<spring:message code="common.remote.groupware"/>">GROUPWARE</a>
			</li>
			<li class="admin_li mobile_ck">
				<a href="/admin/login" class="ico_site_util04" target="_blank" title="<spring:message code="common.admin.page"/>"><spring:message code="common.admin.page"/><!--관리자 페이지--></a>
			</li>
		</ul>
		<a href="javascript:;" class="btn_site_close" onclick="siteMap();" title="<spring:message code="common.close"/>"><spring:message code="common.close"/><!--닫기--></a>	
	</div>
</section>
