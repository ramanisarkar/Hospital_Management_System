<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>

<script>
$(document).ready(function(){
	$('#multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        enableCaseInsensitiveFiltering: true,
        filterPlaceholder: 'Search for something...'
    });
	$('#editevent').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        enableCaseInsensitiveFiltering: true,
        filterPlaceholder: 'Search for something...'
    });
	$('.input-group.date').datepicker({format: "dd/mm/yyyy"}); 
	var username = "eventList";
	$.get('Event', { flag: username }, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td style="padding-top: 15px;">' + obj[index].title + '</td>';
			html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].comment + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].startdate + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
			html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].eventfor + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.eventlist').append(html);
		});
		$('#example').DataTable();
	});
	$('#insert_Event_Form').on('submit', function(event) {
		event.preventDefault();
		var form = $('#insert_Event_Form')[0];
		var data = new FormData(form);
		console.log("data");
		console.log("form");
		$("#insertevent").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "Event",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(response) {
				var obj = JSON.parse(response);
				var count = 0;
				table = $('#example').DataTable();
				table.destroy();
				$('.eventlist').children('tr').remove();
				$.each(obj, function(index, value) {
					count++;
					var html = '';
					html += '<tr id=' + count + '>';
					html += '<td style="padding-top: 15px;">' + obj[index].title + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].comment + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].startdate + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].eventfor + '</td>';
					html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
					html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
					$('.eventlist').append(html);
				});
				var message = obj[0].updateevent;
				console.log(message)
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#insert_Event_Form")[0].reset();
					$('#example').DataTable();
				}
				$("#insertevent").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#insertevent").prop("disabled", false);
			}
		});
	});
	
	$(document).on('click', '.editEvent', function() {
		var editid = $(this).data('edit_id');
		console.log(editid);
		var event = $('#EventId' + editid).val();
		var username = "eventEdit";
		console.log(event);
		$.get('Event', { flag: username, eventId: event }, function(response) {
			$("#eventtab1").hide();
			var obj = JSON.parse(response);
			console.log(response);
			$("#eventtab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#eventId').val(obj[0].id);
			$('#adminId').val(obj[0].aid);
			$('#joinig').val(obj[0].joiningdate);
			$('#eventname').val(obj[0].eventname);
			$('#eventtitle').val(obj[0].title);
			$('#comment').val(obj[0].comment);
			$('#startdate').val(obj[0].startdate);
			$('#enddate').val(obj[0].enddate);
			$.each(obj, function(index) {
				$("#editevent").find("option[value="+obj[index].eventfor+"]").prop("selected", "selected");
			});
		    $("#editevent").multiselect('refresh');
		});
	});
	$('#update_Event_Form').on('submit', function(event) {
		event.preventDefault();
		var form = $('#update_Event_Form')[0];
		var data = new FormData(form);
		console.log(form);
		console.log(data);
		$("#updateevent").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "Event",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(response, textStatus, jqXHR) {
				var obj = JSON.parse(response);
				var count = 0;
				table = $('#eventTable').DataTable();
				table.destroy();
				$('.eventlist').children('tr').remove();
				$.each(obj, function(index, value) {
					count++;
					var html = '';
					html += '<tr id=' + count + '>';
					html += '<td style="padding-top: 15px;">' + obj[index].title + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].comment + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].startdate + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].eventfor + '</td>';
					html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
					html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
					$('.eventlist').append(html);
				});
				var message = obj[0].updateevent;
				console.log(message)
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Update Successsfully");
					$('#example').DataTable();
				}
				$("#updateevent").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#updateevent").prop("disabled", false);
			}
		});
	});
	$(document).on('click', '.deleteEvent', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var event = $('#EventId'+deleteid).val();
		var username = "eventDelete";
		$(".deleteEvent").prop("disabled", true);
		$.get('Event',{flag:username , eventId:event},function(response){
			var obj = JSON.parse(response);
			var count = 0;
			table = $('#eventTable').DataTable();
			table.destroy();
			$('.eventlist').children('tr').remove();
			$.each(obj, function(index, value) {
				count++;
				var html = '';
				html += '<tr id=' + count + '>';
				html += '<td style="padding-top: 15px;">' + obj[index].title + '</td>';
				html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].comment + '</td>';
				html += '<td style="padding-top: 15px;">' + obj[index].startdate + '</td>';
				html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
				html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].eventfor + '</td>';
				html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
				html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
				$('.eventlist').append(html);
			});
			var message = obj[0].updateevent;
			console.log(message)
			if (message == "true") {
				$('#message1').show();
				$('#message2').show();
				$('#message3').show();
				$('#messagepass').text("Record Delete Successsfully");
				$('#eventTable').DataTable();
			}
			$(".deleteEvent").prop("disabled", false);
		});
	});

   	$(".nav-tabs a").click(function(){
   		$("#eventtab2").hide();
   		$("#eventtab1").show();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	});
   	
});
</script>

