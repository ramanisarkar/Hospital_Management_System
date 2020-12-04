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
	$('#User_Role_Insert').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#User_Role_Insert')[0];
	    var data = new FormData(form);
	    $("#User_Role_Insert").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "ParsonRoll",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
	        	if (response == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
				}
	        	$("#insert_usersave").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#insert_usersave").prop("disabled", false);
			}
		});
	});
	
	$('#myTable').DataTable(); 
	$('#userroleid').change(function(event){  
		event.preventDefault();
        let userid=  $(this).val();
        console.log(userid);
     	$.get('ParsonRoll',{flag:"editUserPrivileges", userRoleId:userid},function(response) {
	    	var obj = JSON.parse(response);
	    	console.log(response);
	    	$("#User_Role_Insert")[0].reset();
	    	$('#userroleid').val(userid);
		   	$.each(obj, function(index, value) {
		   		$('.'+obj[index].Name).append('<input type="hidden" name="role_id['+obj[index].Name+'][]" value="'+obj[index].id+'" >');
				if(obj[index].bool1 == true){
					$('#'+obj[index].Name+'_owndata').prop('checked', true);
				}
				if(obj[index].bool2 == true){
					$('#'+obj[index].Name+'_view').prop('checked', true);
				}
				if(obj[index].bool3 == true){
					$('#'+obj[index].Name+'_add').prop('checked', true);
				}
				if(obj[index].bool4 == true){
					$('#'+obj[index].Name+'_edit').prop('checked', true);
				}
				if(obj[index].bool5 == true){
					$('#'+obj[index].Name+'_delete').prop('checked', true);
				}
		   	});
  		});
     	
     	let userRole = $("#userroleid :selected").text();
     	$('#userrolehedding').text(userRole);
    	$.get('Login',{flag:"CheckRole", userRoleId:userRole , adminid :$('#adminid').val()},function(response) {
    		var obj = JSON.parse(response);
    		let count =  0;
    		table = $('#myTable').DataTable();
			table.destroy();
    		$('.userrolelist').children('tr').remove();
		   	$.each(obj, function(index, value) {
		   		count++;
			   	var html = '';
			   	html += '<tr id='+count+'>';
			   	html += '<td><img src="User_Image/'+obj[index].field2+'" height="30px" width="30px" class="img-circle">';
			   	html += '<a href="#" style="margin-left: 10px;">'+obj[index].field1+'</a>	</td>';
				html += '</tr>';
				$('.userrolelist').append(html);
		 	});
			$('#myTable').DataTable(); 
    	});
	});
	
});
</script>
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
.row {
    margin-right: 0px !important;
    margin-left: -15px;
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
    margin-left: 80px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#myTable_length{
	margin-left: 20px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#myTable_paginate{
    margin-left: 110px;
    margin-top: -29px;
}
#myTable_info{
	margin-left: 20px;
}
.btn {
border-radius: 0px;
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
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
		<input type="hidden" id="adminid" value="${q.id }">
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
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="container" style="margin-right: 90px;">
			<div class="row">
        <div class="col-lg-6"style="background-color: #ffffff">
		    <div class="box" >
		        <h1 style="border-bottom: 1px solid gray">Edit Role <span id="userrolehedding"></span> </h1>
		        <form style="margin-top: 50px;" name="userrole" id="User_Role_Insert">
		            <div class="form-group">
		                <label for="fname"><span style="color: red">*</span>Role Name</label>
		                <select class="form-control" name="RollName" id="userroleid" required>
							<option value="" disabled selected hidden="">Select Role</option>	
		                    <option value="1" data-role="Doctor" >Doctor</option>
		                    <option value="2"data-role="Patient">Patient</option>
		                    <option value="3"data-role="Outpatient">Outpatient</option>
		                    <option value="4"data-role="Nurse">Nurse</option>
		                    <option value="5"data-role="Support Staff">Support Staff</option>
		                    <option value="6"data-role="Pharmacist">Pharmacist</option>
		                    <option value="7"data-role="Laboratory Staff">Laboratory Staff</option>
		                    <option value="8"data-role="Accountant Staff">Accountant Staff</option>
		                </select>
		            </div>
		
		            <table class="table">
                        <thead>
                            <tr>
                                <th>Feature</th>
                                <th>Owndata</th>
                                <th>View(global)</th>
                                <th>Add</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Patient Registration</td>
                                <td>
                                    <div class="checkbox PatientRegistration">
                                    
                                        <label> <input type="checkbox" id="PatientRegistration_owndata" value="onwdata" name="permissions[PatientRegistration][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="PatientRegistration_view" value="view" name="permissions[PatientRegistration][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="PatientRegistration_add" value="add" name="permissions[PatientRegistration][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="PatientRegistration_edit" value="edit" name="permissions[PatientRegistration][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="PatientRegistration_delete" value="delete" name="permissions[PatientRegistration][]"></label>
                                    </div>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
                                    <div class="checkbox department">
                                        <label> <input type="checkbox" id="department_owndata" value="onwdata" name="permissions[department][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="department_view" value="view" name="permissions[department][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="department_add" value="add" name="permissions[department][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" id="department_edit" value="edit" name="permissions[department][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox"id="department_delete" value="delete" name="permissions[department][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Specialization</td>
                                <td>
                                    <div class="checkbox specialization">
                                        <label> <input type="checkbox" value="owndata" id="specialization_owndata" name="permissions[specialization][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="specialization_view" name="permissions[specialization][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="add" id="specialization_add" name="permissions[specialization][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="specialization_edit" name="permissions[specialization][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="specialization_delete" name="permissions[specialization][]"></label>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Doctor</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="doctor_owndata" name="permissions[doctor][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="doctor_view" name="permissions[doctor][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox doctor">
                                        <label> <input type="checkbox" value="add" id="doctor_add" name="permissions[doctor][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="doctor_edit" name="permissions[doctor][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete"  id="doctor_delete" name="permissions[doctor][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Outpatient</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="outpatient_owndata" name="permissions[outpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="outpatient_view" name="permissions[outpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox outpatient">
                                        <label> <input type="checkbox" value="add" id="outpatient_add" name="permissions[outpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="outpatient_edit" name="permissions[outpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="outpatient_delete" name="permissions[outpatient][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Inpatient</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="inpatient_owndata" name="permissions[inpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="inpatient_view" name="permissions[inpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox inpatient">
                                        <label> <input type="checkbox" value="add" id="inpatient_add" name="permissions[inpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="inpatient_edit" name="permissions[inpatient][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="inpatient_delete" name="permissions[inpatient][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Nurse</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="nurse_owndata" name="permissions[nurse][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="nurse_view" name="permissions[nurse][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox nurse">
                                        <label> <input type="checkbox" value="add" id="nurse_add" name="permissions[nurse][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="nurse_edit" name="permissions[nurse][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="nurse_delete" name="permissions[nurse][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Support Staff</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="supportstaff_owndata" name="permissions[supportstaff][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="supportstaff_view" name="permissions[supportstaff][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox supportstaff">
                                        <label> <input type="checkbox" value="add" id="supportstaff_add" name="permissions[supportstaff][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="supportstaff_edit" name="permissions[supportstaff][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="supportstaff_delete " name="permissions[supportstaff][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Pharmacist</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="pharmacist_owndata" name="permissions[pharmacist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="pharmacist_view" name="permissions[pharmacist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="add" id="pharmacist_add" name="permissions[pharmacist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox pharmacist">
                                        <label> <input type="checkbox" value="edit" id="pharmacist_edit" name="permissions[pharmacist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="pharmacist_delete" name="permissions[pharmacist][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Laboratory</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="laboratroy_owndata" name="permissions[laboratory][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="laboratroy_view" name="permissions[laboratory][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox laboratroy">
                                        <label> <input type="checkbox" value="add"  id="laboratroy_add"name="permissions[laboratory][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit"id="laboratroy_edit" name="permissions[laboratory][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="laboratroy_delete" name="permissions[laboratory][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Accountant</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="accountant_owndata" name="permissions[accountant][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="accountant_view" name="permissions[accountant][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox accountant">
                                        <label> <input type="checkbox" value="add" id="accountant_add" name="permissions[accountant][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="accountant_edit" name="permissions[accountant][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="accountant_delete" name="permissions[accountant][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Medicine</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="medicine_owndata" name="permissions[medicine][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="medicine_view" name="permissions[medicine][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox medicine">
                                        <label> <input type="checkbox" value="add" id="medicine_add" name="permissions[medicine][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="medicine_edit" name="permissions[medicine][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="medicine_delete"  name="permissions[medicine][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Treatment</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="treatment_owndata" name="permissions[treatment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="treatment_view" name="permissions[treatment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox treatment">
                                        <label> <input type="checkbox" value="add" id="treatment_add" name="permissions[treatment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="treatment_edit" name="permissions[treatment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="treatment_delete" name="permissions[treatment][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Prescription</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="prescription_owndata" name="permissions[prescription][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="prescription_view" name="permissions[prescription][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox prescription">
                                        <label> <input type="checkbox" value="add" id="prescription_add" name="permissions[prescription][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="prescription_edit" name="permissions[prescription][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="prescription_delete" name="permissions[prescription][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Add Bad</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="addbad_owndata" name="permissions[addbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="addbed_view" name="permissions[addbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox addbed">
                                        <label> <input type="checkbox" value="add" id="addbed_add" name="permissions[addbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="addbed_edit" name="permissions[addbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="addbed_delete" name="permissions[addbed][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Assign Bed-Nurse</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="assginaddbed_owndata" name="permissions[assginaddbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="assginaddbed_view" name="permissions[assginaddbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox assginaddbed">
                                        <label> <input type="checkbox" value="add" id="assginaddbed_add" name="permissions[assginaddbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="assginaddbed_edit" name="permissions[assginaddbed][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="assginaddbed_delete" name="permissions[assginaddbed][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Operation List</td>
                                <td>
                                    <div class="checkbox operationlist">
                                        <label> <input type="checkbox" value="owndata"id="operationlist_owndata" name="permissions[operationlist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="operationlist_view" name="permissions[operationlist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="add" id="operationlist_add" name="permissions[operationlist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="operationlist_edit" name="permissions[operationlist][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="operationlist_delete" name="permissions[operationlist][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Diagnosis</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="diagnosis_owndata" name="permissions[diagnosis][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="diagnosis_view" name="permissions[diagnosis][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox diagnosis">
                                        <label> <input type="checkbox" value="add" id="diagnosis_add" name="permissions[diagnosis][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="diagnosis_edit" name="permissions[diagnosis][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="diagnosis_delete" name="permissions[diagnosis][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td> Blood Bank</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="bloodbank_owndata" name="permissions[bloodbank][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="bloodbank_view" name="permissions[bloodbank][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox bloodbank">
                                        <label> <input type="checkbox" value="add" id="bloodbank_add" name="permissions[bloodbank][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="bloodbank_edit" name="permissions[bloodbank][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="bloodbank_delete" name="permissions[bloodbank][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Appointment</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="appointment_owndata" name="permissions[appointment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="appointment_view" name="permissions[appointment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox appointment">
                                        <label> <input type="checkbox" value="add" id="appointment_add" name="permissions[appointment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="appointment_edit" name="permissions[appointment][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="appointment_delete" name="permissions[appointment][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Invoice</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="invoice_owndata" name="permissions[invoice][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="invoice_view" name="permissions[invoice][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox invoice">
                                        <label> <input type="checkbox" value="add" id="invoice_add" name="permissions[invoice][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="invoice_edit" name="permissions[invoice][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="invoice_delete" name="permissions[invoice][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Event</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="event_owndata" name="permissions[event][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="event_view" name="permissions[event][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox event">
                                        <label> <input type="checkbox" value="add" id="event_add" name="permissions[event][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="event_edit" name="permissions[event][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="event_delete" name="permissions[event][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Message</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="message_owndata" name="permissions[message][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="message_view" name="permissions[message][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox message">
                                        <label> <input type="checkbox" value="add" id="message_add" name="permissions[message][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="message_edit" name="permissions[message][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="message_delete" name="permissions[message][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Ambulance</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="ambulance_owndata" name="permissions[ambulance][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="ambulance_view" name="permissions[ambulance][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox ambulance">
                                        <label> <input type="checkbox" value="add" id="ambulance_add" name="permissions[ambulance][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="ambulance_edit" name="permissions[ambulance][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="ambulance_delete" name="permissions[ambulance][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Instrument</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="instrument_owndata" name="permissions[instrument][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="instrument_view" name="permissions[instrument][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox instrument">
                                        <label> <input type="checkbox" value="add" id="instrument_add" name="permissions[instrument][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="instrument_edit" name="permissions[instrument][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="instrument_delete" name="permissions[instrument][]"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Report</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="report_owndata" name="permissions[report][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="report_view" name="permissions[report][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox report">
                                        <label> <input type="checkbox" value="add" id="report_add" name="permissions[report][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="report_edit" name="permissions[report][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="report_delete" name="permissions[report][]"></label>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>Role</td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="owndata" id="role_owndata" name="permissions[role][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="view" id="role_view" name="permissions[role][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox role">
                                        <label> <input type="checkbox" value="add" id="role_add" name="permissions[role][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="edit" id="role_edit" name="permissions[role][]"></label>
                                    </div>
                                </td>
                                <td>
                                    <div class="checkbox">
                                        <label> <input type="checkbox" value="delete" id="role_delete" name="permissions[role][]"></label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
		            <div class="top" style="border-bottom: 1px solid gray"></div>
		            <input name="flag" type="hidden" value="insertUserPrivileges">
		            <input type="submit"class="btn btn-info"style="float: right;margin-top: 20px;" name="save" value="Save" id="insert_usersave">
		        </form>
		    </div>
		</div>
		<div class="col-lg-6" >
		    <div class="box" style="background-color: #ffffff; width: 647px; margin-left: 20px;">
		        <h4 style="border-bottom: 1px solid gray;font-weight: 600;padding: 20px;margin-top: 0px; ">Staff Members Which Are Using This Role</h4>
		        <table id="myTable" class="display table table-striped table-hover " style="width:97%; margin-left: 20px;">
			        <thead>
			            <tr>
			                <th>Full Name</th>
			            </tr>
			        </thead>
			        <tbody class="userrolelist" >
			        </tbody>
			    </table>
		    </div>
		</div>
		</div>
	</div>
</div>
</body>
</html>