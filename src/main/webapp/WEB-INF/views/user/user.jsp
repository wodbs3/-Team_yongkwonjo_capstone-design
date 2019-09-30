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


	<form id="loginFrm" method="post" class="form-horizontal" style="margin-top:10%">
		<div class="form-group">
		<label for="id" class="col-sm-2 control-label">Id</label>
         <div class="col-md-6 col-sm-10">
            <input type="text" class="form-control" id="member_id" placeholder="id">
         </div>
      </div>
      <div class="form-group">
         <label for="ipw" class="col-sm-2 control-label">Password</label>
         <div class="col-md-6 col-sm-10">
            <input type="password" class="form-control" id="member_pw" placeholder="pw">
         </div>
      </div>
      <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Login</button>
         </div>
      </div>
   </form>

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