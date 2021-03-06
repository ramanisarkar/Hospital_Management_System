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
	var symptomslist = "symptomsList";
	var adminid = $('#adminid').val();
	$('#symptomesadminid').val(adminid);
	$.get('Login',{flag:"PermissionRole"},function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$.each(obj, function(index, value) {
			if(obj[index].bool1 == true || obj[index].bool2 == true){
				console.log("fnuisdhaafd");
				$('.'+obj[index].field3+'_menu').removeClass("all_manu");
			}
		});
		$(".all_manu").remove();
		$("#body").css("display", "block");
	});
	$.get('Symptoms', { flag: symptomslist, adminId : adminid }, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		console.log(response);
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].name + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td></tr>';
			$('.symtopslisttable').append(html);
		});
		var select = $('.symptomsoutpatient');
		select.find('option').remove();
		$.each(obj, function(index, value) {
			$('<option>').val(obj[index].id).text(obj[index].name).appendTo(select);
		});
		$('#symtomsmulti').multiselect({
	        includeSelectAllOption: true,
	    });
		$('.multiselect-selected-text').text("Select Symptoms");
	});
	
	var diagnosis = 1;
	$("body").on("click", ".add_more_report", function(){
		diagnosis++;
		$(".diagnosissnosis_div").append('<div class="form-group row"style="d margin-left: -10px;"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-8"><input type="file" class="dignosisreport form-control file" name="diagnosis'+diagnosis+'" accept="application/pdf"></div><div class="col-sm-2"><input type="button" value="Delete" onclick="deleteParentElement(this)" class="remove_cirtificate btn btn-default"></div></div>');
		$('#diagnosiscount').val(diagnosis);
	});
	
	$("body").on("click", ".remove_cirtificate", function(){
		alert("Do you really want to delete this record ?");
		$(this).parent().parent().remove();
	});
	$(document).on('click', '.edit', function(){
		
	});
	$('.input-group.date').datepicker({format: "dd/mm/yyyy",singleDatePicker: true,
	    showDropdowns: true,
	    minYear: 1901,
	    maxYear: parseInt(0)
	});
	var count = 0;
	var supportstaffusername;
	var username="PatientRegistrationList";
		$.get('PatientRegistration',{flag:username},function(response) {
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td><img src="Patient_Registration_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;" ><a href="#">'+obj[index].patientid+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].firstname+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bloodgroup+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].mobileno+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].email+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="patientId'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="patientId'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
			$('.patientRegistration').append(html);
	 	});
			 $('#example').DataTable();
	});
	
	$("#txt_username").keyup(function(){
	      var patientuser = $(this).val().trim();
	      var username = "chackuser";
	      console.log(patientuser);
	      if(patientuser != ''){
	         $.ajax({
	            url: 'PatientRegistration',
	            type: 'post',
	            data: {flag:username , patientuserId:patientuser},
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
	      var username = "chackuser";
	      if(pharmacist != ''){
	         $.ajax({
	            url: 'PatientRegistration',
	            type: 'post',
	            data: {flag:username , patientuserId:patientuser},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
		        	if(obj[0].chackusername == "false"){
		        		if(obj[0].username == supportstaffusername){
		        			$('#available1').html("");
		        			$("#btnSubmit").prop("disabled", false);
		        		}else {
		        			$("#btnSubmit").prop("disabled", true);
			                $('#available1').html("Username Already Taken");		
						}
	             	}
		        	else if (obj[0].chackusername == "true") {
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
	    console.log("---------------");
		var dob = $('#dateofbarth').val();
		console.log(dob);
		var pattern =/^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;
	    if (dob == null || dob == "" || !pattern.test(dob)) {
	    	alert("Invalid date of birth");
	        $('#dateofbarth').text("");
	        return false;
	    }
	    console.log(form);
	    console.log(data);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "PatientRegistration",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = response;
	        	console.log(obj);
	        	if(obj== "success"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$('#coveredit1').attr('src', '');
	        		$(".diagnosissnosis_div").remove();
	        		$("#insert_form")[0].reset();
	        	}
	        	else if(obj == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id Already Exist , Please try again");
	        	}
	        	
	            $("#btnSubmit").prop("disabled", false);
	        },
	        error: function (e) {
	        	$(".diagnosissnosis_div").remove();
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#btnSubmit").prop("disabled", false);
	        }
	    });
	});
	$(document).on('click', '.edit', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var patient = $('#patientId'+editid).val();
		var username = "editPatientRegistration";
		$.get('PatientRegistration',{flag:username , patientId:patient},function(response){
 			$("#patienttab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#patienttab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#patientId').val(obj[0].id);
			$('#adminid').val(obj[0].adminid);
			$('#joiningdateid').val(obj[0].joiningdate);
			$('#first_name').val(obj[0].firstname);
			$('#middlename').val(obj[0].midalname);
			$('#last_name').val(obj[0].lastname);
			$('#dob').val(obj[0].date);
			$('#patientid').val(obj[0].patientid);
			var gender = obj[0].gender;
			if(gender=="male"){
				$("#male").prop("checked", true);
			}
			else {
				$("#female").prop("checked", true);
			}
			$('#blood_group').val(obj[0].bloodgroup);
			$('#symptoms').val(obj[0].symptoms);
			$('#address').val(obj[0].homeeaddrss);
			$('#homecity').val(obj[0].homecity);
			$('#state_name').val(obj[0].homestate);
			$('#homecountry').val(obj[0].homecountry);
			$('#zip_code').val(obj[0].homezipcode);
			$('#standardcode').val(obj[0].mobilecountrycode);
			$('#mobile').val(obj[0].mobileno);
			$('#phone').val(obj[0].phoneno);
			$('#email').val(obj[0].email);
			$('#username').val(obj[0].username);
			$('#password').val(obj[0].password);
			if(obj[0].profileimagename){
  				$('#profileimageid').show();
  				$('#profileimageid').text(obj[0].profileimagename);
  				$('#editprofileImage').val(obj[0].profileimage);
  				console.log(obj[0].profileimage);
  				$("#coveredit").attr("src", "Patient_Registration_Image/"+obj[0].profileimage+"");
  			}else{
  				$('#profileimageid').hide();
  			}
			if(obj[0].dignosisname){
  				$('#experiencecertificateid').show();
  				$('#experiencecertificatebuttonid').show();
  				$('#experiencecertificateid').text(obj[0].dignosisname);
  				$('#editexperienceCertificate').val(obj[0].dignosis);
  				$('#experiencecertificatebuttonid').attr("href","Patient_Registration_Image/"+obj[0].dignosis+"");
  			}else {
  				$('#experiencecertificateid').hide();
  				$('#experiencecertificatebuttonid').hide();
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
        url: "PatientRegistration",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response ,textStatus , jqXHR ){
        	var obj = response;
        	console.log(obj);
        	if(obj== "success"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Recored Update Successsfully");
        		
        	}
        	else if(obj == "false"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Email Id Already Exist , Please try again");
        	}$("#update").prop("disabled", false);
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
		var patient = $('#patientId'+deleteid).val();
		var username = "deletePatientRegistration";
		$.get('PatientRegistration',{flag:username , patientId:patient},function(response){
			var message=response;
			console.log(message)
			if(message == "success"){
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
   	    if(supportStaffList=="Patient Registration List"){
   	    	location.reload();
   	    }
   	});
 	
});
</script>

<style type="text/css">
html{
	scroll-behavior:smooth;
}
.multiselect-container {
    width: 750px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.dropdown-toggle{
   width: 750px !important;
}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
    color: black;
    text-decoration: none;
    background-color: #f1f1f1;
    border: 1px solid #e5e5e5;
    outline: 0;
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

<body id="body" style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif; font-size: 13px;height: 100%!important;display: none;">
	
	<c:forEach items="${sessionScope.userdata }" var="q" end="0"> 
		<input type="hidden" id="adminid" value="${q.adminid.id }">
		 <div class="navbar" style="padding-right: 14px;  background-color: white; height: 69px;">
            <div class="col-md-3 col-sm-2 col-xs-4"style=" word-break: break-all;">
                <h3>
                    <img src="Admin_Images/<%=session.getAttribute("hospitallogo")%>" class="img-circle head_logo" width="40" height="40"
                        style="margin-top: -8px;"><span style="font-size:21px "><%=session.getAttribute("hospitalname")%></span>
                </h3>
            </div>
            <ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
                <li class="dropdown" style="margin-left: 80%;">
                    <a style="background-color: white;  color: #5f5f5f !important;   height: 49px;"
                        data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
                        <img src="User_Image/<%=session.getAttribute("userimage")%>" height="40px" width="40px"
                            class="img-circle" style="margin-top: -15px;">
                        <span>${q.firstname }</span> <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li><a href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><i
                                    class="fa fa-user"></i>
                                My Profile</a></li>
                        <li><a href="Com_Login.jsp"><i class="fas fa-sign-out-alt"></i>Log Out </a></li>
                    </ul>
                </li>
            </ul>
        </div>
	<div hidden="" id="message1" class="updated below-h2"style="width: 81%;margin-left: 253px;margin-top: 27px;"><p id="messagepass"></p></div>
		<div id="message3"style="margin-top:-76px;" hidden=""></div>
		<ul class="nav nav-pills nav-stacked ullist"style="margin-top: -20px;height: 100%!important;">
			<li><a href="<%=request.getContextPath()%>/Admin?flag=desbord&id=${q.adminid.id }"><span class="icone">
                        <img src="ing/dashboard.png"></span><span class="title">Dashboard</span></a></li>

            <li class="PatientRegistration_menu  all_manu"><a
                    href="<%=request.getContextPath()%>/PatientRegistration?flag=role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fas fa fa-wheelchair" style="color: gray;"></i></span><span
                        class="title">Patient Registration</span></a></li>

            <li class="department_menu all_manu "><a href="<%=request.getContextPath()%>/Department?flag=role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fas fa-briefcase" style="color: gray;"></i></span><span
                        class="title">Department</span></a></li>

            <li class="specialization_menu all_manu"><a
                    href="<%=request.getContextPath()%>/Specialization?flag=
role_insert&id=${q.adminid.id }">
                    <span class="icone"><i class="fa fa-lightbulb" style="color: gray;"></i></span><span
                        class="title">Specialization</span></a></li>

            <li class="doctor_menu all_manu"><a href="<%=request.getContextPath()%>/Doctor?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Doctor" title="Doctor">
                    <span class="icone"> <img src="ing/doctor-logo.png"></span>
                    <span class="title">Doctor</span></a></li>

            <li class="outpatient_menu all_manu"><a href="<%=request.getContextPath()%>/OutPatient?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Outpatient" title="Outpatient">
                    <span class="icone"> <img src="ing/outpatient-logo.png"></span>
                    <span class="title">Outpatient</span></a></li>

            <li class="inpatient_menu all_manu"><a href="<%=request.getContextPath()%>/Patient?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
                    <span class="icone"> <img src="ing/Patient-logo.png"></span>
                    <span class="title">Inpatient</span></a></li>

            <li class="nurse_menu all_manu"><a href="<%=request.getContextPath()%>/Nurse?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Nurse" title="Nurse">
                    <span class="icone"> <img src="ing/Nurse-logo.png"></span>
                    <span class="title">Nurse</span></a></li>

            <li class="supportstaff_menu all_manu"><a href="<%=request.getContextPath()%>/SupportStaff?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Support Staff" title="Support Staff">
                    <span class="icone"> <img src="ing/support-logo.png"></span>
                    <span class="title">Support Staff</span></a></li>

            <li class="pharmacist_menu all_manu"><a href="<%=request.getContextPath()%>/Pharmacist?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Pharmacist" title="Pharmacist">
                    <span class="icone"> <img src="ing/Pharmacist-logo.png"></span><span
                        class="title">Pharmacist</span></a></li>

            <li class="laboratory_menu all_manu"><a href="<%=request.getContextPath()%>/Laboratory?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Laboratory Staff" title="Laboratory Staff">
                    <span class="icone"> <img src="ing/Laboratorist-logo.png"></span><span class="title">Laboratory
                        Staff</span></a></li>

            <li class="accountant_menu all_manu"><a
                    href="<%=request.getContextPath()%>/AccountantStaff?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Accountant" title="Accountant">
                    <span class="icone"> <img src="ing/Accountant-logo.png"></span><span
                        class="title">Accountant</span></a></li>
                       
            <li class="medicine_menu all_manu"><a href="<%=request.getContextPath()%>/Medicine?flag=role_insert&id=${q.adminid.id }"
                    data-tooltip="Medicine" title="Medicine">
                    <span class="icone"> <img src="ing/Medicine-logo.png"></span><span class="title">Medicine</span></a>
            </li>
           
            <li class="treatment_menu all_manu"><a
                    href="<%=request.getContextPath()%>/TreatmentUpdate?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Treatment" title="Treatment">
                    <span class="icone"> <img src="ing/Treatment-logo.png"></span><span
                        class="title">Treatment</span></a></li>
                       
            <li class="prescription_menu all_manu"><a href="<%=request.getContextPath()%>/Prescription?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Prescription" title="Prescription">
                    <span class="icone"> <img src="ing/Prescription-logo.png"></span><span
                        class="title">Prescription</span></a></li>

            <li class="addbed_menu all_manu"><a href="<%=request.getContextPath()%>/BadMenegement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
                    <span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
                    <span class="title">Add Bad</span></a></li>

            <li class="assginaddbed_menu all_manu"><a href="<%=request.getContextPath()%>/BadMenegement?flag=role_bedassign&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
                    <span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign
                        Bed-Nurse</span></a></li>

            <li class="operationlist_menu all_manu"><a
                    href="<%=request.getContextPath()%>/OperationManagement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Operation List" title="Operation List">
                    <span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation
                        List</span></a></li>

            <li class="diagnosis_menu all_manu"><a
                    href="<%=request.getContextPath()%>/DiagnosisReport?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Diagnosis" title="Diagnosis">
                    <span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span
                        class="title">Diagnosis</span></a></li>

            <li class="bloodbank_menu all_manu"><a href="<%=request.getContextPath()%>/BloodManage?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
                    <span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood
                        Bank</span></a></li>
 
            <li class="appointment_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
                    <span class="icone"> <img src="ing/Appointment-logo.png"></span><span
                        class="title">Appointment</span></a></li>

            <li class="invoice_menu all_manu"><a
                    href="<%=request.getContextPath()%>/InvoiceManagement?flag=role_insert&id=${q.adminid.id }" class="left-tooltip"
                    data-tooltip="Invoice" title="Invoice">
                    <span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a>
            </li>

            <li class="event_menu all_manu"><a href="<%=request.getContextPath()%>/Event?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Event" title="Event">
                    <span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li>

            <li class="message_menu all_manu"><a href="<%=request.getContextPath()%>/Message?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Message" title="Message">
                    <span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a>
            </li>

            <li class="ambulance_menu all_manu"><a href="<%=request.getContextPath()%>/Ambulance?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
                    <span class="icone"> <img src="ing/Ambulance-logo.png"></span><span
                        class="title">Ambulance</span></a></li>
                       
            <li class="instrument_menu all_manu"><a
                    href="<%=request.getContextPath()%>/InstrumentManagement?flag=role_insert&id=${q.adminid.id }"
                    class="left-tooltip" data-tooltip="instrument" title="instrument">
                    <span class="icone"> <img src="ing/Instrument-logo.png"></span><span
                        class="title">Instrument</span></a></li>
                       
            <li class="report_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
                    <span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a>
            </li>
            <li class="Account_menu all_manu"><a href="" class="left-tooltip" data-tooltip="Account" title="Account"><span
                        class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a>
            </li>
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
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient Registration List</a></li>
						
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="patienttab1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Patient Registration</a>
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
			        <tbody class="patientRegistration">
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
			<div style="margin-top: 20px;"></div>
				<form id="insert_form"  enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input  class="form-control  text-input" maxlength="50" type="text" value="" name="first_name" required>
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
							<input class="form-control  " maxlength="50" type="text" value="" name="last_name" required>
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<label class="radio-inline"><input type="radio" value="male" class="tog " name="gender" checked>Male</label>
						    <label class="radio-inline"><input type="radio" value="female" class="tog" name="gender">Female</label>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" name="birth_date" id="dateofbarth" class="form-control" placeholder="dd/mm/yyyy"    style="width: 750px;" required readonly>
					            <div class="input-group-addon" >
					              <span class=""></span>
					            </div>
				          	</div>
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
				                <select id="symtomsmulti" name="symptoms[]" multiple class="form-control symptomsoutpatient"
				                    required="required">
				                    
				                </select>
				            </div>
				            <div class="col-sm-2">
				                <button style="margin-left: 40px;" id="addremove" model="operation" class="btn " type="button"
				                    data-toggle="modal" data-target="#BedModal">Add Or Remove</button>
				            </div>
				        </div>	
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
						<div class="col-sm-8">
							<input type="file" class="form-control" name="diagnosis1"accept="application/pdf">
						</div>
					</div>
					<div class="diagnosissnosis_div">
					</div>
					<div class="form-group row" >			
						<div class="col-sm-2 ">
						</div>
						<div class="col-sm-8">
							<input type="button" value="Add More Report" name="add_more_report" class="add_more_report btn btn-default">
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
						<label class="col-sm-2 control-label" >Mobile<span class="require-field">*</span></label>
						<div class="col-sm-1" style="padding-right: 0px;">
						<input type="text" value="+91" class="form-control" name="phonecode" maxlength="5">
						</div>
						<div class="col-sm-7">
							<input class="form-control" min="6" maxlength="15" type="number" value="" name="mobile">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="phone">Phone</label>
						<div class="col-sm-8">
							<input class="form-control" min="6" maxlength="15" type="text" name="phone">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  " maxlength="100" type="email" name="email" required="required">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control" id="txt_username" type="text" name="username" maxlength="30" >
						</div>
						<div style="margin-left: 212px;margin-top: 36px;color: red;">
				    		<span id="available"></span>
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
											onchange="document.getElementById('coveredit1').src = window.URL.createObjectURL(this.files[0])">
							</div>
							
							<div class="form-group row">
						    		<div class="image">
						    			<img id="coveredit1" alt="your image" width="150" height="150" style="margin-left: 290px; margin-top: 10px;" />
						    		</div>
			  					</div>
			  					
						</div>	
													
						<div class="col-sm-offset-2 col-sm-8">
			        	<input type="hidden" name="flag" value="insert">
			        	<input type="hidden" name="count" id="diagnosiscount" value="0">
			        	<input type="submit" value="Patient Registration" id="btnSubmit" name="registration_front_patient" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div id="menu2" class="tab-pane">
			<div style="margin-top: 20px;"></div>
				<form id="update_form" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="first_name" class="form-control" maxlength="50" type="text" value="" name="first_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="middle_name" >Middle Name</label>
						<div class="col-sm-8">
							<input id="middlename" class="form-control validate[custom[onlyLetter_specialcharacter]]" maxlength="50" type="text" value="" name="middle_name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="last_name" class="form-control text-input" maxlength="50" type="text" value="" name="last_name" required>
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
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input id="dob"  type="text" name="birth_date"  class="form-control" placeholder="dd/mm/yyyy" required readonly>
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
						</div>
					</div>		
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="blood_group">Blood Group<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<select id="blood_group" class="form-control " name="blood_group">
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
							<input id="symptoms" class="form-control" type="text" name="symptoms" >
						</div>					
					</div>	
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Diagnosis Report</label>
			    		<div class="col-sm-8">
			      			<input type="file" id="diagnosis" name="diagnosis" accept="application/pdf ">
		      				<span id="experiencecertificateid" hidden></span><a hidden href="#" id="experiencecertificatebuttonid"  target="_blank" class="w3-btn w3-black" >Link Button</a>
			    		</div>
			    	</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="address" class="form-control " type="text" maxlength="150" name="address" value="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="city_name">City<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="homecity" class="form-control " type="text" name="city_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">State</label>
						<div class="col-sm-8">
							<input id="state_name" class="form-control " type="text" name="state_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="state_name">Country</label>
						<div class="col-sm-8">
							<input id="homecountry" class="form-control " type="text" name="country_name" maxlength="50" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="zip_code" class="form-control  " type="text" maxlength="15" name="zip_code" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="mobile">Mobile<span class="require-field">*</span></label>
						<div class="col-sm-1" style="padding-right: 0px;">
						<input type="text" value="+91" class="form-control " name="phonecode" maxlength="5" id="standardcode">
						</div>
						<div class="col-sm-7">
							<input id="mobile" class="form-control  text-input" minlength="6" maxlength="15" type="text" value="" name="mobile">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="phone">Phone</label>
						<div class="col-sm-8">
							<input id="phone" class="form-control  " minlength="6" maxlength="15" type="text" value="" name="phone">				
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="email" class="form-control  text-input" maxlength="100" type="text" name="email" value="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="username" class="form-control " type="text" name="username" maxlength="30" value="">
						</div>
						<div style="margin-left: 212px;margin-top: 36px;color: red;">
				    		<span id="available1"></span>
				    	</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 control-label" for="password">Password<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="password" class="form-control " type="password" name="password" maxlength="12" value="">
						</div>
					</div>
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label control-label" >Image</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"style="background-color: #f1f4f9; " readonly="readonly">
			    		</div>
			    		<div class="col-sm-4">
			    			<span hidden id="profileimageid"></span>
			      			<input id="updateprofileimage" type="file" name="profileimage" accept="image/*" 
								onchange="document.getElementById('coveredit').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="coveredit" alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
						<div class="col-sm-offset-2 col-sm-8">
			        	<input type="hidden" id="editprofileImage" name="editprofileImage">
			    		<input type="hidden" id="editexperienceCertificate" name="editdignosis">
			    		
			    		<input type="hidden" id="patientId" name="Id">
			    		<input type="hidden" id="adminid" name="adminid" >
			    		<input type="hidden" id="patientid" name="patientId" >
			    		<input type="hidden" id="joiningdateid" name="joinig" >
			    		<input type="hidden" name="flag" value="update">
			        	<input type="submit" value="Patient Registration" name="registration_front_patient" class="btn btn-success">
			        </div>
			    </form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>