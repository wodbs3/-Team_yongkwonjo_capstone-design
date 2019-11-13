<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="/resources/img/apple-touch-icon-144x144-precomposed.png">

	
	<!-- Google web fonts -->
    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
		
		<title>BUmoim join</title>
			
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
	<form action="join.do" method="POST" class="form-horizontal" style="margin-top:10%" enctype="multipart/form-data">

	
<!-- Input Id -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_id" class="control-label">아이디</label>
				<br>
				<input type="text" class="form-control" id="member_id" name="member_id" value="${member_id }" placeholder="아이디를 입력해주세요.(4~20자)" pattern="[A-Za-z0-9]{4, 20}" minlength="4" maxlength="20" oninput="checkId();" required autofocus>
				<input type="button" class="btn btn-default idCheck" value="중복확인" style="width: 100px;">
				<p class="result">
					<span class="msg">아이디를 확인해주세요.</span>
				</p>
			</div>
		</div>
		
<!-- Input Password -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_pw" class="control-label">비밀번호</label>
				<br>
				<input type="password" class="form-control" id="member_pw" name="member_pw" onkeyup="checkPwd();" placeholder="비밀번호를 입력하세요.(8~20자)" minlength="8" maxlength="20" required>	
				<input type="password" class="form-control" id="member_pw_confirm" name="member_pw_confirm" onkeyup="checkPwd();" placeholder="비밀번호를 한번 더 입력하세요." minlength="8" maxlength="20" required>
				<div class="form-group" id="pwdFalse"></div>
				<div class="form-group" id="pwdOk"></div>
			</div>
		</div>
			<div class="col-md-offset-4 col-md-4 text-right">
			<input type="file" name="uploadFile" class="btn_1"/>
			</div>
		
<!-- Input StudentId -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_studentId" class="control-label">학번</label>
				<br>
				<input type="text" class="form-control" id="member_studentId" name="member_studentId" placeholder="학번">
			</div>
		</div>
		
<!-- Input Name-->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_name" class="control-label">이름</label>
				<br>
				<input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름을 입력해주세요(2~8자)" pattern="[가-힣]{2, 8}" minlength="2" maxlength="8" oninput="checkName();" required>
				<br>
                <div class="form-group" id="nameOk"></div>
			</div>
		</div>
		
<!-- Input Department -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_department" class="control-label">학부</label>
				<br>
				
					<select class="form-control" id="member_department" name="member_department">
						<option value=" selected">학부</option>
						<option>소프트웨어학</option>
						<option>정보보호학</option>
						<option>멀티미디어학</option>
						<option>전자제어학</option>
					</select>
     
			</div>
		</div>
		
<!-- Input Interest -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="grouplist_interest" class="control-label">관심사</label>
				<br>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/bongsa.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="봉사활동">봉사활동
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/gido.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="기독교모임">기독교모임
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/food.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="식사">식사
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/study.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="스터디">스터디
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/carpool.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="카풀">카풀
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/moim.png" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="사교모임">사교모임
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/dongdong.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="동아리">동아리
				</div>
				<div class="col-md-6">
				<img src="/resources/img/groupcreate/free.jpg" style="width:100%; height:100px;">
				<input type="radio" id="member_interest" name="member_interest" value="자유주제">자유주제
				</div>
			</div>
		</div>
		
<!-- Input Gender -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_gender" class="control-label">성별</label>
				<br>
				<input type="radio" id="member_gender" name="member_gender" value="남">남자
				<input type="radio" id="member_gender" name="member_gender" value="여">여자
			</div>
		</div>
		
<!-- Input Birth -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_birth" class="control-label">생년월일</label>
				<br>
				<input type="date" class="form-control" id="member_birth" name="member_birth" placeholder="생년월일" min="1900-12-31" max="2025-12-31">
			</div>
		</div>
		
<!-- Input Email -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<label for="member_email" class="control-label">이메일</label>
				<br>
				<input type="email" class="form-control" id="member_email" name="member_email" placeholder="이메일을 입력해주세요." oninput="checkEmail();" required>
				<br>
				<div class="form-group" id="emailOk"></div>
			</div>
		</div>
		
<!-- Join Button -->
		<div>
			<div class="col-md-offset-4 col-md-4">
				<button type="submit" class="col-md-12 btn btn-default" id="submit" disabled="disabled">가입하기</button>
			</div>
		</div>
		<br><br><br>
		
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	
	/* 아이디 중복 체크 */
	$(".idCheck").click(function(){
		var query = {member_id : $("#member_id").val()};
		$.ajax({
			url : "/idDuplicationCheck.do",
			type : "post",
			data : query,
			success : function(data) {
				if(data == 0) {
					$(".result .msg").text("아이디 중복 사용 불가");
					$(".result .msg").attr("style", "color:#f00");
					$("#submit").attr("disabled", "disabled");
				} else if (data == 1){
					$(".result .msg").text("아이디 사용 가능");
					$(".result .msg").attr("style", "color:#00f");
					$("#submit").removeAttr("disabled");
				}
			}
		});
	});
	
	/* 비밀번호 체크 */
	function checkPwd() {
		var member_pw = $('#member_pw').val(); /* password를 id로 같는 것을 가져옴, .val()는 ()안의 값으로 초기화  */
		var member_pw_confirm = $('#member_pw_confirm').val();
		
		/* 실패시 빨강색 */ /* 성공시 흰색 */
		if(member_pw_confirm == "" || member_pw_confirm != member_pw) {
			$("#member_pw_confirm").css("background-color", "#FFCECE");
			$("#pwdOk").hide();
			$("#pwdFalse").show();
			$("#pwdFalse").html("비밀번호를 확인해주세요.")
		} else if (member_pw == member_pw_confirm) {
			$("#member_pw_confirm").css("background-color", "#FFFFFF");
			$("#pwdFalse").hide();
			$("#pwdOk").show();
			$("#pwdOk").html("비밀번호 일치").css("color", "#2cb5e8");
		}
	}
	
	/* 이름길이 체크 */
	function checkName() {
		var member_name = $('#member_name').val();
		if(member_name.length <= 1 || member_name.length >= 9) {
			$("#member_name").css("background-color", "#FFCECE");
			$("#nameOk").html("이름은 2자이상 8자이하로 입력해주세요");
		} else if (member_name.length == 2 || member_name.length == 8) {
			$("#member_name").css("background-color", "white");
			$("#nameOk").hide();
		}
	}
	
	/* 이메일체크 */
	function checkEmail() {
		var str = $('#member_email').val();
		if(str.indexOf("@") == -1) { /* indexof()는 일치하는 값이 없으면 -1을 반환  */
			$("#member_email").css("background-color", "#FFCECE");
			$("#emailOk").html("이메일주소 형식을 확인해주세요.")
		} else if (str.indexOf("@") != -1) {
			$("#member_email").css("background-color", "white");
			$("#emailOk").hide();
		}
	}
	
	</script>
	<%@ include file="../common/footer.jsp" %>
	</body>
	
</html>
