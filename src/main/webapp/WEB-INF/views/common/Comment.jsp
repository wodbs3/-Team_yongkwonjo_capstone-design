<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<script>
var board_number = '${detail.board_number}';

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'board_number':board_number},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.comment_number+'">'+'댓글번호 : '+value.comment_number+'; / 작성자 : '+value.id;
                a += '<a onclick="commentUpdate('+value.comment_number+',\''+value.comment_content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.comment_number+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.comment_number+'"> <p> 내용 : '+value.comment_content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(comment_number, comment_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comment_number+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+comment_number).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(comment_number){
    var updateContent = $('[name=content_'+comment_number+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'comment_number' : comment_number},
        success : function(data){
            if(data == 1) commentList(board_number); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(comment_number){
    $.ajax({
        url : '/comment/delete/'+comment_number,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(board_number); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
