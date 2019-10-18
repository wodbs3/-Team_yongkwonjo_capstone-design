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

    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>


<div class="container" style="margin-bottom: 333px;width: 60%; margin-left:20%; margin-top: 10%;">
	<form id="groupForm" name="groupForm" method="post">
		<div class="row">
			<div class="col">
				<p></p>
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#info">정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#board">게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#gallery">사진첩</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="info">
						<p>그룹 정보입니다.</p>
					</div>
					<div class="tab-pane fade" id="board">
						<p>그룹 게시판입니다.</p>
					</div>
					<div class="tab-pane fade" id="gallery">
						<p>그룹 사진첩입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>



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
<script>
//글쓰기
function goCreate() {
   location.href="/GroupCreate.do";
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