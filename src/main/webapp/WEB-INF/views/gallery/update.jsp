<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
	<title>사진 등록</title>
	
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/css/settings.css">
	
	    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/css/style.css">
  <style type="text/css">.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before, .scrollax-performance *:after { pointer-events: none !important; -webkit-animation-play-state: paused !important; animation-play-state: paused !important; };</style>
	
	
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>GALLERY MODIFY</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><b>갤러리 수정</b></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;"> </h2>
	</div>

<div class="container margin_60">
<hr>
<div class="row block-9">

    	<div class="col-md-6">
       		<img class="card-img" style="position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px;" id="image_section" src="#" >
       	</div>
       	  <div class="col-md-6" >
    <form action="updateGallery.do?num=${gallery.num}" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data">
    	
     
        	
          
           	  <div class="input-group" >
               <input type="file" id="uploadFile"  class="file" accept="image/gif, image/jpeg, image/png"/>
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" id="writer" name="writer" value="${loginMap.member_id }" readonly>
              </div>
              
              <div class="form-group">
                <textarea id="content" name="content" cols="30" rows="7" class="form-control">${gallery.content }</textarea>
              </div>
    		<div style = "text-align: right;">
                	<input type="submit" class="btn btn-primary py-3 px-5" value="수정">
                    <a href="galleryDetail.do?num=${gallery.num }" class="btn btn-primary py-3 px-5">취소</a>
                </div>
            
        
    </form>
    </div>
    </div>
  </div>
<%@ include file="../common/footer.jsp" %>



	
	<script>
	function readURL(input) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('#image_section').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
		  
		$("#uploadFile").change(function(){
		   readURL(this);
		});
	</script>
	

    <!-- Common scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/common_scripts_min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/functions.js"></script>

    <!-- SLIDER REVOLUTION SCRIPTS  -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.video.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/rev-slider-files/js/extensions/revolution.extension.video.min.js"></script>

	 <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath }/resources/advanture-2-gh-pages/js/main.js"></script>

</body>
</html>