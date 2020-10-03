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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
$(document).ready(function(){
	var count = 0;
	var supportstaffusername;
	var username="accountantStaffList";
		$.get('AccountantStaff',{flag:username},function(response) {
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td><img src="Accountant_Staff_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;" ><a href="#">'+obj[index].patientid+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].firstname+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].email+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="accountantStaffId'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="accountantStaffId'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
			$('.accountant').append(html);
	 	});
			 $('#example').DataTable();
	});
	$("#txt_username").keyup(function(){
		
	      var pharmacist = $(this).val().trim();
	      var username = "chackusername";
	      console.log(pharmacist);
	      if(pharmacist != ''){
	         $.ajax({
	            url: 'AccountantStaff',
	            type: 'post',
	            data: {flag:username , pharmacistusername1:pharmacist},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
	            	if(obj[0].chackusername == "false"){
	        			$("#btnSubmit").prop("disabled", true);
		                $('#available').html("Username Already Taken");		
	             	}
		        	else if (obj[0].chackusername == "true") {
		                $('#available').html("");
		                $("#btnSubmit").prop("disabled", false);
					}
		        }
	         });
	      }else{
	         $("#available").html("");
	      }
	 });
	$("#username").keyup(function(){
	      var pharmacist = $(this).val().trim();
	      var username = "chackusername";
	      if(pharmacist != ''){
	         $.ajax({
	            url: 'AccountantStaff',
	            type: 'post',
	            data: {flag:username , pharmacistusername1:pharmacist},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
		        	if(obj[0].chackusername == "false"){
		        		console.log("------------1245123461+7+4----------------");
		        		if(obj[0].username == supportstaffusername){
		        			console.log("-------------789456---------------");
		        			$('#available1').html("");
		        			$("#btnSubmit").prop("disabled", false);
		        		}else {
		        			console.log("--------------123456--------------");
		        			$("#btnSubmit").prop("disabled", true);
			                $('#available1').html("Username Already Taken");		
						}
	             	}
		        	else if (obj[0].chackusername == "true") {
		        		console.log("--------------dadada--------------");
		                $('#available1').html("");
		                $("#btnSubmit").prop("disabled", false);
					}
		        }
	         });
	      }else{
	         $("#available1").html("");
	      }
	 });
	$('#insert_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#insert_form')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "AccountantStaff",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	console.log(response);
	        	var obj = JSON.parse(response);
	        	if(obj[0].accountantstaffupdate == "true"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#insert_form")[0].reset();
	        	}
	        	else if(obj[0].accountantstaffemail == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id , Please try again");
	        	}
	        	
	        	else if(obj[0].accountantstaffemailinvalid == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id was not coreact ,  Please try again");
	        	}
	            $("#btnSubmit").prop("disabled", false);
	        },
	        error: function (e) {
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#btnSubmit").prop("disabled", false);
	        }
	    });
	
	});
	$(document).on('click', '.edit', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var accountantStaff = $('#accountantStaffId'+editid).val();
		var username = "editAccountantStaff";
		$.get('AccountantStaff',{flag:username , accountantStaffId:accountantStaff},function(response){
 			$("#accountantStaffTab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#accountantStaffTab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#accountantStaffId').val(obj[0].id);
			$('#adminid').val(obj[0].adminid);
			$('#joiningdateid').val(obj[0].joiningdate);
			$('#firstname').val(obj[0].firstname);
			$('#middlename').val(obj[0].midalname);
			$('#lastname').val(obj[0].lastname);
			$('#dob').val(obj[0].date);
			var gender = obj[0].gender;
			if(gender=="male"){
				$("#male").prop("checked", true);
			}
			else {
				$("#female").prop("checked", true);
			}
			$('#hometownaddress').val(obj[0].homeeaddrss);
			$('#homecity').val(obj[0].homecity);
			$('#homestate').val(obj[0].homestate);
			$('#homecountry').val(obj[0].homecountry);
			$('#homezipcode').val(obj[0].homezipcode);
			$('#standardcode').val(obj[0].mobilecountrycode);
			$('#mobilenumber').val(obj[0].mobileno);
			$('#phonenumber').val(obj[0].phoneno);
			$('#email').val(obj[0].email);
			$('#username').val(obj[0].username);
			supportstaffusername= obj[0].username;
			$('#password').val(obj[0].password);
			$('#chargeid').val(obj[0].charge);
			if(obj[0].profileimagename){
				$('#profileimageid').show();
				$('#profileimageid').text(obj[0].profileimagename);
				$('#editprofileImage').val(obj[0].profileimage);
				$("#coveredit").attr("src", "Accountant_Staff_Image/"+obj[0].profileimage+"");
			}else{
				$('#profileimageid').hide();
			}
		});
	});
	$('#update_form').on('submit', function(event){
    event.preventDefault();
    var form = $('#update_form')[0];
    var data = new FormData(form);
    console.log(form);
    console.log(data);
    $("#update").prop("disabled", true);
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "AccountantStaff",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response ,textStatus , jqXHR ){
        	var obj = JSON.parse(response);
        	console.log(obj);
        	if(obj[0].accountantstaffupdate == "true"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Recored Update Successsfully");
        		 $("#update").prop("disabled", false);
        		
        	}
        	else if(obj[0].accountantstaffemail == "false"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Email Id  , Please try again");
        	}
        	
        	else if(obj[0].accountantstaffemailinvalid == "false"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Email Id was not coreact ,  Please try again");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            $("#update").prop("disabled", false);
        	}
    	});
	});
	$(document).on('click', '.delete', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var accountantStaff = $('#accountantStaffId'+deleteid).val();
		var username = "deleteAccountantStaff";
		$.get('AccountantStaff',{flag:username , accountantStaffId:accountantStaff},function(response){
			var message=response;
			console.log(message)
			if(message == "seccess"){
				count--;
        	$('#'+deleteid+'').closest('tr').remove();
			$('#message1').show();
    		$('#message2').show();
    		$('#message3').show();
    		$('#messagepass').text("Recored Delete Successsfully");
    	}
		});
	});
 	$(".nav-tabs a").click(function(){
   		$("#accountantStaffTab2").hide();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	    var supportStaffList =  $(this).text(); 
   	    console.log(supportStaffList);
   	    if(supportStaffList=="Accountant Staff List"){
   	    	location.reload();
   	    }
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
				<li class="active" id="tab1doctorlist"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient List</a></li>
						
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="patienttab1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Patient</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="patienttab2" data-toggle="tab"
					href="#menu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Patient</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home"  class="container tab-pane active"style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                 <th>Photo</th>
			                 <th style="padding-left: 15px;">Patient Id</th>
							 <th style="padding-left: 15px;">Patient Name</th>
							 <th style="padding-left: 15px;">Blood Group</th>
							 <th style="padding-left: 15px;">Mobile Number</th>
							 <th style="padding-left: 15px;">Email</th>
							 <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="accountant">
			        
			        </tbody>
			        <tfoot>
			            <tr>
							 <th>Photo</th>
			                 <th style="padding-left: 15px;">Patient Id</th>
							 <th style="padding-left: 15px;">Patient Name</th>
							 <th style="padding-left: 15px;">Blood Group</th>
							 <th style="padding-left: 15px;">Mobile Number</th>
							 <th style="padding-left: 15px;">Email</th>
							 <th style="padding-left: 15px;">Action</th>			            
						</tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
   			 </div>
			<div id="menu1" class="tab-pane">
				<form id="insert_form" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input  class="form-control  text-input" maxlength="50" type="text" value="" name="first_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="middle_name" >Middle Name</label>
						<div class="col-sm-8">
							<input  class="form-control " maxlength="50" type="text" value="" name="middle_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  " maxlength="50" type="text" value="" name="last_name">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
						<div class="col-sm-8">
										<label class="radio-inline">
						     <input type="radio" value="male" class="tog " name="gender">Male			    </label>
						    <label class="radio-inline">
						      <input type="radio" value="female" class="tog" name="gender">Female 
						    </label>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input  class="form-control" type="date"  name="birth_date">
						</div>
					</div>		
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="blood_group">Blood Group<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<select  class="form-control" name="blood_group" required="required">
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
					  <div class="form-group row">
						<label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control " type="text" name="symptoms" >
						</div>					
					</div>	
					<div class="diagnosissnosis_div">
						<div class="form-group row">
							<label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
							<div class="col-sm-8">
								<input type="file" class="form-control" name="diagnosis">
							</div>
						</div>	
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control " type="text" maxlength="150" name="address" value="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="city_name">City<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control " type="text" name="city_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">State</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" name="state_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">Country</label>
						<div class="col-sm-8">
							<input class="form-control " type="text" name="country_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control" type="number" maxlength="15" name="zip_code" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="mobile">Mobile<span class="require-field">*</span></label>
						<div class="col-sm-1" style="padding-right: 0px;">
						<input type="text" value="+91" class="form-control" name="phonecode" maxlength="5">
						</div>
						<div class="col-sm-7">
							<input class="form-control" minlength="6" maxlength="15" type="number" value="" name="mobile">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="phone">Phone</label>
						<div class="col-sm-8">
							<input class="form-control  " minlength="6" maxlength="15" type="text" value="" name="phone">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  " maxlength="100" type="email" name="email" value="" required="required">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control " type="text" name="username" maxlength="30" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="password">Password<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input  class="form-control " type="password" name="password" maxlength="12" value="">
						</div>
					</div>
				
						<div class="form-group row">
						<label class="col-sm-2 control-label" for="photo">Image</label>
						
							<div class="col-sm-8">
							<input class="form-control file" type="file" name="profileimage" accept="image/*" 
											onchange="document.getElementById('coveredit').src = window.URL.createObjectURL(this.files[0])">
							</div>
							
							<div class="form-group row">
						    		<div class="image">
						    			<img id="coveredit" alt="your image" width="150" height="150" style="margin-left: 290px; margin-top: 10px;" />
						    		</div>
			  					</div>
						</div>	
						<div class="col-sm-offset-2 col-sm-8">
			        	<input type="hidden" name="flag" value="insert">
			        	<input type="hidden" name="count" id="count" >
			        	<input type="submit" value="Patient Registration" name="registration_front_patient" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div id="menu2" class="tab-pane">
				<form id="update_form" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="first_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="first_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="middle_name" >Middle Name</label>
						<div class="col-sm-8">
							<input id="middle_name" class="form-control validate[custom[onlyLetter_specialcharacter]]" maxlength="50" type="text" value="" name="middle_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="last_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="last_name">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
						<div class="col-sm-8">
										<label class="radio-inline">
						     <input type="radio" value="male" class="tog validate[required]" name="gender" checked="checked">Male			    </label>
						    <label class="radio-inline">
						      <input type="radio" value="female" class="tog validate[required]" name="gender">Female 
						    </label>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="birth_date" class="form-control validate[required] " type="date"  name="birth_date">
						</div>
					</div>		
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="blood_group">Blood Group<span class="require-field">*</span></label>
						<div class="col-sm-8">
											<select id="blood_group" class="form-control validate[required]" name="blood_group">
							<option value="">Select Blood Group</option>
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
								<div class="form-group row">
							<label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
							<div class="col-sm-8">
								<input class="form-control validate[required]" type="text" name="symptoms" >
							</div>					
						</div>	
					<div class="diagnosissnosis_div">
						<div class="form-group row">
							<label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
							<div class="col-sm-8">
								<input type="file" class="form-control file dignosisreport" name="diagnosis1">
							</div>
						</div>	
					</div>
					<div class="form-group row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-8 row">
							<input type="button" value="Add More Report" name="add_more_report" class="add_more_report btn btn-default" style="margin-left: 15px;">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="address" class="form-control validate[required,custom[address_description_validation]]" type="text" maxlength="150" name="address" value="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="city_name">City<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="city_name" class="form-control validate[required,custom[city_state_country_validation]]" type="text" name="city_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">State</label>
						<div class="col-sm-8">
							<input id="state_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="state_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">Country</label>
						<div class="col-sm-8">
							<input id="country_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="country_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="zip_code" class="form-control  validate[required,custom[onlyLetterNumber]]" type="text" maxlength="15" name="zip_code" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="mobile">Mobile<span class="require-field">*</span></label>
						<div class="col-sm-1" style="padding-right: 0px;">
						<input type="text" value="+91" class="form-control  validate[required] onlynumber_and_plussign" name="phonecode" maxlength="5">
						</div>
						<div class="col-sm-7">
							<input id="mobile" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="mobile">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="phone">Phone</label>
						<div class="col-sm-8">
							<input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="phone">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="email" class="form-control validate[required,custom[email]] text-input" maxlength="100" type="text" name="email" value="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="username" class="form-control validate[required,custom[username_validation]]" type="text" name="username" maxlength="30" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="password">Password<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="password" class="form-control validate[required,minSize[8]]" type="password" name="password" maxlength="12" value="">
						</div>
					</div>
				
						<div class="form-group row">
						<label class="col-sm-2 control-label" for="photo">Image</label>
						
							<div class="col-sm-8">
							<input class="form-control file" type="file" name="profileimage" accept="image/*" 
											onchange="document.getElementById('coveredit').src = window.URL.createObjectURL(this.files[0])">
							</div>
							
							<div class="form-group row">
						    		<div class="image">
						    			<img id="coveredit" alt="your image" width="150" height="150" style="margin-left: 290px; margin-top: 10px;" />
						    		</div>
			  					</div>
						</div>	
						<div class="col-sm-offset-2 col-sm-8">
			        	<input type="hidden" name="flag" value="insert">
			        	<input type="hidden" name="count" id="count" >
			        	<input type="submit" value="Patient Registration" name="registration_front_patient" class="btn btn-success">
			        </div>
			    </form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>