<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href=${pageContext.request.contextPath }"/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/resources/img/apple-touch-icon-144x144-precomposed.png">

	
	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
		
		<title>그룹생성</title>
			
		<style type="text/css">
			div #emailOk {
				margin-bottom: 15px;
			}
			
			/* 아이디 / 비밀번호 입력 메세지 출력 */
			#idOk, #pwdFalse, #birthOk, #emailOk, #nameOk, #telOk, #imgOk {
				font-size: 12px;
				color: red;
			}
			#pwdOk {
				font-size: 12px;
			}
			
		</style>
		
	</head>

	<%@ include file="../common/header.jsp" %>
	
	<body>
	
	
	<div class="row margin_30">
<!-- Join Form -->
	<form action="GroupCreate.do" method="POST" class="form-horizontal" style="margin-top:10%" enctype="multipart/form-data">

	
<!-- Input Id -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_name" class="control-label">그룹이름</label>
				<br>
				<input type="text" class="form-control" id="grouplist_name" name="grouplist_name" value="${grouplist_name }" placeholder="그룹이름을 입력해주세요.(4~20자)" pattern="[A-Za-z0-9]{4, 40}" minlength="4" maxlength="40" oninput="checkgroup();" required autofocus>
				<input type="button" class="btn btn-default groupCheck" value="중복확인" style="width: 100px;">
				<p class="result">
					<span class="msg">중복확인해주세요.</span>
				</p>
			</div>
		</div>
		<div>
    			<div class="col-md-offset-4 col-md-4">
        			<label class="control-label">그룹 대표 이미지</label>
    				<input type="file" name="file_name" id="imgInput" class="btn_1"/>
     					
     			</div>
     		
    	</div>
           
        <div class="col-md-offset-4 col-md-4">
<!--          	<label class="control-label">미리보기</label> -->
     		<img width="486.4px;" height="198px;" id="image_section" src="#">
		</div>
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_introduce">그룹소개</label>
				<textarea class="form-control" rows="5" id="grouplist_introduce" name="grouplist_introduce"></textarea>
			</div>
		</div>
		


			<!-- Input Interest -->
<!-- 인원 -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_people" class="control-label">정원</label>
				<br>
				
					<select class="form-control" id="grouplist_people" name="grouplist_people">
						<option value=" selected">정원</option>
						<option>20</option>
						<option>40</option>
						<option>60</option>
						<option>80</option>
					</select>
					
			</div>
		</div>
		
<!-- Input Gender -->
<!--  관심사 -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_interest" class="control-label">관심사</label>
				<br>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/bongsa.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="봉사활동">봉사활동
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/gido.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="기독교모임">기독교모임
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/food.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="식사">식사
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/study.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="스터디">스터디
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/carpool.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="카풀">카풀
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/moim.png" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="사교모임">사교모임
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/dongdong.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="동아리">동아리
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/free.jpg" style="width:100%; height:100px;">
				<input type="radio" id="grouplist_interest" name="grouplist_interest" value="자유주제">자유주제
				</div>
			</div>
		</div>
		
<!-- Join Button -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<button type="submit" class="col-md-12 btn btn-default" id="submit" >그룹생성</button>
			</div>
		</div>
		<br><br><br>
		
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	
	/* 아이디 중복 체크 */
	$(".groupCheck").click(function(){
		var query = {grouplist_name : $("#grouplist_name").val()};
		$.ajax({
			url : "/groupDuplicationCheck.do",
			type : "post",
			data : query,
			success : function(data) {
				if(data == 0) {
					$(".result .msg").text("그룹이름 중복 사용불가");
					$(".result .msg").attr("style", "color:#f00");
					$("#submit").attr("disabled", "disabled");
				} else if (data == 1){
					$(".result .msg").text("그룹이름 사용가능");
					$(".result .msg").attr("style", "color:#00f");
					$("#submit").removeAttr("disabled");
				}
			}
		});
	});
	</script>
	<script >
	function fileUploadPreview(thisObj, preViewer) {
        alert(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value));
    if(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value)) {
        alert("이미지 형식의 파일을 선택하십시오");
        return;
    }

    preViewer = (typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {
        var img_path = "";
        if (thisObj.value.indexOf("\\fakepath\\") < 0) {
            img_path = thisObj.value;
        } else {
            thisObj.select();
            var selectionRange = document.selection.createRange();
            img_path = selectionRange.text.toString();
            thisObj.blur();
        }
        preViewer.style.filter =

               "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi" +

               "le://" + img_path + "', sizingMethod='scale')";
      } else {
        preViewer.innerHTML = "";
        var W = preViewer.offsetWidth;
        var H = preViewer.offsetHeight;
        var tmpImage = document.createElement("img");
        preViewer.appendChild(tmpImage);

        tmpImage.onerror = function () {
            return preViewer.innerHTML = "";
        }

        tmpImage.onload = function () {
            if (this.width > W) {
                this.height = this.height / (this.width / W);
                this.width = W;
            }
            if (this.height > H) {
                this.width = this.width / (this.height / H);
                this.height = H;
            }
        }
        if (ua.indexOf("Firefox/3") > -1) {
            var picData = thisObj.files.item(0).getAsDataURL();
            tmpImage.src = picData;
        } else {
            tmpImage.src = "file://" + thisObj.value;
        }
    }
}

</script>
<script>
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	  
	$("#imgInput").change(function(){
	   readURL(this);
	});
</script>
	<%@ include file="../common/footer.jsp" %>
	</body>
	
</html>
