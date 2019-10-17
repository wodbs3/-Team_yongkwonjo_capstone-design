
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
                    	<td>${Board.board_photo }</td>
                    </tr>
                    <tr>
                    	<td colspan="4">${Board.board_content }</td>
                    </tr>
                    </tbody>
                    
                </table>
                <div style = "text-align: right;">
                		<a href="${pageContext.request.contextPath}/boardUpdate.do?board_number=${Board.board_number}" class="btn btn-success" style="padding:10px">수정</a>
                        <a href="${pageContext.request.contextPath}/boardDelete.do?board_number=${Board.board_number}" class="btn btn-danger" style="padding:10px">삭제</a>
                	    <a href="/boardList.do" onClick='fn_cancel()' class="btn btn-success" style="padding:10px">목록</a>
                </div>
            </div>
        </div>
    </form>
    </div>
	
	
    <div class="container" style="margin-bottom: 200px;width: 60%; margin-left:20%; margin-top: 10%;">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="board_number" value="${Board.board_number}"/>
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
// 		var board_number = '${Board.board_number}';

// 		$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
// 		    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
// 		    commentInsert(insertData); //Insert 함수호출(아래)
// 		});
		 
		 
		 
// 		//댓글 목록 
// 		function commentList(){
// 		    $.ajax({
// 		        url : '/comment/list',
// 		        type : 'get',
// 		        data : {'board_number':board_number},
// 		        success : function(data){
// 		            var a =''; 
// 		            $.each(data, function(key, value){ 
// 		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
// 		                a += '<div class="commentInfo'+value.comment_number+'">'+'댓글번호 : '+value.comment_number+'; / 작성자 : '+value.comment_writer;
// 		                a += '<a onclick="commentUpdate('+value.comment_number+',\''+value.comment_content+'\');"> 수정 </a>';
// 		                a += '<a onclick="commentDelete('+value.comment_number+');"> 삭제 </a> </div>';
// 		                a += '<div class="commentContent'+value.comment_number+'"> <p> 내용 : '+value.comment_content +'</p>';
// 		                a += '</div></div>';
// 		            });
		            
// 		            $(".commentList").html(a);
// 		        }
// 		    });
// 		}
		 
// 		//댓글 등록
// 		function commentInsert(insertData){
// 		    $.ajax({
// 		        url : '/comment/insert',
// 		        type : 'post',
// 		        data : insertData,
// 		        success : function(data){
// 		            if(data == 1) {
// 		                commentList(); //댓글 작성 후 댓글 목록 reload
// 		                $('[name=content]').val('');
// 		            }
// 		        }
// 		    });
// 		}
		 
// 		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
// 		function commentUpdate(comment_number, comment_content){
// 		    var a ='';
		    
// 		    a += '<div class="input-group">';
// 		    a += '<input type="text" class="form-control" name="content_'+comment_number+'" value="'+comment_content+'"/>';
// 		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comment_number+');">수정</button> </span>';
// 		    a += '</div>';
		    
// 		    $('.commentContent'+comment_number).html(a);
		    
// 		}
		 
// 		//댓글 수정
// 		function commentUpdateProc(comment_number){
// 		    var updateContent = $('[name=comment_content_'+comment_number+']').val();
		    
// 		    $.ajax({
// 		        url : '/comment/update',
// 		        type : 'post',
// 		        data : {'comment_content' : updateContent, 'comment_number' : comment_number},
// 		        success : function(data){
// 		            if(data == 1) commentList(board_number); //댓글 수정후 목록 출력 
// 		        }
// 		    });
// 		}
		 
// 		//댓글 삭제 
// 		function commentDelete(comment_number){
// 		    $.ajax({
// 		        url : '/comment/delete/'+comment_number,
// 		        type : 'post',
// 		        success : function(data){
// 		            if(data == 1) commentList(board_number); //댓글 삭제후 목록 출력 
// 		        }
// 		    });
// 		}
		 
		 
		 
		 
// 		$(document).ready(function(){
// 		    commentList(); //페이지 로딩시 댓글 목록 출력 
// 		});		
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/boardDelete.do";
				document.form1.submit();
			}
		});
		
		$("#btnUpdate").click(function() {
			var title = $("#title").val();
			var content = $("#content")val();
			var writer = $("#writer").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
		}
		if(content == ""){
			alert("내용을 입력하세요");
			document.form1.content.focus();
			return;
		}
		if(writer == ""){
			alert("이름을 입력하세요");
			document.form1.content.focus();
			return;
		}
		document.form1.action="${path}/boardUpdate.do"
		document.form1.submit();
		
		});
	});	
</script>
</body>
</html>
<%@ include file="../common/footer.jsp" %>
