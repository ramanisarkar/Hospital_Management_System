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

<script type="text/javascript">
$(document).ready(function(){
	
	var bedCategory = "listBedCategory";
	$.get('BadMenegement', { flag: bedCategory}, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		$('.bedaddlist').children('tr').remove();
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].bedtype+ '</td>';
			html += '<td>' + obj[index].charge + '</td>';
			html += '<td style="word-break: break-all;">' + obj[index].loction + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge bedcategorydelete" data-delete_id="' + count + '" id="bedcategoryId'+count+'" value="'+obj[index].id+'">X</button></td>';
			html += '<td><button type="button" class="btn-edit-cat badge bedcategoryedit" data-edit_id="' + count + '" id="bedcategoryId'+count+'" value="'+obj[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
			$('.bedaddlist').append(html);
		});
		var select = $('.addbednumber');
		select.find('option').remove();
		$('<option disabled selected hidden="">').val("").text("Select Bed Type").appendTo(select);  
		$.each(obj, function(index, value) {
			$('<option>').val(obj[index].id).text(obj[index].bedtype).appendTo(select);
		});
	});
	
	$('#bed_category_form').on('submit' , function(){
	    event.preventDefault();
	    var form = $('#bed_category_form')[0];
	    var data = new FormData(form);
	    $("#btn-add-bed-cat").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "BadMenegement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response){
	        	$("#btn-add-bed-cat").prop("disabled", false);
	        	var count=0;
	    		var obj = JSON.parse(response);
	    		$('.bedaddlist').children('tr').remove();
	    		$.each(obj, function(index) {
	    			count++;
	    			var html = '';
	    			html += '<tr id=' + count + '>';
	    			html += '<td>' + obj[index].bedtype+ '</td>';
	    			html += '<td>' + obj[index].charge + '</td>';
	    			html += '<td style="word-break: break-all;">' + obj[index].loction + '</td>';
	    			html += '<td><button type="button" class="btn-delete-cat badge bedcategorydelete" data-delete_id="' + count + '" id="bedcategoryId'+count+'" value="'+obj[index].id+'">X</button></td>';
	    			html += '<td><button type="button" class="btn-edit-cat badge bedcategoryedit" data-edit_id="' + count + '" id="bedcategoryId'+count+'" value="'+obj[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
	    			$('.bedaddlist').append(html);
	    		});
	    		var select = $('.addbednumber');
				select.find('option').remove();
				$('<option disabled selected hidden="">').val("").text("Select Bed Type").appendTo(select);  
				$.each(obj, function(index, value) {
					$('<option>').val(obj[index].id).text(obj[index].bedtype).appendTo(select);
				});
				
	       		$("#bed_category_form")[0].reset();
	        },
	        error: function (e) {
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#btn-add-bed-cat").prop("disabled", false);
	        }
	    });
	});
	
	$(document).on('change', '.addbednumber', function(){
		var bedcategoryid = $(this).val();
		console.log(bedcategoryid);
		var username = "editBedCategoryVo";
		$.get('BadMenegement',{flag:username,bedCategoryId:bedcategoryid},function(response){
			var obj = JSON.parse(response);
			$('#bedlocation').val(obj[0].loction);
			$('#BedCharge').val(obj[0].charge);
		});
	});
	
	var addbedlist = "listAddBed";
	$.get('BadMenegement', { flag: addbedlist}, function(response) {
		var obj = JSON.parse(response);
		var countBedAdd = 0;
		table = $('#bedNumberList').DataTable();
		table.destroy();
		$('.bedNumber').children('tr').remove();
		$.each(obj, function(index, value) {
			countBedAdd++;
		   	var html = '';
		   	html += '<tr id='+countBedAdd+'>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bednumber+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bedtype+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].location+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].description+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editAddbed" data-edit_id="'+countBedAdd+'" id="addBedId'+countBedAdd+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteAddbed" data-delete_id="'+countBedAdd+'" id="addBedId'+countBedAdd+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
			$('.bedNumber').append(html);
	 	});
		$('#bedNumberList').DataTable();
	});
	
	$('#insert_Add_Bed').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#insert_Add_Bed')[0];
	    var data = new FormData(form);
	    $("#btn-btn-success").prop("disabled", true);
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
	        	var obj = JSON.parse(response);
				var countBedAdd = 0;
				table = $('#bedNumberList').DataTable();
				table.destroy();
				$('.bedNumber').children('tr').remove();
				$.each(obj, function(index, value) {
					countBedAdd++;
				   	var html = '';
				   	html += '<tr id='+countBedAdd+'>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bednumber+'</a></td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bedtype+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].location+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].description+'</td>';
					html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editAddbed" data-edit_id="'+countBedAdd+'" id="addBedId'+countBedAdd+'" value="'+obj[index].id+'">Edit</button>';
					html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteAddbed" data-delete_id="'+countBedAdd+'" id="addBedId'+countBedAdd+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
					$('.bedNumber').append(html);
			 	});
				$('#bedNumberList').DataTable();
			 	var message=obj[0].medicineupdate;
				console.log(message);
				if(message == "true"){
					$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Record Added Successsfully");
	        		$("#insert_Add_Bed")[0].reset();
	        		$('#bedNumberList').DataTable();
	    		}
	            $("#btn-btn-success").prop("disabled", false);
	        },
	        error: function (e) {
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#btn-btn-success").prop("disabled", false);
	        }
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
.control-label{

text-align: right;
}
.require-field{
color: red;
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
#bedNumberList_length{
margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#bedNumberList_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;
}
    .category_listbox {
    height: 250px;
    overflow: scroll;
    float: left;
    margin-bottom: 10px;
    width: 100%;
}.table-responsive {
    min-height: .01%;
    overflow-x: auto;
}
.table-responsive {
    padding-top: 10px;
}
.badge {
   
    border-radius: 12px!important;
    font-weight: 300;
    font-size: 11px!important;
    text-align: center;
    vertical-align: middle;
    line-height: 11px;
    height: 18px;
    padding: 3px 6px;
    text-shadow: none!important;
  }
  .badge-delete {
    background: #F25656 !important;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    transform: translate(0, 0);
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
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif; font-size: 13px;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
	 <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
	  			<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white; margin-top: 17px; height: 49px;color: #5f5f5f !important;" data-toggle="dropdown" href="javascript:;">
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
				<li style="background-color: f1f4f9;">
					<a href="#home" id="Bloodtab4" data-toggle="tab">
						<i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Bed List
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu1" id="eventtab1" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true"style="border-radius: 50%; padding: 8px;"></i>Add Bed
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu2" id="eventtab2" style="display: none;" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Bed
					</a>
				</li>
			</ul>
			<div class="tab-content">
			    <div id="home" class="container tab-pane active" style="margin-top: 10px;">
			        <table id="bedNumberList" class="display table table-striped table-hover" style="width:100%">
			            <thead>
			                <tr>
			                    <th style="padding-left: 15px;">Bed Number</th>
			                    <th style="padding-left: 15px;">Bed Type</th>
			                    <th style="padding-left: 15px;">Charges($)</th>
			                    <th style="padding-left: 15px;">Description </th>
			                    <th style="padding-left: 15px;">Action</th>
			                </tr>
			            </thead>
			            <tbody class="bedNumber">
			            </tbody>
			            <tfoot>
			                <tr>
			                    <th style="padding-left: 15px;">Bed Number</th>
			                    <th style="padding-left: 15px;">Bed Type</th>
			                    <th style="padding-left: 15px;">Charges($)</th>
			                    <th style="padding-left: 15px;">Description </th>
			                    <th style="padding-left: 15px;">Action</th>
			                </tr>
			            </tfoot>
			        </table>
			        <div style="margin-top: 26px;"></div>
			    </div>
			    <div id="menu1" class="tab-pane">
			        <form style="margin-top: 15px;" id="insert_Add_Bed">
			            <div class="form-group row">
			                <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span class="require-field">*</span></label>
			                <div class="col-sm-8">
			                    <select name="bed_categoryid" class="form-control addbednumber">
			                        <option value="" disabled selected hidden="">Select Bed Type</option>	
			                    </select>
			                </div>
			                <div class="col-sm-2">
			                    <button id="addremove" class="btn " type="button" data-toggle="modal" data-target="#BedModal1">Add Or
			                        Remove</button>
			                </div>
			            </div>
			            <div class="form-group row">
			                <label class="col-sm-2 control-label" >Bed Number<span class="require-field">*</span></label>
			                <div class="col-sm-8">
			                    <input  class="form-control" type="number" min="0"
			                        onkeypress="if(this.value.length==8) return false;" name="bed_number">
			                </div>
			            </div>
			            <div class="form-group row">
			                <label class="col-sm-2 control-label">Charges(&#x20B9;)<span class="require-field">*</span></label>
			                <div class="col-sm-8">
			                    <input id="BedCharge" class="form-control" type="number" min="0"
			                        onkeypress="if(this.value.length==8) return false;" step="0.01" name="visiting_fees"readonly>
			                </div>
			            </div>
			            <div class="form-group row">
			                <label class="col-sm-2 control-label">Location<span class="require-field">*</span></label>
			                <div class="col-sm-8">
			                    <input type="text" id="bedlocation" class="form-control" readonly>
			                </div>
			            </div>
			            <div class="form-group row">
			                <label class="col-sm-2 control-label">Description<span class="require-field">*</span></label>
			                <div class="col-sm-8">
			                    <textarea id="Bad_history" maxlength="150"
			                        class="form-control"
			                        name="Description"></textarea>
			                </div>
			            </div>
			            <div class="col-sm-offset-2 col-sm-8">
			            <input type="hidden" name ="flag" value="insertAddBed">
			                <input type="submit" value="Save" name="save_Bed" id="btn-btn-success"class="btn btn-success"style="margin-bottom: 15px;">
			            </div>
			        </form>
			    </div>
			    <div class="modal fade" id="BedModal1" tabindex="-1" role="dialog" aria-labelledby="BedModalLabel1"
			        aria-hidden="true">
			        <div class="modal-dialog modal-lg">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal">x</button>
			                    <h3 class="modal-title">Add Bed</h3>
			                </div>
			
			                <div class="modal-body">
			                    <div class="category_listbox">
			                        <div class="table-responsive" style="min-height: 100%;">
			                            <form name="report_typ_form" action="" method="post" class="form-horizontal"id="report_typ_form">
			                                <table class="table">
			
			                                    <thead>
			                                        <tr>
			                                            <th>Bed Type</th>
			                                            <th>Charge</th>
			                                            <th>Location</th>
			                                            <th>Delete</th>
			                                            <th>Edit</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody class="bedaddlist">
			                                        
			                                    </tbody>
			                                </table>
			                            </form>
			                        </div>
			                    </div>
			                </div>
			                <form name="medicinecat_form" action="" method="post" class="form-horizontal" id="bed_category_form">
			                    <div class="form-group">
			                        <label class="col-sm-2 control-label" for="medicine_name">Bed Type<span
			                                class="require-field">*</span></label>
			                        <div class="col-sm-4 margin_bottom_5px">
			                            <input class="form-control" type="text" name="bedtype" required>
			                        </div>
			
			                        <label class="col-sm-1 control-label" for="medicine_name">Charge<span
			                                class="require-field">*</span></label>
			                        <div class="col-sm-3 margin_bottom_5px">
			                            <input id="report_cost" class="form-control" type="number"
			                                min="0" onkeypress="if(this.value.length==8) return false;" step="0.01" value=""
			                                name="bed_cost"required>
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-2 control-label" for="medicine_name">Location<span
			                                class="require-field">*</span></label>
			                        <div class="col-sm-4">
			                            <input class="form-control" type="text" name="bedlocation" required>
			                        </div>
			
			                        <div class="col-sm-2 margin_bottom_5px">
			                        	<input type="hidden" name="flag" value="insertBedCategory">
			                            <input type="submit" value="Add" name="save_category" class="btn btn-success"id="btn-add-bed-cat">
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