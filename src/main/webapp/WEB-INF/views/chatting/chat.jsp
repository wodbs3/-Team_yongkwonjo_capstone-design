<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/chat.css">
<title>AJAX 실시간 채팅 사이트</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/resources/js/bootstrap.js"></script>
	<script type="text/javascript">
		function submitFunction() {
			var chatName = $('chatName').val();
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "./ChatSubmitServlet",
				data: {
					chatName: chatName,
					chatContent: chatContent
				},
				success: function(result) {
					if(result == 1) {
						autoClosingAlert('#successMessage', 2000);
					}else if(result == 0) {
						autoClosingAlert('#dangerMessage', 2000);
					}else{
						autoClosingAlert('#warningMessage', 2000);
						}
				}
			});
			$('#chatContent').val('');
		}
		function autoClosingAlert(selector, delay) {
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() { alert.hide()}, delay);
		}
	</script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-grren"></i>채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height:300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2019년 11월 18일</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												<img class="media-object img-circle" src="/resources/img/groupcreate/food.jpg"> 
											</a>
											<div class="media-body">
												<h4 class="media-heading">남사욱
												<span class="small pull-right">오전 12:23</span>
												</h4>
											</div>
											<p> ㅎㅇ 
										</div> 
									</div>
								</div>
									<div class="portlet-footer">
		<div class="row">
			<div class="form-group col-xs-4">
				<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20">
				
			</div>
		</div>
	</div>
	<div class="row" style="height:90px">
		<div class="form-group col-xs-10">
			<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>		
		</div>
		<div class="form-group col-xs-2">
			<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
			<div class="clearfix"></div>
		</div>
	</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메세지 전송에 성공하였습니다.</strong>
	</div>
		<div class="alert alert-danger" id="dangerMessage" style="display:none;">
		<strong>이름과 내용을 입력해주세요.</strong>
	</div>
		<div class="alert alert-warning" id="warningMessage" style="display:none;">
		<strong>데이터베이스 오류</strong>
	</div>
	</div>

</body>
</html>