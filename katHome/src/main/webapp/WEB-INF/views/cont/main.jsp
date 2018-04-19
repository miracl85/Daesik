<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<script type="text/javascript" src="${jsUrl}common/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${jsUrl}main.js"></script>

<section class="wrap">
	<section id="full_page">
		<!-- section content 1 -->
		<section class="section" id="section0">
			<div class="section_cont">
				<ul class="slider main_slide">
					<li class="index_slide01">
						<div class="visual_vertical">
							<div class="visual_txt">
								<h2><spring:message code="main.1p.title"/><!--사람을 위한 기술가치의 실현--></h2>
								<p><spring:message code="main.1p.title.explain1"/><!--KAT는 최첨단 가공 설비와 고도의 숙련 인력을 통해 축적된 정밀 기술 노하우로 대한민국 최고의 양산능력을 보유하고 있습니다.--></p>
								<a href="/katIntroduce" class="btn_view" title="<spring:message code="main.more"/>"><spring:message code="main.more"/><!--자세히 보기--></a>
							</div>
						</div>
					</li>
					<li class="index_slide02">
						<div class="visual_vertical">
							<div class="visual_txt">
								<h2><spring:message code="main.1p.title"/><!--사람을 위한 기술가치의 실현--></h2>
								<p><spring:message code="main.1p.title.explain2"/><!--KAT는 국내 최고 수준의 정밀 가공 및 모션설계 기술을 바탕으로 세계 최고 수준의 기술력을 제공합니다.--></p>
								<a href="/katIntroduce" class="btn_view" title="<spring:message code="main.more"/>"><spring:message code="main.more"/><!--자세히 보기--></a>
							</div>
						</div>
					</li>
					<li class="index_slide03">
						<div class="visual_vertical">
							<div class="visual_txt">
								<h2><spring:message code="main.1p.title"/><!--사람을 위한 기술가치의 실현--></h2>
								<p><spring:message code="main.1p.title.explain3"/><!--KAT는 혁신적인 공정 시스템을 도입하여 안정적인 품질 관리를 보장하며 적극적인 R&D 투자를 통해 미래 성장 동력을 확보하고 있습니다.--></p>
								<a href="/katIntroduce" class="btn_view" title="<spring:message code="main.more"/>"><spring:message code="main.more"/><!--자세히 보기--></a>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<!-- particles.js container -->
			<div id="particles-js" class="particle01"></div>
			<div id="particles-js02" class="particle02"></div>
			<!-- scripts -->
			<script src="${jsUrl}common/particles.js"></script>
			<script src="${jsUrl}common/app.js"></script>

			<!-- m_scroll -->
			<div class="scroll_simbol" >
				<div class="scroll_box">
					<div class="ball_scale_multiple">
						<span></span>
						<span></span>
						<span></span>
					</div>
					<a href="javascript:;" class="btn_m_scroll">scroll</a>
				</div>
			</div>
			<!-- //m_scroll -->
			
		</section>
		<!-- //section content 1 -->
		
		<!-- section content 2 -->
		<section class="section" id="section1">
			<div class="section_wrap_box">
				<div class="section_middle_box">
					<div class="visual_txt2 margin_t"> 
						<h2><spring:message code="main.2p.title"/><!--고객 감동의 실현--></h2>
						<p><spring:message code="main.2p.title.explain1"/><!--첨단 기술을 바탕으로 세계로 도약하는 경쟁력 있는 회사 고객감동 실현을 위해 항상 최선을 다하는 기업--></p>
						<div class="soltworks_gp">
							<strong>SOLTWORKS</strong>
							GROUP
						</div>
					</div>
					<!-- about KAT-->
					<div class="about_kat">
						<div class="kat_box family" title="<spring:message code="company.common.subsidiaryCompany"/>">
							<div class="box_thumb">
								<img src="${imgUrl}main/bg_kat_box01.jpg" alt="<spring:message code="common.subsidiaryCompany.img"/>">
							</div>
							<p class="kat_tit"><spring:message code="company.common.subsidiaryCompany"/><!--계열사--><span>Family</span></p>
							<p class="kat_txt"><spring:message code="common.soltworks"/><!--솔트웍스--><br>KAT<br>KMT</p>
							<a href="/katIntroduce?subMenu=sub" class="btn_more">
								<spring:message code="common.more.button"/><!--더보기 버튼-->
								<div>
									<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
								</div>
							</a>
							<div class="kat_lin_gp_left">
								<span class="lin_inner"></span>
							</div>
							<div class="kat_lin_gp_right">
								<span class="lin_inner_02"></span>
							</div>
							<div class="kat_lin_gp_full">
								<span class="lin_inner_top"></span>
								<span class="lin_inner_right"></span>
								<span class="lin_inner_bottom"></span>
								<span class="lin_inner_left"></span>
							</div>
						</div>
						<div class="kat_box friend" title="<spring:message code="common.majorPartner"/>"><!--고객사-->
							<div class="box_thumb">
								<img src="${imgUrl}main/bg_kat_box02.jpg" alt="<spring:message code="company.common.subsidiaryCompany"/>">
							</div>
							<p class="kat_tit"><spring:message code="common.majorPartner"/><!--고객사--><span>Friend</span></p>
							<p class="kat_txt"><spring:message code="company.majorPartner.content"/><!--언제나 고객의 미래와 성공을 위해 노력하는 KAT가 되겠습니다.--></p>
							<a href="/katIntroduce?subMenu=guest" class="btn_more">
								<spring:message code="common.more.button"/><!--더보기 버튼-->
								<div>
									<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
								</div>
							</a>
							<div class="kat_lin_gp_left">
								<span class="lin_inner"></span>
							</div>
							<div class="kat_lin_gp_right">
								<span class="lin_inner_02"></span>
							</div>
							<div class="kat_lin_gp_full">
								<span class="lin_inner_top"></span>
								<span class="lin_inner_right"></span>
								<span class="lin_inner_bottom"></span>
								<span class="lin_inner_left"></span>
							</div>
						</div>
						<div class="kat_box fame" title="<spring:message code="company.common.history"/>"><!--주요연혁-->
							<div class="box_thumb">
								<img src="${imgUrl}main/bg_kat_box03.jpg" alt="<spring:message code="common.subsidiaryCompany.img"/>">
							</div>
							<p class="kat_tit"><spring:message code="company.common.history"/><!--주요연혁--><span>Fame</span></p>
							<p class="kat_txt"><spring:message code="company.history.content"/><!--KAT는 1983년도에 설립되어 꾸준하게 발전해 왔습니다.--></p>
							<a href="/katIntroduce?subMenu=his" class="btn_more">
								<spring:message code="common.more.button"/><!--더보기 버튼-->
								<div>
									<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
								</div>
							</a>
							<div class="kat_lin_gp_left">
								<span class="lin_inner"></span>
							</div>
							<div class="kat_lin_gp_right">
								<span class="lin_inner_02"></span>
							</div>
							<div class="kat_lin_gp_full">
								<span class="lin_inner_top"></span>
								<span class="lin_inner_right"></span>
								<span class="lin_inner_bottom"></span>
								<span class="lin_inner_left"></span>
							</div>
						</div>
					</div>
				</div>
				<!-- //about KAT-->
	
				<!-- m_scroll -->
				<div class="scroll_simbol" >
					<div class="scroll_box">
						<div class="ball_scale_multiple">
							<span></span>
							<span></span>
							<span></span>
						</div>
						<a href="javascript:;" class="btn_m_scroll">scroll</a>
					</div>
				</div>
				<!-- //m_scroll -->
				
				<video class="bg_video1" muted autoplay poster="${imgUrl}main/bg_main_video_capture.jpg">
					<source src="${imgUrl}bg_main_video.mp4" type="video/mp4">
				</video>
				
				<div class="bg_black"></div>
			</div>
		</section>
		<!-- //section content 2 -->

		<!-- section content 3 -->
		<section class="section" id="section2">
			<div class="section_middle_box">
				<div class="visual_txt3 margin_t">
					<h2>Field of<span> Business</span></h2>
					<p><spring:message code="main.3p.title.explain1"/><!--KAT는 뛰어난 방산사업 및 민수사업의 역량을 기반으로 <span>4차 산업혁명을 주도할 수 있는 기업으로 거듭나기 위해 달려나가고 있습니다.</span>--></p>
				</div>
				<!-- main_video_box-->
				<div class="main_video_gp" >
					<div class="main_video mv01" onclick="urlEvent('kebinet');" title="<spring:message code="main.3p.shortcut.cabinet"/>"><!--캐비닛 바로가기-->
						<div class="thevideo_box">
							<video class="thevideo">
								<source src="${imgUrl}main_video01.mp4" type="video/mp4">
								Your browser does not support the video tag.
							</video>
						</div>
						<div class="video_txt">
							<strong><spring:message code="business.defense.cabinet"/><!--캐비닛--></strong>
							<a href="javascript:;" class="btn_trans_arrow"><spring:message code="main.more.content"/><!--관련내용 바로가기--></a>
						</div>
						<div class="video_tag">
							<p>
								<span><spring:message code="main.3p.contents.cabinet.keyword1"/><!--#함정--></span>
								<span><spring:message code="main.3p.contents.cabinet.keyword2"/><!--#전차--></span>
								<span><spring:message code="main.3p.contents.cabinet.keyword3"/><!--#EMS--></span>
							</p>
						</div>
						<div class="line_gp">
							<span class="lin_top"></span>
							<span class="lin_right"></span>
							<span class="lin_bottom"></span>
							<span class="lin_left"></span>
						</div>
						<a href="javascript:;" class="btn_more">
							<spring:message code="common.more.button"/><!--더보기 버튼-->
							<div>
								<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
							</div>
						</a>
					</div>
					<div class="video_right">
						<div class="main_video mv02" onclick="urlEvent('consol');" title="<spring:message code="main.3p.shortcut.console"/>"><!--콘솔 바로가기-->
							<div class="thevideo_box">
								<video class="thevideo">
									<source src="${imgUrl}main_video02.mp4" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
							<div class="video_txt">
								<strong><spring:message code="business.defense.console"/><!--콘솔--></strong>
								<a href="javascript:;" class="btn_trans_arrow"><spring:message code="main.more.content"/><!--관련내용 바로가기--></a>
							</div>
							<div class="video_tag">
								<p>
									<span><spring:message code="main.3p.contents.console.keyword1"/><!--#항해--></span>
									<span><spring:message code="main.3p.contents.console.keyword2"/><!--#다기능--></span>
									<span><spring:message code="main.3p.contents.console.keyword3"/><!--#하우징--></span>
								</p>
							</div>
							<div class="line_gp">
								<span class="lin_top"></span>
								<span class="lin_right"></span>
								<span class="lin_bottom"></span>
								<span class="lin_left"></span>
							</div>
							<a href="javascript:;" class="btn_more">
							<spring:message code="common.more.button"/><!--더보기 버튼-->
							<div>
								<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
							</div>
						</a>
						</div>
						<div class="main_video mv03" onclick="urlEvent('robot');" title="<spring:message code="main.3p.shortcut.robot"/>">
							<div class="thevideo_box">
								<video class="thevideo">
									<source src="${imgUrl}main_video03.mp4" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
							<div class="video_txt">
								<strong><spring:message code="business.commercial.robot"/><!--협동로봇--></strong>
								<a href="javascript:;" class="btn_trans_arrow"><spring:message code="main.more.content"/><!--관련내용 바로가기--></a>
							</div>
							<div class="video_tag">
								<p>
									<span><spring:message code="main.3p.contents.robot.keyword1"/><!--#4차 산업혁명--></span>
									<span><spring:message code="main.3p.contents.robot.keyword2"/><!--#6축--></span>
								</p>
							</div>
							<div class="line_gp">
								<span class="lin_top"></span>
								<span class="lin_right"></span>
								<span class="lin_bottom"></span>
								<span class="lin_left"></span>
							</div>
							<a href="javascript:;" class="btn_more">
							<spring:message code="common.more.button"/><!--더보기 버튼-->
							<div>
								<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
							</div>
						</a>
						</div>
						<div class="main_video mv04" onclick="urlEvent('smt');" title="<spring:message code="main.3p.shortcut.chip"/>">
							<div class="thevideo_box">
								<video class="thevideo">
									<source src="${imgUrl}main_video04.mp4" type="video/mp4">
									Your browser does not support the video tag.
								</video>
							</div>
							<div class="video_txt">
								<strong><spring:message code="business.commercial.chip"/><!--칩마운터--></strong>
								<a href="javascript:;" class="btn_trans_arrow"><spring:message code="main.more.content"/><!--관련내용 바로가기--></a>
							</div>
							<div class="video_tag">
								<p>
									<span><spring:message code="main.3p.contents.chip.keyword1"/><!--#SMT--></span>
									<span><spring:message code="main.3p.contents.chip.keyword2"/><!--#반도체--></span>
									<span><spring:message code="main.3p.contents.chip.keyword3"/><!--#중·고속--></span>
								</p>
							</div>
							<div class="line_gp">
								<span class="lin_top"></span>
								<span class="lin_right"></span>
								<span class="lin_bottom"></span>
								<span class="lin_left"></span>
							</div>
							<a href="javascript:;" class="btn_more">
								<spring:message code="common.more.button"/><!--더보기 버튼-->
								<div>
									<img src="${imgUrl}main/ico_btn_more.png" alt="<spring:message code="common.more.button"/>">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- m_scroll -->
			<div class="scroll_simbol" onclick="moveSectionDown()">
				<div class="scroll_box">
					<div class="ball_scale_multiple">
						<span></span>
						<span></span>
						<span></span>
					</div>
					<a href="javascript:;" class="btn_m_scroll">scroll</a>
				</div>
			</div>
			<!-- //m_scroll -->
		</section>
		<!-- //section content 3 -->

		<!-- footer -->
		<section class="section" id="section3">
			<footer>
				<ul class="foot_info">
					<!-- <li>
						<a href="javascript:;" title="<spring:message code="common.remote.introduction"/>" class="com_down" onclick="companyData();"><spring:message code="common.remote.introduction"/></a>
					</li>
					<li>
						<a href="javascript:;" title="<spring:message code="common.remote.promotionVideo"/>" onclick="pupShowHide('movie');" class="com_video"><spring:message code="common.remote.promotionVideo"/></a>
					</li> -->
					<li>
						<a href="http://gw.soltworks.com/" target="_blank" title="GroupWare" class="com_groupware">GROUPWARE</a>
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
						<p><spring:message code="common.footer.changwon"/><!--창원 본사: 51389 경상남도 창원시 의창구 죽전로 85(팔용동)--> <span><a href="tel:055-299-0536" title="<spring:message code="common.footer.tel.changwon.title"/>"><spring:message code="common.footer.tel"/><!--전화--> : 055-299-0536,</a></span> <spring:message code="common.footer.fax"/><!--팩스--> : 055-299-0538</span></p>
						<p><spring:message code="common.footer.changwon2"/><!--창원 2공장: 51542 경상남도 창원시 성산구 곰절길 28번길 2 (성주동)--> <span><a href="tel:055-299-0536" title="<spring:message code="common.footer.tel.changwon2.title"/>"><spring:message code="common.footer.tel"/><!--전화--> : 055-299-0536,</a></span> <spring:message code="common.footer.fax"/><!--팩스--> : 055-299-0538</span></p>
						<p><spring:message code="common.footer.seoul"/><!--서울 연구소: 08380 서울시 구로구 디지털로33길 11 에이스테크노타워8차 401호, 1207호--></p>
	
						<a href="mailto:management@katkorea.co.kr" class="email" title="e-mail:management@katkorea.co.kr">E-mail : management@katkorea.co.kr</a>
						<p class="copy">© KAT KOREA., all rights reserved</p>
					</div>
					<img src="${imgUrl}comm/logo_kat_soltworks_group.PNG" title="<spring:message code="common.katSolt"/>" alt="<spring:message code="common.katSolt"/>"/><!--KAT 솔트웍스그룹-->
					<img src="${imgUrl}comm/logo_kosdaq.gif" title="<spring:message code="common.kosdaq"/>" alt="<spring:message code="common.kosdaq"/>"  class="margin_t"/><!--코스닥 상장 법인-->
				</address>
			</footer>
		</section>
		<!-- //footer -->
	</section>
</section>
<script>
	function hoverVideo(e) {
		$(".main_video").each(function() {
			$(this).removeClass("hover");
			$('video', this).get(0).pause();
		});
		
	    $('video', this).get(0).play();
	    $(this).addClass("hover");
	}

	function hideVideo(e) {
		$(".main_video").each(function() {
			$(this).removeClass("hover");
		});
	    $('video', this).get(0).pause(); 
	}
</script>

