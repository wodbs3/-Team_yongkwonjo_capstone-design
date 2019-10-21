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
	<title>BoardList</title>
		
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="container" style="margin-bottom: 333px;width: 60%; margin-left:20%; margin-top: 10%;">
    <form id="boardForm" name="boardForm" method="post">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>내용 미리보기</th>
                    <th>작성자</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="Board" items="${Board}" varStatus="status">
                    <tr>
                        <td><c:out value="${Board.board_number }"/></td>
<%--                         <input type="hidden" name="board_num" value="${Board.board_number}"> --%>
                        <td><a href="boardDetail.do?board_number=${Board.board_number }">
                        <c:out value="${Board.board_title }"/></a></td>
                        <td><c:out value="${Board.board_content }"/></td>
                        <td><c:out value="${Board.board_writer }"/></td>
                        <td><c:out value="${Board.board_date }"/></td>
                        <td></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
         <c:choose>
        <c:when test="${loginMap.member_id eq null }">
        <div style = "text-align: right;">           
            <a href='#' onclick="javascript:goLogin();" class="btn btn-success">로그인 해주세요</a>
        </div>
        </c:when>
        <c:otherwise>
        <div style = "text-align: right;">           
            <a href='#' onclick="javascript:goCreate();" class="btn btn-success">글쓰기</a>
        </div>
        </c:otherwise>
        </c:choose>
    </form>
   <nav aria-label="Page navigation example">
   <ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev }">
    <li>
        <a href='<c:url value="/boardList.do?page=${pageMaker.startPage-1 }"/>'> Previous </a>
    </li>
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
    <li>
        <a href='<c:url value="/boardList.do?page=${idx }"/>'><i class="fa">${idx }</i></a>
    </li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    <li>
        <a href='<c:url value="/boardList.do?page=${pageMaker.endPage+1 }"/>'> Next </a>
    </li>
    </c:if>
</ul>
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
   location.href="/boardWrite.do";
}

function goLogin() {
	location.href="/login.do"
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