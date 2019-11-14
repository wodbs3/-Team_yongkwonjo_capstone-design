<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description"
	content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
<meta name="author" content="Ansonika">
<title>CITY TOURS - City tours and travel site template by
	Ansonika</title>

<!-- Favicons-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="img/apple-touch-icon-144x144-precomposed.png">

<!-- Google web fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i"
	rel="stylesheet">

<!-- CSS -->
<link href="css/base.css" rel="stylesheet">

<!-- Radio and check inputs -->
<link href="css/skins/square/grey.css" rel="stylesheet">

<!-- Range slider -->
<link href="css/ion.rangeSlider.css" rel="stylesheet">
<link href="css/ion.rangeSlider.skinFlat.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" charset="UTF-8"
	src="http://maps.googleapis.com/maps-api-v3/api/js/38/7/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="http://maps.googleapis.com/maps-api-v3/api/js/38/7/intl/ko_ALL/util.js"></script>

<style type="text/css">
img {
	display: block;
	max-width: 400px;
	max-height: 300px;
	width: auto;
	height: auto;
}
</style>
</head>

<body class="" style="overflow: visible;">
	<div class="parallax-mirror"
		style="visibility: visible; z-index: 1; position: fixed; top: 0px; left: 0px; overflow: hidden; transform: translate3d(0px, 0px, 0px); height: 470px; width: 1519px;">
		<img class="parallax-slider" src="img/header_bg.jpg"
			style="transform: translate3d(0px, 0px, 0px); position: absolute; top: -19px; left: 0px; height: 509px; width: 1519px; max-width: none;">
	</div>

	<!--[if lte IE 8]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
<![endif]-->

	<div id="preloader" style="display: none;">
		<div class="sk-spinner sk-spinner-wave">
			<div class="sk-rect1"></div>
			<div class="sk-rect2"></div>
			<div class="sk-rect3"></div>
			<div class="sk-rect4"></div>
			<div class="sk-rect5"></div>
		</div>
	</div>
	<!-- End Preload -->

	<div class="layer"></div>
	<!-- Mobile menu overlay mask -->

	<%@ include file="../common/header.jsp"%>

	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Gallery page</h1>
				<p>Ridiculus sociosqu cursus neque cursus curae ante scelerisque
					vehicula.</p>
			</div>
		</div>
	</section>
	<!-- End Section -->

	<main style="margin-bottom: 354px;">
	<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>


				<li><a href="${pageContext.request.contextPath }/gallery.do">사진첩</a></li>
			</ul>
		</div>
	</div>
	<!-- End Position -->

	<div class="container margin_60">
		<div class="main_title">
			<%-- 				<h2><span>${smallgroup.name}</span></h2> --%>
			<h2>
				<span>용권조 갤러리</span>
			</h2>
		</div>
		<hr>
		<div class="text-right">
		<c:if test="${loginMap.member_id == null}">
			<input type="button" class="btn_1" onclick="upload_btn(${loginMap.member_id})" value="사진 등록"/>
		</c:if>
		<c:if test="${loginMap.member_id != null }">
			<a href="upload.do" class="btn_1">사진 등록</a>
		</c:if>
		</div>
		<div class="hotel_container">
			<c:forEach items="${gallery}" var="galleryList">
				<div class="col-md-4 col-sm-4">
					<div class="img_container">
						<a
							href="${pageContext.request.contextPath }/galleryDetail.do?num=${galleryList.num}">
							<img width="auto" height="auto"
							src="${pageContext.request.contextPath }/resources/upload/${galleryList.fileName}"
							alt="Image">

						</a>

					</div>
					<!-- 						<div class="hotel_title"> -->
					<%-- 						<h3><strong>${galleryList.title}</strong></h3> --%>
					<!-- 						</div> -->

				</div>

			</c:forEach>
		</div>

		<!-- End row -->


	</div>
	<!-- End container -->
	<hr>
	<div class="text-center">
		<ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/gallery.do?page=${pageMaker.startPage-1 }"/>'> Previous </a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li>
        <a href='<c:url value="/gallery.do?page=${idx }"/>'><i class="fa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/gallery.do?page=${pageMaker.endPage+1 }"/>'> Next </a>
    </li>
    </c:if>
</ul>
	</div>

	</main>
	<!-- End main -->


	<div id="toTop" style="display: none;"></div>
	<!-- Back to top button -->

	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i
			class="icon_set_1_icon-77"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search...">
			<button type="submit">
				<i class="icon_set_1_icon-78"></i>
			</button>
		</form>
	</div>
	<!-- End Search Menu -->
	<%@ include file="../common/footer.jsp"%>

	<!-- Common scripts -->
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/common_scripts_min.js"></script>
	<script src="js/functions.js"></script>
	<script>
	
	function upload_btn(id) {
		
			alert("로그인을 해주세요");
		
	}
	</script>
	



</body>





</html>










