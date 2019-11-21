
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
	<title>BoardUpdate</title>
	
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

 
    <link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">


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
				<h1>Board MODIFY</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> 게시글 수정 </span> </h2>
	</div>
<div class="container" style="margin-bottom: 200px;width: 60%; margin-left:20%;">

	 <form action="${pageContext.request.contextPath}/boardModify.do?groupList_number=${Board.groupList_number}&board_number=${Board.board_number}" method="POST">
        <div class="form-group">
            <label for="board_title">제목</label>
            <input type="text" class="form-control" id="board_title" name="board_title" value="${Board.board_title }">
        </div>
        <div class="form-group">
            <label for="board_writer">작성자</label>
            <input type="text" class="form-control" id="board_writer" name="board_writer" value="${Board.board_writer }" readonly>
        </div>
        <div class="form-group">
            <label for="board_content">내용</label>
            <textarea class="form-control" id="board_content" rows="10" name="board_content">${Board.board_content }</textarea>
        </div>
        <input type="hidden" name="board_number" value="${Board.board_number }">
        <button type="submit" class="btn btn-info">수정하기</button>
        <a href="<%=request.getHeader("Referer")%>" class="btn btn-info">뒤로가기</a>
    </form>
</div>
	       


    <script src="${pageContext.request.contextPath }/resources/js/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/common_scripts_min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/functions.js"></script>


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