<style type="text/css">
.multiselect-container {
    width: 751px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.dropdown-toggle{
   width: 751px !important;
}
.title {
	color: white;
	padding: 8px;
}
.text{

text-align: right;
}
.ullist {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 15%;
	background:  #364150;
	height: 100%;
	overflow: auto;
}
.nav>li>a:focus, .nav>li>a:hover {
    text-decoration: none;
    background-color: #2C3542; !important;
}

.tabcalss>li>a {
	color:#555555;
    position: relative;
    display: block;
    padding: 10px 15px;
    background-color: #f1f4f9;
}
.tabcalss>li>a:hover {
	color:#555555;
    position: relative;
    display: block;
    padding: 10px 15px;
    background-color: white;
}
#message1 {
    background: #fff none repeat scroll 0 0;
    border-left: 4px solid #7ad03a;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
    margin: 5px 15px 9px;
    padding: 9px 0px 1px 13px;
}
table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_desc_disabled:after {
    position: absolute;
    bottom: 8px;
    right: 8px;
    display: block;
    font-family: 'Glyphicons Halflings';
    opacity: 0.5;
}table.dataTable thead .sorting_asc:after {
    content: "\e155";
}

table.dataTable thead .sorting_desc:after {
     content: "\e156";
}
table.dataTable thead .sorting_asc:last-child:after {
    display:none !important;
}

table.dataTable thead .sorting_desc:last-child:after {
display:none !important;
}
table.dataTable thead .sorting:after {
    content: "\e156";
}
table.dataTable thead .sorting:last-child:after{
display:none !important;
}

