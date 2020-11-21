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

	var listBedCategory="listBedCategory";
 	$.get('BadMenegement',{flag:listBedCategory},function(response) {
    	var obj = JSON.parse(response);
    	var select = $('#bed_type_id');
    	select.find('option').remove();
    	$('<option disabled selected hidden="">').val("").text("Select Bed Type").appendTo(select);  
	   	$.each(obj, function(index, value) {
	   		$('<option>').val(obj[index].id).text(obj[index].bedtype).appendTo(select);
		});
   	});

 	var bedNumberList;
 	$(document).on('change', '#bed_type_id', function(){
		var bedId = $(this).val();
		var listBedNumber = "listBednumber";
		$.get('BadMenegement',{flag:listBedNumber , bedId : bedId},function(response){
			bedNumberList = JSON.parse(response);
			var select = $('#insert_bed_number');
			select.find('option').remove();
        	$('<option disabled selected hidden="">').val("").text("Select Bed Number").appendTo(select);  
    	   	$.each(bedNumberList, function(index, value) {
    	   		$('<option>').val(bedNumberList[index].addbedid).text(bedNumberList[index].bednumber).appendTo(select);
    		});
		});
	});
 	
 	$(document).on('change', '#insert_bed_number', function(){
 		var bednumber = $(this).val();
 		console.log(bednumber);
 		$.each(bedNumberList, function(i,v) {
	    	if (v.addbedid == bednumber) {
	    		var bedlocation=v.location;
	    		console.log("matched");
	    		console.log(bedlocation);
	    		$(".insertbedlocation").css("display", "block");
	    		$('#bedcatelocation').text(bedlocation);
	        	return;
			}
	    });
 	});
	
 	$('.input-group.date').datepicker({format: "dd/mm/yyyy",singleDatePicker: true,
	    showDropdowns: true,
	    minYear: 1901,
	    maxYear: parseInt(0)
	});
	
 	$('#insert_form_AssignBed').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#insert_form_AssignBed')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#save_allow").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "BadMenegement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	$("#save_allow").prop("disabled", false);
	        	var obj = response;
	        	console.log(obj);
	        	if(obj== "success"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#insert_form_AssignBed")[0].reset();
	        	}
	        	else if(obj == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id Already Exist , Please try again");
	        	}
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	            $("#save_allow").prop("disabled", false);
	        }
	    });
	});
});
</script>
<style type="text/css">
.multiselect-container {
    width: 750px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
    color: black;
    text-decoration: none;
    background-color: #E6E6E6;
    outline: 0;
}
.dropdown-toggle{
width: 750px;
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
.input-group-addon {
    background-color: white !important;
    border: none!important;
}
</style>
</head>
<body style=" background-color :#f1f4f9;font-family: 'Open Sans',sans-serif;font-size: 13px;">
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
					<a style="background-color: white;color: #5f5f5f !important;height: 49px;" data-toggle="dropdown" href="javascript:;">
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
			
			<li><a href="<%=request.getContextPath()%>/BadMenegement?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
			<span class="title">Add Bad</span></a></li>
			
			<li><a href="<%=request.getContextPath()%>/BadMenegement?flag=bedassign&id=${q.id }" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
			<span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign Bed-Nurse</span></a></li>
			
			<li><a href="" class="left-tooltip" data-tooltip="Operation List" title="Operation List">
			<span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation List</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
			<span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span class="title">Diagnosis</span></a></li>
			<li><a href="<%=request.getContextPath()%>/BloodManage?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
			<span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood Bank</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
			<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
			<span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a></li><li>
			<a href="<%=request.getContextPath()%>/Event?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Event" title="Event">
			<span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Message?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Message" title="Message">
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
				<li class="active" id="assignbedtab"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Assigned Bed List</a></li>
						
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu1" id="assignbedtab1" data-toggle="tab">
					<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Assigned Bed</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu2" id="assignbedtab2" data-toggle="tab">
					<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Tranasfer Bed</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu3" id="assignbedtab3" data-toggle="tab">
					<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Assign Bed</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home" class="container tab-pane active" style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
					    <thead>
					        <tr>
					            <th style="padding-left: 15px;">Bed Type</th>
					            <th style="padding-left: 15px;">Bed number</th>
					            <th style="padding-left: 15px;">Patient</th>
					            <th style="padding-left: 15px;">Nurse</th>
					            <th style="padding-left: 15px;">Allotment Date </th>
					            <th style="padding-left: 15px;">Expected Discharge Date</th>
					            <th style="padding-left: 15px;">Action</th>
					
					        </tr>
					    </thead>
					    <tbody class="medicine">
					    </tbody>
					    <tfoot>
					        <tr>
					            <th style="padding-left: 15px;">Bed Type</th>
					            <th style="padding-left: 15px;">Bed number</th>
					            <th style="padding-left: 15px;">Patient</th>
					            <th style="padding-left: 15px;">Nurse</th>
					            <th style="padding-left: 15px;">Allotment Date </th>
					            <th style="padding-left: 15px;">Expected Discharge Date</th>
					            <th style="padding-left: 15px;">Action</th>
					        </tr>
					    </tfoot>
					</table>
					<div style="margin-top: 26px;"></div>
				</div>
				 <div id="menu1" class="tab-pane">
	                <form name="patient_form" action="" method="post" class="form-horizontal" id="insert_form_AssignBed"style="margin-top: 15px">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label " for="patient_id">Patient<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_id" id="patient_id" class="form-control  " required>
	                                <option value="" disabled selected hidden="">Select Patient </option>	
									<c:forEach items="${sessionScope.patientList }" var="q">
										<option value="${q.id }">${q.patientregistrationid.patientid } - ${q.patientregistrationid.firstname }</option>
									</c:forEach>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label " for="patient_status">Patient Status<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_status" class="form-control " required>
	                                <option value="">select Patient Status</option>
	                                <option value="Admitted">Admitted</option>
	                                <option value="Under Treatment">Under Treatment</option>
	                                <option value="Operated">Operated</option>
	                                <option value="Recovery">Recovery</option>
	                                <option value="Cured">Cured</option>
	                                <option value="Discharged">Discharged</option>
	                                <option value="Death">Death</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_type_id" class="form-control " id="bed_type_id" required>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bednumber">Bed Number<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_number" class="form-control " id="insert_bed_number">
	                                <option value="">Select Bed Number</option>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="col-sm-2 insertbedlocation" style="display:none;"></div>
	                    <div class="col-sm-8 insertbedlocation" style="display: none;">
	                    	<p class="bg-info" style="padding:10px; float:left; width:100%">
	                    	<strong>Bed Location : </strong><span id="bedcatelocation"></span></p>
						</div>
						
	                    <div class="col-sm-2" style="float:left; width:100%"></div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="allotment_date">Allotment Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text" name="allotment_date" id="insert_allotment_date" class="form-control" placeholder="dd/mm/yyyy"    style="width: 750px;" required readonly>
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
			          			</div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="discharge_time">Expected Discharge Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text" name="discharge_time" id="insert_allotment_date" class="form-control" placeholder="dd/mm/yyyy"    style="width: 750px;" required readonly>
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
			          			</div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="doctor">Select Nurse</label>
	                        <div class="col-sm-8">
	                            <select name="nurse[]" class="form-control" multiple="multiple" id="multiselect" >
									<c:forEach items="${sessionScope.nurseList }" var="q">
										<option value="${q.id }">${q.firstname }</option>
									</c:forEach>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="middle_name">Description</label>
	                        <div class="col-sm-8">
	                            <textarea class="form-control " maxlength="150" name="allotment_description"
	                                id="allotment_description" required></textarea>
	                        </div>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
	                    	<input type="hidden" name="flag" value="insertAssignBed">
	                        <input id="save_allow" type="submit" value="Save" name="bedallotment" class="btn btn-success"
	                            style="margin-bottom: 15px;">
	                    </div>
	                </form>
	            </div>
	            <div id="menu2" class="tab-pane">
	                <form name="patient_form" action="" method="post" class="form-horizontal" id="patient_form"
	                    style="margin-top: 15px">
	                    <!-- START TRANSFER BED FORM-->
	                    <input type="hidden" name="action" value="transfer">
	                    <input type="hidden" name="transfar_allotment_id" value="32">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient_id">Patient<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="transfar_patient_id" id="patient_id" class="form-control "
	                                disabled="disabled">
	                                <option value="">Select Patient</option>
	                            </select>
	                            <input type="hidden" name="transfar_patient_id" value="178">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient_status">Patient Status<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_status" class="form-control " disabled="disabled">
	                                <option value="" disabled selected hidden="">Select Patient Status</option>
	                                <option value="Admitted">Admitted</option>
	                                <option value="Under Treatment" selected="selected">Under Treatment</option>
	                                <option value="Operated">Operated</option>
	                                <option value="Recovery">Recovery</option>
	                                <option value="Cured">Cured</option>
	                                <option value="Discharged">Discharged</option>
	                                <option value="Death">Death</option>
	                            </select>
	                            <input type="hidden" name="transfar_patient_status" value="Under Treatment">
	                        </div>
	                    </div>
	
	                    <div class=" col-offset-2 col-md-8 bg-info "
	                        style="float:left; width:92%; padding:8px; margin-bottom:10px; font-size:18px; font-weight:bold">
	                        Bed Transfer From :</div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="" class="form-control" id="" disabled="disabled">
	                                <option value="">Bed Type</option>
	                                <option value="33">General</option>
	                                <option value="34" selected="selected">ICU</option>
	                                <option value="35">Special</option>
	                                <option value="338">test bed</option>
	                                <option value="55">very spec</option>
	                            </select>
	                            <input type="hidden" name="old_bed_type_id" value="34">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bednumber">Bed Number<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="" class="form-control " id="" disabled="disabled">
	                                <option value="">Select Bed Number</option>
	                                <option value="3" selected="selected">003</option>
	                                <option value="4">004</option>
	                                <option value="7">1</option>
	                            </select>
	                            <input type="hidden" name="old_bednumber" value="7">
	                        </div>
	                    </div>
	
	
	                    <div id=""></div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="allotment_date">Allotment Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="" class="form-control " type="text" value="2020-09-23" name="allotment_date_old"
	                                readonly="">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="discharge_time">Expected Discharge Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="" class="form-control " type="text" value="2020-09-30" name="" readonly=""
	                                required>
	                        </div>
	                    </div>
	
	                    <div class="  col-md-8 bg-info "
	                        style="float:left; width:92%; padding:8px; margin-bottom:10px; font-size:18px; font-weight:bold">
	                        Bed Transfer To :</div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="transfar_bed_type_id" class="form-control " id="bed_type_id">
	                                <option value="">Bed type</option>
	                                <option value="33">General</option>
	                                <option value="34">ICU</option>
	                                <option value="35">Special</option>
	                                <option value="338">test bed</option>
	                                <option value="55">very spec</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bednumber">Bed Number<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="transfar_bed_number" class="form-control" id="bednumber" required>
	                                <option value="">Select Bed Number</option>
	                                <option value="3">003</option>
	                                <option value="4">004</option>
	                                <option value="7">1</option>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="col-sm-2"></div>
	                    <div class="col-sm-8" id="bedlocation"> </div>
	                    <div class="col-sm-2" style=" float:left; width:100%"></div>
	
	                    <div id=""></div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="allotment_date">Allotment Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="allotment_date" class="form-control " type="text" value="2020-10-15"
	                                name="transfar_allotment_date" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="discharge_time">Expected Discharge Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="discharge_time" class="form-control " type="text" value=""
	                                name="transfar_discharge_time" required>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="doctor">Select Nurse</label>
	                        <div class="col-sm-8">
	                            <select name="nurse[]" class="form-control" multiple="multiple" id="nurse">
	                                <option>select nurse</option>
	                                <option value="258">neema patel</option>
	                                <option value="9" selected="">Cristi Abeita</option>
	                                <option value="266">nurse jhk</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="middle_name">Description</label>
	                        <div class="col-sm-8">
	                            <textarea class="form-control" name="allotment_description"
	                                id="allotment_description">fvgdfgd </textarea>
	                        </div>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
	                        <input id="save_allow" type="submit" value="Transfer Bed" name="bed_transfar"
	                            class="btn btn-success" style="margin-bottom: 15px;">
	                    </div>
	                </form>
	            </div>
	            <div id="menu3" class="tab-pane">
	                <form name="patient_form" action="" method="post" class="form-horizontal" id="patient_form"
	                    style="margin-top: 15px">
	                    <!-- START BED ALLOTMENT FORM-->
	                    <input type="hidden" name="action" value="edit">
	                    <input type="hidden" name="allotment_id" value="32">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient_id">Patient<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_id" id="patient_id" class="form-control  " required>
	                                <option value="">Select Patient</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient_status">Patient Status<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_status" class="form-control " required>
	                                <option value="">select Patient Status</option>
	                                <option value="Admitted">Admitted</option>
	                                <option value="Under Treatment" selected="selected">Under Treatment</option>
	                                <option value="Operated">Operated</option>
	                                <option value="Recovery">Recovery</option>
	                                <option value="Cured">Cured</option>
	                                <option value="Discharged">Discharged</option>
	                                <option value="Death">Death</option>
	
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_type_id" class="form-control " id="bed_type_id" required>
	                                <option value="">Bed type</option>
	                                <option value="33">General</option> selected='selected'<option value="34"
	                                    selected="selected">ICU</option>
	                                <option value="35">Special</option>
	                                <option value="338">test bed</option>
	                                <option value="55">very spec</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bednumber">Bed Number<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_number" class="form-control " id="bednumber" required>
	                                <option value="">Select Bed Number</option>
	                                <option value="3" selected="selected">003</option>
	                                <option value="4">004</option>
	                                <option value="7">1</option>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="col-sm-2"></div>
	                    <div class="col-sm-8" id="bedlocation">
	
	                        <p class="bg-info" style="padding:10px; float:left; width:100%"><strong>Bed Location : </strong>
	                        </p>
	
	                    </div>
	                    <div class="col-sm-2" style="padding:10px; float:left; width:100%"></div>
	
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="allotment_date">Allotment Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="allotment_date" class="form-control " type="text" value="2020-09-23"
	                                name="allotment_date" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="discharge_time">Expected Discharge Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="discharge_time" class="form-control " type="text" value="2020-09-30"
	                                name="discharge_time">
	                        </div>
	                    </div>
	                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="40d9c6c34d"><input type="hidden"
	                        name="_wp_http_referer"
	                        value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=bedallotment&amp;tab=bedassign&amp;action=edit&amp;allotment_id=MzI%3D">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="doctor">Select Nurse</label>
	                        <div class="col-sm-8">
	                            <select name="nurse[]" class="form-control" multiple="multiple" id="nurse">
	                                <option value="258">select nurse</option>
	                                <option value="258">neema</option>
	                                <option value="9" selected="">Cristi</option>
	                                <option value="266">nurse</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="middle_name">Description</label>
	                        <div class="col-sm-8">
	                            <textarea class="form-control validate[custom[address_description_validation]]"
	                                maxlength="150" name="allotment_description"
	                                id="allotment_description">fvgdfgd </textarea>
	
	                        </div>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
	                        <input id="save_allow" type="submit" value="Save" name="bedallotment" class="btn btn-success">
	                    </div>
	                </form>
	            </div>
			</div>
		</div>
	</div>
</body>
</html>