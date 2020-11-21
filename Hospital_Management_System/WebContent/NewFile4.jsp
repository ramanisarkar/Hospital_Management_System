<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="https://bootswatch.com/3/lumen/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
 
<script type="text/javascript">

$(function() {

	  $('#calendar').fullCalendar({
	    themeSystem: 'bootstrap3',
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'month,agendaWeek,agendaDay,listMonth'
	    },
	    weekNumbers: true,
	    eventLimit: true, // allow "more" link when too many events
	    events: 'https://fullcalendar.io/demo-events.json'
	  });

	});
</script>
<style type="text/css">
html, body {
  margin: 0;
  padding: 0;
  font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
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
</body>
</html>