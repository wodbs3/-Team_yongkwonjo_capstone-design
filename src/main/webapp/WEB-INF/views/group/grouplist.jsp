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
	<title>GroupList</title>
		
	    <link href="https://fonts.googleapis.com/css?family=Gochi+Hand|Lato:300,400|Montserrat:400,400i,700,700i" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/resources/css/base.css" rel="stylesheet">

    <!-- REVOLUTION SLIDER CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
	<link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/rev-slider-files/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    
    
    <style>
      .thead-dark {
    th {
      color: $table-dark-color;
      background-color: $table-dark-bg;
      border-color: $table-dark-border-color;
    }
  }
    
    
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="container" style="margin-bottom: 333px;width: 60%; margin-left:20%; margin-top: 10%;">
    <form id="groupForm" name="groupForm" method="post">
        <table class="table">
            <thead class="thead-dark" style="
    background: #474747;
    color: white;
">
                <tr>
                    <th>번호</th>
                    <th>그룹이름</th>
                    <th>그룹소개</th>
                    <th>그룹흥미</th>
                    <th>그룹정원</th>
                    <th>생성날짜</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="GroupList" items="${GroupList}" varStatus="status">
                    <tr>
                        <td><a href="${pageContext.request.contextPath }/group/groupInfo.do?groupList_number=${GroupList.grouplist_number }"><c:out value="${GroupList.grouplist_number }"/></a></td>
                        <td><a href="${pageContext.request.contextPath }/group/groupInfo.do?groupList_number=${GroupList.grouplist_number }"><c:out value="${GroupList.grouplist_name }"/></a></td>
                        <td><c:out value="${GroupList.grouplist_introduce }"/></td>
                        <td><c:out value="${GroupList.grouplist_interest }"/></td>
                        <td><c:out value="${GroupList.grouplist_people }"/></td>
                        <td><c:out value="${GroupList.grouplist_date }"/></td>
                        <td>                        
	                        <div>
		                        <c:if test="${loginMap.member_id != null && loginMap.member_id == GroupList.comment_id}">      
		                           <div class="col-md-4">
		                           		<a href="groupJoin.do?memberNum=${member.member_number }" class="btn btn-default" id="groupJoinButton">가입하기</a>
		                           </div>
		                        </c:if>
	                        </div>
						</td>
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
            <a href='#' onclick="javascript:goCreate();" class="btn btn-success">그룹생성</a>
        </div>
        </c:otherwise>
        </c:choose>
    </form>
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
		location.href="/GroupCreate.do";
	}
	
	function goLogin() {
		location.href="/login.do";
	}

	function goJoin() {
		location.href="/groupJoin.do";
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
	
	<script>
	/* 그룹 가입여부 체크 */
	/* 1. 회원에서 가입 여부 상태를 가져온다. */
	/* 2. 만약에 회원이 이미 가입한 그룹이라면 버튼을 disabled */
	/* 3. 회원이 가입한 그룹이 아니라면 removeAttr("disabled") */
	$("#groupJoinButton").click(function(){
		var query = {group_number : $("#group_number").val()};
		$.ajax({
			url : "/groupJoinCheck.do",
			type : "post",
			data : query,
			success : function(data) {
				if(data == 0) {
					$("#submit").attr("disabled", "disabled");
				} else if (data == 1){
					$("#submit").removeAttr("disabled");
				}
			}
		});
	});
	</script>
	
</body>
</html>
