<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style type="text/css">
html{
	scroll-behavior:smooth;
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
.control-label{

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
.require-field{
color: red;
text-align: right;
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
</style>
</head>
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;font-size: 13px;">
<%-- 	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">  --%>
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
				<a style="background-color: white; margin-top: 17px; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
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
	<%--</c:forEach> --%>
		<div id="message2" style="margin-top: 67px;"hidden="" ></div>
		<div style="margin-left: 236px; padding: 0px 16px; margin-top: -75%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<!--  -----------------------------------Add new Sytomes -------------------------------------------*  -->
		
		<div class="modal fade" id="BedModal" tabindex="-1" role="dialog" aria-labelledby="BedModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content" style=" ">
		    <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">x</button>
		       
		        <h3 class="modal-title">Symptoms</h3>
		      </div>
		               <div class="panel panel-white">
		                   <div class="category_listbox">
		                       <div class="table-responsive" style="min-height: 100%;">
		                           <form name="report_typ_form" action="" method="post" class="form-horizontal"
		                               id="report_typ_form">
		                               <table class="table">
		                                   <thead>
		                                       <tr>
		                                           <th>Symptoms</th>
		                                           <th>Action</th>
		                                       </tr>
		                                   </thead>
		                                   <tbody class="symtopslisttable">
		                                   </tbody>
		                               </table>
		                           </form>
		                       </div>
		                   </div>
		                   <form name="systomes_insert_form" id="systomes_insert_form" class="form-horizontal">
		                       <div class="form-group">
		                           <label class="col-sm-4 control-label" for="medicine_name">Symptoms<span class="require-field">*</span></label>
		                           <div class="col-sm-4 margin_bottom_5px">
		                               <input id="medicine_name"class="form-control text-input"maxlength="50" type="text" value="" name="name">
		                           </div>
		                           <div class="col-sm-4">
		                               <input type="submit" value="Add" id="btn-insert-symptoms" name="save_category" class="btn btn-success">
		                               <input type="hidden" name="adinid" id="symptomesadminid">
		                               <input type="hidden" name="flag" value="precriptionSymptomesInsert">
		                           </div>
		                       </div>
		                   </form>
		               </div>
		           </div>
		       </div>
		   </div>
		<!--  -----------------------------------Add new Sytomes Exit -------------------------------------------  -->
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Out Patient list</a></li>
						
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="nursetab1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add New Out Patient</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="nursetab2" data-toggle="tab"
					href="#menu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Out Patient</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home"  class="container tab-pane active"style="margin-top: 10px;">
					 <table id="example" class="display table table-striped table-hover" style="width:100%">
					       <thead>
					           <tr>
								<th style="padding-left: 15px;"> Photo</th>
								<th style="padding-left: 15px;">Patient Name</th>
								<th style="padding-left: 15px;">Patient Id</th>
								<th style="padding-left: 15px;">Mobile Number</th>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Email</th>
								<th style="padding-left: 15px;">Assibned Doctor Name</th>
								<th style="padding-left: 15px;">Action</th>
					           </tr>        
					       </thead>
					       <tbody class="medicine">
					       </tbody>
					       <tfoot>
					           <tr>
					         	<th style="padding-left: 15px;"> Photo</th>
								<th style="padding-left: 15px;">Patient Name</th>
								<th style="padding-left: 15px;">Patient Id</th>
								<th style="padding-left: 15px;">Mobile Number</th>
								<th style="padding-left: 15px;">Blood Group</th>
								<th style="padding-left: 15px;">Email</th>
								<th style="padding-left: 15px;">Assibned Doctor Name</th>
								<th style="padding-left: 15px;">Action</th>
					           </tr>
					       </tfoot>
					   </table>
					   <div style="margin-top: 26px;"></div>
				</div>

				<div id="menu1" class="tab-pane">
				    <form id="out_patient_insert_form" class="form-horizontal" enctype="multipart/form-data">
				        <div class="header">
				            <h3 class="first_hed">Personal Information</h3>
				            <hr>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="roll_id">Patient Id<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <select name="patient_id" id="insertpatientid" class="form-control" required>
				                    <option value="" disabled selected hidden="">Select Patient </option>
				                    <c:forEach items="${sessionScope.patientRagistrationList }" var="q">
				                        <option value="${q.id }">${q.patientid } - ${q.firstname } </option>
				                    </c:forEach>
				                </select>
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="first_name">First Name<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="insertfirstname" class="form-control text-input" maxlength="50" type="text" value=""
				                    name="first_name" required>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="middle_name">Middle
				                Name</label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input class="form-control" id="insertmiddlename" type="text" maxlength="50" value=""
				                    name="middle_name">
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="last_name">Last Name<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input class="form-control text-input" id="insertlastname" maxlength="50" type="text" value=""
				                    name="last_name" required>
				            </div>
				        </div>
				        <div class="form-group row">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="birth_date">Date of
				                birth<span class="require-field">*</span></label>
				            <div class="col-sm-3">
				                <div class="input-group date" data-date-format="dd/mm/yyyy">
				                    <input type="text" name="birth_date" id="insertdob" class="form-control" placeholder="dd/mm/yyyy"
				                        readonly="readonly" required>
				                    <div class="input-group-addon">
				                        <span class=""></span>
				                    </div>
				                </div>
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label">Blood
				                Group</label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 ">
				
				                <select id="insertbloodgroup" class="form-control" name="blood_group" required>
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
				        </div>
				
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="gender">Gender<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <label class="radio-inline">
				                    <input type="radio" value="male" class="tog" id="insertmale" name="gender" checked="checked">Male
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" value="female" id="insertfemale" class="tog" name="gender">Female
				                </label>
				            </div>
				        </div>
				
				        <div class="header">
				            <h3>HomeTown Address Information</h3>
				            <hr>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="address">Home Town Address<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input class="form-control" id="inserthomeaddress" type="text" maxlength="150" name="address" required>
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="homecity">City<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input class="form-control" id="inserthomecity" type="text" maxlength="50" name="homecity" required>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">State</label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="inserthomestate" class="form-control" type="text" maxlength="50" name="state_name" value="">
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">Country</label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="inserthomecountry" class="form-control " type="text" maxlength="50" name="homecountry"
				                    value="">
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="zip_code">Zip Code<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="inserthomezip" class="form-control" type="text" maxlength="15" name="zip_code" required>
				            </div>
				        </div>
				        <div class="header">
				            <h3>Contact Information</h3>
				            <hr>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="mobile">Mobile
				                Number<span class="require-field">*</span></label>
				            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 margin_bottom_5px">
				                <input type="text" value="+91" id="insertcode" class="form-control" name="standardcode" maxlength="5"
				                    required>
				            </div>
				            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 has-feedback">
				                <input id="insertmobile" class="form-control text-input" min="6" maxlength="15" type="text" value=""
				                    name="mobile" required>
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="phone">Phone</label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="insertphone" class="form-control text-input" min="6" maxlength="15" type="text" value=""
				                    name="phonenumber">
				            </div>
				        </div>
				        <div class="header">
				            <h3>Login Information</h3>
				            <hr>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="email">Email<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="outpatientemail" class="form-control text-input" maxlength="100" type="text" name="email"
				                    required>
				                <span id="error_email" style="color: red;"></span>
				            </div>
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="username">User Name<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="outpatientusername" class="form-control" maxlength="30" type="text" name="username" required>
				                <span id="error_user" style="color: red;"></span>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="password">Password<span
				                    class="require-field">*</span></label>
				            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
				                <input id="password" class="form-control" type="password" maxlength="12" name="password" required>
				            </div>
				        </div>
				        <div class="header">
				            <h3>Other Information</h3>
				            <hr>
				        </div>
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="doctor">Assign Doctor<span class="require-field">*</span></label>
				            <div class="col-sm-3 margin_bottom_5px">
				                <select name="doctor" id="doctor" class="form-control" required>
				                    <option value="" disabled selected hidden="">Select Doctor </option>
				                    <c:forEach items="${sessionScope.doctorlist }" var="q">
				                        <option value="${q.id }">${q.firstname }</option>
				                    </c:forEach>
				                </select>
				            </div>
				        </div>
				
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
				            <div class="col-sm-3" style="margin-left: 15px;">
				                <select id="symtomsmulti" name="symptoms[]" multiple class="form-control symptomsoutpatient"
				                    required="required">
				                </select>
				                <br>
				            </div>
				            <div class="col-sm-2">
				                <button style="margin-left: 40px;" id="addremove" model="operation" class="btn " type="button"
				                    data-toggle="modal" data-target="#BedModal">Add Or Remove</button>
				            </div>
				        </div>
				
				        <div class="diagnosissnosis_div">
				            <div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
				                <div class="col-sm-3"><input type="file" name="dignosis1"></div>
				            </div>
				            <div id="outpatientdignosisadd">
				
				            </div>
				            <div class="form-group">
				                <div class="col-sm-2">
				                </div>
				                <div class="col-sm-2">
				                    <input type="button" value="Add More Report" name="add_more_report"
				                        class="add_more_report_fronted btn btn-default">
				                </div>
				            </div>
				            <div class="form-group">
				                <label class="col-sm-2 control-label" for="photo">Image</label>
				                <div class="col-sm-3">
				                    <input type="file" name="profileimage">
				                </div>
				            </div>
				
				            <div class="clearfix"></div>
				
				            <div class="col-sm-offset-2 col-sm-8">
				                <div id="upload_user_avatar_preview">
				
				                </div>
				            </div>
				        </div>
				        <div class="col-sm-offset-2 col-sm-8">
				            <input type="hidden" name="adminid" id="outpatientadminid">
				            <input type="hidden" name="count" id="outpatentdiagnosiscount" value="1">
				            <input type="hidden" name="flag" value="precriptionOutPatientInsert">
				            <input type="submit" value="Save Patient" id="btn-submit-outpatient" class="btn btn-success"
				                style="margin-top: 31px;">
				        </div>
				    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>