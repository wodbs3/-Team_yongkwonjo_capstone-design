<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang='utf-8'>
  <head>
    <meta charset='utf-8' />

    <link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.min.css' rel='stylesheet' />
    <link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.min.css' rel='stylesheet' />
    <link href='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.min.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.min.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.min.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.min.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.min.js'></script>
        <link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.css' rel='stylesheet' />
    <link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
    <link href='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.js'></script>
    <script src='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.js'></script>
    
   
<style>
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 900px;
  margin: 40px auto;
}
</style>

  </head>
  
  <body>
  
   <div id='calendar'></div>



	
 <script>
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
    	    selectable: true,
    	 
    	    header: {
//     	      left: 'prev,next today',
//     	      center: 'title',
//     	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    	    },
    	   	
    	    select: function(info) {
    	    var schedule = new String(prompt('일정입력'));
    	    console.log("일정입력" + schedule);
    	    
    	    
    	    	if(schedule == null){
    	    		alert("일정을 입력하세요");
    	    	
    	    	} else {
    	    		calendar.addEvent({
        	    		title: schedule,
        	    		start: info.startStr,
        	    		end: info.endStr,
        	    		allDay:true
    	    		});
    	    	}
    	     
    	    }
    	    
    	
    	  });

    	  calendar.render();
    	});
    </script>
   
  </body>
  
  
</html>