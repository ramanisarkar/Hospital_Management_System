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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<script src="js/Blood_Manage.js"></script>
 

<style type="text/css">
img.dashboard_background {
  float: left;
  width: 100%;
}
.info-box .patient .info-box-stats p {
  font-family: 'Open Sans';
  color: red;
  font-size: 34px; 
}
.hi{
font-family: 'Open Sans';
  color: red;
  font-size: 34px;
}
.info-box .patient .info-box-stats span.info-box-title {
	font-family: 'Open Sans';
  color: #22baa0;
  font-size: 34px; 
}
.info-box .panel-body {
	  background-position: right center !important;
	}
	.info-box .info-box-icon i {
    float: right;
    font-size: 70px !important;
}
.info-box img{
 
	transition: all 0.3s ease 0s;
} .info-box:hover img
{
	transition: all 0.3s ease 0s;
    transform: scale(1.2);
    overflow: hidden;
}  
.info-box .info-box-stats {
	  position: absolute;
	  left: 8%;
	  top: 15%;
	  z-index:2;
}
.info-box .panel-body {
  padding: 0 !important;
}
.info-box{
	box-shadow: 0px 0px 8px #22baa0 ;
	overflow: hidden;
	border: 1px solid #22baa0;
}
.info-box1{
	box-shadow: 0px 0px 8px red !important;
	overflow: hidden;
	border: 1px solid red ;
}
.info-box2{
	box-shadow: 0px 0px 10px #f0ad4e !important;
	overflow: hidden;
	border: 1px solid #eea236 ;
}
.info-box3{
	box-shadow: 0px 0px 8px green !important;
	overflow: hidden;
	border: 1px solid green ;
}
.img-fludia{
max-width: 100%;
height: auto;
}
.require-field{
color: red;
}
.multiselect-container {
    width: 653px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
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
#tableBloodInword_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableBloodInword_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#tableBloodDoner_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableBloodDoner_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#tableBloodDonorHistry_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableBloodDonorHistry_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#tableBloodDonorView1_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableBloodDonorView1_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#tableoutwordlist_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableoutwordlist_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;
}
.dateformat {
    position: relative;
    color: white;
}

.dateformat:before {
    content: attr(data-date);
    color: black;
}

.dateformat::-webkit-datetime-edit, input::-webkit-inner-spin-button, input::-webkit-clear-button {
    display: none;
}

.dateformat::-webkit-calendar-picker-indicator {
    position: absolute;
    top: 3px;
    right: 0;
    color: black;
    opacity: 1;
}
#icone{
	padding-bottom: 8px;
    padding-top: 8px;
    padding-right: 5px;
}
#clickBloodOutwordList{
	border: none;
	background: none;
	width: 248.5px;
	margin-left: -5px;
}
#clickBloodOutwordList:focus{
	outline: none;
}
.input-group-addon {
    background-color: white !important;
    border: none!important;
}
.icone {
  float: left;
  height: 20px !important;
  margin-right: 5px;
  overflow: hidden;
  width: 25px !important;
  text-align: center;
}
.nav-tabs>li>a {
    margin-right: 8px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}
</style>
</head>

