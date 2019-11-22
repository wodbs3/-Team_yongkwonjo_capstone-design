<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	<meta name="description"
		content="Citytours - Premium site template for city tours agencies, transfers and tickets.">
	<meta name="author" content="Ansonika">
	<title>CITY TOURS - City tours and travel site template by
		Ansonika</title>
	
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<!-- Favicons-->
	<link rel="shortcut icon" href="/resources/img/favicon.ico"
		type="image/x-icon">
	<link rel="apple-touch-icon" type="image/x-icon"
		href="/resources/img/apple-touch-icon-57x57-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
		href="/resources/img/apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
		href="/resources/img/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
		href="/resources/img/apple-touch-icon-144x144-precomposed.png">
	
	<!-- Google web fonts -->
	<link
		href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i"
		rel="stylesheet">
	
	<!-- CSS -->
	<link href="/resources/css/base.css" rel="stylesheet">
	
	<!-- Radio and check inputs -->
	<link href="/resources/css/skins/square/grey.css" rel="stylesheet">
	
	<style type="text/css">
	img {
		display: block;
		max-width: 300px;
		max-height: 200px;
		width: auto;
		height: auto;
	}
	
	/* .fouc { */
	/* 	display: none; */
	/* } */
	.myButton {
		box-shadow:inset 0px 1px 0px 0px #97c4fe;
		background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
		background-color:#3d94f6;
		border-radius:6px;
		border:1px solid #337fed;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px 1px 0px #1570cd;
	}
	.myButton:hover {
		background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
		background-color:#1e62d0;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}
	</style>
	
	
	<style>
	
	ul>li:hover>a, ul>li:focus>a, ul>li:active>a, ul>li.active>a {
		color: yellow;
		background-color: #000;
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
				<h1>GroupInfo page</h1>
			</div>
		</div>
	</section>
	<main>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><a href="${pageContext.request.contextPath }/group/GroupList.do">게시판 목록 </a></li>

				<li><b>그룹상세</b></li>
			</ul>
		</div>
	</div>
		
		<!-- End position -->

		<div class="container margin_60">
			<div class="row">

				<!-- START group side form -->
<!--  기준 -->

			<aside class="col-md-4" id="sidebar">
				<div class="theiaStickySidebar">
					<div class="box_style_1" id="booking_box">

						<h3 class="inner">${smallGroupDetail.somoim_name}</h3>
						<hr>
						<div class="form-inline">
							<p>장소 ${smallGroupDetail.somoim_place }</p>
							<p>회비 ${smallGroupDetail.somoim_price}</p>
							<p>일시 ${smallGroupDetail.somoim_date }
						<c:choose>
							<c:when
								test="${loginMap.member_group1 eq groupDetail.grouplist_number || loginMap.member_group2 eq groupDetail.grouplist_number || loginMap.member_group3 eq groupDetail.grouplist_number}">
								<button style="width:100%;" class="myButton" value="${groupDetail.grouplist_number }">이미 가입된
									모임입니다.</button>
							</c:when>
							<c:when
								test="${loginMap.member_group1 ne groupDetail.grouplist_number || loginMap.member_group2 ne groupDetail.grouplist_number || loginMap.member_group3 ne groupDetail.grouplist_number}">
								<c:choose>
									<c:when test="${loginMap.member_id eq null}">
										<button class="myButton" onclick="javascript:goLogin();" value="${loginMap.member_id eq null }">로그인해주세요</button>
									</c:when>
									<c:otherwise>
										<button class="myButton" onclick="javascript:goGroupJogin();" value="${groupDetail.grouplist_number }">가입신청</button>
									</c:otherwise>						
								</c:choose>
							</c:when>
						</c:choose>
					</div>
				</div>
			
				<!--End sticky -->	
			</aside>

			<!-- END group side form -->


			<!-- START group tab -->
			<div class="col-md-8 add_bottom_15">
				<form id="groupForm" name="groupForm" method="post">
					<div class="row">
						<div class="col">
							<p></p>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="calendar-tab" data-toggle="tab" role="tab" href="#calendar"
									role="tab" aria-controls="calendar" aria-selected="true">일정</a></li>
								<li class="nav-item"><a class="nav-link" id="mapView-tab"
									data-toggle="tab" role="tab" href="#mapView"
									aria-controls="mapView" aria-selected="false">지도</a></li>
							</ul>
							<div class="tab-content fouc" id="myTabContent">


								<!-- START somoim calendar TAB -->

								<div class="tab-pane fade active" id="calendar"
									role="tabpanel" aria-labelledby="calendar-tab">
									<div class ="main-title">
<div id="map" style="height:500px;"></div>
										</div>

								</div>
								<!-- END somoim calendar TAB -->


								<!-- START somoim map TAB -->
								<div class="tab-pane fade" id="mapView" role="tabpanel" aria-labelledby="mapView-tab">
			
			<div id="map" style="height:500px;"></div>
			<p><em>지도를 클릭해주세요!</em></p> 
			<div id="clickLatlng"></div>
			
			<div>
				<input type="text" id="sample3_postcode" placeholder="우편번호">
				<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample3_address" placeholder="주소"><br>
				<input type="text" id="sample3_detailAddress" placeholder="상세주소">
				<input type="text" id="sample3_extraAddress" placeholder="참고항목">
				
				<div id="wrap" style="display:none;border:1px solid;width:500px;height:200px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</div>



								</div>
								<!-- END somoim map TAB -->


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
								<!-- END group GALLERY TAB -->

							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- END group tab -->
			<!--End col-md-8 -->


		</div>
		<!--End row -->
	</div>
	<!--End container --> 
	
	</main>
	<!-- End main -->

	<%@ include file="../common/footer.jsp"%>

	<div id="toTop"></div>
	<!-- Back to top button -->

	<!-- Search Menu -->
	<div class="search-overlay-menu">
		<span class="search-overlay-close"><i
			class="icon_set_1_icon-77"></i></span>
		<form role="search" id="searchform" method="get">
			<input value="" name="q" type="search" placeholder="Search..." />
			<button type="submit">
				<i class="icon_set_1_icon-78"></i>
			</button>
		</form>
	</div>
	<!-- End Search Menu -->

	<!-- Jquery -->
	<script src="/resources/js/jquery-2.2.4.min.js"></script>
	<script src="/resources/js/common_scripts_min.js"></script>
	<script src="/resources/js/functions.js"></script>

	<script src="/resources/js/icheck.js"></script>
	
	
	<!-- KAKAO MAP API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8373ed5578b755b465a636ebec99ca7"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8373ed5578b755b465a636ebec99ca7&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8373ed5578b755b465a636ebec99ca7&libraries=services,clusterer,drawing"></script>
	
	<!-- 클릭한 위치에 마커 표시하기 -->
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
	    
	});
	</script>
	
	
	
	
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
 		$(function(){
 		 var sBtn = $("ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
 		
			 sBtn.find("a").click(function(${idx}){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	//   		 sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	  		 $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
					
	  		});
			
 		});
	</script>
	<script>
	
		$("#page").trigger("click");
	</script>

	<script>

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
	
/*  	$('#myTab a[href="#board"]').tab('show') // Select tab by name
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  e.target // newly activated tab
		 
		})
 */
 
	$('#myTab a').click(function(e) {
	  e.preventDefault();
	  $(this).tab('show');
	});

	// store the currently selected tab in the hash value
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
	  var id = $(e.target).attr("href").substr(1);
	  window.location.hash = id;
	});

	// on load of the page: switch to the currently selected tab
	var hash = window.location.hash;
	$('#myTab a[href="' + hash + '"]').tab('show');
	</script>
	
	<!-- Modal script -->

	
</body>

</html>
