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
<style type="text/css">
img {
	display: block;
	max-width:300px;
	max-height: 200px;
	width: auto;
	height: auto;
}

/* .fouc { */
/* 	display: none; */
/* } */
</style>

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
								<ul class="nav nav-tabs" id="myTab" role="tablist">
		                           <li class="nav-item">
		                              <a class="nav-link active" id="board-tab" data-toggle="tab" role="tab" href="#board"  role="tab" aria-controls="board" aria-selected="true">게시판</a>
		                           </li>
		                           <li class="nav-item">
		                              <a class="nav-link" id="gallery-tab" data-toggle="tab" role="tab" href="#gallery" aria-controls="gallery" aria-selected="false">사진첩</a>
		                           </li>
		                           <li class="nav-item">
		                              <a class="nav-link" id="member-tab" data-toggle="tab" role="tab" href="#member" aria-controls="member" aria-selected="false">모임회원</a>
		                           </li>
		                        </ul>
								<div class="tab-content fouc" id="myTabContent">
									<div class="tab-pane fade show active" id="board" role="tabpanel" aria-labelledby="board-tab">
										<p>그룹 게시판입니다.</p>
									</div>
									<div class="tab-pane fade" id="gallery" role="tabpanel" aria-labelledby="gallery-tab">
										<div class="main_title">
			<%-- 				<h2><span>${smallgroup.name}</span></h2> --%>
			<h2>
				
			</h2>
		
		<hr>
		<div class="text-right">
		<c:if test="${loginMap.member_id == null}">
			<input type="button" class="btn_1" onclick="upload_btn(${loginMap.member_id})" value="사진 등록"/>
		</c:if>
		<c:if test="${loginMap.member_id != null }">
			<a href="${pageContext.request.contextPath }/upload.do?groupList_number=${groupDetail.grouplist_number}" class="btn_1">사진 등록</a>
		</c:if>
		</div>
		
		
		<div class="hotel_container">
			<c:forEach items="${galleryList}" var="galleryList">
							
				<div class="col-md-4 col-sm-4">
					<div class="img_container">
						<a
							href="${pageContext.request.contextPath }/galleryDetail.do?num=${galleryList.num}">
							<img width="auto" height="auto"
							src="${pageContext.request.contextPath }/resources/upload/${galleryList.photo_name}"
							alt="Image">

						</a>

					</div>
					
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
        <a href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.startPage-1 }"/>'> Previous </a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx" varStatus="status">
  		
    <li>
        <a href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${idx }"/>'><i class="fa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.endPage+1 }"/>'> Next </a>
    </li>
    </c:if>
</ul>
	</div>
</div>

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
									
									<div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab">
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
	$(document).ready(function(){
		var link = document.location.href;
		var tab = link.split('/').pop();
		$('a[href='+tab+']'.trigger('click');)
		
	}
			))
	</script>
	<script>
	function upload_btn(id) {
		
			alert("로그인을 해주세요");
		
	}
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
	
	<script>
		$('#myTab a[href="#board"]').tab('show') // Select tab by name
		
// 		var hash = window.location.hash;
// 		$('#myTab a[href="' + hash + '"]').tab('show');
		
		$('#myTab a').on('shown.bs.tab',function(){
			$(".fouc").show();
		});
	</script>

</body>

</html>