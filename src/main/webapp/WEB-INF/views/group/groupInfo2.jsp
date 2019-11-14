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
</style>

</head>

<body>
	<%@ include file="../common/header.jsp" %>
	
	<main>
		
		<!-- End position -->

		<div class="container margin_60" style="margin-top: 5%;">
			<div class="row">
				
				<!-- START group side form -->
<!--  기준 -->

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
						<c:choose>
							<c:when
								test="${loginMap.member_group1 eq groupDetail.grouplist_number || loginMap.member_group2 eq groupDetail.grouplist_number || loginMap.member_group3 eq groupDetail.grouplist_number}">
								<button value="${groupDetail.grouplist_number }">이미 가입된
									모임입니다.</button>
							</c:when>
							<c:when
								test="${loginMap.member_group1 ne groupDetail.grouplist_number || loginMap.member_group2 ne groupDetail.grouplist_number || loginMap.member_group3 ne groupDetail.grouplist_number}">
								<button value="${groupDetail.grouplist_number }">가입신청</button>
							</c:when>
							<c:otherwise>
								<button value="${loginMap.member_id eq null}">로그인해주세요</button>
							</c:otherwise>
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
									id="board-tab" data-toggle="tab" role="tab" href="#board"
									role="tab" aria-controls="board" aria-selected="true">게시판</a></li>
								<li class="nav-item"><a class="nav-link" id="gallery-tab"
									data-toggle="tab" role="tab" href="#gallery"
									aria-controls="gallery" aria-selected="false">사진첩</a></li>
								<li class="nav-item"><a class="nav-link" id="member-tab"
									data-toggle="tab" role="tab" href="#member"
									aria-controls="member" aria-selected="false">모임회원</a></li>
							</ul>
							<div class="tab-content fouc" id="myTabContent">


								<!-- START group BOARD TAB -->
								<div class="tab-pane fade active" id="board" role="tabpanel" aria-labelledby="board-tab">
									
									<div>
									<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>내용</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="boardList" items="${boardList }" varStatus="status">
										<tr>
											<td><c:out value="${boardList.board_number }"/></td>
											<td><a href="${pageContext.request.contextPath }/boardDetail.do?board_number=${boardList.board_number }"><c:out value="${boardList.board_title }"/></a></td>
											<td><c:out value="${boardList.board_content }"/></td>
											<td><c:out value="${boardList.board_writer }"/></td>
											<td><c:out value="${boardList.board_date }"/></td>
											<td></td>
										</tr>
										</c:forEach>
									</tbody>
									</table>
									<div style = "text-align: right;">           
										<a href='#' onclick="javascript:goCreate();" class="btn btn-success">글쓰기</a>
									</div>
                                   </div>
                                   
								</div>
								<!-- END group BOARD TAB -->


								<!-- START group GALLERY TAB -->
								<div class="tab-pane fade" id="gallery" role="tabpanel"
									aria-labelledby="gallery-tab">
									<div class="main_title">
										<%-- 				<h2><span>${smallgroup.name}</span></h2> --%>
										<h2></h2>

										<hr>
										<div class="text-right">
											<c:if test="${loginMap.member_id == null}">
												<input type="button" class="btn_1"
													onclick="upload_btn(${loginMap.member_id})" value="사진 등록" />
											</c:if>
											<c:if test="${loginMap.member_id != null }">
												<a
													href="${pageContext.request.contextPath }/upload.do?groupList_number=${groupDetail.grouplist_number}"
													class="btn_1">사진 등록</a>
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
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.startPage-1 }"/>'>
														Previous </a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx" varStatus="status">

												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${idx }#gallery"/>'><i
														class="fa">${idx }</i></a></li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
												<li><a
													href='<c:url value="/group/groupInfo.do?groupList_number=${groupDetail.grouplist_number }&page=${pageMaker.endPage+1 }"/>'>
														Next </a></li>
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
								<!-- END group GALLERY TAB -->


								<!-- START group MEMBER TAB -->
								<div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab">
									
	<table class="table table-striped options_cart">
			<thead>
				<tr>
					<th colspan="3">
						모임회원 목록
					</th>
				</tr>
			</thead>
		<c:forEach var="groupMemberList" items="${groupMemberList }" varStatus="status">					
			
			<tbody>
				<tr>
					<td class="col-md-3">
						<img src="${pageContext.request.contextPath }/resources/userupload/${groupMemberList.fileName }" class="mx-auto d-block" style="width:50%">
					</td>
					<td>
						<div class="col-md-6">
							<b>회원ID&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_id }"></c:out>
						</div>
						<div class="col-md-6">
							<b>학부&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_department }"></c:out>
						</div>
						<br><br>
						<div class="col-md-6">
							<b>학번&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_studentId }"></c:out>
						</div>
						<div class="col-md-6">
							<b>이름&nbsp;:&nbsp;</b><c:out value="${groupMemberList.member_name }"></c:out>
						</div>
						<%-- <h5><b>회원ID</b></h5><c:out value="${groupMemberList.member_id }"></c:out>
						<h5><b>학부</b></h5><c:out value="${groupMemberList.member_department }"></c:out>
						<h5><b>회번</b></h5><c:out value="${groupMemberList.member_studentId }"></c:out>
						<h5><b>이름</b></h5><c:out value="${groupMemberList.member_name }"></c:out> --%>
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
								</div>
								<!-- END group MEMBER TAB -->


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

</body>

</html>
