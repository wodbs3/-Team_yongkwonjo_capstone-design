<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">
<head>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<title>GroupList</title>
		
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    
    
    <style>
      .thead-dark {
    th {
      color: $table-dark-color;
      background-color: $table-dark-bg;
      border-color: $table-dark-border-color;
    }
  }
    page-title.txt {
    	font-size : 28px;
    	margin-bottom: 10px;
    	color: #333;
    }
    
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Introduce Page</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>


				<li><a href="introduce.do">소개</a></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> Introduce </span> </h2>
	</div>

<section class="pb-110">
		<div class="row margin_30">
		<div class="col-md-12" style="
    height: 500px;
">
			<div class="col-md-8 col-md-offset-2" style="
    height: 500px;
">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3193.093447355837!2d127.18103121524885!3d36.84023797994026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b293c64087a5b%3A0x81d1a65485393d8d!2z67Cx7ISd64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1574331374842!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
			</div> 
		</div>

		     <div class="col-md-12 mb-10">
             <h4></h4>
            <div class="col-md-4 mb-30">
             <h5> <i class="fa fa-car"></i> 자동차</h5>
             <p>E.IC방면</p>
             <p>1. 입장, 선거 방면 우회전</p>
             <p>2. 백석대학교, 백석문화대학 방면 우회전</p>
            </div>
            <div class="col-md-4 mb-30">
             <h5> <i class="fa fa-bus"></i> 버스</h5>
             <p>천안버스터미널 : 각지역고속버스터미널 또는 시외버스 터미널에서 천안행을 타신후 천안고속버스 터미널에서 하차, 길 건너 시내버스 정류장에서 시내버스(14,700,701,710,711) 또는 학교 셔틀버스(학기중에만 운영)를 타세요 약 10분</p>
            </div>

            <div class="col-md-4 mb-30">
             <h5><i class="fa fa-train"></i> 지하철</h5>
             <p>천안역 : 천안역(동문)에서 내리신후 택시 승강장 우측 버스정류장 맞은편에서 시내버스(700,701,710,711)를 타세요. 약 15분 소요</p>
             <p>두정역 : 두정역에서 내리신후 택시승강장 맞은편 버스정류장에서 시내버스 14번 또는 셔틀버스를 타세요. 약 15분소요</p>

            </div>
            </div>
	</div>
</section>



<%@ include file="../common/footer.jsp" %>


	
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
	
</body>
</html>
