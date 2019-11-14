
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

<div class="container" style="margin-bottom: 200px;width: 60%; margin-left:20%; margin-top: 10%;">
    <form id="detail" name="detail" method="POST">
        <div>
            <h2>상세보기</h2>
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
                		<a href="${pageContext.request.contextPath}/boardUpdate.do?board_number=${Board.board_number}" class="btn btn-success" style="padding:10px">수정</a>
                        <a href="${pageContext.request.contextPath}/boardDelete.do?board_number=${Board.board_number}" class="btn btn-danger" style="padding:10px">삭제</a>
                	    <a href="/boardList.do" class="btn btn-success" style="padding:10px">목록</a>
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
								<img src="${pageContext.request.contextPath }/resources/img/avatar1.jpg" alt="Image" class="img-circle">
								<small> - ${commentList.comment_date } -</small>
								<br>
								<a href="boardcommentDelete.do?num=${commentList.comment_number }" class="button_1"></a>
								<h4>아이디: <span>${commentList.comment_id }</span></h4>
								<hr>
								<p>
									
									${commentList.comment_content }
									<span class="writeReReply" style="curosor: pointer;"> (답글 달기) </span> 
								</p>
						<table id = "replyTable">		
							<tbody>		
								<tr class="hide">
									<td class="board_number">${comment.board_number }</td>
									<td class="comment_reparent">${comment.comment_reparent }</td>
								</tr>
								<tr class="hide">
									<td class="comment_redepth">${comment.comment_redepth }</td>
									<td class="comment_reorder">${comment.comment_reorder }</td>
								</tr>
								<tr class="hide">
									<td colspan="2" class ="comment_id">${comment.comment_id }</td>
								</tr>	
							</tbody>
						</table>
							</div>
							
						</c:forEach>
						</li>
						</ol>
					</div>
					<!-- End Comments -->
					<br>
					<h4>댓글 달기</h4>
					<form action="boardcommentInsert.do?board_number=${Board.board_number }" method="post">
					<input type="hidden" value="${Board.board_number}"/>
						<div class="form-group">
							<h4>작성자:</h4>
         					<input type="text" id="comment_id" name="comment_id" value="${loginMap.member_id }" readonly/>
							<textarea id="comment_content" name="comment_content" class="form-control style_2" style="height:150px;" placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="reset" class="btn_1" value="Clear">
							<input type="submit" class="btn_1" value="댓글 달기">
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


</script>
</body>
</html>
<%@ include file="../common/footer.jsp" %>
