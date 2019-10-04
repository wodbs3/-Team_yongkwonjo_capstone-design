<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<title>BoardDetail</title>
	
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

<div class="col-md-offset-3 col-md-6" style="margin-top: 10%;">
    <form id="writeForm" name="writeForm" method="post">
        <div>
            <h2>상세보기</h2>
            <div style=" width : 100%;">
                <table class = "table table-boardered" style = " width : 100%;">
                <tbody>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">글 번호</th> 
                    	<td>${map.TITLE }</td> 
                    	<th style = "width : 10%; font-size: 18px;" scope="row">조회수</th> 
                    	<td>${map.HIT_CNT }</td>
                    </tr>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">작성자</th> 
                    	<td>${map.CREA_ID }</td> 
                    	<th style = "width : 10%; font-size: 18px;" scope="row">작성시간</th> 
                    	<td>${map.CREA_DTM }</td>
                    </tr>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">제목</th> 
                    	<td>${map.TITLE }</td>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">파일</th> 
                    	<td>${map.CREA_DTM }</td>
                    </tr>
                    <tr>
                    	<td colspan="4">${map.CONTENTS }</td>
                    </tr>
                    </tbody>
                    
                </table>
                <div style = "text-align: right;">
                	    <a href='#' onClick='fn_update()' class="btn btn-success">수정</a>
                    	<a href='boardList.do' onClick='fn_cancel()' class="btn btn-success">목록</a>
                    	<a href='#' onClick ='' class = "btn btn-danger">삭제</a>
                </div>
            </div>
        </div>
    </form>
    </div>
    <div class="col-md-offset-3 col-md-6" style="margin-top: 0%;">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>

    <%@ include file="../common/Comment.jsp" %>


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
		$(document).ready(function(){ 
			$("#list").on("click", function(e)
					{ //목록
				e.preventDefault(); fn_boardList(); }); 
			
			$("#update").on("click", function(e){ 
				e.preventDefault(); fn_boardUpdate(); }); 
		}); 
		
		function fn_openBoardList(){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/board/boardList.do' />"); 
			comSubmit.submit(); 
		} 
		
		function fn_openBoardUpdate(){ 
			var idx = "${map.IDX}"; var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/board/boardUpdate' />"); 
			comSubmit.addParam("IDX", idx); 
			comSubmit.submit(); }
</script>
</body>
</html>
<%@ include file="../common/footer.jsp" %>