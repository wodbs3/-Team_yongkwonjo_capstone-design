<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
   <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>BUSomoim</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<section class="parallax-window" data-parallax="scroll"
		data-image-src="img/header_bg.jpg" data-natural-width="1400"
		data-natural-height="470">
		<div class="parallax-content-1">
			<div class="animated fadeInDown">
				<h1>MY PAGE</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><b>마이페이지</b></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> 회원 정보 </span> </h2>
	</div>

<div class = "container">
	<div class="row">
	<div class="col-md-5 toppad pull-right col-md-offset-4">
		<br>
	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 toppad">
			<form action="/deleteMember.do?member_id=${loginMap.member_id }" name="delete "method="POST">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">${loginMap.member_id}님의 회원 정보</h3>
				</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3 col-lg-3" align="center"><img src="/resources/userupload/${loginMap.fileName }" class="img-responsive"/></div>
		     <div class=" col-md-9 col-lg-9"> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>아이디:</td>
                        <td>${loginMap.member_id}</td>
                      </tr>  
                                            
                      <tr>
                        <td>이름:</td>
                        <td>${loginMap.member_name}</td>
                      </tr>         
                      <tr>
                        <td>성별:</td>
                        <td>${loginMap.member_gender}</td>
                      </tr> 
                      <tr>
                        <td>학교:</td>
                        <td>백석대학교</td>
                      </tr>
                      <tr>
                        <td>학번:</td>
                        <td>${loginMap.member_number}</td>
                      </tr>
                      <tr>
                        <td>전공:</td>
                        <td>${loginMap.member_major}</td>
                      </tr>
                      <tr>
                        <td>흥미:</td>
                        <td>${loginMap.member_interest}</td>
                      </tr>
                      <tr>
                        <td>이메일 주소:</td>
                        <td>${loginMap.member_mail}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
		</div>
		</div>
		</div>
	
	</div>
	</form>
</div>
</div>
<button class="btn btn-default" onclick="javascript:goModify()" type="button" id="modify">회원수정</button>
<a href="${pageContext.request.contextPath}/userDelete.do?member_id=${loginMap.member_id}" class="btn btn-default">회원삭제</a>



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
<script>
function goModify(){
	location.href="/userModify.do";
}

function goDelete(){
	location.href="/userDelete.do"
}

</script>

</body>
</html>