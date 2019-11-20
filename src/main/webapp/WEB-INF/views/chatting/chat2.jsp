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


<input type="text" id="name" placeholder="name" required/>
<input type="text" id="messagePub" placeholder="message" required/>
<input type="submit" id="sendPub" value="enter"/>

<div id="chatPub" style="overflow: auto;height:200px;"></div>