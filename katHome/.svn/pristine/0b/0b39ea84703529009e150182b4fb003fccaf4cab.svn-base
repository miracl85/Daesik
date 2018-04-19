<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<script type="text/javascript" src="${jsUrl}admin/comm.js"></script>

<header>
	<h1>
		<a href="/admin/dashBoard" title="KAT"><img src="${imgUrl}admin/comm/logo.gif" alt="Soltworks Solutions for you" /></a>
	</h1>
	<div class="util">
		<span class="user_name"><span id="user_id" name="user_id">${userId}</span>님 로그인하셨습니다.</span>
		<a href="/admin/logout" class="logout" title="로그아웃">로그아웃</a>
	</div>
</header>

<nav>
	<ul>
		<li>
			<span>
				<a href="/admin/notice" class="notice" id="notice" title="공지사항">공지사항</a>
			</span>
		</li>
		<li>
			<span>
				<a href="/admin/affiliate" class="site" id="affiliate" title="주요 고객사">주요 고객사</a>
			</span>
		</li>
		<li>
			<span>
				<a href="/admin/history" class="history" id="history" title="회사연혁">회사연혁</a>
			</span>
		</li>
		<li>
			<span>
				<a href="/admin/update" class="company" id="update" title="회사자료 업데이트">회사자료 업데이트</a>
			</span>
		</li>
		
		<li>
			<span>
				<a href="/admin/statisticsOs" class="statistics" id="statistics" title="통계">통계</a>
			</span>
			<ul style="display: none;" id="stats_list">
				<li ><a href="/admin/statisticsOs" id="statistics_os">OS/Browser 별 접속통계</a></li>
				<li><a href="/admin/statisticsDevice" id="statistics_device">Device Cat 별 접속통계</a></li>
				<li><a href="/admin/statisticsMobile" id="statistics_mobile">Mobile 기기별 접속통계</a></li>
				<li><a href="/admin/statisticsCountry" id="statistics_country">국가별 접속통계</a></li>
				<li><a href="/admin/statisticsPage" id="statistics_page">페이지별 접속통계</a></li>
			</ul>
		</li>
	</ul>
</nav>