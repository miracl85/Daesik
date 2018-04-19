<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<spring:eval expression="@config['URL_FRONT_UPLOAD']" var="uploadUrl" />


<section class="content">
	<div class="sub_head civilian">
		<div class="sub_head_inner">
			<strong title="<spring:message code="business.commercial"/>"><spring:message code="business.commercial"/><!--민수 사업--></strong>
			<p><spring:message code="business.commercial.content1"/><!--4차 산업혁명을 선도하는 초정밀 가공기술로--><br/><spring:message code="business.commercial.content2"/><!--다양한 사업으로의 적용 및 확장 능력 보유--></p>
			<a href="javascript:;" onclick="mainMenuArrow('diff');"  title="<spring:message code="business.defense"/>" class="left_list_arrow"><spring:message code="business.defense"/><!--방산사업--></a>
			<a href="javascript:;" onclick="mainMenuArrow('cmnt');" title="<spring:message code="common.community"/>" class="right_list_arrow"><spring:message code="common.community"/><!--커뮤니티--></a>
		</div>
	</div>
	<div class="sub_content">
		<ul id="" class="sub_ul tabs tow_tabs">
			<li id="smt_li" onclick="tabEvent('smt');"  class="active" title="<spring:message code="business.commercial.chip"/>"><spring:message code="business.commercial.chip"/><!--칩마운터--></li>
			<li id="robot_li" onclick="tabEvent('robot');"  class="" title="<spring:message code="business.commercial.robot"/>"><spring:message code="business.commercial.robot"/><!--협동로봇--></li>
		</ul>
		
		<!-- tab1 -->
		<div id="smt_tab_view"  class="tab-content">
			<strong class="company_topic"><spring:message code="business.commercial.chip"/><!--칩마운터--></strong>
			<p class="tit_explain"><spring:message code="business.commercial.chip.content"/><!--칩마운터는 회로기판(PCB) 위에 전자부품을 자동으로 삽입하는 장비--></p>
			<!--칩마운터 상품 안내-->
			<div class="product_dp_wrap">
				<div class="product_dp_box orange" title="<spring:message code="business.commercial.highChip"/>"><!--고속 칩마운터-->
					<div class="product_img img01"></div>
					<div class="product_info_box db_box01">
						<div class="product_info_inner">
							<span class="ico_product_dp high_chip"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.highChip"/><!--고속 칩마운터--></strong>
							<p class="product_dp_txt">High-Speed Chip Mounter</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.productName"/><!--제품명--></span>
							<p class="product_cont_txt"><spring:message code="business.commercial.highChip.explain1"/><!--엑센프로M, 엑센프로 D--></p>
							<span class="product_sub_tit"><spring:message code="business.commercial.highChip.explain2"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.highChip.explain3"/><!-- 시간 당 60,000~120,000개 이상의 칩 장착가능 --></li>
								<li><spring:message code="business.commercial.highChip.explain4"/><!-- 1.25m의 초슬림형 디자인 --></li>
								<li><spring:message code="business.commercial.highChip.explain5"/><!-- 주로 소형기판 및 실장부품 수가 많으며 대량생산이 요구되는 모바일 기기 업종 등에서 사용 --></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product_dp_box orange_red " title="<spring:message code="business.commercial.mediunChip"/>"><!--중속 칩마운터-->
					<div class="product_img img02"></div>
					<div class="product_info_box db_box02">
						<div class="product_info_inner">
							<span class="ico_product_dp medium_chip"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.mediunChip"/><!--중속 칩마운터--></strong>
							<p class="product_dp_txt">Medium-Speed Mounter</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.productName"/><!--제품명--></span>
							<p class="product_cont_txt">Decan S2, L2, F2</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.highChip.explain2"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.mediunChip.explain3"/><!--시간당 50,000~92,000개 이상 의 칩 장착가능--></li>
								<li><spring:message code="business.commercial.mediunChip.explain4"/><!--저렴한 유지비와 제품가격--></li>
								<li><spring:message code="business.commercial.mediunChip.explain5"/><!--넓은 범위의 부품 대응--></li>
								<li><spring:message code="business.commercial.mediunChip.explain6"/><!--주로 LCD 디스플레이, 자동차 전장, LED 조명 등에서 사용--></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--홍보영상-->
			<div class="promotion_cont">
				<div class="promotion_inner">
					<strong class="promotion_tit"><spring:message code="business.commercial.video"/><!--홍보영상--></strong>
					<p class="promotion_txt"><spring:message code="business.commercial.chip.video.content"/><!--4 Gantry 형 고속 모듈러 마운터 EXCEN PRO --></p>
					<div class="promotion_video_box">
						<iframe id="if_chib" src="https://drive.google.com/file/d/1_-6P53ByP4959ZJGb5938fxAUZD7xd8w/preview"></iframe>
					</div>
					<div class="promotion_spec">
						<table class="tb1 video01">
							<colgroup>
								<col width="80">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td><span class="ico spec_ico1"></span></td>
									<td>
										<strong><spring:message code="business.commercial.chip.video.speed"/><!--속도--></strong>
										<p><spring:message code="business.commercial.chip.video.explain1"/><!--120,000 CPH (최적)--></p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico2"></span></td>
									<td>
										<strong><spring:message code="business.commercial.chip.video.structure"/><!--구조--></strong>
										<p>4 Gantry x 2/8/16 Spindles/Head</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico3"></span></td>
									<td>
										<strong><spring:message code="business.commercial.chip.video.accuracy"/><!--장착정도--></strong>
										<p>
											±35μm Cpk≥1.0 (Chip)<br/>
											±30μm Cpk≥1.0 (QFP)
										</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico4"></span></td>
									<td>
										<strong>PCB Size</strong>
										<p>
											(Min) L50xW50mm<br/>
											(Max) L350xW310mm
										</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico5"></span></td>
									<td>
										<strong><spring:message code="business.commercial.chip.video.feature"/><!--특징--></strong>
										<p>
											<spring:message code="business.commercial.chip.video.explain3"/><!--초경량 고속∙고정도 전동피더--><br/>
											<spring:message code="business.commercial.chip.video.explain4"/><!--세계 최초 자동 Spacing 및 Loading-->
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- //tab1 -->

		<!-- tab2 -->
		<div id="robot_tab_view"  class="tab-content active">
			<strong class="company_topic"><spring:message code="business.commercial.robot"/><!--협동로봇--></strong>
			<p class="tit_explain"><spring:message code="business.commercial.robot.content"/><!--KAT의 뛰어난 기술로 구조해석을 통한 경량화, 내구성을 갖춘 협동로봇--></p>
			<!--칩마운터 상품 안내-->
			<div class="product_dp_wrap">
				<div class="product_dp_box mini gray" title="<spring:message code="business.commercial.robot.auto"/>"><!--자동화 조립-->
					<div class="product_img img03"></div>
					<div class="product_info_box db_box03">
						<div class="product_info_inner">
							<span class="ico_product_dp icon03"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.robot.auto"/><!--자동화 조립--></strong>
							<p class="product_dp_txt">Automated Assembly</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.robot.auto.explain1"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.robot.auto.explain2"/><!--국내 최초 협동로봇--></li>
								<li><spring:message code="business.commercial.robot.auto.explain3"/><!--가반중량 : 3 ~ 12kg(3kg, 5kg, 12kg)--></li>
								<li><spring:message code="business.commercial.robot.auto.explain4"/><!--구성 축 : 6축--></li>
								<li><spring:message code="business.commercial.robot.auto.explain5"/><!--작업반경 : 600~1300mm--></li>
								<li><spring:message code="business.commercial.robot.auto.explain6"/><!--관절범위 : ±360°--></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product_dp_box mini navy " title="<spring:message code="business.commercial.robot.logistics"/>"><!--물류 이송-->
					<div class="product_img img04"></div>
					<div class="product_info_box db_box04">
						<div class="product_info_inner">
							<span class="ico_product_dp icon04"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.robot.logistics"/><!--물류 이송--></strong>
							<p class="product_dp_txt">Logistics Transfer</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.robot.logistics.explain1"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.robot.logistics.explain2"/><!--가벼운 소형 로봇에 센서와 제어 장치 내장--></li>
								<li><spring:message code="business.commercial.robot.logistics.explain3"/><!--기존 로봇대비 적은 초기 투자비--></li>
								<li><spring:message code="business.commercial.robot.logistics.explain4"/><!--정밀한 반복작업 가능--></li>
								<li><spring:message code="business.commercial.robot.logistics.explain5"/><!--인건비 대폭 절감--></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product_dp_box mini turquoise " title="<spring:message code="business.commercial.robot.welding"/>"><!--용접-->
					<div class="product_img img05"></div>
					<div class="product_info_box db_box05">
						<div class="product_info_inner">
							<span class="ico_product_dp icon05"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.robot.welding"/><!--용접--></strong>
							<p class="product_dp_txt">Welding</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.robot.welding.explain1"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.robot.welding.explain2"/><!--작업자와 동일 공간에서 작업 가능 (안전성)--></li>
								<li><spring:message code="business.commercial.robot.welding.explain3"/><!--세밀한 초정밀 작업 가능--></li>
								<li><spring:message code="business.commercial.robot.welding.explain4"/><!--외부 충격 예측 / 감지시  자동으로 정지--></li>
								<li><spring:message code="business.commercial.robot.welding.explain5"/><!--다이렉트 티칭 가능--></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="product_dp_box mini blue" title="<spring:message code="business.commercial.robot.manufacturing"/>"><!--제조-->
					<div class="product_img img06"></div>
					<div class="product_info_box db_box06">
						<div class="product_info_inner">
							<span class="ico_product_dp icon06"></span>
							<strong class="product_dp_tit"><spring:message code="business.commercial.robot.manufacturing"/><!--제조--></strong>
							<p class="product_dp_txt">Manufacturing</p>
							<span class="product_sub_tit"><spring:message code="business.commercial.robot.manufacturing.explain1"/><!--제품설명--></span>
							<ul class="product_cont_txt">
								<li><spring:message code="business.commercial.robot.manufacturing.explain2"/><!--다품종 소량생산체제 및 중소/중견기업에 적합--></li>
								<li><spring:message code="business.commercial.robot.manufacturing.explain3"/><!--비전문가 조작 가능--></li>
								<li><spring:message code="business.commercial.robot.manufacturing.explain4"/><!--유연한 작업 배치로 다양한 공정에 쉽고 빠르게 적용--></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--홍보영상-->
			<div class="promotion_cont">
				<div class="promotion_inner">
					<strong class="promotion_tit"><spring:message code="business.commercial.video"/><!--홍보영상--></strong>
					<p class="promotion_txt">Hanwha Collaborative Robotics (HCR-5)</p>
					<div class="promotion_video_box box02">
						<iframe id="if_hcr" src="https://drive.google.com/file/d/1kEpt9ERRfrzCpyvozmGtNgF1nwhbI8MB/preview"></iframe>
					</div>
					<div class="promotion_spec">
						<table class="tb1 video01">
							<colgroup>
								<col width="80">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td><span class="ico spec_ico6"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain1"/><!--자유도--></strong>
										<p><spring:message code="business.commercial.robot.video.explain2"/><!--6축 관절--></p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico7"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain3"/><!--가반중량--></strong>
										<p>5 Kg</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico8"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain4"/><!--작업반경--></strong>
										<p>915 mm</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico9"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain5"/><!--관절범위--></strong>
										<p>±360°</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico10"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain6"/><!--무게--></strong>
										<p>20 Kg</p>
									</td>
								</tr>
								<tr>
									<td><span class="ico spec_ico11"></span></td>
									<td>
										<strong><spring:message code="business.commercial.robot.video.explain7"/><!--속도--></strong>
										<p><spring:message code="business.commercial.robot.video.explain8"/><!--각축: 180°/sec, 툴: 1m/sec--></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- //tab2 -->
		
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
			<a href="javascript:remoteTop();" class="btn_top" title="TOP">TOP</a>
		</div>
		<!-- //리모콘 -->
	</div>
</section>