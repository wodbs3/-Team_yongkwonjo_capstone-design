<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<title>사진 등록</title>
	
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
				<h1>GALLERY WRITE</h1>
			</div>
		</div>
	</section>
		<div id="position">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/index">Home</a></li>
				<li><b>사진 등록</b></li>
			</ul>
		</div>
	</div>
	<div class="col-md-12">
	<h2 style="
    text-align: center;
"> <span> 사진 등록 </span> </h2>
	</div>
	
<div class="container margin_60">
<div class="col-md-offset-3 col-md-6" style="margin-top: 3%;">
    <form action="fileUpload.do?groupList_number=${groupList_number }" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data">
    	
        <div>
        	<div class="row">
    			<div class="col-md-8"></div>
    			<div class="col-md-4">
    				<input type="file" name="file_name" id="imgInput" class="btn_1"/>
     					
     			</div>
     		
    		</div>
           
            <h5>작성자:<input type="text" id="writer" name="writer" value="${loginMap.member_id }" readonly/></h5>
         	<h3>미리보기</h3>
         	
     		<img width="486.4px;" height="198px;" id="image_section" src="#" style="
    		margin-left: 53px;">
			
            <div style=" width : 100%;">
                <table style = " width : 100%;">
<!--                     <tr> -->
<!--                         <th style = "width : 10%; font-size: 20px;"> 제목</th> -->
<!--                         <td><input style="width: 100%" type="text" id="title" name="title" /></td> -->
<!--                     </tr> -->
					
                    <tr>
                        <th style = "width : 10%; font-size: 20px;">내용</th>
                        <td><textarea style="width: 100%" rows="10" cols="10" id="content" name="content"></textarea></td>
                    </tr>
                 
                </table>
                <div style = "text-align: right;">
                	<input type="submit" class="btn btn-success"  value="등록">
                    <a href="/group/groupInfo.do?groupList_number=${groupList_number }#gallery" class="btn btn-success">목록</a>
                </div>
            </div>
        </div>
    </form>
    </div>
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

</body>
</html>