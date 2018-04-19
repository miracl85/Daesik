<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<script type="text/javascript" src="${jsUrl}common/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${jsUrl}diffusion.js"></script>

<section class="content">
	<div class="sub_head diffusion">
		<div class="sub_head_inner">
			<strong title="방산 사업">방산 사업</strong>
			<p>최첨단 시스템과 탁월한 R&D인력으로 개발부터 양산까지<br/> 완제품을 Turn-Key로 공급할 수 있는 역량을 보유</p> 
			<a href="javascript:;" onclick="mainMenuArrow('intro');" title="회사소개" class="left_list_arrow">회사소개</a>
			<a href="javascript:;" onclick="mainMenuArrow('civi');" title="민수사업" class="right_list_arrow">민수사업</a>
		</div>
	</div>
	<div class="sub_content">
		<ul id="" class="sub_ul tabs tow_tabs">
			<li id="kebinet_li" onclick="tabEvent('kebinet');" class="active" title="캐비닛">캐비닛</li>
			<li id="consol_li" onclick="tabEvent('consol');" class="" title="콘솔">콘솔</li>
		</ul>
		
		<!-- tab1 -->
		<div id="kebinet_tab_view" class="tab-content active">
			<strong class="company_topic">캐비닛</strong>
			<p class="tit_explain">무기체계의 설계부터 가공 및 제작까지 전 공정을 설계하고 해석하는 통합된 소요기술을 바탕으로 <br/> 육군, 해군, 공군 등 소요군에서 사용하는 모든 체계용 캐비닛을 개발하고 양산합니다</p>
			<div class="section_cont">
				<ul class="slider">
					<li>
						<img src="${imgUrl}sub/img_slider1.png">
						<div class="slider_info">
							<strong></strong>
							<strong>육군 캐비닛</strong>
							<p>#L-SAM #TICN</p>
						</div>
					</li>
					<li>
						<img src="${imgUrl}sub/img_slider2.png">
						<div class="slider_info">
							<strong></strong>
							<strong>잠수정 캐비닛</strong>
							<p>#장보고-ll #장보고-lll</p>
						</div>
					</li>
					<li>
						<img src="${imgUrl}sub/img_slider3.png">
						<div class="slider_info">
							<strong></strong>
							<strong>함정 캐비닛</strong>
							<p>#FFX-II#PKX-B#LPH#KDX-I#FRIGATE</p>
						</div>
					</li>
				</ul>
				<div class="txt_capability">
					<strong>Capability</strong>
					<p>기구설계, 시뮬레이션, 기구해석, 진동해석, 열유동해석, 하네스 설계, H/W 설계 및 가공</p>
				</div>
			</div>
			
			<div class="cont_sub_box">
				<strong class="sub_topic">Types and Spec</strong>
				<p class="tit_sub_explain">육군, 해군, 공군 등 소요군에서 사용되는 캐비닛의 전 공정 (디자인, H/W, 하네스 설계 및 통합 기술)에 대한 Turn-key 제조 능력을 보유</p>
				<div class="section_cont">
					<div class="spec_grid antenna" onClick="specClick('antenna');" title="안테나 통합 캐비닛">
						<strong>안테나 통합 캐비닛</strong>
						<p><span>적용 장비</span> 바로보기</p>
						<div class="lin_animation">
							<div class="lin_ani_top"></div>
							<div class="lin_ani_right"></div>
							<div class="lin_ani_bottom"></div>
							<div class="lin_ani_left"></div>
						</div>
					</div>
					<div class="spec_cont antenna_cont" id="antenna">
						<strong>적용장비</strong>
						<span class="img_spec"><img src="${imgUrl}sub/img_spec_antenna.gif" alt=""></span>
						<ul>
							<li>- 캐비닛 하우징</li>
							<li>- 내부 및 외부 연동 시스템 개발</li>
							<li>- 내부 및 외부공조 시스템 연동</li>
							<li>- MIL-STD Qualified(온도/습도, 진동, 충격 등)</li>
						</ul>
						<p>*해당 사례: 장거리 지대공 미사일(L-SAM)</p>
						<a href="javascript:;" class="btn_spec_close" onClick="specClose()">닫기</a>
					</div>
					
					
					<div class="spec_grid combine" onClick="specClick('combine');" title="통신용 통합 캐비닛">
						<strong>통신용 통합 캐비닛</strong>
						<p><span>적용 장비</span> 바로보기</p>
						<div class="lin_animation">
							<div class="lin_ani_top"></div>
							<div class="lin_ani_right"></div>
							<div class="lin_ani_bottom"></div>
							<div class="lin_ani_left"></div>
						</div>
					</div>
					<div class="spec_cont combine_cont" id="combine">
						<strong>적용장비</strong>
						<span class="img_spec"><img src="${imgUrl}sub/img_spec_combine.gif" alt=""></span>
						<ul>
							<li>- 외부 장비와 연동</li>
							<li>- 전투체계 데이터베이스 제공</li>
							<li>- 영상 분배, 기록, 저장, 소나음성 저장 및 분석</li>
						</ul>
						<p>*해당 사례 : 전술정보통신체계(TICN)</p>
						<a href="javascript:;" class="btn_spec_close" onClick="specClose()">닫기</a>
					</div>
					
					<div class="spec_grid system" onClick="specClick('system');" title="전투체계 시스템캐비닛">
						<strong>전투체계 시스템캐비닛</strong>
						<p><span>적용 장비</span> 바로보기</p>
						<div class="lin_animation">
							<div class="lin_ani_top"></div>
							<div class="lin_ani_right"></div>
							<div class="lin_ani_bottom"></div>
							<div class="lin_ani_left"></div>
						</div>
					</div>
					<div class="spec_cont system_cont" id="system">
						<strong>적용장비</strong>
						<span class="img_spec"><img src="${imgUrl}sub/img_spec_system.gif" alt=""></span>
						<ul>
							<li>- 외부 장비와 연동</li>
							<li>- 전투체계 데이터베이스 제공</li>
							<li>- 영상 분배, 기록, 저장, 소나음성 저장 및 분석</li>
						</ul>
						<p>*해당 사례 : 전술정보통신체계(TICN)</p>
						<a href="javascript:;" class="btn_spec_close" onClick="specClose()">닫기</a>
					</div>
						
					<div class="bg_transparent"></div>
				</div>
			</div>
		</div>
		<!-- //tab1 -->

		<!-- tab2 -->
		<div id="consol_tab_view" class="tab-content">
			<strong class="company_topic">콘솔(Console)</strong>
			<p class="tit_explain">운용자에게 필요한 정보를 전달, 지휘통제를 수행하는 장비</p>
			<div class="console_sub_box">
				<ul class="console_info">
					<li>
						<img src="${imgUrl}sub/console_info1.png" alt="진동 및 충격 완화 기능">
						<strong>진동 및 충격 완화 기능</strong>
						<p>고온, 충격, 진동, EMI/EMC <br/>부분 MIL 스펙 인증</p>
					</li>
					<li>
						<img src="${imgUrl}sub/console_info2.png" alt="경량화">
						<strong>경량화</strong>
						<p>카본 신소재(CFRP) 적용을<br/>통한 제품 경량화</p>
					</li>
					<li>
						<img src="${imgUrl}sub/console_info3.png" alt="활용 기능">
						<strong>활용 기능</strong>
						<p>지휘통제, 무장할당, 전시제어,<br/>시스템 제어 등 다양한 분야에 활용</p>
					</li>
				</ul>
			</div>
			
			<div class="developmen_form">
				<strong class="sub_topic_type"><span>Development</span> Competency</strong>
				<ul>
					<li>
						<a href="javascript:;" onclick="scrolling('carbon')" class="carbon" title="임무통제장치 바로가기">
							<span>Project Name</span>
							<strong>임무통제장치<span>Carbon Fiber Naval Console</span></strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="임무통제장치 바로가기">
						</a>
					</li>
					<li>
						<a href="javascript:;" onclick="scrolling('kss')" class="kss" title="KSS-III 체계시뮬레이터 다기능 콘솔 바로가기">
							<span>Project Name</span>
							<strong>KSS-III 체계시뮬레이터<br/>다기능 콘솔(공랭식)</strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="KSS-III 체계시뮬레이터 다기능 콘솔 바로가기">
						</a>
					</li>
					<li>
						<a href="javascript:;" onclick="scrolling('ecdis')" class="ecdis" title="ECDIS System 바로가기">
							<span>Project Name</span>
							<strong>ECDIS System</strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="ECDIS System 바로가기">
						</a>
					</li>
					<li>
						<a href="javascript:;" onclick="scrolling('robot')" class="robot" title="다중로봇 통합지휘통제 시스템 바로가기">
							<span>Project Name</span>
							<strong>다중로봇<br/>통합지휘통제 시스템</strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="다중로봇 통합지휘통제 시스템 바로가기">
						</a>
					</li>
					<li>
						<a href="javascript:;" onclick="scrolling('cds')" class="cds" title="CDS System Console 바로가기">
							<span>Project Name </span>
							<strong>CDS<br/>System Console</strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="CDS System Console 바로가기">
						</a>
					</li>
					<li>
						<a href="javascript:;" onclick="scrolling('engine')" class="engine" title="Engine Control System Console 바로가기">
							<span>Project Name </span>
							<strong>Engine Control<br/>System Console</strong>
							<img src="${imgUrl}sub/img_developmen_arrow.png" alt="Engine Control System Console 바로가기">
						</a>
					</li>
				</ul>
			</div>
			
			<!-- 임무통제장치 part -->
			<div class="competency_part section_cont scro_carbon">
				<span class="img_product"><img src="${imgUrl}sub/img_product_carbon.png" alt="임무통제장치(Carbon Fiber Naval Console)"></span>
				<div class="spec_info_form">
					<strong>임무통제장치<span>(Carbon Fiber Naval Console)</span></strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>온도/습도 (MIL-STD-810G)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>충격  (MIL-STD-901D)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>진동  (MIL-STD-167-1, Type1)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico4"></span></td>
								<td>전자파(EMI/EMC)(MIL-STD-461F)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico5"></span></td>
								<td>KS C IEC 60529:2006</td>
							</tr>
						</tbody>
					</table>
					
					<ul class="spec_detail type_three">
						<li><span>크기 : 600 x 750 x 1800</span></li>
						<li><span>Console Housing</span></li>
						<li class="bd_none"><span>4 Display 24”x2, 10.4”, 3”</span></li>
						<li class="bd"><span>Track Ball/Keyboard</span></li>
						<li class="bd_none"><span>Isolator Mounting</span></li>
						<li><span class="emphasis">주 재질 : CFRP<br/>(Carbon Fiber Reinforced Plastic)</span></li>
					</ul>
				</div>
			</div>
			<!-- //임무통제장치 part -->
			
			<!-- KSS-III 체계시뮬레이터 다기능 콘솔  part -->
			<div class="competency_part section_cont scro_kss">
				<span class="img_product"><img src="${imgUrl}sub/img_product_kss.png" alt="KSS-III 체계시뮬레이터 다기능 콘솔 "></span>
				<div class="spec_info_form">
					<strong>KSS-III 체계시뮬레이터 다기능 콘솔 <span>(공랭식)</span></strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>온도/습도 (MIL-STD-810G)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>충격  (MIL-STD-901D)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>진동  (MIL-STD-167-1, Type1)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico4"></span></td>
								<td>전자파(EMI/EMC)  (MIL-STD-461F)</td>
							</tr>
						</tbody>
					</table>
					<p class="spec_exam_p mt">- 네트워크 기반 또는 자율구성</p>
					<p class="spec_exam_p">- 시스템, 플랫폼 및 프로그램간 전송 가능</p>
					<ul class="spec_detail type_tow">
						<li><span>Console Housing</span></li>
						<li><span>3 Display 20.1”, 8.4”</span></li>
						<li><span>Joysticks/Track Ball/Keyboard</span></li>
						<li><span>Isolator Mounting</span></li>
					</ul>
				</div>
			</div>
			<!-- //KSS-III 체계시뮬레이터 다기능 콘솔  part -->
			
			<!-- ECDIS System part -->
			<div class="competency_part section_cont scro_ecdis">
				<span class="img_product"><img src="${imgUrl}sub/img_product_ecdis.png" alt="ECDIS System "></span>
				<div class="spec_info_form">
					<strong>ECDIS System</strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>진동 (MIL-STD-167)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>전자파(EMI/EMC) (MIL-STD-461)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>환경/신뢰성 (MIL-STD-810)</td>
							</tr>
						</tbody>
					</table>
					<p class="spec_exam_p mt">- 네트워크 기반 또는 자율구성</p>
					<p class="spec_exam_p">- 시스템, 플랫폼 및 프로그램간 전송 가능</p>
					<ul class="spec_detail type_tow">
						<li><span>Console Housing</span></li>
						<li><span>5 Display 32, 20.1”</span></li>
						<li><span>Track Ball/Keyboard</span></li>
						<li><span>Isolator Mounting</span></li>
					</ul>
				</div>
			</div>
			<!-- //ECDIS System  part -->
			
			<!-- 다중로봇 통합지휘통제 시스템 part -->
			<div class="competency_part section_cont scro_robot">
				<span class="img_product"><img src="${imgUrl}sub/img_product_robot.png" alt="다중로봇 통합지휘통제 시스템 "></span>
				<div class="spec_info_form">
					<strong>다중로봇 통합지휘통제 시스템</strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>온도/습도 (MIL-STD-810G)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>충격 (MIL-STD-901D)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>진동  (MIL-STD-167-1, Type1)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico4"></span></td>
								<td>전자파(EMI/EMC) (MIL-STD-461-F)</td>
							</tr>
						</tbody>
					</table>
					<ul class="spec_detail type_three">
						<li><span>19” Commercial Rack  Mount</span></li>
						<li><span>20.1” Rugged lcd 탑재</span></li>
						<li class="full_li"><span>Rugged Design</span></li>
					</ul>
				</div>
			</div>
			<!-- //다중로봇 통합지휘통제 시스템  part -->
			
			<!-- CDS System Console part -->
			<div class="competency_part section_cont scro_cds">
				<span class="img_product"><img src="${imgUrl}sub/img_product_cds.png" alt="CDS System Console "></span>
				<div class="spec_info_form">
					<strong>CDS System Console</strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>충격 (MIL-STD-901D)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>진동 (MIL-STD-167)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>전자파(EMI/EMC) (MIL-STD-461)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico4"></span></td>
								<td>환경/신뢰성 (MIL-STD-810)</td>
							</tr>
						</tbody>
					</table>
					<p class="spec_exam_p mt">- 네트워크 기반 또는 자율구성</p>
					<p class="spec_exam_p">- 시스템, 플랫폼 및 프로그램간 전송 가능</p>
					<ul class="spec_detail type_tow">
						<li><span>Console Housing</span></li>
						<li><span>2 Display 20.1”</span></li>
						<li><span>Joysticks/Track Ball/Keyboard</span></li>
						<li><span>Isolator Mounting</span></li>
					</ul>
				</div>
			</div>
			<!-- //CDS System Console part -->
			
			<!-- Engine Control System Console part -->
			<div class="competency_part section_cont scro_engine">
				<span class="img_product"><img src="${imgUrl}sub/img_product_engine.png" alt="Engine Control System Console"></span>
				<div class="spec_info_form">
					<strong>Engine Control System Console</strong>
					<p class="spec_mim_tit">MIL-STD Qualified </p>
					<table class="tb1">
						<colgroup>
							<col width="80" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td><span class="ico console_ico1"></span></td>
								<td>충격 (MIL-STD-901D)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico2"></span></td>
								<td>진동 (MIL-STD-167)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico3"></span></td>
								<td>전자파(EMI/EMC) (MIL-STD-461)</td>
							</tr>
							<tr>
								<td><span class="ico console_ico4"></span></td>
								<td>환경/신뢰성 (MIL-STD-810)</td>
							</tr>
						</tbody>
					</table>
					<p class="spec_exam_p mt">- 네트워크 기반 또는 자율구성</p>
					<p class="spec_exam_p">- 시스템, 플랫폼 및 프로그램간 전송 가능</p>
					<ul class="spec_detail type_tow">
						<li><span>Console Housing</span></li>
						<li><span>2 Display 20.1”</span></li>
						<li><span>Joysticks/Track Ball/Keyboard</span></li>
						<li><span>Isolator Mounting</span></li>
					</ul>
				</div>
			</div>
			<!-- //CDS System Console part -->
		</div>
		<!-- //tab2 -->
		
		<!-- 리모콘 -->
		<div class="remote">
			<!-- <a href="javascript:;" class="btn_company_download" onclick="companyData();" title="회사소개 자료">회사소개 자료</a>
			<a href="javascript:;" class="btn_company_video" onclick="pupShowHide('movie');" title="회사홍보 동영상">회사홍보 동영상</a> -->
			<a href="http://gw.soltworks.com/" target="_blank" class="btn_company_groupware" title="그룹웨어">그룹웨어</a>
			<div class="share_util">
				<a href="javascript:;" class="btn_company_share" title="공유하기">공유하기</a>
				<ul class="share_form">
					<li>
						<a href="javascript:shareFacebook('http://www.katkorea.co.kr/');" class="btn_facebook" title="페이스북">페이스북</a>
					</li>
					<li>
						<a href="javascript:shareTwitter('http://www.katkorea.co.kr/');" class="btn_twitter" title="트위터">트위터</a>
					</li>
				</ul>
			</div>
			<a href="javascript:remoteTop();" class="btn_top" title="TOP">TOP</a>
		</div>
		<!-- //리모콘 -->
	</div>
</section>