<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<link href="/resources/css/base.css" rel="stylesheet">
		
		<!-- REVOLUTION SLIDER CSS -->
		<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
		<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
		<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>BUmoim join</title>	
	</head>
	
	<body>
	<%@ include file="../common/header.jsp" %>

<!-- Join Form -->
	<form id="joinFrm" method="post" class="form-horizontal" style="margin-top:10%">

	
<!-- Input Id -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_id" class="control-label">아이디</label>
				<br>
				<input type="text" class="form-control" id="member_id" placeholder="아이디 입력">
			</div>
		</div>
      	
<!-- Input Password -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_pw" class="control-label">비밀번호</label>
				<br>
				<input type="password" class="form-control" id="member_pw" placeholder="비밀번호 입력">	
				<br>			
				<input type="password" class="form-control" id="member_pw_confirm" placeholder="비밀번호 재입력">
			</div>
		</div>
		
<!-- Input StudentId -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_studentId" class="control-label">학번</label>
				<br>
				<input type="text" class="form-control" id="member_studentId" placeholder="학번">
			</div>
		</div>
		
<!-- Input Department -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_department" class="control-label">학부</label>
				<br>
				
					<select class="form-control" id="member_department">
						<option value=" selected">학부</option>
						<option>소프트웨어학</option>
						<option>정보보호학</option>
						<option>멀티미디어학</option>
						<option>전자제어학</option>
					</select>
     
			</div>
		</div>
		
<!-- Input Name-->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_name" class="control-label">이름</label>
				<br>
				<input type="text" class="form-control" id="member_name" placeholder="이름">
			</div>
		</div>
		
<!-- Input Interest -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_interest" class="control-label">관심사</label>
				<br>
				
					<select class="form-control" id="member_interest">
						<option value=" selected">관심사</option>
						<option>소프트웨어학</option>
						<option>정보보호학</option>
						<option>멀티미디어학</option>
						<option>전자제어학</option>
					</select>
					
			</div>
		</div>
		
<!-- Input Gender -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_gender" class="control-label">성별</label>
				<br>
				<div class="form-inline">
					<input type="radio" name="gender" value="male" checked>남<br>
					<input type="radio" name="gender" value="female">여<br>
				</div>
			</div>
		</div>
		
<!-- Input Birth -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_birth" class="control-label">생년월일</label>
				<br>
				<input type="date" class="form-control" id="member_birth" placeholder="생년월일" min="1900-12-31" max="2025-12-31">
			</div>
		</div>
		
<!-- Input Email -->
		<div>
			<div class="col-md-offset-5 form-inline">
				<label for="member_email" class="control-label">이메일</label>
				<br>
				<input type="email" class="form-control" id="member_email" placeholder="이메일">
			</div>
		</div>
		
<!-- Join Button -->

		<div>
			<div class="col-md-offset-5 form-inline">
			<button type="submit" class="btn btn-default">가입하기</button>
			</div>
		</div>
		
	</form>

<!-- End Join Form -->

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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	
	
	$("button[type=submit]").on("click", function(){
	      $.ajax({
	         type:'post',
	         url:'/login',
	         data:$("#loginFrm").serialize(),
	         async:false,
	         success:function(data){
	            if(data.result == 'success'){
	               $("#loginFrm").html("<p class='text-center'>"+data.MEMBER_NAME+"님 환영합니다.</p>");
	               $(".logout").html("<h6 class='text-center' onclick='javascript:logout();'>•로그아웃하기</h6>")
	            }else{
	               alert("잘못된 아이디이거나 비밀번호 입니다.");
	               return false;
	               
	            }
	         }
	      })
	   })
	$(document).ready(function(){
	   var ID = '${loginMap.MEMBER_ID}';
	   if(ID != null && ID != ''){
	      $("#loginFrm").html("<p class='text-center'>${loginMap.MEM_NAME}님 환영합니다.</p>");
	      $(".logout").html("<h6 class='text-center' onclick='javascript:logout();'>•로그아웃하기</h6>");
	   }
	   
	});
	
	function logout(){
	   var confirm = window.confirm("로그아웃 하시겠습니까?");
	   if(confirm == true){
	      window.location.href="/logout";
	   }else{
	      return false;
	   }
	   
	}
	   
	
	</script>
	
	</body>
	
</html>