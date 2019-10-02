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

<!--     BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

<!--     REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>


<div class="col-md-offset-3 col-md-6" style="margin-top: 10%;">
    <form id="viewForm" name="viewForm" method="post">
        <div>
            <h2>게시판 상세보기</h2>
            <div style=" width : 100%;">
                <table style = " width : 100%;">
                    <tr>
                        <th style = "width : 10%; font-size: 20px;"> 제목</th>
                        <td><input style="width: 100%" type="text" id="title" name="title" value="${result.title }"/></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">내용</th>
                        <td><textarea style="width: 100%" rows="10" cols="10" id="content" name="content"><c:out value="${result.content }"/></textarea></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">작성자</th>
                        <td><input style="width: 100%" type="text" id="writer" name="writer" value="${result.writer }"/></td>
                    </tr>
                </table>
                <div style = "text-align: right;">
                    <a href='#' onClick='fn_update()' class="btn btn-success">수정</a>
                    <a href='#' onClick='fn_cancel()' class="btn btn-success">목록</a>
                </div>
            </div>
        </div>
        <input type='hidden' id='code' name='code' value='${result.code }' />
    </form>
    
<%@ include file="../common/Comment.jsp" %>

<%@ include file="../common/footer.jsp" %>


<!--       Common scripts -->
    <script src="/resources/js/jquery-2.2.4.min.js"></script>
    <script src="/resources/js/common_scripts_min.js"></script>
    <script src="/resources/js/functions.js"></script>

<!--     SLIDER REVOLUTION SCRIPTS  -->
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
 //목록
	 function fn_cancel(){
    
     var form = document.getElementById("detail");
    
     form.action = "<c:url value='/board/boardList.do'/>";
     form.submit();
    
 }
 
 //수정
 function fn_update(){
    
     var form = document.getElementById("detail");
    
     form.action = "<c:url value='/board/updateboard.do'/>";
     form.submit();
 }
 
//답변
 function fn_relay(){
    
     var form = document.getElementById("detail");
    
     form.action = "<c:url value='/board/relayForm.do'/>";
     form.submit();
    
}
</script>
</div>
</body>
</html>