<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<meta http-equiv="Content-Type" content="text/html;" charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="Resource-type" content="Document" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />
<spring:eval expression="@config['URL_FRONT_UPLOAD']" var="uploadUrl" />
<spring:eval expression="@config['URL_FILE_AFF']" var="affUrl" />
<spring:eval expression="@config['URL_FILE_NOTICE']" var="noticeUrl" />
<spring:eval expression="@config['URL_FILE_COMPANY']" var="companyUrl" />
<link rel="shortcut icon" type="text/css" href="${imgUrl}comm/kat_favicon.ico">
<script type="text/javascript" src="${jsUrl}common/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${jsUrl}common/ajax.googleapis-jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${cssUrl}admin/comm.css" />
<link rel="stylesheet" type="text/css" href="${cssUrl}admin/pup.css" />
<link rel="stylesheet" type="text/css" href="${cssUrl}jquery-ui.min.css" />
<script type="text/javascript" src="${jsUrl}common/jquery-ui.min.js"></script>
<script type="text/javascript" src="${jsUrl}common/html5.js"></script>
<script type="text/javascript" src="${jsUrl}admin/comm.js"></script>
<title>KAT</title>
</head>
<body>
	<div class="wrap">
		<input type="hidden" id="aff_url" value="${affUrl}" >
		<input type="hidden" id="notice_url" value="${noticeUrl}" >
		<input type="hidden" id="company_url" value="${companyUrl}" >
		<input type="hidden" id="upload_url" value="${uploadUrl}" >
		<input type="hidden" id="img_url" value="${imgUrl}" >
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>