<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;font-size: 13px;">
	
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0"> 
		 <div class="navbar" style="padding-right: 14px;  background-color: white;height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white; margin-top: 17px; color: #5f5f5f !important;height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
						<img src="Admin_Images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-top: -15px;" >								
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
			<li><a href="<%=request.getContextPath()%>/PatientRegistration?flag=insert&id=${q.id }"><span class="icone"><i class="fas fa fa-wheelchair" style="color: gray;"></i></span><span class="title">Patient Registration</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Department?flag=insert&id=${q.id }"><span class="icone"><i class="fas fa-briefcase" style="color: gray;"></i></span><span class="title">Department</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Specialization?flag=insert&id=${q.id }"><span class="icone"><i class="fa fa-lightbulb" style="color: gray;"></i></span><span class="title">Specialization</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Doctor?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Doctor" title="Doctor">
			<span class="icone"> <img src="ing/doctor-logo.png"></span>
			<span class="title">Doctor</span></a></li>
			
			<li><a href="" class="left-tooltip" data-tooltip="Outpatient" title="Outpatient">
			<span class="icone"> <img src="ing/outpatient-logo.png"></span>
			<span class="title">Outpatient</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
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
			<li><a href="<%=request.getContextPath()%>/Prescription?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
			<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
			<span class="title">Add Bad</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
			<span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign Bed-Nurse</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Operation List" title="Operation List">
			<span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation List</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
			<span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span class="title">Diagnosis</span></a></li>
			<li><a href="<%=request.getContextPath()%>/BloodManage?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
			<span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood Bank</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
			<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
			<span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a></li><li>
			<a href="<%=request.getContextPath()%>/Event?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Event" title="Event">
			<span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Message" title="Message">
			<span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Ambulance?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
			<span class="icone"> <img src="ing/Ambulance-logo.png"></span><span class="title">Ambulance</span></a></li><li><a href="" class="left-tooltip" data-tooltip="instrument" title="instrument">
			<span class="icone"> <img src="ing/Instrument-logo.png"></span><span class="title">Instrument</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
			<span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Account" title="Account">
			<span class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a></li>
		</ul>
	</c:forEach>
	
	<div id="message2" style="margin-top: 67px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss" style="font-size: 13px;font-weight: bold;">
				<li class="active" id="BloodManagetab">
					<a href="#home"	data-toggle="tab"><i class="fa fa-bars"aria-hidden="true"id="icone"></i>Blood Stock</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu1" id="Bloodtab1" data-toggle="tab"><i class="fa fa-bars"aria-hidden="true" id="icone"></i>Blood Donor List</a></li>
				<li style="background-color: f1f4f9;">
					<a href="#menu2" id="Bloodtab2" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" id="icone"></i>Add Blood Donor
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu3" id="Bloodtab3" style="display: none;" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" id="icone"></i>Edit Blood Donor</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu10"  id="Bloodtab10" data-toggle="tab"style="display: none;">
						<i class="fas fa-edit"aria-hidden="true" id="icone"></i>View Blood Donor</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu4" id="Bloodtab4" data-toggle="tab">
						<i class="fa fa-bars"aria-hidden="true" id="icone"></i>Blood Inword List
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu5" id="Bloodtab5" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true"id="icone"></i>Add Blood Inword
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu6" id="Bloodtab6" style="display: none;" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" id="icone"></i>Edit Blood Inword
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu7" id="Bloodtab7" data-toggle="tab">
						<i class="fa fa-bars"aria-hidden="true" id="icone"></i>Blood Outword List 
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu8" id="Bloodtab8" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" id="icone"></i>Add Blood Outword 
					</a>
				</li>
				<li style="background-color: f1f4f9;">
					<a href="#menu9"  id="Bloodtab9" data-toggle="tab"style="display: none;">
						<i class="fas fa-edit"aria-hidden="true" id="icone"></i>Edit Blood Outword</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home"  class="container tab-pane active"style="margin-top: 10px;">
					<div style="padding: 50px;">
					<div class="row">	
						<div class="col-lg-3">			
							<div  class="panel info-box panel-white"id="stockchak0" >
								<div class="panel-body patient" >
									<div class="info-box-stats">
										<p style="font-family: 'Open Sans';" class="counter">O+</p>
										
										<span class="info-box-title" id="obloodstock"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background">
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white"id="stockchak1" >
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">O-</p>
										<span  class="info-box-title"id="o-bloodstock1"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background"> 	
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white"id="stockchak2">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">A+</p>
										<span class="info-box-title"id="abloodstock2"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background"> 	
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white"id="stockchak3">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">A-</p>
										<span class="info-box-title"id="a-bloodstock3"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background"> 	
								</div>
							</div>
						</div>
						</div>
						<div class="row">	
						<div class="col-lg-3">			
							<div class="panel info-box panel-white" id="stockchak4">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">B+</p>
										
										<span class="info-box-title"id="bbloodstock4"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background">
									
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white"id="stockchak5">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">B-</p>
										<span class="info-box-title"id="b-bloodstock5"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background"> 	
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white" id="stockchak6">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">AB+</p>
										<span class="info-box-title"id="abbloodstock6"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background"> 	
								</div>
							</div>
						</div>
						<div class="col-lg-3 ">			
							<div class="panel info-box panel-white"id="stockchak7">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter">AB-</p>
										<span class="info-box-title"id="ab-bloodstock7"></span>
									</div>
									<img src="ing/blood (1).png" class="dashboard_background img-fludia"> 	
								</div>
							</div>
						</div>
					</div>
					<div class="row">	
						<div class="col-lg-3">
						<button id="clickBloodOutwordList">
							<div class="panel info-box panel-white">
								<div class="panel-body patient">
									<div class="info-box-stats">
										<p class="counter" id="donorcount" style="margin-left: -43px; color: #22baa0;">0</p>
										<span class="info-box-title" style="font-size: 30px;">Doner</span>
									</div>
									<img src="ing/sasasa.jpg" style="margin-left: 28px;" class="dashboard_background">
								</div>
							</div>
						</button>
						</div>
					</div>
	   			 </div>
				</div>
				<div id="menu1"  class="tab-pane "style="margin-top: 15px;">
					<table id="tableBloodDoner" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			            	<th style="padding-left: 15px;">Donor Id</th>
							<th style="padding-left: 15px;">Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Age</th>
							<th style="padding-left: 15px;">Email</th>
							<th style="padding-left: 15px;">Phone NO</th>
							<th style="padding-left: 15px;">Joining</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="bloodDonorList">
			        </tbody>
			        <tfoot>
			            <tr>
			            	<th style="padding-left: 15px;">Donor Id</th>
							<th style="padding-left: 15px;">Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Age</th>
							<th style="padding-left: 15px;">Email</th>
							<th style="padding-left: 15px;">Phone NO</th>
							<th style="padding-left: 15px;">Joining</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </tfoot>
			    	</table>
			    	<div style="margin-top: 26px;"></div>
				</div>
				<div id="menu2"  class="tab-pane "style="margin-top: 15px;">
					<form id="bloodDonor_form" style="margin-top: 20px;" >
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div >
							<div style="margin-top: 15px;">
								<div class="form-group row">
						    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" class="form-control" name="firstname" placeholder="First Name"  required>
						    		</div>
		
						    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
						    		<div class="col-sm-4">
						      			<input type="text" class="form-control" name="middlename"  placeholder="Middle Name">
						    		</div>
						    	</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
						    		</div>
						    		<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
							    		<div class="input-group date" data-date-format="dd/mm/yyyy">
							            	<input  type="text" id="datechange1" name="dob" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
								            <div class="input-group-addon" >
								              <span class=""></span>
								            </div>
							          	</div>
						          	</div>
					  			</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<label class="radio-inline"><input type="radio" name="gender" value="male" checked="checked">Male</label>
										<label class="radio-inline"><input type="radio" name="gender" value="female">Female</label>
						    		</div>
						    		<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
									<div class="col-sm-4">
										<input class="form-control  text-input" maxlength="100" type="text" name="email" value=""required>
									</div>
					  			</div>
					  			<div class="form-group row">
					  				<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
				    				<div class="col-sm-4 ">
					      			<select class="form-control " name="bloodgroup" required="required">
										<option value="" disabled selected hidden="">Select Blood Group</option>	
										<option value="O+">O+ </option>
										<option value="O-">O- </option>
										<option value="A+">A+ </option>
										<option value="B+">B+ </option>
										<option value="A-">A- </option>
										<option value="B-">B- </option>
										<option value="AB+">AB+ </option>
										<option value="AB-">AB- </option>
									</select>
				    			</div>
				    			<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
								<div class="col-sm-4">
									<input name="age"  class="form-control" min="0" max="99" type="number" onkeypress="if(this.value.length==2) return false;" required>
								</div>
				    		</div>
							</div>
						</div>
						<div style="margin-top: 20px;"><h4>Contact Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
					    		<div class="col-sm-1">
					      			<input type="tel" class="form-control" name="standardcode" value="+91" >
					    		</div>
					    		<div class="col-sm-3">
					      			<input type="tel" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Phone Number</label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
					    		</div>
					    	</div>
					    </div>
						
						<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
						<input type="hidden" name="flag" value="insertblooddonor">
				        	<input type="submit" value="Save" id="blooddonerbten" name="save_blooddonor" class="btn btn-success">
				        </div>
	       			 </form>
				</div>
				<div id="menu3"  class="tab-pane "style="margin-top: 15px;">
					<form id="updateBloodDonor_form" style="margin-top: 20px;" >
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div >
							<div style="margin-top: 15px;">
								<div class="form-group row">
						    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" id="donerfirstname" class="form-control" name="firstname" placeholder="First Name"  required>
						    		</div>
		
						    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
						    		<div class="col-sm-4">
						      			<input type="text" id="donermiddlename" class="form-control" name="middlename"  placeholder="Middle Name">
						    		</div>
						    	</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" id="donerlastname" class="form-control" name="lastname" placeholder="Last Name" required>
						    		</div>
						    		<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<div class="input-group date" data-date-format="dd/mm/yyyy">
							            	<input  type="text" id="donordob" name="dateofbirth" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
								            <div class="input-group-addon" >
								              <span class=""></span>
								            </div>
							          	</div>
						    		</div>
						    		
					  			</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<label class="radio-inline"><input type="radio" id="donortgender" name="gender" value="male" checked="checked">Male</label>
										<label class="radio-inline"><input type="radio" id="donortgenderf"name="gender" value="female">Female</label>
						    		</div>
						    		<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
									<div class="col-sm-4">
										<input id="donoremail" class="form-control  text-input" maxlength="100" type="text" name="email" value=""required>
									</div>
					  			</div>
					  			<div class="form-group row">
					  				<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
				    				<div class="col-sm-4 ">
					      			<select id="donorblood_group" class="form-control" name="bloodgroup" required="required">
										<option value="" disabled selected hidden="">Select Blood Group</option>	
										<option value="O+">O+ </option>
										<option value="O-">O- </option>
										<option value="A+">A+ </option>
										<option value="B+">B+ </option>
										<option value="A-">A- </option>
										<option value="B-">B- </option>
										<option value="AB+">AB+ </option>
										<option value="AB-">AB- </option>
									</select>
				    			</div>
				    			<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
								<div class="col-sm-4">
									<input class="form-control" id="donoraeg" min="0" max="99" type="number" onkeypress="if(this.value.length==2) return false;" name="age" required>
								</div>
				    		</div>
							</div>
						</div>
						<div style="margin-top: 20px;"><h4>Contact Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
					    		<div class="col-sm-1">
					      			<input type="tel" id="donorcode"class="form-control" name="standardcode" value="+91" >
					    		</div>
					    		<div class="col-sm-3">
					      			<input type="tel" id="donormobile" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Phone Number</label>
					    		<div class="col-sm-4">
					      			<input type="tel" id="donorphone" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
					    		</div>
					    	</div>
					    </div>
						
						<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
							<input type="hidden" name="flag" value="updatedonor">
							<input type="hidden" name="id" id="bloodDonorId">
							<input type="hidden" name="adminid" id="bloodDonorAdminid">
							<input type="hidden" name="joining" id="bloodDonorJoiningdate">
							<input type="hidden" name="donorId" id="blodoonerid">
				        	<input type="submit" value="Update"id="donorupdatebtn" name="save_blooddonor" style="padding: 8px 50px;margin-right: 8px;" class="btn btn-success">
				        </div>
	       			 </form>
	       			 <div style="margin-top: 68px;"><h4>Blood Donation History</h4></div>
					 <div style="border-bottom: 1px solid gray;"></div>
	       			 <div style="margin-top: 15px;"></div>
	       			 <div class="form-group row">
		       			 <table id="tableBloodDonorHistry" class="display table table-striped table-hover" style="width:100%">
				        <thead>
				            <tr>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Donation Camp</th>
								<th style="padding-left: 15px;">Number Of Bags</th>
								<th style="padding-left: 15px;">Last Donation Date</th>
								<th style="padding-left: 15px; text-align: center ;">Action</th>
				            </tr>
				        </thead>
				        <tbody class="blooddonorhistry">
				        </tbody>
				        <tfoot>
				            <tr>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Donation Camp</th>
								<th style="padding-left: 15px;">Number Of Bags</th>
								<th style="padding-left: 15px;">Last Donation Date</th>
								<th style="padding-left: 15px; text-align: center ;">Action</th>
				            </tr>
				        </tfoot>
				    	</table>
				    	<div style="margin-top: 26px;"></div>
			    	</div>
				</div>
				<div id="menu4"  class="tab-pane "style="margin-top: 15px;">
					<table id="tableBloodInword" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
							<th style="padding-left: 15px;">Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Age</th>
							<th style="padding-left: 15px;">Donation Camp</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px;">Last Donation Date</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="bloodinwordList">
			        </tbody>
			        <tfoot>
			            <tr>
			            	<th style="padding-left: 15px;">Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Age</th>
							<th style="padding-left: 15px;">Donation Camp</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px;">Last Donation Date</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </tfoot>
			    	</table>
			    	<div style="margin-top: 26px;"></div>
				</div>
				<div id="menu5"  class="tab-pane "style="margin-top: 15px;">
					<form id="bloodInword_form" style="margin-top: 20px;">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
						<div class="form-group row">
							<label class="col-sm-2 text" for="first_name">Donor Id<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<select id="inworddonorid" class="form-control" name="donorId">
									<option value="" disabled selected hidden="">Select Donor</option>
							   </select>
							</div>
				    		<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="inwordage"  type="text" id="donorage" name="age" readonly="readonly">
							</div>
			    		</div>
						<div class="form-group row">
						<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<label class="radio-inline"><input type="radio" id="inwordmale" name="gender" value="male" checked="checked" disabled="disabled">Male</label>
								<label class="radio-inline"><input type="radio" id="inwordfemale" name="gender" value="female" disabled="disabled">Female</label>
				    		</div>
							
							<label class="col-sm-2 text " for="phone">Phone<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="inwordphone" type="text" name="phone" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="inwordemail" type="text" name="email" readonly="readonly">
							</div>
						
							<label class="col-sm-2 text" for="bloodgruop">Blood Group<span class="require-field" >*</span></label>
							<div class="col-sm-4">
								<input class="form-control"id="inwordbloodgroup" type="text" name="bloodgroup" id="donorbloodgroup" readonly="readonly">
							</div>
						</div>	
						<div class="form-group row">
							<label class="col-sm-2 text" for="blood_status">Number Of Bags<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" type="number" min="1"  value="" name="numberofbags"required>
							</div>
							<label class="col-sm-2 text" for="last_donet_date">Last Donation Date<span style="color: red;">*</span></label>
							<div class="col-sm-4">
								<div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text" name="lastdate" id="datechange" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
					          	</div>
							</div>
						</div>
					</div>
						<div style="margin-top: 20px;"><h4>Donation Camp Address Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Donation Camp Addres<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text"class="form-control" name="donationCampAddres" placeholder="Donation Camp Address" required="required">
					    		</div>
	
					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text"class="form-control" name="city" placeholder="city" required="required">
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text"class="form-control" name="state" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text"class="form-control" name="country" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="zipCode" pattern="[0-9]{6}"  placeholder="Zip Code"required="required">
					    		</div>
				  			</div>
						</div>
						</div>
						<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
						<input type="hidden" name="flag" value="insertinword">
				        	<input type="submit" value="Save" id="inwordsubmit" name="save_blooddonor" class="btn btn-success">
				        </div>
	       			 </form>
				</div>
				<div id="menu6"  class="tab-pane "style="margin-top: 15px;">
					<form id="updateBloodInword_form" style="margin-top: 20px;" >
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
						<div class="form-group row">
							<label class="col-sm-2 text" for="first_name">Donor Id<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<select id="inworddonoreditid"  class="form-control" name="donorId">
									<option value="" disabled selected hidden="">Select Donor</option>
									
							   </select>
							</div>
				    		<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="donorinwordage" type="text" id="donorage" name="age" readonly="readonly">
							</div>
			    		</div>
						<div class="form-group row">
						<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<label class="radio-inline"><input type="radio" id="donorinwordmale" name="gender" value="male" checked="checked" disabled="disabled">Male</label>
								<label class="radio-inline"><input type="radio" id="donorinwordfemale" name="gender" value="female" disabled="disabled">Female</label>
				    		</div>
							
							<label class="col-sm-2 text " for="phone">Phone<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="donorinwordphone" type="text" name="phone" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="donorinwordemail" type="text" name="email" readonly="readonly">
							</div>
						
							<label class="col-sm-2 text" for="bloodgruop">Blood Group<span class="require-field" >*</span></label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="bloodgroup" id="donorinwordbloodgoupe"readonly="readonly">
							</div>
						</div>	
						<div class="form-group row">
							<label class="col-sm-2 text" for="blood_status">Number Of Bags<span class="require-field">*</span></label>
							<div class="col-sm-4">
								<input class="form-control" id="donorinwordnob" type="number" min="1"  value="" name="numberofbags"required>
							</div>
							<label class="col-sm-2 text" for="last_donet_date">Last Donation Date<span style="color: red;">*</span></label>
							<div class="col-sm-4">
								<div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text" name="lastdate" id="donorinwordlastdate" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
					          	</div>
							</div>
						</div>
					</div>
					<div style="margin-top: 20px;"><h4>Donation Camp Address Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Donation Camp Addres<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="donorinwordaddress"class="form-control" name="donationCampAddres" placeholder="Donation Camp Address" required="required">
					    		</div>
	
					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="donorinwordcity"class="form-control" name="city" placeholder="city" required="required">
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="donorinwordstate" class="form-control" name="state" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="donorinwordcontry" class="form-control" name="country" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel"id="donorinwordzipcode"class="form-control" name="zipcode" pattern="[0-9]{6}"  placeholder="Zip Code"required="required">
					    		</div>
				  			</div>
						</div>
						</div>
						
						<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
							<input type="hidden" name="adminid" id="bloodidwordadminid">
							<input type="hidden" name="id" id="bloodInwordid">
							<input type="hidden" name="joining" id="bloodInwordJoiningdate">
							<input type="hidden" name="flag" value="updatebloodinword">
				        	<input type="submit" value="Update Blood Inword" name="update_bloodinword" class="btn btn-success">
				        </div>
	       			 </form>
				</div>
				<div id="menu7"  class="tab-pane"style="margin-top: 15px;">
					<table id="tableoutwordlist" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
							<th style="padding-left: 15px;">Patient Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Email</th>
							<th style="padding-left: 15px;">Mobile</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px;">Donation Date</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="bloodOutwordList">
			        </tbody>
			        <tfoot>
			            <tr>
			            	<th style="padding-left: 15px;">Patient Name</th>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Email</th>
							<th style="padding-left: 15px;">Mobile</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px;">Donation Date</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </tfoot>
			    	</table>
			    	<div style="margin-top: 26px;"></div>
				</div>
				<div id="menu8"  class="tab-pane "style="margin-top: 15px;">
					<form id="bloodOutword_form" style="margin-top: 20px;" >
					<div style="margin-top: 15px;"><h4>Patient Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
								<div class="col-sm-4">
									<select id="insertpatientid" class="form-control " name="patientId">
										<option value="" disabled selected hidden="">Select Patient </option>	
										<c:forEach items="${sessionScope.patientList }" var="q">
											<option value="${q.id }">${q.patientregistrationid.patientid } - ${q.patientregistrationid.firstname }</option>
										</c:forEach>
								   </select>
								   <span id="error_patient_id" class="text-danger"></span>
								</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertfirstname" class="form-control" name="firstname" readonly="readonly">
					      			<span id="error_first_name" class="text-danger"></span>
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertmiddlename"  class="form-control" name="middlename" readonly="readonly">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertlastname"class="form-control" name="lastname" readonly="readonly">
					      			<span id="error_last_name" class="text-danger"></span>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
									<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" name="dob" id="insertdob" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
							            <div class="input-group-addon" >
							              <span class=""></span>
							            </div>
						          	</div>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					    			<input type="text" id="insertbloodgroup" class="form-control" name="blood_group" readonly="readonly">
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" id="insertmale" name="gender" value="male" disabled="disabled">Male</label>
									<label class="radio-inline"><input type="radio" id="insertfemale" name="gender" value="female" disabled="disabled">Female</label>
					    		</div>
				  			</div>
						</div>
						<div style="margin-top: 20px;"><h4>Billing Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label text" >Number Of Bags<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number" class="form-control totalcharg" id="blooddispachbag"name="numberofbags"onkeypress="if(this.value.length==3) return false;"  min="0" max="999" required>
									
								</div>
								<label class="col-sm-2 col-form-label text">Charge(&#x20B9;)<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number" class="form-control totalcharg" name="charge" onkeypress="if(this.value.length==5) return false;" id="bloodoutwordchage" max="99999" min="0" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label text">Date<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
						          	<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" name="date" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
							            <div class="input-group-addon" >
							              <span class=""></span>
							            </div>
						          	</div>
								</div>
								<label class="col-sm-2 col-form-label text">Total<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number" class="form-control" value="0" id="totalcost"name="total" min="0" readonly="readonly">
								</div>
							</div>
							<input type="hidden" name="flag" value="insertOutword"/>
							<div class="col-sm-offset-2 col-sm-8">
								<input type="submit" value="Save" name="save_medicine" class="btn btn-success"style="margin-bottom: 15px;"/>
							</div>
						</div>
					</form>
				</div>
				<div id="menu9"  class="tab-pane"style="margin-top: 15px;">
					<form id="updateBloodOutword_form" style="margin-top: 20px;" >
					<div style="margin-top: 15px;"><h4>Patient Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
								<div class="col-sm-4">
									<select id="editpatientid" class="form-control " name="patientId">
										<option value="" disabled selected hidden="">Select Patient</option>
										<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
											<option value="${q.id }">${q.firstname }</option>
										</c:forEach>
								   </select>
								</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editoutwordfirstname" class="form-control" name="firstname" readonly="readonly">
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editoutwordmiddlename"  class="form-control" name="middlename" readonly="readonly">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editoutwordlastname"class="form-control" name="lastname" readonly="readonly">
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" name="dob" id="editoutwordbod" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
							            <div class="input-group-addon" >
							              <span class=""></span>
							            </div>
						          	</div>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					    			<input type="text" id="editoutwordbloodgruop" class="form-control" name="blood_group" readonly="readonly">
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" id="editoutwordmale" name="gender" value="male" checked>Male</label>
									<label class="radio-inline"><input type="radio" id="editoutwordfemale" name="gender" value="female" >Female</label>
					    		</div>
				  			</div>
						</div>
						<div style="margin-top: 20px;"><h4>Contact Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label text" >Number Of Bags<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number" id="editoutwordnob" class="form-control edittotalcharg" name="numberofbags"  min="0" required>
								</div>
								<label class="col-sm-2 col-form-label text">Charge(&#x20B9;)<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number"id="editoutwordcharge"class="form-control  edittotalcharg" name="charge"  min="0" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label text">Date<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" name="date" id="editoutworddate" class="form-control" placeholder="dd/mm/yyyy" style="width: 361px;"  required readonly>
							            <div class="input-group-addon" >
							              <span class=""></span>
							            </div>
						          	</div>
								</div>
								<label class="col-sm-2 col-form-label text">Total<span style="color: red;">*</span></label>
								<div class="col-sm-4 ">
									<input type="number" class="form-control" value="0" id="editoutwordtotal" name="total" min="0" readonly="readonly">
								</div>
							</div>
							<input type="hidden" name="flag" value="updateoutword" />
							<input type="hidden" name="adminid" id="outwordadminid"/>
							<input type="hidden" name="id" id="outworddid" />
							<input type="hidden" name="joinig" value="outwordjoining" />
							<div class="col-sm-offset-2 col-sm-8">
								<input type="submit" value="Update" id="outwordupdate" class="btn btn-success"style="margin-bottom: 15px;"/>
							</div>
						</div>
					</form>
				</div>
				<div id="menu10"  class="tab-pane "style="margin-top: 15px;">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div >
							<div style="margin-top: 15px;">
								<div class="form-group row">
						    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" id="viewFirstName" class="form-control" name="firstname"readonly="readonly">
						    		</div>
		
						    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
						    		<div class="col-sm-4">
						      			<input type="text" id="viewMiddleName" class="form-control" readonly="readonly">
						    		</div>
						    	</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" id="viewLastName" class="form-control" readonly="readonly">
						    		</div>
						    		<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<input type="text" id="viewDOB" class="form-control" readonly="readonly">
						    		</div>
						    		
					  			</div>
					  			<div class="form-group row">
						    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
						    		<div class="col-sm-4">
						      			<label class="radio-inline"><input type="radio" id="viewMale" disabled="disabled" >Male</label>
										<label class="radio-inline"><input type="radio" id="ViewFemale" disabled="disabled">Female</label>
						    		</div>
						    		<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
									<div class="col-sm-4">
										<input id="viewEmail" class="form-control" type="text" readonly="readonly">
									</div>
					  			</div>
					  			<div class="form-group row">
					  				<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
				    				<div class="col-sm-4 ">
						      			<input class="form-control" type="text" id="viewBloodgroup" readonly="readonly">
				    				</div>
					    			<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
									<div class="col-sm-4">
										<input class="form-control" id="viewAge" type="text" readonly="readonly">
									</div>
				    			</div>
							</div>
						</div>
						<div style="margin-top: 20px;"><h4>Contact Information</h4></div>
						<div style="border-bottom: 1px solid gray;"></div>
						<div style="margin-top: 15px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
					    		<div class="col-sm-1">
					      			<input type="text" id="viewCode"class="form-control" readonly="readonly">
					    		</div>
					    		<div class="col-sm-3">
					      			<input type="text" id="viewMobile" class="form-control" readonly="readonly">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Phone Number</label>
					    		<div class="col-sm-4">
					      			<input type="tel" id="viewPhone" class="form-control"readonly="readonly">
					    		</div>
					    	</div>
					    </div>
					 					    	
	       			 <div style="margin-top: 20px;"><h4>Blood Donation History</h4><button style="margin-left:913px; margin-top:-45px; padding: 8px 100px; " type="button" class="btn btn-danger editBloodDonor" data-edit_id="edit" id="bloodDonorIdedit" value="">Edit</button></div>
					 <div style="border-bottom: 1px solid gray;"></div>
					 <div style="margin-top: 15px;">
 	       			 <div class="form-group row">
					 
		       			<table id="tableBloodDonorView1" class="display table table-striped table-hover" style="width:100%">
				        <thead>
				            <tr>
				            	<th style="padding-left: 15px;">Donor ID</th>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Donation Camp</th>
								<th style="padding-left: 15px;">Number Of Bags</th>
								<th style="padding-left: 15px;">Last Donation Date</th>
				            </tr>
				        </thead>
				        <tbody class="viewbloodinworddetails">
				        </tbody>
				        <tfoot>
				            <tr>
				            	<th style="padding-left: 15px;">Donor ID</th>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Donation Camp</th>
								<th style="padding-left: 15px;">Number Of Bags</th>
								<th style="padding-left: 15px;">Last Donation Date</th>
				            </tr>
				        </tfoot>
				    	</table>
			    	</div>
			    	</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>