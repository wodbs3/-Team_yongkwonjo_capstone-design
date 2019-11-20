<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/chat.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.pubnub.com/pubnub-3.4.4.js"></script>
<script>
    var pubnub = PUBNUB.init({
    	publish_key: 'pub-c-04359bbf-659b-4944-8870-5338ecbc06b6',
    	subscribe_key: 'sub-c-e464efaa-0bd4-11ea-ad54-52dd774e953e',
    	ssl: true
    });
    
    pubnub.subscribe({
    	channel: 'chat',
    	message: displayPub
    });
    
    pubnub.history({
    	channel: 'chat',
    	reverse: true,
    	count: 100
    }, function(status, response){
    	$.each(status[0], function(i, item){
    		displayPub(item);
    	});
    });

	function displayPub(message){
		var html = "<div>"+message.username+": "+message.text+"</div>";
		$("#chatPub").append(html).scrollTop(999999);
	}
	
	function sendPub(){
		if($("#name").val() == ''){
			alert("enter your name");
			return;
		}
		if($("#messagePub").val() == '') return;
		pubnub.publish({
			channel: 'chat',
			message:{
				username: $("#name").val(),
				text: $("#messagePub").val()
			}
		});
		$("#messagePub").val('').focus();
	}

	$(document).ready(function(){
		$("#sendPub").click(function(){
			sendPub();
		});
		$("#messagePub").keyup(function(event){
			if(event.keyCode == 13) sendPub();
		});
	});
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
								<h4>
									<i class="fa fa-circle text-green"></i>익명 채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatPub" class="portlet-body chat-widget"
								style="overflow-y: auto; width: auto; height: 300px;"></div>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height: 40px;" type="text" id="name"
											name="name" class="form-control" placeholder="이름"
											maxlength="8">

									</div>

									<div class="row">
										<div class="form-group col-xs-4">
										<input type="text" class="form-control" id="messagePub" style="height: 40px;" placeholder="메세지를 입력하세요."/>
<!-- 											<textarea style="height: 80px;" id="chatContent" -->
<!-- 												class="form-control" placeholder="메세지를 입력하세요." -->
<!-- 												maxlength="100"></textarea> -->
										</div>
										<div class="form-group col-xs-3">
											<input type="submit" class="btn btn-default pull-right" id="sendPub" value="enter"/>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 	<input type="text" id="name" placeholder="name" required/> -->
<!-- <input type="text" id="messagePub" placeholder="message" required/> -->
<!-- <input type="submit" pull-right" id="sendPub" value="enter"/> -->
<!-- <div id="chatPub" style="overflow: auto;height:200px;"></div> -->

</body>
</html>