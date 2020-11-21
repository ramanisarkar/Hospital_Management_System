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
.btn {
border-radius: 0px;
}

.icone {
  float: left;
  height: 20px !important;
  margin-right: 5px;
  overflow: hidden;
  width: 25px !important;
  text-align: center;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
    margin-bottom: 16px;
}
.form-control {
    background: #fff;
    border-radius: 0;
    border: 1px solid #dce1e4;
    box-shadow: none!important;
    font-size: 13px;
    padding: 6px 6px!important;

    transition: all .2s ease-in-out;
}
.charges_heading {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    width: 100%;
    float: left;
    margin-bottom: 5px;
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
				<a style="background-color: white; margin-top: 17px;color: #5f5f5f !important; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
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
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Invoice list</a></li>
						
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="invoiceteb1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Invoice</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb2" data-toggle="tab"
					href="#menu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Invoice</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu3" id="invoiceteb3" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Income List</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu4" id="invoiceteb4" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Income</a>
				</li>
				
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb5" data-toggle="tab"
					href="#menu5" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Income</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu6" id="invoiceteb6" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Expense List</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu7" id="invoiceteb7" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Expense</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb8" data-toggle="tab"
					href="#menu8" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Income</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home" class="container tab-pane active" style="margin-top: 10px;">
			    <table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th style="padding-left: 15px;">Invoice Id</th>
			                <th style="padding-left: 15px;">Title</th>
			                <th style="padding-left: 15px;">Patient</th>
			                <th style="padding-left: 15px;">Total Amount</th>
			                <th style="padding-left: 15px;">Adjustment Amount </th>
			                <th style="padding-left: 15px;">Paid Amount</th>
			                <th style="padding-left: 15px;">Due Amount</th>
			                <th style="padding-left: 15px;">Status</th>
			                <th style="padding-left: 15px;">Action</th>
			
			
			            </tr>
			        </thead>
			        <tbody class="medicine">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th style="padding-left: 15px;">Invoice Id</th>
			                <th style="padding-left: 15px;">Title</th>
			                <th style="padding-left: 15px;">Patient</th>
			                <th style="padding-left: 15px;">Total Amount</th>
			                <th style="padding-left: 15px;">Adjustment Amount </th>
			                <th style="padding-left: 15px;">Paid Amount</th>
			                <th style="padding-left: 15px;">Due Amount</th>
			                <th style="padding-left: 15px;">Status</th>
			                <th style="padding-left: 15px;">Action</th>
			
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			
			<div id="menu1" class="tab-pane">
			
			    <form name="invoice_form" action="" method="post" class="form-horizontal" id="invoice_form"
			        style="margin-top: 15px;">
			        <!-- START INVOICE FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_number">Invoice ID<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_number" class="form-control" type="text" readonly
			                    value="20102068" name="invoice_number">
			            </div>
			        </div>
			
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8 ">
			                <select name="patient" class="form-control" id="patient_id">
			                    <option value="">Select Patient</option>
			                </select>
			            </div>
			            <div class="col-sm-1">
			                <a href="#" data-toggle="modal"data-target="#exampleModal"class=" btn btn-default"><i class="fa fa-eye"></i> Check Charges</a>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invice_title">Invoice Title</label>
			            <div class="col-sm-8">
			                <input id="invice_title" class="form-control"
			                    maxlength="50" type="text" value="" name="invice_title">
			            </div>
			        </div>
			        <div class=""></div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">Subtotal Amount ($)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_amount"
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="adjustment_amount">Adjustment Amount ($)</label>
			            <div class="col-sm-8">
			                <input id="adjustment_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="adjustment_amount">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control " type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div class="form-group margin_bottom_5px">
			            <label class="col-sm-2 control-label" for="comments">Comments</label>
			            <div class="col-sm-8">
			                <textarea id="comments" class="form-control validate[custom[address_description_validation]]"
			                    maxlength="150" name="comments"></textarea>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Invoice Entry" name="save_invoice" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu2" class="tab-pane">
			
			    <form name="invoice_form" action="" method="post" class="form-horizontal" id="invoice_form"
			        style="margin-top: 15px;">
			        <!-- START INVOICE FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_number">Invoice ID<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_number" class="form-control" type="text" readonly
			                    value="20102068" name="invoice_number">
			            </div>
			        </div>
			
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8 ">
			                <select name="patient" class="form-control" id="patient_id">
			                    <option value="">Select Patient</option>
			                </select>
			            </div>
			            <div class="col-sm-1">
			                <a href="#" class=" btn btn-default"><i class="fa fa-eye"></i> Check Charges</a>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invice_title">Invoice Title</label>
			            <div class="col-sm-8">
			                <input id="invice_title" class="form-control"
			                    maxlength="50" type="text" value="" name="invice_title">
			            </div>
			        </div>
			        <div class=""></div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">Subtotal Amount ($)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_amount"
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="adjustment_amount">Adjustment Amount ($)</label>
			            <div class="col-sm-8">
			                <input id="adjustment_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="adjustment_amount">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control " type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div class="form-group margin_bottom_5px">
			            <label class="col-sm-2 control-label" for="comments">Comments</label>
			            <div class="col-sm-8">
			                <textarea id="comments" class="form-control"
			                    maxlength="150" name="comments"></textarea>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Invoice Entry" name="save_invoice" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu3" class="container tab-pane " style="margin-top: 10px;">
			    <table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th style="padding-left: 15px;">Invoice Id</th>
			                <th style="padding-left: 15px;">Patient Id</th>
			                <th style="padding-left: 15px;">Patient Name</th>
			                <th style="padding-left: 15px;">Amount</th>
			                <th style="padding-left: 15px;">Date</th>
			                <th style="padding-left: 15px;">Payment Method</th>
			                <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="medicine">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th style="padding-left: 15px;">Invoice Id</th>
			                <th style="padding-left: 15px;">Patient Id</th>
			                <th style="padding-left: 15px;">Patient Name</th>
			                <th style="padding-left: 15px;">Amount</th>
			                <th style="padding-left: 15px;">Date</th>
			                <th style="padding-left: 15px;">Payment Method</th>
			                <th style="padding-left: 15px;">Action</th>
			                <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			<div id="menu4" class="tab-pane">
			    <form name="income_form" action="" method="post" class="form-horizontal" id="income_form" style="margin-top: 15px;">
			        <!-- START INCOME FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			
			                <select name="party_name" class="form-control validate[required]">
			                </select>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control validate[required]">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_method">Payment Method<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="payment_method" id="payment_method" class="form-control">
			                    <option value="Cash">Cash</option>
			                    <option value="Cheque">Cheque</option>
			                    <option value="Bank Transfer">Bank Transfer</option>
			                    <option value="Credit Card Or Debit Card">Credit Card Or Debit Card</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="">Payment Details</label>
			            <div class="col-sm-8">
			                <textarea name="payment_description"
			                    class="form-control validate[custom[address_description_validation]]" maxlength="150"
			                    id="notice_content"></textarea>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control validate[required]" type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <hr>
			        <div id="income_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Income Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control validate[required] text-input" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="income_amount[]"
			                        placeholder="Income Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Income Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="income_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Income Entry </button>
			            </div>
			        </div>
			        <input type="hidden" id="_wpnonce" name="_wpnonce" value="0b0302dd37"><input type="hidden"
			            name="_wp_http_referer"
			            value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=invoice&amp;tab=addincome&amp;action=insert">
			        <hr>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Income Entry" name="save_income" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu5" class="tab-pane">
			    <form name="income_form" action="" method="post" class="form-horizontal" id="income_form" style="margin-top: 15px;">
			        <!-- START INCOME FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			
			                <select name="party_name" class="form-control validate[required]">
			                </select>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control validate[required]">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_method">Payment Method<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="payment_method" id="payment_method" class="form-control">
			                    <option value="Cash">Cash</option>
			                    <option value="Cheque">Cheque</option>
			                    <option value="Bank Transfer">Bank Transfer</option>
			                    <option value="Credit Card Or Debit Card">Credit Card Or Debit Card</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="">Payment Details</label>
			            <div class="col-sm-8">
			                <textarea name="payment_description"
			                    class="form-control validate[custom[address_description_validation]]" maxlength="150"
			                    id="notice_content"></textarea>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control validate[required]" type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <hr>
			        <div id="income_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Income Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control validate[required] text-input" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="income_amount[]"
			                        placeholder="Income Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Income Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="income_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Income Entry </button>
			            </div>
			        </div>
			        <input type="hidden" id="_wpnonce" name="_wpnonce" value="0b0302dd37"><input type="hidden"
			            name="_wp_http_referer"
			            value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=invoice&amp;tab=addincome&amp;action=insert">
			        <hr>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Income Entry" name="save_income" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu6" class="container tab-pane " style="margin-top: 10px;">
			    <table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th style="padding-left: 15px;">Supplier Name</th>
			                <th style="padding-left: 15px;">Amount</th>
			                <th style="padding-left: 15px;">Date</th>
			                <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="medicine">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th style="padding-left: 15px;">Supplier Name</th>
			                <th style="padding-left: 15px;">Amount</th>
			                <th style="padding-left: 15px;">Date</th>
			                <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			<div id="menu7" class="tab-pane">
			    <form name="expense_form" action="" method="post" class="form-horizontal" id="expense_form"
			        style="margin-top: 15px">
			        <!-- START EXPENSE FORM-->
			        <input type="hidden" name="action" value="insert">
			        <input type="hidden" name="expense_id" value="0">
			        <input type="hidden" name="invoice_type" value="expense">
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Supplier Name<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="party_name"
			                    class="form-control"
			                    maxlength="30" type="text" value="" name="party_name">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control" type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div id="expense_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Expense Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name=""
			                        placeholder="Expense Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"
			                        class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Expense Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="expense_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Expense Entry </button>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8"style="margin-bottom: 15px; ">
			            <input type="submit" value="Create Expense Entry" name="save_expense" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div id="menu8" class="tab-pane">
			    <form name="expense_form" action="" method="post" class="form-horizontal" id="expense_form"
			        style="margin-top: 15px;" >
			        <!-- START EXPENSE FORM-->
			        <input type="hidden" name="action" value="insert">
			        <input type="hidden" name="expense_id" value="0">
			        <input type="hidden" name="invoice_type" value="expense">
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Supplier Name<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="party_name"
			                    class="form-control"
			                    maxlength="30" type="text" value="" name="party_name">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control" type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div id="expense_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Expense Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name=""
			                        placeholder="Expense Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"
			                        class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Expense Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="expense_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Expense Entry </button>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px; ">
			            <input type="submit" value="Create Expense Entry" name="save_expense" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			    aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content" style="    width: 1240px;
			    margin-left: -182px;    height: 468px;
			    ">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal">×</button>
			                <h3 class="modal-title">Add Outpatient</h3>
			
			            </div>
			
			            <div class="modal-body" style="background: #fff;height: 265px;overflow-y:  scroll;">
			                <div class="charges_heading">
			                    <div class="col-md-1 ">
			                        #
			                    </div>
			                    <div class="col-md-2 ">
			                        Type </div>
			                    <div class="col-md-2 ">
			                        Title </div>
			                    <div class="col-md-1 ">
			                        Date </div>
			                    <div class="col-md-1 ">
			                        Unit </div>
			                    <div class="col-md-1 ">
			                        Amount ($)
			                    </div>
			                    <div class="col-md-1 ">
			                        Discount Amount ($)
			                    </div>
			                    <div class="col-md-1 ">
			                        Total Amount ($)
			                    </div>
			                    <div class="col-md-1 col-sm-4 col-xs-12 align_center padding_8">
			                        Action </div>
			                </div>
			                <div class="charges_body">
			
			                    <div class="row">
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="transaction_ids[cheak_0]" value="243">
			                            <input type="hidden" name="patient" value="118">
			                            <input id="" type="checkbox" value="1" name="cheak[cheak_0]" checked="">
			                        </div>
			                        <div class="col-md-2 ">
			                            <input id="type" class="form-control " type="text" value="Instrument Charges" name="type[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-2 ">
			                            <input id="title" class="form-control " type="text" value="sdfasfsdafsaf" name="title[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="date" class="form-control " type="text" value="2019-09-02" name="date[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="unit" class="form-control " type="text" value="9 Days" name="unit[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="amount" class="form-control  amount_0" type="number" min="0"
			                                onkeypress="if(this.value.length==10) return false;" step="0.01" value="594.00"
			                                name="amount[cheak_0]" placeholder="" readonly="readonly">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="old_discount_amount" class="old_discount_amount_0" value="0.00">
			                            <input id="discount_amount" class="form-control  transaction_discount discount_amount_0"
			                                type="number" dataid1="0" min="0" onkeypress="if(this.value.length==10) return false;"
			                                step="0.01" value="0.00" name="discount_amount[cheak_0]" placeholder="">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="total_amount" class="form-control  total_amount_0" type="number" min="0"
			                                onkeypress="if(this.value.length==10) return false;" step="0.01" value="647.46"
			                                name="total_amount[cheak_0]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 col-sm-4 col-xs-12 align_center div_padding_bottom_5">
			
			                        </div>
			                    </div>
			
			                    <div class="row">
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="transaction_ids[cheak_1]" value="244">
			                            <input type="hidden" name="patient" value="118">
			                            <input id="" type="checkbox" value="1" name="cheak[cheak_1]" checked="">
			                        </div>
			                        <div class="col-md-2 ">
			                            <input id="type" class="form-control " type="text" value="Dignosis Report Charges"
			                                name="type[]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-2 ">
			                            <input id="title" class="form-control " type="text" value="" name="title[]" placeholder=""
			                                readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="date" class="form-control " type="text" value="2019-09-03" name="date[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="unit" class="form-control " type="text" value="" name="unit[]" placeholder=""
			                                readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="amount" class="form-control  amount_1" type="number" min="0"
			                                onkeypress="if(this.value.length==10) return false;" step="0.01" value="500.00"
			                                name="amount[cheak_1]" placeholder="" readonly="readonly">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="old_discount_amount" class="old_discount_amount_1" value="0.00">
			                            <input id="discount_amount" class="form-control  transaction_discount discount_amount_1"
			                                type="number" dataid1="1" min="0" onkeypress="if(this.value.length==10) return false;"
			                                step="0.01" value="0.00" name="discount_amount[cheak_1]" placeholder="">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="total_amount" class="form-control  total_amount_1" type="number" min="0"
			                                onkeypress="if(this.value.length==10) return false;" step="0.01" value="545.00"
			                                name="total_amount[cheak_1]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 col-sm-4 col-xs-12 align_center div_padding_bottom_5">
			
			                        </div>
			                    </div>
			
			                    <div class="row">
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="transaction_ids[cheak_3]" value="249">
			                            <input type="hidden" name="patient" value="118">
			                            <input id="" type="checkbox" value="1" name="cheak[cheak_3]" checked="">
			                        </div>
			                        <div class="col-md-2 ">
			                            <input id="type" class="form-control text-input" type="text" value="Medicine Charges"
			                                name="type[]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-2 col-sm-4 col-xs-12 align_center div_padding_right_0 div_padding_bottom_5">
			                            <input id="title" class="form-control text-input" type="text" value="Medicine"
			                                name="title[]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="date" class="form-control text-input" type="text" value="2019-09-07"
			                                name="date[]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="unit" class="form-control text-input" type="text" value="" name="unit[]"
			                                placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="amount" class="form-control text-input amount_3" type="number" min="0"
			                                onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.00"
			                                name="amount[cheak_3]" placeholder="" readonly="readonly">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input type="hidden" name="old_discount_amount" class="old_discount_amount_3" value="">
			                            <input id="discount_amount"
			                                class="form-control text-input transaction_discount discount_amount_3" type="number"
			                                dataid1="3" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01"
			                                value="" name="discount_amount[cheak_3]" placeholder="" readonly="readonly">
			
			                        </div>
			                        <div class="col-md-1 ">
			                            <input id="total_amount" class="form-control text-input total_amount_3" type="number"
			                                min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.00"
			                                name="total_amount[cheak_3]" placeholder="" readonly="readonly">
			                        </div>
			                        <div class="col-md-1 col-sm-4 col-xs-12 align_center div_padding_bottom_5">
			                            <a href="?page=hmgt_medicine&amp;dispatchmedicinepdf=dispatchmedicinepdf&amp;dispatch_medicine_id=21"
			                                target="_blank" class="btn btn-primary"> View</a>
			
			                        </div>
			                    </div>
			
			                    <div id="entriys">
			                    </div>
			
			                </div>
							</div>			                
			                <div class="footer">
			                    <button id="add_new_entry" style="width:100%;"
			                        class="btn btn-default btn-sm btn-icon icon-left add_more_charge_entry" type="button"
			                        name="add_new_entry"><span class="dashicons dashicons-plus-alt"></span> NEW ROW</button>
			                    <div class="col-md-3">
			                        <button id="addremove" model="invoice_charge" type="button" class="btn " data-toggle="modal"
			                            data-target="#exampleModal2" style="width:100%;margin-bottom: 10px;margin-top: 10px"
			                            class="btn btn-default btn-sm btn-icon icon-left" type="button"><span
			                                class="dashicons dashicons-plus-alt"></span><span
			                                class="dashicons dashicons-minus"></span> CHARGE CATEGORY</button>
			                    </div>
			                    <div class="col-md-2">
			                        <input type="submit" class="btn btn-success" style="width:100%;margin-top: 10px"
			                            name="get_totale" value="SAVE">
			                    </div>
			                </div>
			        </div>
			    </div>
			</div>
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2"
			    aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal">×</button>
			                <h3 class="modal-title">Add Outpatient</h3>
			            </div>
			
			            <div class="modal-body" style="background: #fff;height: 265px;overflow: scroll;">
			                <div class="category_listbox">
			                    <div class="table-responsive" style="min-height: 100%;">
			                        <form name="report_typ_form" action="" method="post" class="form-horizontal"
			                            id="report_typ_form">
			                            <table class="table">
			
			                                <thead>
			                                    <tr>
			                                        <th>Charge Name</th>
			                                        <th>Amount</th>
			
			                                        <th>tax</th>
			                                        <th> Description</th>
			                                        <th>Edit</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                    <tr id="cat-543">
			                                        <td> Historia Clinica </td>
			                                        <td>1</td>
			                                        <td> sudhguiyagd87yagd9uashduoasuoidhasuodouasduoasdou</td>
			                                        <td id="543"> <a class="btn-delete-cat badge badge-delete" model="report_type"
			                                                href="#" id="543"> X </a></td>
			                                        <td id="543"> <a class="btn-edit-cat badge badge-edit" model="report_type"
			                                                href="#" id="543"> <i class="fa fa-pencil-square-o" aria -
			                                                    hidden="true"> </i></a> </td>
			                                    </tr>
			
			                                </tbody>
			                            </table>
			                        </form>
			                    </div>
			                </div>
			            </div>
			            <form name="medicinecat_form" action="" method="post" class="form-horizontal" id="medicinecat_form"
			                style="margin-top: 20px">
			                <div class="form-group">
			                    <label class="col-sm-2 control-label" for="medicine_name">Report Name<span
			                            class="require-field">*</span></label>
			                    <div class="col-sm-4 margin_bottom_5px">
			                        <input id="medicine_name" class=" form-control text-input" maxlength="50" type="text" value=""
			                            name="category_name" required>
			                    </div>
			
			                    <label class="col-sm-1 control-label" for="medicine_name">Amount<span
			                            class="require-field">*</span></label>
			                    <div class="col-sm-3 margin_bottom_5px">
			                        <input id="report_cost" class="form-control  text-input " type="number" min="0"
			                            onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="report_cost"
			                            required>
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label class="col-sm-2 control-label" for="medicine_name">Description<span
			                            class="require-field">*</span></label>
			                    <div class="col-sm-4">
			                        <textarea id="diagno_description" maxlength="50" class="form-control " name="diagno_description"
			                            required> </textarea>
			                    </div>
			
			                    <div class="col-sm-2 margin_bottom_5px">
			                        <input type="button" value="Add" name="save_category" class="btn btn-success"
			                            model="report_type" id="btn-add-cat">
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>