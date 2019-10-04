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
	<title>BoardWrite</title>
	
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
            <h2>글쓰기</h2>
            <div style=" width : 100%;">
                <table style = " width : 100%;">
                    <tr>
                        <th style = "width : 10%; font-size: 20px;"> 제목</th>
                        <td><input style="width: 100%" type="text" id="title" name="title" /></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">내용</th>
                        <td><textarea style="width: 100%" rows="10" cols="10" id="content" name="content"></textarea></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">작성자</th>
                        <td><input style="width: 100%" type="text" id="writer" name="writer" /></td>
                    </tr>
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">업로드</th>
                        <td><input style="width: 100%" type="file" id="upload" name="upload" /></td>
                    </tr>
                </table>
                <div style = "text-align: right;">
                	<a href='#' onClick='fn_addtoBoard()' class="btn btn-success">글 등록</a>
                    <a href="boardList.do" class="btn btn-success">목록</a>
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
//글등록
function fn_addtoBoard(){
    
    var form = document.getElementById("write");
    
    form.action = "<c:url value='/board/write.do'/>";
    form.submit();
    
}
 
//목록
function fn_cancel(){
    
    var form = document.getElementById("write");
    
    form.action = "<c:url value='/board/boardList.do'/>";
    form.submit();
    
}
</script>

</body>
</html>