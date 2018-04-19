<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:eval expression="@config['SERVICE_URL']" var="localUrl" />
<spring:eval expression="@config['URL_FRONT_JS']" var="jsUrl" />
<spring:eval expression="@config['URL_FRONT_CSS']" var="cssUrl" />
<spring:eval expression="@config['URL_FRONT_IMG']" var="imgUrl" />

<!DOCTYPE html>
<html>
<head>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
<title>KAT Manager System</title>
<link rel="shortcut icon" type="text/css" href="${imgUrl}comm/kat_favicon.ico">
<link type="text/css" rel="stylesheet" href="${cssUrl}admin/login.css" />
<script type="text/javascript" src="${jsUrl}common/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${jsUrl}admin/placeholders.min.js"></script>
<script type="text/javascript" src="${jsUrl}admin/login.js"></script>
</head>
<body>
<div class="login_wrap">
	<div class="login_body">
		<h1>
			<img src="${imgUrl}admin/login/logo.gif" alt="soltworks">
		</h1>
		<form method="post" action="/loginProcessing" id="login_form" class="login_form" >
			<fieldset>
				<legend>login</legend>
				<h2>Manager <strong>System</strong></h2>
				<div class="item">
	                <label for="uid" class="ico_uid" style="position:absolute; visibility:visible;">ID</label>
	                <input type="text" id="user_id" class="i_text uid" name="user_id" placeholder="ID">
	            </div>
	            <div class="item">
		            <label for="upw" class="ico_upw" style="position:absolute; visibility:visible;">PASSWORD</label>
		            <input type="password" id="user_pw" class="i_text upw" name="user_pw" placeholder="PASSWORD" onkeydown="if(event.keyCode==13)login();">
		        </div>
				<input name="" type="button" class="btn_login" onclick="login();" value="Login" title="로그인">
				<span class="txt_info">*관리자만 접속 가능 합니다.</span><br>	
				<%-- <c:if test="${loginSF == 'F'}">
					<span class="login_info">*아이디 또는 비밀번호를 다시 확인하세요.</span>
				</c:if> --%>
			</fieldset>
		</form>
		<address>
			© KAT KOREA., all rights reserved
		</address>
	</div>
</div>


</body>
</html>

