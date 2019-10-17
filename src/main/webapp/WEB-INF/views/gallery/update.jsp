<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<title>사진 등록</title>
	
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
<div class="container margin_60">
<div class="col-md-offset-3 col-md-6" style="margin-top: 10%;">
    <form action="updateGallery.do?num=${gallery.num}" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data">
    	
        <div>
        	<div class="row">
    			<div class="col-md-8"></div>
    			
    			<div class="col-md-4">
    			  	<input type="file" name="uploadFile" class="btn_1"/>
     			</div>
    		</div>
            <h2>사진 등록</h2>
            <hr>
            <div style=" width : 100%;">
                <table style = " width : 100%;">
<!--                     <tr> -->
<!--                         <th style = "width : 10%; font-size: 20px;"> 제목</th> -->
<!--                         <td><input style="width: 100%" type="text" id="title" name="title" /></td> -->
<!--                     </tr> -->
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">내용</th>
                        <td><textarea style="width: 100%" rows="10" cols="10" id="content" name="content">
                        	${gallery.content}
                        </textarea></td>
                    </tr>
                 
                </table>
                <div style = "text-align: right;">
                	<input type="submit" class="btn btn-success" value="수정">
                    <a href="galleryDetail.do" class="btn btn-success">취소</a>
                </div>
            </div>
        </div>
    </form>
    </div>
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


</body>
</html>