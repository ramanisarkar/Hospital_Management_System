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
<script src="js/Common_Outpatient_Pop.js"></script>

<script>
$(document).ready(function(){
	var adminid = $('#adminid').val();
	$('#symptomesadminid').val(adminid);
	var symptomslist = "symptomsList";
	$.get('Symptoms', { flag: symptomslist, adminId : adminid }, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		var select = $('.symptomsoutpatient');
		select.find('option').remove();
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].name + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td></tr>';
			$('.symtopslisttable').append(html);
			$('<option>').val(obj[index].name).text(obj[index].name).appendTo(select);
		});
		
		$('#symtomsmulti').multiselect({
	        includeSelectAllOption: true,
	    });
		$('.multiselect-selected-text').text("Select Option");
	});
	
	$('#systomes_insert_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#systomes_insert_form')[0];
        var data = new FormData(form);
		console.log(form);
        $("#btn-insert-symptoms").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Symptoms",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
        		$.get('Symptoms', { flag: symptomslist, adminId : adminid }, function(response) {
        			var count=0;
        			var obj = JSON.parse(response);
        			$('.symtopslisttable').children('tr').remove();
        			var select = $('.symptomsoutpatient');
        			$('#symtomsmulti').multiselect('destroy');
        			select.find('option').remove();
        			
        			$.each(obj, function(index) {
        				count++;
        				var html = '';
        				html += '<tr id=' + count + '>';
        				html += '<td>' + obj[index].name + '</td>';
        				html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td></tr>';
        				$('.symtopslisttable').append(html);
        				$('<option>').val(obj[index].name).text(obj[index].name).appendTo(select);
        			});
        			$('#symtomsmulti').multiselect({
        		        includeSelectAllOption: true,
        		    });
        		});
           		$("#systomes_insert_form")[0].reset();
           		$("#btn-insert-symptoms").prop("disabled", false);
            },
            error: function (e) {
                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btn-insert-symptoms").prop("disabled", false);
            }
        });
    });
	
	$(document).on('click', '.deletesymptomes', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var symptomes = $('#symptomsId'+deleteid).val();
		var username = "symptomsDelete";
		$.get('Symptoms',{flag:username , symptomsId:symptomes},function(response){
			$.get('Symptoms', { flag: symptomslist, adminId : adminid }, function(response) {
    			var count=0;
    			var obj = JSON.parse(response);
    			$('.symtopslisttable').children('tr').remove();
    			$.each(obj, function(index) {
    				count++;
    				var html = '';
    				html += '<tr id=' + count + '>';
    				html += '<td>' + obj[index].name + '</td>';
    				html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td>';
    				$('.symtopslisttable').append(html);
    			});
    			var select = $('.symptomsoutpatient');
    			$('#symtomsmulti').multiselect('destroy');
    			select.find('option').remove();
    			$.each(obj, function(index, value) {
    				$('<option>').val(obj[index].name).text(obj[index].name).appendTo(select);
    			});
    			$('#symtomsmulti').multiselect({
    		        includeSelectAllOption: true,
    		    });
    		});
		});
	});
	
	$.get('OperationManagement', { flag: "operationList" }, function(response) {
		var obj = JSON.parse(response);
		var count=0;
		var select = $('.operationSelect');
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].Name + '</td>';
			html += '<td>' + obj[index].price + '</td>';
			html += '<td style="word-break: break-all;">' + obj[index].discription + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge operationdelete" data-delete_id="' + count + '" id="operationAddId'+count+'" value="'+obj[index].id+'">X</button></td>';
			html += '<td><button type="button" class="btn-edit-cat badge operationedit" data-edit_id="' + count + '" id="operationAddId'+count+'" value="'+obj[index].id+'"><i class="fa fa-edit" aria-hidden="true"></button></td></tr>';
			$('.opereationAddList').append(html);
			$('<option>').val(obj[index].id).text(obj[index].Name).appendTo(select);
		});
	});
	
	$('.operationSelect').on('change' , function(){
		var operationId = $(this).val();
		console.log(operationId);
		$.get('OperationManagement', { flag :"operationPrice" , operationId :operationId}, function(response) {
			var obj = JSON.parse(response);
			$('#operation_charge').val(obj[0].price);
		});
	});
	
	$('#multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        enableCaseInsensitiveFiltering: true,
        filterPlaceholder: 'Search for something...'
    });
	
	$('.operation_status').on('change' , function(){
		var operation = $(this).val();
		if(operation == "Completed"){
			$('.out_come_status').css("display", "block");
		}
		else {
			$('.out_come_status').css("display", "none");
		}
	});
	
	$(document).on('change', '#bed_type_id', function(){
		var bedId = $(this).val();
		var listBedNumber = "listBednumber";
		$.get('BadMenegement',{flag:listBedNumber , bedId : bedId},function(response){
			var bedNumberList = JSON.parse(response);
			var select = $('#insert_bed_number');
    	   	$.each(bedNumberList, function(index, value) {
    	   		$('<option>').val(bedNumberList[index].addbedid).text(bedNumberList[index].bednumber).appendTo(select);
    		});
		});
	});
	
	$('.input-group.date').datepicker({format: "dd/mm/yyyy",singleDatePicker: true,
	    showDropdowns: true,
	    minYear: 1901,
	    maxYear: parseInt(0)
	});
	
	$('#Operation_Add_insert').on('submit' , function(){
	    event.preventDefault();
	    var form = $('#Operation_Add_insert')[0];
	    var data = new FormData(form);
	    $("#btn-add-cat-operation").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "OperationManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response){
	        	$("#btn-add-cat-operation").prop("disabled", false);
	        	var count=0;
	    		var obj = JSON.parse(response);
	    		$('.opereationAddList').children('tr').remove();
	    		var select = $('.operationSelect');
				select.find('option').remove();
				$('<option disabled selected hidden="">').val("").text("Select Opration").appendTo(select);
	    		$.each(obj, function(index) {
	    			count++;
	    			var html = '';
	    			html += '<tr id=' + count + '>';
	    			html += '<td>' + obj[index].Name + '</td>';
	    			html += '<td>' + obj[index].price + '</td>';
	    			html += '<td style="word-break: break-all;">' + obj[index].discription + '</td>';
	    			html += '<td><button type="button" class="btn-delete-cat badge operationdelete" data-delete_id="' + count + '" id="operationAddId'+count+'" value="'+obj[index].id+'">X</button></td>';
	    			html += '<td><button type="button" class="btn-edit-cat badge operationedit" data-edit_id="' + count + '" id="operationAddId'+count+'" value="'+obj[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
	    			$('.opereationAddList').append(html);
	    			$('<option>').val(obj[index].id).text(obj[index].Name).appendTo(select);
	    		});
	       		$("#Operation_Add_insert")[0].reset();
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	            $("#btn-add-cat-operation").prop("disabled", false);
	        }
	    });
	});
	
	$.get('OperationManagement', { flag: "operationApplyList" }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		var count=0;
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].Name + '</td>';
			html += '<td>' + obj[index].patientName + '</td>';
			html += '<td style="word-break: break-all;">' + obj[index].field2 + '</td>';
			html += '<td>' + obj[index].date + '</td>';
			html += '<td>' + obj[index].price + '</td>';
			html += '<td>' + obj[index].field1 + '</td>';
			html += '<td >' + obj[index].title + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.oprationTableList').append(html);
		});
		$('#oprationtable').DataTable();
	});
	
	$('#operation_insert_form').on('submit' , function(){
	    event.preventDefault();
	    var form = $('#operation_insert_form')[0];
	    var data = new FormData(form);
	    $("#btn-cat-operation").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "OperationManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response){
	        	$("#btn-cat-operation").prop("disabled", false);
	        	var count=0;
	    		var obj = JSON.parse(response);
	    		console.log(response);
	    		table = $('#oprationtable').DataTable();
				table.destroy();
	    		$('.oprationTableList').children('tr').remove();
	    		$.each(obj, function(index) {
	    			count++;
	    			var html = '';
	    			html += '<tr id=' + count + '>';
	    			html += '<td>' + obj[index].Name + '</td>';
	    			html += '<td>' + obj[index].patientName + '</td>';
	    			html += '<td style="word-break: break-all;">' + obj[index].field2 + '</td>';
	    			html += '<td>' + obj[index].date + '</td>';
	    			html += '<td>' + obj[index].price + '</td>';
	    			html += '<td>' + obj[index].field1 + '</td>';
	    			html += '<td >' + obj[index].title + '</td>';
	    			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
	    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
	    			$('.oprationTableList').append(html);
	    		});
	       		var message = obj[0].field3;
				console.log(message)
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#operation_insert_form")[0].reset();
					$('#oprationtable').DataTable();
				}
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	            $("#btn-cat-operation").prop("disabled", false);
	        }
	    });
	});
});
</script>
<style type="text/css">


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
.text{

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

#oprationtable_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#oprationtable_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;
}
.modal.fade.in {
   background: #000000bf;
 }
 .popup-bg {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    cursor: pointer;
    z-index: 1000;
    background: #000;
    background: rgba(0,0,0,0.35);
}
.overlay-content {
    background: #ffffff none repeat scroll 0 0;
    border-radius: 4px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.9);
    cursor: default;
    float: left;
    left: 34%;
    margin: 0 0 0 -13%;
    padding: 10px 10px 10px;
    position: fixed;
    top: 6%;
    width: 60%;
}

