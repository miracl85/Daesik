<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=944b08832837cd1319ee5ca6b546408c"></script>
<script type="text/javascript" src="${jsUrl}introduce.js"></script>
<section class="content">
	<div class="sub_head">
		<div class="sub_head_inner">
			<strong title="<spring:message code="company.common.introduction"/>"><spring:message code="company.common.introduction"/><!--회사소개--></strong>
			<p><spring:message code="company.common.content1"/><!--최첨단 설비와 고도로 숙련된 인력의 조화로--> <br/><spring:message code="company.common.content2"/><!--상상을 현실로 가공하는 최고의 혁신기업 KAT입니다.--></p>
			<a href="javascript:;" onclick="mainMenuArrow('cmnt');" title="<spring:message code="common.community"/>" class="left_list_arrow"><spring:message code="common.community"/><!--커뮤니티--></a>
			<a href="javascript:;" onclick="mainMenuArrow('diff');" title="<spring:message code="business.defense"/>" class="right_list_arrow"><spring:message code="business.defense"/><!--방산사업--></a>
		</div>
	</div>
	<div class="sub_content">
		<ul id="" class="sub_ul tabs">
			<li id="intro_li" onclick="tabEvent('intro');" class="active" title="<spring:message code="company.common.companyOverview"/>"><spring:message code="company.common.companyOverview"/><!--기업소개--></li>
			<li id="his_li" onclick="tabEvent('his');" class="" title="<spring:message code="company.common.history"/>"><spring:message code="company.common.history"/><!--주요연혁--></li>
			<li id="ci_li" onclick="tabEvent('ci');" class="" title="<spring:message code="company.common.ci"/>"><spring:message code="company.common.ci"/><!--C.I 소개--></li>
			<li id="sub_li" onclick="tabEvent('sub');" class="" title="<spring:message code="company.common.subsidiaryCompany"/>"><spring:message code="company.common.subsidiaryCompany"/><!--계열사--></li>
			<li id="guest_li" onclick="tabEvent('guest');" class="" title="<spring:message code="company.common.majorPartner"/>"><spring:message code="company.common.majorPartner"/><!--주요 고객사--></li>
			<li id="way_li" onclick="tabEvent('way');" class="" title="<spring:message code="company.common.contactUs"/>"><spring:message code="company.common.contactUs"/><!--오시는길--></li>
		</ul>
		<!-- tab1 -->
		<div id="intro_tab_view" class="tab-content active">
			<strong class="company_topic"><spring:message code="company.introduction.title1"/><!--끊임없는 신기술 개발과 경영혁신으로--><br/><spring:message code="company.introduction.title2"/><!--고객감동을 성취할 수 있는 전문성을 갖춘 기업 KAT--></strong>
			<p class="tit_explain"><spring:message code="company.introduction.explain1"/><!--KAT는 R&D에서 정밀 가공/조립까지 수직 계열화된 사업구조로 독자운영 시스템을 구축, QCD(Quality, Cost, Delivery)를 차별화 했습니다.--> <br/><spring:message code="company.introduction.explain2"/><!--30여년간 쌓아온 초정밀 가공기술과 연구개발 능력을 바탕으로 4차 산업혁명에 적합한 신사업을 선도하는 기술우위의 가치를 창조하고--><br/><spring:message code="company.introduction.explain3"/><!--경영 목표를 달성하여 파트너, 구성원 모두의 삶을 만족시킬 수 있는 기업이 되겠습니다.--></p>
			<div class="company_cont">
				<div class="illust_wrap">
					<div class="circle_line">
						<div class="earth_bg"></div>
					</div>
					<strong class="ico_challenge">
						<span><spring:message code="company.introduction.challenge"/><!--도전--></span>
					</strong>
					<div class="box_challenge">
						<strong><spring:message code="company.introduction.challenge.content"/><!--최고를 지향하는 도전--></strong>
						<p><spring:message code="company.introduction.challenge.explain"/><!--최고의 기술과 연구개발 능력으로 업계 선도기업 위치 달성--></p>
					</div>
					<strong class="ico_communication">
						<span><spring:message code="company.introduction.communicate"/><!--소통--></span>
					</strong>
					<div class="box_communication">
						<strong><spring:message code="company.introduction.communicate.content"/><!--고객을 위한 소통--></strong>
						<p><spring:message code="company.introduction.communicate.explain"/><!--지속적인 소통으로 통한 고객과의 신뢰 구축 및 기대이상의 가치전달--></p>
					</div>
					<strong class="ico_change">
						<span><spring:message code="company.introduction.change"/><!--변화--></span>
					</strong>
					<div class="box_change">
						<strong><spring:message code="company.introduction.change.content"/><!--시대를 주도하는 변화--></strong>
						<p><spring:message code="company.introduction.change.explain"/><!--4차 산업혁명 시대를 주도하며 신사업을 통한 국내외 시장개척--></p>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- tab2 -->
		<div id="his_tab_view" class="tab-content">
			<strong class="company_topic"><spring:message code="company.common.history"/><!--주요연혁--></strong>
			<p class="tit_explain"><spring:message code="company.history.content"/><!--KAT는 1983년도에 설립되어 꾸준하게 발전해 왔습니다.--></p>
			<div class="history_cont" id="history_board">
				<div class="history_title">
					<strong>
						<span title="KAT history">KAT<br>History</span>
					</strong>
					<span class="diagonal_line"></span>
				</div>
				<ul id="ul_history">
				</ul>
			</div>
			
			
			
		</div>
		<!-- tab3 -->
		<div id="ci_tab_view" class="tab-content">
			<strong class="company_topic"><spring:message code="company.common.ci"/><!--C.I 소개--></strong>
			<p class="tit_explain"><spring:message code="company.ci.content"/><!--KAT는 더욱 성장하기 위해 최선의 노력을 다 하고 있습니다.--></p>
			<div class="ci_cont">
				<div class="symbol_box">
					<div class="symbol_txt">
						<strong>Symbol &amp; Concept</strong>
						<p>
							<spring:message code="company.ci.symbol1"/><!--심볼마크는 기술, 지식, 그리고 도약하는 개구리의 모습을 상징합니다.-->  <br>
							<spring:message code="company.ci.symbol2"/><!--개구리의 형상을 열려있는 네트워크의 형태 안에 담아냄으로써 SOLTWORKS GROUP의 중심 가치인 기술과 지식의 오픈, 도전정신을 강조하였습니다.-->  <br>
							<spring:message code="company.ci.symbol3"/><!--사람과 기술의 조화를 위해 혁신적으로 도약하는  SOLTWORKS GROUP의 이미지를 심어주기 위해 역동성을 강조한 레드를 사용하였습니다.-->
						</p>
					</div>
					<div class="symbol_img">
						<img src="${imgUrl}company/ico_symbol_process.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
						<div class="logo_bg">
							<img src="${imgUrl}company/img_logo01.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
						</div>
					</div>
				</div>
				<div class="btn_download_gp">
					<a href="/ciDownload?fileName=kat_ci.ai" class="btn_ai_download" title="AI Download"><span></span>AI Download</a>
					<a href="/ciDownload?fileName=kat_ci.jpg" class="btn_jpg_download" title="JPG Download"><span></span>JPG Download</a>
				</div>
				<div class="ci_tit">
					<strong>Primary Identifier</strong>
					<p><spring:message code="company.ci.identifier"/><!--심볼과 로고의 변형된 사용은 업체의 이미지를 왜곡 시키고 커뮤니케이션 효과를 약화시키므로 사용상 주의해 주시기 바랍니다.-->
				</p></div>
				<div class="logo_gp">
					<div class="logo_div two">
						<span><spring:message code="company.ci.form1"/><!--기본형 1--></span>
						<img src="${imgUrl}company/img_logo02.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
					<div class="logo_div two">
						<span><spring:message code="company.ci.form2"/><!--기본형 2--></span>
						<img src="${imgUrl}company/img_logo03.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
				</div>
				<div class="ci_tit">
					<strong>Color System</strong>
					<p><spring:message code="company.ci.color.system1"/><!--전용색상은 브랜드마크와 더불어 KAT의 아이덴티티를 형성하는 중요한 요소입니다.--> <br> <spring:message code="company.ci.color.system2"/><!--전용색상의 표현은 별색인쇄를 원칙으로 하며 본 메뉴얼 자료에 수록된 색상견본 또는 컬러 넘버를 표준으로 합니다.--></p>
				</div>
				<div class="color_gp">
					<div class="color_red">
						<strong>KAT<br>RED</strong>
						<p>
							<span>RGB / R250  G52  B61</span>
							<span>CMRK / C0  M93  Y75  K0</span>
							<span>COLOR / #EE3642<br></span>
						</p>
					</div>
					<div class="color_red orange">
						<strong>KAT<br>ORANGE</strong>
						<p>
							<span>RGB / R250  G5122  B34</span>
							<span>CMRK / C0  M65  Y95  K0</span>
							<span>COLOR / #FF7A22</span>
						</p>
					</div>
					<div class="color_red black">
						<strong>KAT<br>BLACK</strong>
						<p>
							<span>RGB / R0 G0  B0</span>
							<span>CMRK / C75  M68  Y67  K90</span>
							<span>COLOR / #404140</span>
						</p>
					</div>
				</div>
				<p class="ci_tit_p"><spring:message code="company.ci.content2"/><!--KAT의 일관된 이미지 구축을 위해서는 수록된 색상 견본에 의한 별색 인쇄를 우선으로 사용하여 상황에 따라 4원색 프로세스 컬러를 활용할 수 있습니다.--></p>
				<div class="logo_gp">
					<div class="logo_div">
						<span><spring:message code="company.ci.color1"/><!--컬러형 1--></span>
						<img src="${imgUrl}company/img_logo02.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
					<div class="logo_div">
						<span><spring:message code="company.ci.color2"/><!--컬러형 2--></span>
						<img src="${imgUrl}company/img_logo06.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
					<div class="logo_div">
						<span><spring:message code="company.ci.color3"/><!--컬러형 3--></span>
						<img src="${imgUrl}company/img_logo07.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
					<div class="logo_div">
						<span><spring:message code="company.ci.color4"/><!--컬러형 4--></span>
						<img src="${imgUrl}company/img_logo08.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
					</div>
				</div>
			</div>
		</div>
		<!-- tab4 -->
		<div id="sub_tab_view" class="tab-content">
			<strong class="company_topic"><spring:message code="company.subsidiaryCompany.title"/><!--계열사/사업소개--></strong>
			<p class="tit_explain"><spring:message code="company.subsidiaryCompany.content"/><!--솔트웍스 그룹은 4차 산업혁명 시대에 발맞춰 IT-미디어-제조 사업의 융합을 통해 각 분야에서 경쟁력 있는 회사로 발돋움 하고 있습니다.--></p>
			<div class="affiliate_cont">
				<div class="form_wrap">
					<strong class="form_group_box">SOLTWORKS GROUP</strong>
					<span class="lin_form"></span>
					<div class="group_box">
						<strong class="group_head">KAT</strong>
						<span class="logo_box affiliate">
							<span>
								<img src="${imgUrl}company/logo_kat.PNG" alt="<spring:message code="common.logo.kat"/>"><!--KAT 로고-->
							</span>
						</span>
						<div class="company_info affiliate">
							<span class="company_explanation">COMPANY</span>
							<p class="info_company_txt">
								<spring:message code="company.subsidiaryCompany.katContent"/><!--초정밀부품 가공기술을 기반으로 로봇, 칩마운터, 캐비닛 등 반도체 관련 장비 및 정밀 기계부품을  생산하는 전문업체-->
							</p>
							<a href="/" class="btn_website" title="<spring:message code="company.shortcut.home"/>"><spring:message code="company.shortcut.home"/><!--홈페이지 바로가기--><span></span></a>
						</div>
					</div>
					<div class="group_box">
						<strong class="group_head">SOLTWORKS</strong>
						<span class="logo_box affiliate">
							<span>
								<img src="${imgUrl}company/logo_soltworks.png" alt="<spring:message code="common.logo.kmt"/>"><!--KMT로고-->
							</span>
						</span>
						<div class="company_info affiliate">
							<span class="company_explanation">COMPANY</span>
							<p class="info_company_txt">
								<spring:message code="company.subsidiaryCompany.soltContent"/><!--솔트웍스 그룹의 지주 회사로 4차 산업혁명 시대의 주요 기술을 활용한 VR/AR/MR 및 스마트 러닝 시스템을 개발하는 IT 전문 업체-->
							</p>
							<a href="http://soltworks.com" target="_blank" class="btn_website" title="<spring:message code="company.shortcut.home"/>"><spring:message code="company.shortcut.home"/><!--홈페이지 바로가기--><span></span></a>
						</div>
					</div>
					<div class="group_box">
						<strong class="group_head">KMT</strong>
						<span class="logo_box affiliate">
							<span>
								<img src="${imgUrl}company/logo_kmt.png" alt="<spring:message code="common.logo.solt"/>"><!--솔트웍스 로고-->
							</span>
						</span>
						<div class="company_info affiliate">
							<span class="company_explanation">COMPANY</span>
							<p class="info_company_txt">
								<spring:message code="company.subsidiaryCompany.kmtContent"/><!--다년간 축적된 경험과 기술을 바탕으로 첨단영상 시뮬레이터 및 가상 현실(Virtual-Reality)디스플레이 시스템 개발 전문 업체-->
							</p>
							<a href="http://www.vrdis.com/default/" target="_blank" class="btn_website" title="<spring:message code="company.shortcut.home"/>"><spring:message code="company.shortcut.home"/><!-- 홈페이지 바로가기 --><span></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- tab5 -->
		<div id="guest_tab_view" class="tab-content">
			<strong class="company_topic"><spring:message code="company.common.majorPartner"/><!--주요 고객사--></strong>
			<p class="tit_explain"><spring:message code="company.majorPartner.content"/><!--언제나 고객의 미래와 성공을 위해 노력하는 KAT가 되겠습니다.--></p>
			<div class="customer_cont">
				<div class="cont_inner" id="guest_board">
					<div class="nodata_notice_box" style="display: none;">
						<strong>No Data Available</strong>
						<p>게시글이 없습니다.</p>
					</div>
				</div>
				<div class="paging">
				</div>
			</div>
		</div>
		<!-- tab6 -->
		<div id="way_tab_view" class="tab-content">
			<strong class="company_topic"><spring:message code="company.common.contactUs"/><!--오시는 길--></strong>
			<p class="tit_explain"><spring:message code="company.directions.content"/><!--KAT로 오시는 위치정보를 안내해드립니다.--></p>
			<div class="location_cont">
				<input id="location_tab1" type="radio" name="location_tab" checked="checked" onclick="locatioinTap1();">
				<input id="location_tab2" type="radio" name="location_tab" onclick="locatioinTap2();">
				<input id="location_tab3" type="radio" name="location_tab" onclick="locatioinTap3();">
				<label for="location_tab1" class="location_tab" style="cursor: pointer;" title="<spring:message code="company.changwon"/>"><spring:message code="company.changwon"/><!--창원 1공장--></label>
				<label for="location_tab2" class="location_tab" style="cursor: pointer;" title="<spring:message code="company.changwon2"/>"><spring:message code="company.changwon2"/><!--창원 2공장--></label>
				<label for="location_tab3" class="location_tab" style="cursor: pointer;" title="<spring:message code="company.seoul"/>"><spring:message code="company.seoul"/><!--서울 연구소--></label>
				
				<!-- 창원 1공장 --> 
				<div class="location_tab_cont">
				
				<div class="api_box" id="locatioin_tap1"></div>

					<strong class="location_tit" title="<spring:message code="company.changwon"/>"><spring:message code="company.changwon"/><!--창원 1공장--></strong>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.phone"/>"><spring:message code="company.phone"/><!--대표번호--></span></span>
						<span class="lo_td"><span title="055-299-0536">055-299-0536</span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="FAX">FAX</span></span>
						<span class="lo_td"><span title="055-299-0538">055-299-0538</span></span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.address"/>"><spring:message code="company.address"/><!--주소--></span></span>
						<span class="lo_td"><span title="<spring:message code="company.address.changwon"/>"><spring:message code="company.address.changwon"/><!--51389 경상남도 창원시 의창구 죽전로 85(팔용동)--></span></span>
					</p>
					<p class="lo_tr transport">
						<span class="lo_th"><span title="<spring:message code="company.directions"/>"><spring:message code="company.directions"/><!--찾아오시는 길--></span></span>
						<div class="transport_box">
							<div class="transport_in train">
								<strong><spring:message code="company.subway"/><!--지하철--></strong>
								<p title="<spring:message code="company.address.changwon.ktx"/>"><span class="indigo sign" title="KTX">KTX</span><span class="transport_txt"><spring:message code="company.address.changwon.ktx"/><!--창원역 하차 후 108 버스 탑승, 차룡 119안전센터 정류장 하차, 600m 근방--></span></p>
							</div>
							<div class="transport_in bus">
								<strong><spring:message code="company.bus"/><!--버스--></strong>
								<p title="<spring:message code="company.address.changwon.bus"/>"><span class="red sign" title="<spring:message code="company.expressBus"/>"><spring:message code="company.expressBus"/><!--고속버스--></span><span class="transport_txt"><spring:message code="company.address.changwon.bus"/><!--마산남부 시외버스터미널 하차후 707 버스 탑승, 차룡 119 안전센터 정류장 하차--></span></p>
							</div>
						</div>
					</p>
				</div>
				<!-- 창원 2공장 --> 
				<div class="location_tab_cont">
				
					<div class="api_box" id="locatioin_tap2"></div>
					
					<strong class="location_tit" title="<spring:message code="company.changwon2"/>"><spring:message code="company.changwon2"/><!--창원 2공장--></strong>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.phone"/>"><spring:message code="company.phone"/><!--대표번호--></span></span>
						<span class="lo_td"><span title="055-299-0536">055-299-0536</span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="FAX">FAX</span></span>
						<span class="lo_td"><span title="055-299-0538">055-299-0538</span></span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.address"/>"><spring:message code="company.address"/><!--주소--></span></span>
						<span class="lo_td"><span title="<spring:message code="company.address.changwon2"/>"><spring:message code="company.address.changwon2"/><!--51542 경상남도 창원시 성산구 곰절길 28번길 2 (성주동)--></span></span>
					</p>
					<p class="lo_tr transport">
						<span class="lo_th"><span title="<spring:message code="company.directions"/>"><spring:message code="company.directions"/><!--찾아오시는 길--></span></span>
						<div class="transport_box">
							<div class="transport_in train">
								<strong><spring:message code="company.subway"/><!--지하철--></strong>
								<p title="<spring:message code="company.address.changwon2.ktx"/>"><span class="indigo sign" title="KTX">KTX</span><span class="transport_txt"><spring:message code="company.address.changwon2.ktx"/><!--창원중앙역 하차 후 210  버스 탑승, 남양개나리3차아파트 정류장 하차, 213버스 승차, 천선일반산업단지 정류장에서 하차, 300m 근방--></span></p>
							</div>
							<div class="transport_in bus">
								<strong><spring:message code="company.bus"/><!--버스--></strong>
								<p title="<spring:message code="company.address.changwon2.bus"/>"><span class="red sign" title="<spring:message code="company.expressBus"/>"><spring:message code="company.expressBus"/><!--고속버스--></span><span class="transport_txt"><spring:message code="company.address.changwon2.bus"/><!--창원종합버스터미널 하차후 151 버스 탑승, 성주동종점 정류장 하차--></span></p>
							</div>
						</div>
					</p>
				</div>
				<!-- 서울 연구소 --> 
				<div class="location_tab_cont">
				
					<div class="api_box" id="locatioin_tap3"></div>
					
					<strong class="location_tit" title="<spring:message code="company.seoul"/>"><spring:message code="company.seoul"/><!--서울 연구소--></strong>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.phone"/>"><spring:message code="company.phone"/><!--대표번호--></span></span>
						<span class="lo_td"><span title="02-852-1007">02-852-1007</span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="FAX">FAX</span></span>
						<span class="lo_td"><span title="02-852-0888">02-852-0888</span></span>
					</p>
					<p class="lo_tr">
						<span class="lo_th"><span title="<spring:message code="company.address"/>"><spring:message code="company.address"/><!--주소--></span></span>
						<span class="lo_td"><span title="<spring:message code="company.address.seoul"/>"><spring:message code="company.address.seoul"/><!--08380 서울시 구로구 디지털로33길 11 에이스테크노타워8차 401호, 1207호--></span></span>
					</p>
					<p class="lo_tr transport">
						<span class="lo_th"><span title="<spring:message code="company.directions"/>"><spring:message code="company.directions"/><!--찾아오시는 길--></span></span>
						<div class="transport_box">
							<div class="transport_in train">
								<strong><spring:message code="company.subway"/><!--지하철--></strong>
								<p title="<spring:message code="company.address.seoul.subway1"/>"><span class="green sign" title="<spring:message code="company.subway.line2"/>"><spring:message code="company.subway.line2"/><!--2호선--></span><span class="transport_txt"><spring:message code="company.address.seoul.subway1"/><!--구로디지털단지역 3번 출구 도보 10분--></span></p>
								<p title="<spring:message code="company.address.seoul.subway2"/>"><span class="dark_green sign" title="<spring:message code="company.subway.line7"/>"><spring:message code="company.subway.line7"/><!--7호선--></span><span class="transport_txt"><spring:message code="company.address.seoul.subway2"/><!--남구로역 1번 출구 도보 20분--></span></p>
							</div>
							<div class="transport_in bus">
								<strong><spring:message code="company.bus"/><!--버스--></strong>
								<p title="<spring:message code="company.address.seoul.bus"/>"><span class="indigo sign" title="<spring:message code="company.townBus"/>"><spring:message code="company.townBus"/><!--마을버스--></span><span class="transport_txt"><spring:message code="company.address.seoul.bus"/><!--구로디지털단지역 정류장 하차 도보 10분--></span></p>
							</div>
						</div>
					</p>
				</div>
			</div>
		</div>

		<!-- 리모콘 -->
		<div class="remote">
			<!-- <a href="javascript:;" class="btn_company_download" onclick="companyData();" title="회사소개 자료">회사소개 자료</a>
			<a href="javascript:;" class="btn_company_video" onclick="pupShowHide('movie');" title="회사홍보 동영상">회사홍보 동영상</a> -->
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