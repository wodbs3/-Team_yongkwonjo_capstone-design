
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
	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>Group Detail</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>


				<li><b>상세보기</b></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> 상세보기 </span> </h2>
	</div>
<div class="container" style="margin-bottom: 200px;width: 60%; margin-left:20%;">
    <form id="detail" name="detail" method="POST">
        <div>>
            <div style=" width : 100%;">
             <input type="hidden" name="board_number"/>
                <table class = "table table-boardered" style = " width : 100%;">
                <tbody>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">글 번호</th> 
                    	<td>${Board.board_number }</td> 
                    </tr>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">작성자</th> 
                    	<td>${Board.board_writer }</td> 
                    	<th style = "width : 10%; font-size: 18px;" scope="row">작성시간</th> 
                    	<td>${Board.board_date }</td>
                    </tr>
                    <tr>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">제목</th> 
                    	<td>${Board.board_title }</td>
                    	<th style = "width : 10%; font-size: 18px;" scope="row">파일</th> 
                      	<td><a href= 'FileDownloadAction.do?file_name=${Board.board_photo }'>${Board.board_photo }</a></td>
                    </tr>
                    <tr>
                    	<td colspan="4">${Board.board_content }</td>
                    </tr>
                    </tbody>
                    
                </table>
                <div style = "text-align: right;"> 
                	
                	<c:if test="${loginMap.member_id eq Board.board_writer}">
                	<a href="${pageContext.request.contextPath}/boardUpdate.do?groupList_number=${Board.groupList_number}&board_number=${Board.board_number}" class="btn btn-success" style="padding:10px">수정</a>
                    <a href="${pageContext.request.contextPath}/boardDelete.do?board_number=${Board.board_number}" class="btn btn-danger" style="padding:10px">삭제</a>
                	</c:if>
                		
                	   <input type="button" value="목록" onClick='goBack()' class="btn btn-success" style="padding:10px"/>

                </div>
            </div>
        </div>
    </form>
					
					<h4>댓글</h4>
					<div class="post-right">
							<div id="general_rating"> Reviews
							</div>
							</div><br>
								
					<div id="comments">
					
						<ol>
							<li>
							
							<hr>		
							
							
							<!-- End review strip -->
												<c:forEach items="${commentList }" var="commentList">
							<div class="review_strip_single last">
							
								<a href="boardcommentDelete.do?comment_number=${commentList.comment_number }" class="button_1"></a>
								<h3>${commentList.comment_id }</h3>
							
								<h5>
									${commentList.comment_content }
									
								</h5>
								<br>
								<div class="post-left">
								<small> - ${commentList.comment_date } -</small>
								</div>
								<br>
								<c:if test="${loginMap.member_id != null && loginMap.member_id == commentList.comment_id}">		
									<div class="post-right">
<%-- 									<a href="updateForm.do?num=${gallery.num }" class="btn_1">수정</a> --%>
									<a href="commentDelete.do?comment_number=${commentList.comment_number }" class="btn_1">삭제</a>
									
									</div>
								</c:if>
									
							</div>
							<hr>
						</c:forEach>
						</li>
						</ol>
					</div>
					<!-- End Comments -->
					<br>
					<h4>댓글 달기</h4>
					<form action="boardcommentInsert.do?groupList_number=${Board.groupList_number }&board_number=${Board.board_number }" method="post">
						<div class="form-group">
							<h4>작성자:</h4>
         					<input type="text" id="comment_id" name="comment_id" value="${loginMap.member_id }" readonly/>
							<textarea id="comment_content" name="comment_content" class="form-control style_2" style="height:150px;" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="reset" class="btn_1" value="Clear">
							<c:if test="${loginMap.member_id != null }">
								<input type="submit" class="btn_1" value="댓글 달기">
							</c:if>
							<c:if test="${loginMap.member_id == null }">
								<input type="button" class="btn_1" onclick="comment_input()" value="댓글 달기">
							</c:if>
						</div>
					</form>
				</div>
				


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

function goBack() {
	   location.href="/group/groupInfo.do?groupList_number=${Board.groupList_number}#board";
	}
	
function comment_input() {
	alert("로그인을 해주세요");
}
</script>
</body>
</html>
<%@ include file="../common/footer.jsp" %>