.modal-content {
    -webkit-box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    -moz-box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    border: 0;
    border-radius: 0;
}

.pull-right {
    float: right!important;
}
.badge {
    display: inline-block;
    min-width: 21px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 100;
    line-height: 1.3;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color: red;
    border-radius: 13px;
    border: none;
}
.pull-right {
    float: right;
}
.modal-title {
    margin: 0;
    line-height: 1.42857143;
}.panel-white {
    background: #fff;
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
.input-group-addon {
	padding: 0px !important;
    background-color: white !important;
    border: none!important;
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
	</c:forEach>
	<div id="message2" style="margin-top: 67px;" hidden=""></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%; background-color: white;">
	    <div style="color: green; margin-top: 3px;" id="specializationadd"></div>
	    <div style="padding-top: 15px;"></div>
	    <div class="conmmonpoppop"></div>
<!-- 	-------------------------------Start Add Opreation--------------------------------------------     -->
                <div class="modal fade" id="opreationAdd" tabindex="-1" role="dialog" aria-labelledby="opreationAddLabel"aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content" style="height: 460px;">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">×</button>
		                <h3 class="modal-title">Operation</h3>
		            </div>
		            
		            <div class="modal-body" style="background: #fff;height: 265px;">
		                <div class="category_listbox">
		                    <div class="table-responsive" style="min-height: 100%;">
		                        <form name="report_typ_form" action="" method="post" class="form-horizontal"id="report_typ_form">
		                            <table class="table">
		                                <thead>
		                                    <tr>
		                                        <th>Operation Name</th>
		                                        <th>Amount</th>
		                                        <th>Description</th>
		                                        <th>Delete</th>
		                                        <th>Edit</th>
		                                    </tr>
		                                </thead>
		                                <tbody class="opereationAddList">
		                                </tbody>
		                            </table>
		                        </form>
		                    </div>
		                </div>
		            </div>
		            <div class="insertform">
		            <form class="form-horizontal" id="Operation_Add_insert">
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Operation Name<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4 margin_bottom_5px">
		                        <input class="form-control text-input"maxlength="50" type="text" value="" name="operationName" required>
		                    </div>
		                    <label class="col-sm-1 control-label" for="medicine_name">Amount<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-3 margin_bottom_5px">
		                        <input class="form-control text-input" type="number" min="0" onkeypress="if(this.value.length==8) return false;" step="0.01" name="operation_cost" required>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label" for="medicine_name">Description<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4">
		                        <textarea id="diagno_description" maxlength="40"class="form-control"name="operation_description"required> </textarea>
		                    </div>
		                    <div class="col-sm-2 margin_bottom_5px">
		                    	<input type="hidden" name="flag" value="insertOperation">
		                        <input type="submit" value="Add" class="btn btn-success" id="btn-add-cat-operation">
		                    </div>
		                </div>
		            </form>
		            </div>
		            <div class="editform" style="display: none;" >
		            	<form class="form-horizontal" id="Priscription_report_update">
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Operation Name<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4 margin_bottom_5px">
		                        <input id="editReportname" class="form-control text-input"maxlength="50" type="text" value="" name="reportname" required>
		                    </div>
		                    <label class="col-sm-1 control-label" for="medicine_name">Amount<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-3 margin_bottom_5px">
		                        <input id="editAmount" class="form-control text-input" type="number" min="0" onkeypress="if(this.value.length==8) return false;" step="0.01" name="report_cost" required>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label" for="medicine_name">Description<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4">
		                        <textarea id="editDescription" maxlength="40"class="form-control"name="diagno_description"required> </textarea>
		                    </div>
		                    <div class="col-sm-2 margin_bottom_5px">
		                    	<input type="hidden" name="adminid" id="priscriptadminidreportup">
		                    	<input type="hidden" name="flag" value="priscriptionReportUpdate">
		                    	<input type="hidden" name="id" id="reportid">
		                    	<input type="hidden" name="joining" id="joining">
		                        <input type="submit" value="Update" class="btn btn-success" id="btn-update-cat-report">
		                    </div>
		                </div>
		            </form>
		            </div>
		        </div>
		    </div>
		</div>
<!-- 	-------------------------------end Opreation--------------------------------------------     -->
<!-- ----------------------------------Add bed ----------------------------------------------------- -->
	<div class="modal fade" id="BedModal" tabindex="-1" role="dialog" aria-labelledby="BedModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="height: 427px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>

                    <h3 class="modal-title">Add Bed</h3>
                </div>

                <div class="modal-body">

                    <form style="margin-top: 15px;">
                        <div class="form-group row">
                            <label class="col-sm-2 control-label" for="bed_type_id">Select Bed Type<span
                                    class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <select name="bed_type_id" class="form-control validate[required]" id="bed_type_id">
                                    <option value="">Bed type</option>
                                    <option value="33">General</option>
                                    <option value="34">ICU</option>
                                    <option value="35">Special</option>
                                    <option value="338">test bed</option>
                                    <option value="55">very spec</option>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <button model="report_type" class="btn " type="button"
                                    data-toggle="modal" data-target="#BedModal1">Add Or Remove</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2" for="bed_type_id">Bed Number<span
                                    class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="Bed" class="form-control" type="number" min="0"
                                    onkeypress="if(this.value.length==8) return false;" step="0.01"
                                    name="visiting_fees">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2" for="bed_type_id">Charges($)<span
                                    class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="Bed" class="form-control" type="number" min="0"
                                    onkeypress="if(this.value.length==8) return false;" step="0.01"
                                    name="visiting_fees">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2" for="bed_type_id">Location<span
                                    class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <textarea id="Bad_history" maxlength="150"
                                    class="form-control validate[required,custom[address_description_validation]]"
                                    name="case_history"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2" for="bed_type_id">Description<span
                                    class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <textarea id="Bad_history" maxlength="150"
                                    class="form-control validate[required,custom[address_description_validation]]"
                                    name="case_history"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="submit" value="Save" name="save_Bed" class="btn btn-success">
                        </div>
                    </form>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"
                            style="    margin-top: -11px;">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="BedModal1" tabindex="-1" role="dialog" aria-labelledby="BedModalLabel1" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">×</button>
	
	                <h3 class="modal-title">Add Bed</h3>
	            </div>
	            <div class="modal-body">
	                <div class="category_listbox">
	                    <div class="table-responsive" style="min-height: 100%;">
	                        <form name="report_typ_form" action="" method="post" class="form-horizontal"
	                            id="report_typ_form">
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
	                                <tbody>
	                                    <tr id="cat-543">
	                                        <td> icu </td>
	                                        <td>1000</td>
	                                        <td> sudhguiyagd87yagd9uashduoasuoidhasuodouasduoasdou</td>
	                                        <td id="543"> <a class="btn-delete-cat badge badge-delete" model="report_type"
	                                                href="#" id="543"> X </a></td>
	                                        <td id="543"> <a class="btn-edit-cat badge badge-edit" model="report_type"
	                                                href="#" id="543"> <i class="fa fa-pencil-square-o" aria -
	                                                    hidden="true">
	                                                </i></a> </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </form>
	                    </div>
	                </div>
	            </div>
	            <form name="medicinecat_form" action="" method="post" class="form-horizontal" id="medicinecat_form">
	                <div class="form-group">
	                    <label class="col-sm-2 control-label" for="medicine_name">Bed Type<span
	                            class="require-field">*</span></label>
	                    <div class="col-sm-4 margin_bottom_5px">
	                        <select name="bed_type_id" class="form-control validate[required]" id="bed_type_id">
	                            <option value="">Bed type</option>
	                            <option value="33">General</option>
	                            <option value="34">ICU</option>
	                            <option value="35">Special</option>
	                            <option value="338">test bed</option>
	                            <option value="55">very spec</option>
	                        </select>
	                    </div>
	
	                    <label class="col-sm-1 control-label" for="medicine_name">Charge<span
	                            class="require-field">*</span></label>
	                    <div class="col-sm-3 margin_bottom_5px">
	                        <input id="report_cost" class="form-control  text-input validate[required]" type="number"
	                            min="0" onkeypress="if(this.value.length==8) return false;" step="0.01" value=""
	                            name="report_cost">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-2 control-label" for="medicine_name">Location<span
	                            class="require-field">*</span></label>
	                    <div class="col-sm-4">
	                        <input id="report_cost" class="form-control  text-input validate[required]" type="text" min="0"
	                            onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="report_cost">
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
<!-- -----------------------------------End Bed------------------------------------------------------ -->
	    <div class="container" style="margin-right: 90px;">
	        <ul class="nav nav-tabs tabcalss">
	            <li style="background-color: f1f4f9;">
	                <a href="#home" id="Bloodtab4" data-toggle="tab">
	                    <i class="fa fa-bars" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Operation list
	                </a>
	            </li>
	            <li style="margin-left: 15px; background-color: f1f4f9;">
	                <a href="#menu1" id="eventtab1" data-toggle="tab">
	                    <i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add
                    Operation </a>
	            </li>
	            <li style="margin-left: 15px; background-color: f1f4f9;">
	                <a href="#menu2" id="eventtab2" style="display: none;" data-toggle="tab">
	                    <i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
                    Operation </a>
	            </li>
	        </ul>
	        <div class="tab-content">
	            <div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
	                <table id="oprationtable" class="display table table-striped table-hover" style="width:100%">
	                    <thead>
	                        <tr>
	                            <th style="padding-left: 15px;"> Operation Name</th>
	                            <th style="padding-left: 15px;">Patient</th>
	                            <th style="padding-left: 15px;">Surgeon</th>
	                            <th style="padding-left: 15px;">Date</th>
	                            <th style="padding-left: 15px;">Operation Charge<span>(&#x20B9;)</span> </th>
	                            <th style="padding-left: 15px;">Operation Status</th>
	                            <th style="padding-left: 15px;">Out Come Status</th>
	                            <th style="padding-left: 15px;">Actiion</th>
	
	                        </tr>
	                    </thead>
	                    <tbody class="oprationTableList">
	                    </tbody>
	                    <tfoot>
	                        <tr>
	                            <th style="padding-left: 15px;"> Operation Name</th>
	                            <th style="padding-left: 15px;">Patient</th>
	                            <th style="padding-left: 15px;">Surgeon</th>
	                            <th style="padding-left: 15px;">Date</th>
	                            <th style="padding-left: 15px;">Operation Charge<span>(&#x20B9;)</span> </th>
	                            <th style="padding-left: 15px;">Operation Status</th>
	                            <th style="padding-left: 15px;">Out Come Status</th>
	                            <th style="padding-left: 15px;">Actiion</th>
	                        </tr>
	                    </tfoot>
	                </table>
	                <div style="margin-top: 26px;"></div>
	            </div>
				<div id="menu1" class="tab-pane"style="margin-top: 20px;">
	                <form name="operation_form" action="" method="post" class="form-horizontal" id="operation_insert_form">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient">Patient<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	
	                            <select name="patient_id" id="patient" class="form-control"required>
	                                <option value="" disabled selected hidden="">Select Patient </option>	
									<c:forEach items="${sessionScope.patientList }" var="q">
										<option value="${q.id }">${q.patientregistrationid.patientid } - ${q.patientregistrationid.firstname }</option>
									</c:forEach>
	                            </select>
	                        </div>
	                        <div class="col-sm-2">
	
	                            <a href="#" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"> Add Outpatient</a>
	
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="patient_status">Patient Status<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="patient_status" class="form-control"required>
	                                <option value="" disabled selected hidden="">Select Patient Status</option>
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
	                        <label class="col-sm-2 control-label" for="patient">Operation<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8 margin_bottom_5px">
	                            <select name="operation_title" class="form-control operationSelect"required>
	                                <option value="" disabled selected hidden="">Select Operation</option>	
	                            </select>
	                        </div>
	                        <div class="col-sm-2"><a href="#" class="btn btn-default" class="btn " type="button" data-toggle="modal"
	                                data-target="#opreationAdd">Add Or Remove</a></div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="doctor">Select Doctor<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8 multiselect_validation_doctor">
	                            <select name="doctor[]" class="form-control " multiple="multiple"
	                                id="multiselect" required>
	                                <option value="" disabled selected hidden="">Select Doctor </option>
									<c:forEach items="${sessionScope.doctorList }" var="q">
										<option value="${q.id }">${q.firstname } - ${q.specializationid.specialization }</option>
									</c:forEach>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bedtype">Bed Category<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_type_id" class="form-control" id="bed_type_id"required>
	                                <option value="" disabled selected hidden="">Select Bed </option>
									<c:forEach items="${sessionScope.bedList }" var="q">
										<option value="${q.id }">${q.bedtype}</option>
									</c:forEach>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="bednumber">Bed Number<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="bed_number" class="form-control" id="insert_bed_number"required>
	                                <option value="" disabled selected hidden="">Select Bed Number</option>
	                            </select>
	                        </div>
	                        <div class="col-sm-2">
	
	                            <a href="#" class="btn btn-default" class="btn " type="button" data-toggle="modal"
	                                data-target="#BedModal"> Add Bed</a>
	
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="request_date">Operation Date<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
								<div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text" name="OperationDate" class="form-control" placeholder="dd/mm/yyyy"    style="width: 750px;" required readonly>
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
					          	</div>
							</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="operation_time">Operation Time</label>
	                        <div class="col-sm-8">
	                            <input type="time" id="insert_operation_time" class="form-control" name="insert_operation_time">
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="ot_description">Description<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <textarea id="ot_description"class="form-control "maxlength="150" name="ot_description"required></textarea>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="operation_charge">Total Opearation Charge ($)<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <input id="operation_charge" class="form-control" min="0" type="number"
	                                onkeypress="if(this.value.length==10) return false;" step="0.01" value=""
	                                name="operation_charge" readonly="">
	                        </div>
	                    </div>
	                    <div class="form-group margin_bottom_5px">
	                        <label class="col-sm-2 control-label" for="patient_status">Operation Status<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-8">
	                            <select name="operation_status" class="form-control operation_status"required>
	                                <option value="" disabled selected hidden="">Select Operation Status</option>	
	                                <option value="Inprogress">
	                                    Inprogress</option>
	                                <option value="Completed">
	                                    Completed</option>
	                                <option value="Scheduled">
	                                    Scheduled</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="form-group out_come_status" style="display: none;">
	                        <label class="col-sm-2 control-label" for="hmgt_currency_code">Out Come Status</label>
	                        <div class="col-sm-8">
	                            <select name="out_come_status" class="form-control text-input">
	                                <option value="Success">
	                                    Success</option>
	                                <option value="Fail">
	                                    Fail</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8 doctor_submit" style="margin-bottom: 15px;">
	                    	<input type="hidden" name="flag" value="insertOperationApply">
	                        <input type="submit" value="Save" name="save_operation" id="btn-cat-operation" class="btn btn-success">
	                    </div>
	                </form>
	            </div>
	            
	            <div id="menu2" class="tab-pane" style="margin-top: 15px;">
	                <form id="update_Event_Form">
	                    <div class="form-group row">
	                        <label class="col-sm-2 control-label text">Event/Notice<span
	                                style="color: red;">*</span></label>
	                        <div class="col-sm-8 margin_bottom_5px">
	                            <select class="form-control" id="eventname" name="event">
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
	                            <textarea name="eventcommnet" id="comment" class="form-control"></textarea>
	                        </div>
	                    </div>
	                    <div class="form-group row">
	                        <label class="col-sm-2 col-form-label text">Start Date<span style="color: red;">*</span></label>
	                        <div class="col-sm-8 ">
	                            <div class="input-group date" data-date-format="dd/mm/yyyy">
	                                <input type="text" id="startdate" name="startdate" class="form-control"
	                                    placeholder="dd/mm/yyyy" required>
	                                <div class="input-group-addon">
	                                    <span class="glyphicon glyphicon-th"></span>
	                                </div>
	                            </div>
	                            <div class="input-group date" data-date-format="dd/mm/yyyy">
	                                <input type="text" id="startdate" name="startdate" class="form-control"
	                                    placeholder="dd/mm/yyyy" style="width: 750px;" required readonly>
	                                <div class="input-group-addon">
	                                    <span class=""></span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group row">
	                        <label class="col-sm-2 col-form-label text">End Date<span style="color: red;">*</span></label>
	                        <div class="col-sm-8 ">
	                            <div class="input-group date" data-date-format="dd/mm/yyyy">
	                                <input type="text" id="enddate" name="eventenddate" class="form-control"
	                                    placeholder="dd/mm/yyyy" style="width: 750px;" required readonly>
	                                <div class="input-group-addon">
	                                    <span class=""></span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group row">
	                        <label class="col-sm-2 col-form-label text">Event For<span style="color: red;">*</span></label>
	                        <div class="col-sm-8 ">
	                            <select id="editevent" name="eventfor[]" multiple class="col-sm-8 form-control">
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
	                        <input type="submit" value="Update" id="updateevent" class="btn btn-success"
	                            style="margin-bottom: 15px; margin-right: 15px;">
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>