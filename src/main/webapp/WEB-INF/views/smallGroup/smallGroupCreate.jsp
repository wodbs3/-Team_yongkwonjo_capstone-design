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

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
<!-- Favicons-->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-144x144-precomposed.png">

<!-- Google web fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i"
	rel="stylesheet">

<!-- CSS -->
<link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

<!-- Radio and check inputs -->
<link href="${pageContext.request.contextPath }/resources/css/skins/square/grey.css" rel="stylesheet">

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
				<li><a href="${pageContext.request.contextPath }/group/GroupList.do">그룹 </a></li>

				<li><b>소모임개설</b></li>
			</ul>
		</div>
		</div>
		
		<!-- End position -->

	<div class="container margin_30">
	
	<!-- Join Form -->
		<form action="smallGroupCreate.do" method="POST" class="form-horizontal" enctype="multipart/form-data">
	
		
	<!-- Input somoim name -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<label for="somoim_name" class="control-label">소모임 이름</label>
					<br>
					<input type="text" class="form-control" id="somoim_name" name="somoim_name" value="${member_id }" placeholder="소모임명을 입력해주세요.(4~50자)" pattern="[A-Za-z0-9]{4, 50}" minlength="4" maxlength="50" required autofocus>
				</div>
			</div>
			
	<!-- Input somoim date -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<label for="somoim_date" class="control-label">소모임 날짜</label>
					<br>
					<input type="datetime-local" class="form-control" id="somoim_date" name="somoim_date">	
				</div>

	<!-- Input somoim price -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<label for="somoim_price" class="control-label">회비</label>
					<br>
					<input type="text" class="form-control" id="somoim_price" name="somoim_price" placeholder="회비를 입력해주세요.">
					<br>
				</div>
			</div>

	<!-- Input somoim place -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<label for="somoim_place" class="control-label">소모임 장소명</label>
					<br>
					<input type="text" class="form-control" id="somoim_place" name="somoim_place" placeholder="소모임 장소명을 입력해주세요.">
				</div>
			</div>
			
	<!-- Input somoim map -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<label for="somoim_map" class="control-label">소모임 지도 추가</label>
					<br>
					<input type="text" class="form-control" id="somoim_map" name="somoim_map" placeholder="주소 입력">
					<input type="button" class="btn btn-default idCheck col-xs-12" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
					<div id="map" class="col-md-12 col-xm-12" style="height:300px; margin-top:10px; display:none"></div>
				</div>
			</div>
			
	<!-- Join Button -->
			<div>
				<div class="col-md-offset-4 col-md-4">
					<button type="submit" class="col-xs-12 btn btn-default" id="submit" >생성하기</button>
				</div>
			</div>
			<br><br><br>
			
		</form>
		
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
	<script src="${pageContext.request.contextPath }/resources/js/jquery-2.2.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/common_scripts_min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/functions.js"></script>

	<script src="${pageContext.request.contextPath }/resources/js/icheck.js"></script>
	
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
	function upload_btn(id) {
			alert("로그인을 해주세요");
			location.href="/login.do";
	}
	</script>

	<script>
	function goCreate() {
	   location.href="/boardWrite.do?groupList_number=${groupDetail.grouplist_number}";
	}

	function goLogin() {
		location.href="/login.do";
	}
	
	function goGroupJogin() {
		location.href="/group/groupJoin.do?groupList_number=${groupDetail.grouplist_number}&member_id=${loginMap.member_id}";
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
	

	<!-- Map -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8373ed5578b755b465a636ebec99ca7&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("somoim_map").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>

</html>
