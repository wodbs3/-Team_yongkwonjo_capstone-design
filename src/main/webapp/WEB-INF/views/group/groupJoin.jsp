<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144-precomposed.png">

	
	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
		
		<title>그룹 생성</title>
			
		<style type="text/css">
			div #emailOk {
				margin-bottom: 15px;
			}
			
			/* 아이디 / 비밀번호 입력 메세지 출력 */
			#idOk, #pwdFalse, #birthOk, #emailOk, #nameOk, #telOk, #imgOk {
				font-size: 12px;
				color: red;
			}
			#pwdOk {
				font-size: 12px;
			}
			
		</style>
		
	</head>

	<%@ include file="../common/header.jsp" %>
	
	<body>
	
	
	<div class="row margin_30">
	
<!-- Join Form -->
	<form action="groupJoin.do" method="POST" class="form-horizontal" style="margin-top:10%">
	
<!-- PlanText GroupName -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_name" class="control-label">그룹이름</label>
				<br>
			    <div class="col-sm-10">
			      <p class="form-control-static">someone@example.com</p>
			    </div>
			</div>
		</div>
		
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_introduce">자기소개</label>
				<br>
			    <div class="col-sm-10">
			      <p class="form-control-static">${loginMap.member_id } 님. 가입을 환영합니다.</p>
			    </div>
			</div>
		</div>
		
<!-- Join Button -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<button type="submit" class="col-md-12 btn btn-default" id="submit">그룹화면 이동</button>
			</div>
		</div>
		
	</form>
	
	</div>

    <!-- Common scripts -->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>
    <script src="/resources/js/common_scripts_min.js"></script>
    <script src="/resources/js/functions.js"></script>

    <!-- SLIDER REVOLUTION SCRIPTS  -->
    <script type="text/javascript" src="/resources/rev-slider-files/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript" src="/resources/rev-slider-files/js/extensions/revolution.extension.video.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<%@ include file="../common/footer.jsp" %>
	
	</body>
	
</html>
