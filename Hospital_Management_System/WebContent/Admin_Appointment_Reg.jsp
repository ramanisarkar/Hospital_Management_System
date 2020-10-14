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
	<%-- <c:forEach items="${sessionScope.hospitaldata }" var="q" end="0"> --%>
		 <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="    margin-top: -8px;"> <span style="font-size:21px ">Hospital
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
	<%-- </c:forEach> --%>
	
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
			<div class="panel-body"><!-- STAR PANEL BODY DIV -->
				<form name="apintment_time_form" action="" method="post" class="form-horizontal apointment_times_form" id="patient_form"><!--- START Appointment TIME FORM -->
				<div class="form-group appointment_note" style="display:none;">	
					<div class="col-sm-offset-2 col-sm-10">
						<note>
							<p>
							</p><h3 style="color:#e21313fc;" class="appointment_msg"></h3>
							<input type="hidden" name="already_appointment_set_time" id="already_appointment_set_time" value="">	
							<p></p>				
						</note>
					</div>
				</div>
					<div class="form-group">
					<label class="col-sm-2 control-label" for="notice_content">Start Date<span class="require-field">*</span></label>
					
					<div class="col-sm-8">
					<input id="appointment_time_startdate" class="appointment_start_date appointmet_sdate datepicker form-control validate[required] text-input" type="text" value="" name="appointment_time_startdate" readonly="">
							
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="notice_content">End Date<span class="require-field">*</span></label>
					
					<div class="col-sm-8">
					<input id="appointment_time_enddate" class="datepicker form-control validate[required] text-input" type="text" value="" name="appointment_time_enddate" readonly="">
						
					</div>
				</div>	
			<div class="form-group">
			<label class="col-sm-2 control-label" for="time">Add Appointment Time<span class="require-field">*</span></label>
			</div>
						<div class="form-group">
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_monday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_monday" aria-expanded="false" href="#collapse_monday" data-parent="#accordion" data-toggle="collapse">
				   Monday</a>          	
					</h4>
				   </div>		
					<div id="collapse_monday" class="panel-collapse collapse" aria-labelledby="heading_monday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][monday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][monday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][monday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][monday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][monday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][monday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][monday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_monday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][monday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][monday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][monday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][monday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][monday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][monday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][monday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][monday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][monday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][monday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][monday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][monday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][monday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][monday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][monday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][monday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][monday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][monday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][monday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][monday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][monday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][monday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][monday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][monday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][monday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][monday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][monday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][monday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][monday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][monday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][monday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][monday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][monday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_monday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][monday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_tuesday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_tuesday" aria-expanded="false" href="#collapse_tuesday" data-parent="#accordion" data-toggle="collapse">
				   Tuesday</a>          	
					</h4>
				   </div>		
					<div id="collapse_tuesday" class="panel-collapse collapse" aria-labelledby="heading_tuesday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][tuesday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][tuesday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][tuesday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][tuesday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][tuesday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][tuesday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][tuesday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_tuesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][tuesday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][tuesday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][tuesday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][tuesday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][tuesday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][tuesday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][tuesday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][tuesday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][tuesday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][tuesday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][tuesday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][tuesday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][tuesday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][tuesday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][tuesday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][tuesday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][tuesday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][tuesday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][tuesday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][tuesday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][tuesday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][tuesday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][tuesday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][tuesday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][tuesday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][tuesday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][tuesday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][tuesday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][tuesday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][tuesday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][tuesday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][tuesday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][tuesday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_tuesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][tuesday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_wednesday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_wednesday" aria-expanded="false" href="#collapse_wednesday" data-parent="#accordion" data-toggle="collapse">
				   Wednesday</a>          	
					</h4>
				   </div>		
					<div id="collapse_wednesday" class="panel-collapse collapse" aria-labelledby="heading_wednesday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][wednesday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][wednesday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][wednesday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][wednesday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][wednesday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][wednesday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][wednesday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_wednesday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][wednesday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][wednesday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][wednesday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][wednesday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][wednesday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][wednesday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][wednesday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][wednesday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][wednesday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][wednesday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][wednesday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][wednesday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][wednesday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][wednesday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][wednesday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][wednesday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][wednesday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][wednesday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][wednesday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][wednesday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][wednesday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][wednesday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][wednesday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][wednesday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][wednesday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][wednesday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][wednesday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][wednesday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][wednesday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][wednesday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][wednesday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][wednesday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][wednesday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_wednesday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][wednesday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_thursday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_thursday" aria-expanded="false" href="#collapse_thursday" data-parent="#accordion" data-toggle="collapse">
				   Thursday</a>          	
					</h4>
				   </div>		
					<div id="collapse_thursday" class="panel-collapse collapse" aria-labelledby="heading_thursday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][thursday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][thursday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][thursday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][thursday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][thursday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][thursday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][thursday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_thursday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][thursday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][thursday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][thursday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][thursday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][thursday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][thursday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][thursday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][thursday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][thursday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][thursday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][thursday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][thursday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][thursday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][thursday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][thursday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][thursday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][thursday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][thursday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][thursday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][thursday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][thursday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][thursday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][thursday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][thursday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][thursday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][thursday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][thursday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][thursday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][thursday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][thursday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][thursday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][thursday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][thursday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_thursday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][thursday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_friday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_friday" aria-expanded="false" href="#collapse_friday" data-parent="#accordion" data-toggle="collapse">
				   Friday</a>          	
					</h4>
				   </div>		
					<div id="collapse_friday" class="panel-collapse collapse" aria-labelledby="heading_friday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][friday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][friday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][friday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][friday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][friday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][friday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][friday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_friday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][friday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][friday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][friday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][friday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][friday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][friday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][friday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][friday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][friday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][friday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][friday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][friday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][friday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][friday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][friday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][friday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][friday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][friday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][friday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][friday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][friday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][friday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][friday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][friday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][friday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][friday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][friday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][friday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][friday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][friday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][friday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][friday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][friday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_friday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][friday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_saturday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_saturday" aria-expanded="false" href="#collapse_saturday" data-parent="#accordion" data-toggle="collapse">
				   Saturday</a>          	
					</h4>
				   </div>		
					<div id="collapse_saturday" class="panel-collapse collapse" aria-labelledby="heading_saturday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][saturday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][saturday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][saturday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][saturday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][saturday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][saturday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][saturday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_saturday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][saturday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][saturday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][saturday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][saturday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][saturday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][saturday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][saturday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][saturday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][saturday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][saturday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][saturday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][saturday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][saturday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][saturday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][saturday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][saturday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][saturday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][saturday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][saturday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][saturday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][saturday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][saturday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][saturday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][saturday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][saturday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][saturday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][saturday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][saturday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][saturday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][saturday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][saturday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][saturday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][saturday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_saturday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][saturday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
					
			
			<div class="col-sm-offset-2 col-sm-8">
				<div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
				<div class="panel panel-default">
					<div id="heading_sunday" class="panel-heading" role="tab">
					<h4 class="panel-title">
					<a class="collapsed" aria-controls="collapse_sunday" aria-expanded="false" href="#collapse_sunday" data-parent="#accordion" data-toggle="collapse">
				   Sunday</a>          	
					</h4>
				   </div>		
					<div id="collapse_sunday" class="panel-collapse collapse" aria-labelledby="heading_sunday" role="tabpanel" aria-expanded="false" style="height: 0px;">
					<div class="panel-body">					
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Morning						</div> 
							
											
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_00_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][sunday]" value="10:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_15_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][sunday]" value="10:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_30_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][sunday]" value="10:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_10_45_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][sunday]" value="10:45"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_00_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][sunday]" value="11:00"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_15_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][sunday]" value="11:15"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_30_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][sunday]" value="11:30"> 
								</span>
								</span>
							</span></div>
												
							<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
								<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
								<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
								<span style="text-align: center" class="appointment_col_md_12 col-md-12">
								<span class="selected_11_45_sunday" style="float: left;width: 100%;padding: 0px;">
								<input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][sunday]" value="11:45"> 
								</span>
								</span>
							</span></div>
											
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
							Afternoon						</div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][sunday]" value="12:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][sunday]" value="12:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][sunday]" value="12:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_12_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][sunday]" value="12:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][sunday]" value="01:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][sunday]" value="01:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][sunday]" value="01:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_01_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][sunday]" value="01:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][sunday]" value="02:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][sunday]" value="02:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][sunday]" value="02:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_02_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][sunday]" value="02:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][sunday]" value="03:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][sunday]" value="03:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][sunday]" value="03:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_03_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][sunday]" value="03:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][sunday]" value="04:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][sunday]" value="04:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][sunday]" value="04:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_04_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][sunday]" value="04:45"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][sunday]" value="05:00"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][sunday]" value="05:15"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][sunday]" value="05:30"></span>
							</span>
						</span></div>	
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_05_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][sunday]" value="05:45"></span>
							</span>
						</span></div>	
									
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">		
						Evening					</div>			
											<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][sunday]" value="06:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][sunday]" value="06:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][sunday]" value="06:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_06_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][sunday]" value="06:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][sunday]" value="07:00"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_15_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][sunday]" value="07:15"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_30_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][sunday]" value="07:30"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_07_45_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][sunday]" value="07:45"></span>
							</span>
						</span></div>
												<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
							<span style="border: 1px solid #000;padding: 0;" class="appointment_col_md_12 col-md-12">  
							<span style="padding: 5px;border-bottom: 1px solid #000;text-align: center;background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
							<span style="text-align: center" class="appointment_col_md_12 col-md-12">
							<span class="selected_08_00_sunday" style="float: left;width: 100%;padding: 0px;">
							<input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][sunday]" value="08:00"></span>
							</span>
						</span></div>
											
					</div>
					</div>
				</div>        
			</div>	
			</div>
							</div>
				<input type="hidden" id="_wpnonce" name="_wpnonce" value="56751934d4"><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=appointment&amp;tab=appointment_time">				<div class="col-sm-offset-2 col-sm-8">
					<input type="submit" id="btnsavetime" value="Save" name="save_appointment_time" class="btn btn-success">
				</div>
			</form><!-- end appointment time form-->
		</div>
			</div>
			</div></div></div>
</body>
</html>