.table th:focus {
	outline: 0 !important;
}
.table th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
    position: relative;
}
.dataTables_filter {
    margin-left: 301px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#example_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#example_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;
}
</style>
</head>
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
		 <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="    margin-top: -8px;"> <span style="font-size:22px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white; margin-top: 17px; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
						<img src="images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-top: -15px;" >								
						<span>${q.hospitalname }</span> <b class="caret"></b>
				</a>
				<ul class="dropdown-menu extended logout">
					<li><a  href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><i class="fa fa-user"></i>
							My Profile</a></li>
					<li><a href="Com_Login.jsp"><i class="fas fa-sign-out-alt"></i>Log Out </a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div hidden="" id="message1" class="updated below-h2"style="width: 81%;margin-left: 253px;margin-top: 27px;"><p id="messagepass"></p></div>
		<div id="message3"style="margin-top:-76px;" hidden=""></div>
		<ul class="nav nav-pills nav-stacked ullist"style="margin-top: -20px; height: 1170;">
			<li><a href="Admin_Login.jsp"><span class="icone"><img src="ing/dashboard.png"></span><span class="title">Dashboard</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Department?flag=insert&id=${q.id }"><span class="icone"><i class="fas fa-briefcase" style="color: gray;"></i></span><span class="title">Department</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Specialization?flag=insert&id=${q.id }"><span class="icone"><i class="fa fa-lightbulb" style="color: gray;"></i></span><span class="title">Specialization</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Doctor?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Doctor" title="Doctor">
			<span class="icone"> <img src="ing/doctor-logo.png"></span>
			<span class="title">Doctor</span></a></li>
			
			<li><a href="" class="left-tooltip" data-tooltip="Outpatient" title="Outpatient">
			<span class="icone"> <img src="ing/outpatient-logo.png"></span>
			<span class="title">Outpatient</span></a></li>
			
			<li><a href="" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"> <img src="ing/Patient-logo.png"></span>
			<span class="title">Inpatient</span></a></li>
			
			
			<li><a href="<%=request.getContextPath()%>/Nurse?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Nurse" title="Nurse">
			<span class="icone"> <img src="ing/Nurse-logo.png"></span>
			<span class="title">Nurse</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/SupportStaff?flag=insert&id=${q.id }"class="left-tooltip" data-tooltip="Support Staff" title="Support Staff">
			<span class="icone"> <img src="ing/support-logo.png"></span>
			<span class="title">Support Staff</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Pharmacist?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Pharmacist" title="Pharmacist">
			<span class="icone"> <img src="ing/Pharmacist-logo.png"></span><span class="title">Pharmacist</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Laboratory?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Laboratory Staff" title="Laboratory Staff">
			<span class="icone"> <img src="ing/Laboratorist-logo.png"></span><span class="title">Laboratory Staff</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/AccountantStaff?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Accountant" title="Accountant">
			<span class="icone"> <img src="ing/Accountant-logo.png"></span><span class="title">Accountant</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Medicine?flag=insert&id=${q.id }" data-tooltip="Medicine" title="Medicine">
			<span class="icone"> <img src="ing/Medicine-logo.png"></span><span class="title">Medicine</span></a></li>
			<li><a href="<%=request.getContextPath()%>/TreatmentUpdate?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Treatment" title="Treatment">
			<span class="icone"> <img src="ing/Treatment-logo.png"></span><span class="title">Treatment</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
			<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
			<span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign Bed-Nurse</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Operation List" title="Operation List">
			<span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation List</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
			<span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span class="title">Diagnosis</span></a></li>
			<li><a href="<%=request.getContextPath()%>/BloodManage?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
			<span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood Bank</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
			<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
			<span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Event" title="Event">
			<span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Message" title="Message">
			<span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
			<span class="icone"> <img src="ing/Ambulance-logo.png"></span><span class="title">Ambulance</span></a></li><li><a href="" class="left-tooltip" data-tooltip="instrument" title="instrument">
			<span class="icone"> <img src="ing/Instrument-logo.png"></span><span class="title">Instrument</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
			<span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Account" title="Account">
			<span class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a></li>	
		</ul>
	</c:forEach>
	
	<div style="margin-top: 83px;"></div>
	<div id="message2" style="margin-top: 149px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -77%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li style="background-color: f1f4f9;">
					<a href="#home" id="Bloodtab4" data-toggle="tab">
						<i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Even List
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu1" id="eventtab1" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true"style="border-radius: 50%; padding: 8px;"></i>Add Event
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu2" id="eventtab2" style="display: none;" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Event
					</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
				        <thead>
				            <tr>
				            	 <th width="124px;">Title</th>
								 <th width="133.6px;">Comment</th>
								 <th width="114.2px;">Start Date</th>
								 <th width="96.2px;">End Date</th>
								 <th width="173px;">For</th>
								 <th width="140px;">Action</th>
							</tr>
				        </thead>
				        <tbody class="eventlist" >
						</tbody>
						<tfoot>
				            <tr>
				            	 <th width="124px;">Title</th>
								 <th width="133.6px;">Comment</th>
								 <th width="114.2px;">Start Date</th>
								 <th width="96.2px;">End Date</th>
								 <th width="173px;">For</th>
								 <th width="140px;">Action</th>
							</tr>
				        </tfoot>
				   	</table>
			    	<div style="margin-top: 26px;"></div>
   			 </div>
			<div id="menu1" class="tab-pane" style="margin-top: 20px;">
				<form id="insert_Event_Form">
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event/Notice<span style="color: red;">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<select class="form-control" name="event" >
								<option value="" disabled selected hidden="">Select Event And Notice</option>
								<option value="event">Event</option>
								<option value="notice">Notice</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event Title<span style="color: red;">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<input type="text" class="form-control" name="eventtitle"required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event Comment</label>
						<div class="col-sm-8 margin_bottom_5px">
							<textarea name="eventcommnet" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">Start Date<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" name="startdate"  class="form-control" placeholder="dd/mm/yyyy">
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">End Date<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" name="eventenddate"  class="form-control" placeholder="dd/mm/yyyy">
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">Event For<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<select id="multiselect" name="eventfor[]" multiple class="col-sm-8 form-control" required="required">
							  <option value="Patient">Patient</option>
							  <option value="Doctor">Doctor</option>
							  <option value="Nurse">Nurse</option>
							  <option value="SupportStaff">Support Staff</option>
							  <option value="Pharmacist">Pharmacist</option>
							  <option value="LaboratoryStaff">Laboratory Staff</option>
							  <option value="Accountant">Accountant</option>
							</select>
						</div>
					</div>
					<div class="col-sm-offset-2" style="margin-left: 194px;">
						<input type="hidden" name="flag" value="insertevent">
						<input type="submit" value="Save" id="insertevent" class="btn btn-success"style="margin-bottom: 15px; margin-right: 15px;">
					</div>	
				</form>
			</div>
			<div id="menu2" class="tab-pane" style="margin-top: 15px;">
				<form id="update_Event_Form">
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event/Notice<span style="color: red;">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<select class="form-control" id="eventname" name="event" >
								<option value="" disabled selected hidden="">Select Event And Notice</option>
								<option value="event">Event</option>
								<option value="notice">Notice</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event Title<span style="color: red;">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<input type="text" id="eventtitle" class="form-control" name="eventtitle" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label text">Event Comment</label>
						<div class="col-sm-8 margin_bottom_5px">
							<textarea name="eventcommnet" id="comment" class="form-control" ></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">Start Date<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" id="startdate" name="startdate"  class="form-control" placeholder="dd/mm/yyyy" required>
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">End Date<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" id="enddate"name="eventenddate"  class="form-control" placeholder="dd/mm/yyyy" required>
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label text">Event For<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<select id="editevent"name="eventfor[]" multiple class="col-sm-8 form-control">
							  <option value="Patient">Patient</option>
							  <option value="Doctor">Doctor</option>
							  <option value="Nurse">Nurse</option>
							  <option value="SupportStaff">Support Staff</option>
							  <option value="Pharmacist">Pharmacist</option>
							  <option value="LaboratoryStaff">Laboratory Staff</option>
							  <option value="Accountant">Accountant</option>
							</select>
						</div>
					</div>
					<div class="col-sm-offset-2" style="margin-left: 194px;">
						<input type="hidden" name="flag" value="updateevent">
						<input type="hidden" name="eventId" id="eventId">
						<input type="hidden" name="adminid" id="adminId">
						<input type="hidden" name="joinig" id="joinig">
						<input type="submit" value="Update" id="updateevent" class="btn btn-success"style="margin-bottom: 15px; margin-right: 15px;">
					</div>	
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>