<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
	<meta name="author" content="Ansonika">
	<title>CITY TOURS - City tours and travel site template by Ansonika</title>

	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<!-- Favicons-->
	<link rel="shortcut icon" href="/resources/img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="/resources/img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144-precomposed.png">
	
	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

	<!-- CSS -->
	<link href="/resources/css/base.css" rel="stylesheet">

	<!-- Radio and check inputs -->
	<link href="/resources/css/skins/square/grey.css" rel="stylesheet">

</head>

<body>

	<%@ include file="../common/header.jsp" %>
	
	<main>
		
		<!-- End position -->

		<div class="container margin_60" style="margin-top: 5%;">
			<div class="row">
				
				<!-- START group side form -->
				
				<aside class="col-md-4" id="sidebar">
					<div class="theiaStickySidebar">
						<div class="box_style_1" id="booking_box">
							<h3 class="inner">${groupDetail.grouplist_name}</h3>
							<p>여기엔 대표 이미지</p>
							<hr>
							<div class="form-inline">
								<p>키워드 ${groupDetail.grouplist_interest}</p>
								<p>7 / ${groupDetail.grouplist_people} (현재원 / 총원)</p>
							</div>
							<p>생성일 ${groupDetail.grouplist_date}</p>
							<hr>
							<p>${groupDetail.grouplist_introduce}</p>
						</div>
					</div>
					<!--End sticky -->
				</aside>
				
				<!-- END group side form -->
				
				<div class="col-md-8 add_bottom_15">
					<form id="groupForm" name="groupForm" method="post">
						<div class="row">
							<div class="col">
								<p></p>
								<ul class="nav nav-tabs">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#board">게시판</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#gallery">사진첩</a>
									</li>
									<li>
										<a class="nav-link" data-toggle="tab" href="#member">모임회원</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade" id="board">
										<p>그룹 게시판입니다.</p>
									</div>
									<div class="tab-pane fade" id="gallery">
										<p>그룹 사진첩입니다.</p>
									</div>
									<div class="tab-pane fade" id="member">
										<p>그룹 모힘회원입니다.</p>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!--End col-md-8 -->


			</div>
			<!--End row -->
		</div>
		<!--End container -->
	</main>
	<!-- End main -->

	<%@ include file="../common/footer.jsp" %>

	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i class="icon_set_1_icon-77"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search..." />
			<button type="submit"><i class="icon_set_1_icon-78"></i>
			</button>
		</form>
	</div><!-- End Search Menu -->
	
	<!-- Jquery -->
	<script src="/resources/js/jquery-2.2.4.min.js"></script>
	<script src="/resources/js/common_scripts_min.js"></script>
	<script src="/resources/js/functions.js"></script>

	<script src="/resources/js/icheck.js"></script>
	<script>
		$('input').iCheck({
			checkboxClass: 'icheckbox_square-grey',
			radioClass: 'iradio_square-grey'
		});
	</script>

	<!-- Fixed sidebar -->
	<script src="/resources/js/theia-sticky-sidebar.js"></script>
	<script>
		jQuery('#sidebar').theiaStickySidebar({
			additionalMarginTop: 80
		});
	</script>
	
	<script>
	//글쓰기
	function goCreate() {
		location.href="/GroupCreate.do";
	}

	function goLogin() {
		location.href="/login.do";
	}

	$(document).on('click', '#btnSearch', function(e){
	   e.preventDefault();
	   var url = "${requestScope['javax.servlet.forward.servlet_path']}";
	   url = url + "?searchType=" + $('#searchType').val();
	   url = url + "&keyword=" + $('#keyword').val();
	   location.href = url;
	   console.log(url);
	});
	</script>

</body>

</html>