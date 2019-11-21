<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
	<title>BoardWrite</title>
	
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/css/settings.css">

</head>
<body>
<%@ include file="../common/header.jsp" %>

<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>BOARD WRITE</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><b>게시글 작성</b></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> 게시글 작성 </span> </h2>
	</div>
<!-- class="col-md-offset-3 col-md-6" -->
<div class="container" style="margin-bottom: 200px;width: 60%; margin-left:20%;">
    <form action="/boardWrite.do?groupList_number=${groupList_number }" name="writeForm" method="POST" enctype="multipart/form-data">
        <div>
        
            <div style=" width : 100%;">
                <table style = " width : 100%;">
                    <tr>
                        <th style = "width : 10%; font-size: 20px;"> 제목</th>
                        <td><input style="width: 100%" type="text" id="board_title" name="board_title" /></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">내용</th>
                        <td><textarea style="width: 100%" rows="10" cols="10" id="board_content" name="board_content"></textarea></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">작성자</th>
                        <td><input style="width: 100%" type="text" id="board_writer" name="board_writer" value="${loginMap.member_id }" readonly/></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">업로드</th>
                        <td><input style="width: 100%" type="file" name="uploadFile" /></td>
                    </tr>
                </table>
                <div style = "text-align: right;">
                	<input type="submit" class="btn btn-success" value="등록">
                    <a href="/group/groupInfo.do?groupList_number=${groupList_number }#board"  class="btn btn-success">목록</a>
                </div>
            </div>
        </div>
    </form>
    </div>


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
<script>


</script>

</body>
</html>
<%@ include file="../common/footer.jsp" %>