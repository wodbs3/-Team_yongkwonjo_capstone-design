<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
	<meta name="author" content="Ansonika">
	<title>CITY TOURS - City tours and travel site template by Ansonika</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="img/favicon.ico" type="resources/image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon" href="resources/img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="resources/img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="resources/img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="resources/img/apple-touch-icon-144x144-precomposed.png">
	
	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

	<!-- CSS -->
	<link href="resources/css/base.css" rel="stylesheet">

	<!-- CSS -->
	<link href="resources/css/blog.css" rel="stylesheet">

	<!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body style="overflow: visible;"><div class="parallax-mirror" style="visibility: visible; z-index: 1; position: fixed; top: -100px; left: 0px; overflow: hidden; transform: translate3d(0px, 0px, 0px); height: 470px; width: 1519px;"><img class="parallax-slider" src="resources/img/bg_blog.jpg" style="transform: translate3d(0px, 0px, 0px); position: absolute; top: 61px; left: 0px; height: 509px; width: 1519px; max-width: none;"></div>

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

	<!-- Header================================================== -->
<%@ include file="../common/header.jsp" %>


	<section class="parallax-window" data-parallax="scroll" data-image-src="resources/img/bg_blog.jpg" data-natural-width="1400" data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Tour Blog</h1>
				<p>Ridiculus sociosqu cursus neque cursus curae ante scelerisque vehicula.</p>
			</div>
		</div>
	</section>
	<!-- End section -->

	<main style="margin-bottom: 354px;">
		<div id="position">
			<div class="container">
				<ul>
					<li><a href="index">Home</a>
					</li>
					<li><a href="gallery.do">갤러리</a></li>
					
				</ul>
			</div>
		</div>
		
		<!-- End position -->
		<div class="container margin_60">
			<div class="row">
				
				<div class="col-md-10">
					<div class="box_style_1">
						<div class="post nopadding">
						<div class="text-right">
			<a href="gallery.do" class="btn_1">목록</a>	
			<c:if test="${loginMap.member_id != null && loginMap.member_id == gallery.writer}">		
			<a href="updateForm.do?num=${gallery.num }" class="btn_1">수정</a>
			<a href="deleteGallery.do?num=${gallery.num }" class="btn_1">삭제</a>
			</c:if>
			</div>
							<img src="${pageContext.request.contextPath }/resources/upload/${gallery.fileName}" alt="Image" class="img-responsive">
							<div class="post_info clearfix">
								<div class="post-left">
									<ul>
										<li><i class="icon-calendar-empty"></i>On <span>${gallery.regDate }</span>
										</li>
									</ul>
								</div>
								<div class="post-right"><p>작성자: ${gallery.writer }</p></div>
								
							</div>
							<div class=box_style_2>
							
								<h4>${gallery.content }</h4>
							
							</div>
						</div>
						<!-- end post -->
					</div>
					<!-- end box_style_1 -->

					<h4>댓글</h4>
					<div class="post-right">
							<div id="general_rating"> Reviews
							</div>
							</div><br>
						
					<div id="comments">
					
						<ol>
							<li>
							
							<hr>		
							
							<!-- End review strip -->
						<c:forEach items="${commentList }" var="commentList">
							<div class="review_strip_single last">
								<img src="${pageContext.request.contextPath }/resources/img/avatar1.jpg" alt="Image" class="img-circle">
								<small> - ${commentList.comment_date } -</small>
								<br>
								<a href="commentDelete.do?num=${commentList.comment_number }" class="button_1"></a>
								<h4>아이디: <span>${commentList.comment_id }</span></h4>
								<hr>
								<p>
									${commentList.comment_content }
									
								</p>
							
							</div>
						</c:forEach>
							</li>
						</ol>
					</div>
					<!-- End Comments -->
					<br>
					<h4>댓글 달기</h4>
					<form action="commentInsert.do?num=${gallery.num }" method="post">
						<div class="form-group">
							<h4>작성자:</h4>
         					<input type="text" id="comment_id" name="comment_id" value="${loginMap.member_id }" readonly/>
							<textarea id="comment_content" name="comment_content" class="form-control style_2" style="height:150px;" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="reset" class="btn_1" value="Clear">
							<input type="submit" class="btn_1" value="댓글 달기">
						</div>
					</form>
				</div>
				<!-- End col-md-8-->

				

				
			</div>
			<!-- End row-->
		</div>
		<!-- End container -->
	</main>
	<!-- End main -->

	<%@ include file="../common/footer.jsp" %>

	<div id="toTop" style="display: block;"></div><!-- Back to top button -->
	
	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i class="icon_set_1_icon-77"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search...">
			<button type="submit"><i class="icon_set_1_icon-78"></i>
			</button>
		</form>
	</div><!-- End Search Menu -->



	<!-- Common scripts -->
	<script src="resources/js/jquery-2.2.4.min.js"></script>
	<script src="resources/js/common_scripts_min.js"></script>
	<script src="resources/js/functions.js"></script>
			
</body>
</html>