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
var blank_custom_label ='';
$(document).ready(function(){
	var adminid = $('#adminid').val();
	$('#symptomesadminid').val(adminid);
	console.log(adminid);
	$('.input-group.date').datepicker({format: "dd/mm/yyyy"}); 
	blank_custom_label = $('#custom_label').html();
	$('input[type=radio][name=prescription_type]').on('change', function() {
		var checkbox = $(this).val();
		console.log(checkbox);
		if(checkbox=="treatment"){
			$('#tretment_div').css('display', '');
			$('#prescription_report_div').css('display', 'none');
		}
		if(checkbox=="report"){
			$('#tretment_div').css('display', 'none');
			$('#prescription_report_div').css('display', '');
		}
	});
	$(document).on("click",".add_more_report_fronted",function(){
		console.log("dsaklgdkjla");
		$('#outpatientdignosisadd').append('<div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-3"><input type="file" name="file"></div><div class="col-sm-2"><button type="button" class="btn btn-default" onclick="deletediagnosisreport(this)"><i class="entypo-trash">Delete</i></button></div></div>');
	});
	$('#multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        enableCaseInsensitiveFiltering: true,
        filterPlaceholder: 'Search for something...'
    });
	$(document).on("click",'#add_new_medicine_entry',function() {
		var html = '';
		html += '<div class="form-group"><label class="col-sm-2 control-label" for="medication">Medication<span class="require-field">*</span></label><div class="col-sm-3">';
		html += '<select name="medication[]"  class="form-control medication_class"><option value="" disabled selected hidden="">Select Medicine </option><c:forEach items="${sessionScope.medicineList }" var="q"><option value="${q.id }">${q.medicinename }</option></c:forEach></select></div>';
		html += '<div class="col-sm-1 margin_bottom_5px padding_left_right_15px" style="padding:0px"><select name="times1[]" class="form-control  validate[required]"><option value="" disabled selected hidden="">Frequency</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></div>';
		html += '<div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;"><input id="days" class="form-control validate[required]" type="number" step="1" maxlength="2" min="0" value="" name="days[]" placeholder="No Of"></div>';
		html += '<div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;"><select name="time_period[]" class="form-control validate[required]"><option value="day">Day</option><option value="week">Week</option><option value="month">Month</option><option value="hour">Hour</option></select></div>';
		html += '<div class="col-sm-2 margin_bottom_5px"><select name="takes_time[]" class="form-control validate[required]"><option value="" disabled selected hidden="">When to take</option>	<option value="before_breakfast">Before Breakfast</option><option value="after_meal">After Meal</option><option value="before_meal">Before Meal</option><option value="night">Night </option></select></div>';
		html += '<div class="col-sm-1"><button type="button" class="btn btn-default" onclick="deleteParentElement(this)"><i class="entypo-trash">Delete</i></button></div></div>';
		$('#invoice_medicine_entry').append(html);
	});
	$(document).on("click", "#addremove", function(){
		document.getElementById("exampleModal").style.zIndex = "-1";
		$('#exampleModal').css('display', 'none');
		$('.popup-bg').css('display' , 'block');
  	});
	$("body").on("click", ".close-btn-cat", function(){	
		 document.getElementById("exampleModal").style.zIndex = "";
		 $('#exampleModal').css('display', 'block');
		 $('.popup-bg').hide(); // hide the overlay	
	});
	/* var reportlist = "ReportList";
	$.get('Report', { flag: reportlist , adminId : adminid }, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		$.each(obj, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + obj[index].reportname + '</td>';
			html += '<td>' + obj[index].amount + '</td>';
			html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge badge-delete" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">x</button></td>';
			html += '<td><button type="button" class="btn-edit-cat badge badge-edit" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '"><i class="fas fa-edit" aria-hidden="true"></button></td></tr>';
			$('.report_data').append(html);
		});
	});  */
	
	var symptomslist = "symptomsList";
	$.get('Symptoms', { flag: symptomslist, adminId : adminid }, function(response) {
		var count=0;
		var obj = JSON.parse(response);
		
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
        			$.each(obj, function(index) {
        				count++;
        				var html = '';
        				html += '<tr id=' + count + '>';
        				html += '<td>' + obj[index].name + '</td>';
        				html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td></tr>';
        				$('.symtopslisttable').append(html);
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
    		});
		});
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
        			$.each(obj, function(index) {
        				count++;
        				var html = '';
        				html += '<tr id=' + count + '>';
        				html += '<td>' + obj[index].name + '</td>';
        				html += '<td><button type="button" class="btn-delete-cat badge badge-delete deletesymptomes" data-delete_id="' + count + '" id="symptomsId'+count+'"value="' + obj[index].id + '">x</button></td></tr>';
        				$('.symtopslisttable').append(html);
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
	$('#report_insert_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#report_insert_form')[0];
        var data = new FormData(form);
        $("#insertreport").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Report",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
            	$("#insertreport").prop("disabled", false);
            	var count=0;
        		var obj = JSON.parse(response);
        		$('.report_data').children('tr').remove();
        		$.each(obj, function(index) {
        			count++;
        			var html = '';
        			html += '<tr id=' + count + '>';
        			html += '<td>' + obj[index].reportname + '</td>';
        			html += '<td>' + obj[index].amount + '</td>';
        			html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
        			html += '<td><button type="button" class="btn-delete-cat badge badge-delete" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">x</button></td>';
        			html += '<td><button type="button" class="btn-edit-cat badge badge-edit" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '"><i class="fas fa-edit" aria-hidden="true"></button></td></tr>';
        			$('.report_data').append(html);
        		});
           		$("#report_insert_form")[0].reset();
            },
            error: function (e) {
                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#insertreport").prop("disabled", false);
            }
        });
    });
});
function add_custom_label(){
	$("#custom_label").append('<div class="form-group"><label class="col-sm-2 control-label" for="note">Note</label><div class="col-sm-8"><textarea class="form-control" maxlength="150" name="note[]"> </textarea></div><div class="col-sm-2 margin_bottom_5px"><button type="button" class="btn btn-default" onclick="deleteParentElement(this)"><i class="entypo-trash">Delete</i></button></div></div>');
}
function deleteParentElement(n){
    alert("Do you really want to delete this record");
	n.parentNode.parentNode.parentNode.removeChild(n.parentNode.parentNode);
}
function deletediagnosisreport(n){
    alert("Do you really want to delete this record");
	n.parentNode.parentNode.parentNode.removeChild(n.parentNode.parentNode);
}
</script>
<style type="text/css">

.multiselect-container {
    width: 237px;
    overflow: scroll;
    height: 200px;
    margin-left: -15px;
}
.dropdown-toggle{
   width: 237px !important;
}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
    color: black;
    text-decoration: none;
    background-color: #f1f1f1;
    border: 1px solid #e5e5e5;
    outline: 0;
}
.btn-group>.btn:first-child {
    margin-left: -15px;
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

.badge {
    -webkit-border-radius: 12px!important;
    -moz-border-radius: 12px!important;
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
.pull-right {
    float: right!important;
}
.badge {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color: #777;
    border-radius: 10px;
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
</style>
</head>
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
		<input type="hidden" id="adminid" value="${q.id }">
		 <div class="navbar" style="padding-right: 14px;background-color: white;height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px;font-weight: 600; ">Hospital
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
		
		<!--  -----------------------------------Add new Out Patient-------------------------------------------*  -->
		
		<div class="modal fade outpatiebnt"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		    aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">×</button>
		                <h3 class="modal-title">Add Outpatient</h3>
		            </div>
		            <div class="modal-body">
		                <form name="out_patient_insert_form" class="form-horizontal">
		                    <input type="hidden" name="action" value="MJ_hmgt_save_outpatient_popup_form_template">
		
		                    <div class="header">
		                        <h3 class="first_hed">Personal Information</h3>
		                        <hr>
		                    </div>
		                    <input type="hidden" name="role" value="patient">
		                    <input type="hidden" name="patient_type" value="outpatient">
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="roll_id">Patient Id<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                        	<select name="patient_id" class="form-control">
		                                <option value="" disabled selected hidden="">Select Patient </option>	
										<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
											<option value="${q.id }">${q.patientid } - ${q.firstname }   </option>
										</c:forEach>
		                            </select>   
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="first_name">First
		                            Name<span class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="first_name"
		                                class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input"
		                                maxlength="50" type="text" value="" name="first_name">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="middle_name">Middle
		                            Name</label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="middle_name" class="form-control validate[custom[onlyLetter_specialcharacter]]"
		                                type="text" maxlength="50" value="" name="middle_name">
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="last_name">Last Name<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="last_name"
		                                class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input"
		                                maxlength="50" type="text" value="" name="last_name">
		                        </div>
		                    </div>
		                    <div class="form-group row">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="birth_date">Date of
		                            birth<span class="require-field">*</span></label>
		                         <div class="col-sm-3">   
								<div class="input-group date" data-date-format="dd/mm/yyyy">
					            	<input  type="text"name="birth_date"  class="form-control" placeholder="dd/mm/yyyy" readonly="readonly">
						            <div class="input-group-addon" >
						              <span class=""></span>
						            </div>
					          	</div>
					          	</div>               
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="blood_group">Blood
		                            Group</label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 ">
		
		                            <select id="blood_group" class="form-control" name="blood_group">
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
		
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="gender">Gender<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <label class="radio-inline">
		                                <input type="radio" value="male" class="tog validate[required]" name="gender"
		                                    checked="checked">Male </label>
		                            <label class="radio-inline">
		                                <input type="radio" value="female" class="tog validate[required]" name="gender">Female
		                            </label>
		                        </div>
		                    </div>
		
		                    <div class="header">
		                        <h3>HomeTown Address Information</h3>
		                        <hr>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="address">Home Town
		                            Address<span class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="address"
		                                class="form-control validate[required,custom[address_description_validation]]"
		                                type="text" maxlength="150" name="address" value="">
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="city_name">City<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="city_name"
		                                class="form-control validate[required,custom[city_state_country_validation]]"
		                                type="text" maxlength="50" name="city_name" value="">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">State</label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="state_name" class="form-control validate[custom[city_state_country_validation]]"
		                                type="text" maxlength="50" name="state_name" value="">
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
		                            for="state_name">Country</label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="country_name"
		                                class="form-control validate[custom[city_state_country_validation]]" type="text"
		                                maxlength="50" name="country_name" value="">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="zip_code">Zip Code<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="zip_code" class="form-control validate[required,custom[onlyLetterNumber]]"
		                                type="text" maxlength="15" name="zip_code" value="">
		                        </div>
		                    </div>
		                    <div class="header">
		                        <h3>Contact Information</h3>
		                        <hr>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label  " for="mobile">Mobile
		                            Number<span class="require-field">*</span></label>
		                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 margin_bottom_5px">
		                            <input type="text" value="+91"
		                                class="form-control  validate[required] onlynumber_and_plussign" name="phonecode"
		                                maxlength="5">
		                        </div>
		                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 has-feedback">
		                            <input id="mobile" class="form-control validate[required,custom[phone_number]] text-input"min="6" maxlength="15" type="text" value="" name="mobile">
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="phone">Phone</label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="phone" class="form-control validate[custom[phone_number]] text-input" min="6" maxlength="15" type="text" value="" name="phone">
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
		                            <input id="email" class="form-control validate[required,custom[email]] text-input"
		                                maxlength="100" type="text" name="email" value="">
		                        </div>
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="username">User Name<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="username" class="form-control validate[required,custom[username_validation]]"
		                                maxlength="30" type="text" name="username" value="">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="password">Password<span
		                                class="require-field">*</span></label>
		                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
		                            <input id="password" class="form-control validate[required,minSize[8]]" type="password"
		                                maxlength="12" name="password" value="">
		                        </div>
		                    </div>
		                    <div class="header">
		                        <h3>Other Information</h3>
		                        <hr>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label" for="doctor">Assign Doctor</label>
		                        <div class="col-sm-3 margin_bottom_5px">
		                            <select name="doctor" id="doctor" class="form-control">
		                                <option value="" disabled selected hidden="">Select Doctor </option>	
										<c:forEach items="${sessionScope.doctorlist }" var="q">
											<option value="${q.id }">${q.firstname }</option>
										</c:forEach>
		                            </select>
		                        </div>
		                    </div>
		
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label" for="symptoms">Symptoms<span
		                                class="require-field">*</span></label>
		                        <div class="col-sm-3"style="margin-left: 15px;">
		                        	<select id="symtomsmulti" name="symptoms[]" multiple class="form-control symptomsoutpatient" required="required">
		                                <option value="560">26</option>
		                            </select>
		                            <br>
		                        </div>
		                        <div class="col-sm-2">
		                            <button style="margin-left: 40px;" id="addremove" type="button" class="btn btn-default" >Add Or Remove</button>
		                        </div>
		                    </div>
		
		                    <div class="diagnosissnosis_div">
		                        <div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-3"><input type="file" name="file"></div></div>
		                        <div id="outpatientdignosisadd">
		                        	
		                        </div>
		                        <div class="form-group">
		                            <div class="col-sm-2">
		                            </div>
		                            <div class="col-sm-2">
		                                <input type="button" value="Add More Report" name="add_more_report"class="add_more_report_fronted btn btn-default">
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <label class="col-sm-2 control-label" for="photo">Image</label>
		                            <div class="col-sm-3">
		                                <input type="file" name="file">
		                            </div>
		                        </div>
		
		                        <div class="clearfix"></div>
		
		                        <div class="col-sm-offset-2 col-sm-8">
		                            <div id="upload_user_avatar_preview">
		
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-sm-offset-2 col-sm-8">
		
		                        <input type="submit" value="Save Patient" name="save_outpatient"
		                            class="btn btn-success symptoms_alert" style="    margin-top: 31px;">
		                    </div>
		                </form>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		            </div>
		        </div>
		    </div>
		</div>
		<!--  -----------------------------------Add new Out Patient Exit -------------------------------------------*  -->
		
		<!--  -----------------------------------Add new Sytomes -------------------------------------------*  -->
		
		<div class="popup-bg " style="display: none;z-index: 1050; background:#000000bf ;">
		    <div class="overlay-content overlay_content_css">
		        <div class="modal-content">
		            <div class="notice_content"></div>
		            <div class="category_list">
		                <div class="modal-header"> <a href="#" class="close-btn-cat badge badge-danger pull-right">X</a>
		                    <h4 id="myLargeModalLabel" class="modal-title">Symptoms</h4>
		                </div>
		                <hr>
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
		</div>
		<!--  -----------------------------------Add new Sytomes Exit -------------------------------------------*  -->
		
		<!--  -----------------------------------Add new Report -------------------------------------------*  -->
		<div class="modal fade" id="reportModale" tabindex="-1" role="dialog" aria-labelledby="reportModaleLabel"
		    aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content" style="margin-top: 77px;width: 166%;margin-left: -168px;height: 180px;">
		            <div class="category_list">
		
		                <div class="modal-header"> <a href="#" class="close" data-dismiss="modal" class=" badge-danger pull-right">X</a>
		                    <h4 id="myLargeModalLabel" class="modal-title">Diagnosis Report</h4>
		                </div>
		                <hr>
		                <div class="panel panel-white">
		                    <div class="category_listbox">
		                        <div class="table-responsive" style="min-height: 100%;">
		                            <form name="report_typ_form" action="" method="post" class="form-horizontal"
		                                id="report_typ_form">
		                                <table class="table">
		
		                                    <thead>
		                                        <tr>
		                                            <th>Report Name</th>
		                                            <th>Amount</th>
		                                            <th>Description</th>
		                                            <th>Delete</th>
		                                            <th>Edit</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody style="overflow: scroll;" class="report_data">
		                                    	<tr>
		                                    		<td>dsa</td>
		                                    		<td>dsa</td>
		                                    		<td>ds</dtd>
		                                    		<td>dsa</td>
		                                    		<td>sada</td>
		                                    	</tr>
		                                    </tbody>
		                                </table>
		                            </form>
		                        </div>
		                    </div>
		                    <form id="report_insert_form">
		                        <div class="form-group">
		                            <label class="col-sm-2 control-label">Report Name<span class="require-field">*</span></label>
		                            <div class="col-sm-4 margin_bottom_5px">
		                                <input class="form-control"maxlength="50" type="text" value="" name="report_name">
		                            </div>
		                            <label class="col-sm-1 control-label">Amount<span class="require-field">*</span></label>
		                            <div class="col-sm-3 margin_bottom_5px">
		                                <input id="report_cost" class="form-control"type="number" min="0" onkeypress="if(this.value.length==8) return false;"
		                                    step="0.01" value="" name="report_cost">
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <label class="col-sm-2 control-label" for="medicine_name">Description<span
		                                    class="require-field">*</span></label>
		                            <div class="col-sm-4">
		                                <textarea id="diagno_description" maxlength="50"class="form-control"name="diagno_description"> </textarea>
		                            </div>
		                            <div class="col-sm-2 margin_bottom_5px">
		                                <input type="submit" value="Add" id="insertreport"class="btn btn-success">
		                            </div>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--  -----------------------------------Add new Report exit -------------------------------------------  -->
		
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li style="background-color: f1f4f9;">
					<a href="#home" id="Bloodtab4" data-toggle="tab">
						<i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Prescription List
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu1" id="eventtab1" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true"style="border-radius: 50%; padding: 8px;"></i>Add Prescription
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu2" id="eventtab2" style="display: none;" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Prescription
					</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
				        <thead>
				            <tr>
				            	 <th width="124px;">Title</th>
								 <th width="133.6px;">Comment</th>
								 <th width="114.2px;">Start Date</th>
								 <th width="96.2px;">End Date</th>
								 <th width="173px;">For</th>
								 <th width="140px;">Action</th>
							</tr>
				        </thead>
				        <tbody class="eventlist" >
						</tbody>
						<tfoot>
				            <tr>
				            	 <th width="124px;">Title</th>
								 <th width="133.6px;">Comment</th>
								 <th width="114.2px;">Start Date</th>
								 <th width="96.2px;">End Date</th>
								 <th width="173px;">For</th>
								 <th width="140px;">Action</th>
							</tr>
				        </tfoot>
				   	</table>
			    	<div style="margin-top: 26px;"></div>
   			 </div>
			<div id="menu1" class="tab-pane" style="margin-top: 20px;">
				<form name="prescription_form" action="" method="post" class="form-horizontal" id="prescription_form"><!-- STRT Prescription FORM-->
					<div class="form-group">				
						<label class="col-sm-2 control-label">Doctor<span class="require-field">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<select name="patient_id" class="form-control" id="doctor_id">
								<option value="" disabled selected hidden="">Select Doctor </option>	
								<c:forEach items="${sessionScope.doctorlist }" var="q">
									<option value="${q.id }">${q.firstname }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">				
						<label class="col-sm-2 control-label" for="patient_id">Patient<span class="require-field">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<select name="patient_id" class="form-control" id="patient_id">
							</select>
						</div>
						<div class="col-sm-2">
							<a href="#" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"> Add Outpatient</a>
						</div>
					</div>
					<div class="form-group convert_patient">
					</div>
					<div class="form-group">			
						<label class="col-sm-2 control-label" for="patient_id">Type<span class="require-field">*</span></label>
						<div class="col-sm-8">
												<label class="radio-inline">
							 <input type="radio" value="treatment" class="tog" name="prescription_type"   checked='checked'/>Treatment					</label>
							<label class="radio-inline">
							  <input type="radio" value="report" class="tog" name="prescription_type"  />Report 
							</label>
						</div>
					</div>
					<div id="tretment_div">			
						<div class="form-group">
							<label class="col-sm-2 control-label" for="treatment_id">Treatment<span class="require-field">*</span></label>
							<div class="col-sm-8">
								<select class="form-control" name="treatment_id">
									<option value="" disabled selected hidden="">Select Treatment </option>	
									<c:forEach items="${sessionScope.treatmentList }" var="q">
										<option value="${q.id }">${q.treatmentname }</option>
									</c:forEach>
								</select>
							</div>
						</div>
				
						<div class="form-group">
							<label class="col-sm-2 control-label" for="case_history">Case History<span class="require-field">*</span></label>
							<div class="col-sm-8">
								<textarea id="case_history" maxlength="150" class="form-control validate[required,custom[address_description_validation]]" name="case_history"></textarea>
							</div>
						</div>
	    				<div id="invoice_medicine_entry">
							<div class="form-group">		
								<label class="col-sm-2 control-label" for="medication">Medication<span class="require-field">*</span></label>
								<div class="col-sm-3">
									<select name="medication[]" id="medication_id" class="form-control">
										<option value="" disabled selected hidden="">Select Medicine </option>	
										<c:forEach items="${sessionScope.medicineList }" var="q">
											<option value="${q.id }">${q.medicinename }</option>
										</c:forEach>					
									</select>
								</div>
								<div class="col-sm-1 margin_bottom_5px padding_left_right_15px" style="padding:0px">
									<select name="times1[]" class="form-control validate[required]">
										<option value="" disabled selected hidden="">Frequency</option>	
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>					
									</select>
								</div>
								<div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;">
									<input id="days" class="form-control validate[required]" type="number" step="1" maxlength="2" min="0" value="" name="days[]" placeholder="No Of">
								</div>
								<div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;">
									<select name="time_period[]" class="form-control validate[required]">				
										<option value="day">Day</option>
										<option value="week">Week</option>
										<option value="month">Month</option>
										<option value="hour">Hour</option>
									</select>
								</div>
								<div class="col-sm-2">
									<select name="takes_time[]" class="form-control validate[required]">
										<option value="" disabled selected hidden="">When to take</option>	
										<option value="before_breakfast">Before Breakfast</option>
										<option value="after_meal">After Meal</option>
										<option value="before_meal">Before Meal</option>
										<option value="night">Night </option>
									</select>
								</div>
								<div class="col-sm-1">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="invoice_entry"></label>
							<div class="col-sm-3">				
								<p  id="add_new_medicine_entry" class="btn btn-default btn-sm btn-icon icon-left">
								Add Medicine Data						</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="note">Note</label>
							<div class="col-sm-8">
								<textarea class="form-control" maxlength="150" name="note[]"> </textarea>
							</div>
						</div>
						<div id="custom_label">
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="income_entry"></label>
							<div class="col-sm-3">
								<button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button"   name="add_new_entry" onclick="add_custom_label()">Add More Field</button>
							</div>
						</div>
					</div>
					<div id="prescription_report_div"  style="display: none">			
						<div class="form-group">
						<label class="col-sm-2 control-label" for="patient">Report Type<span class="require-field">*</span></label>
						<div class="col-sm-8 ">
							<div class="col-sm-3">
							<select id="multiselect" name="report_type[]" multiple class="form-control" required="required">
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
						<div class="col-sm-2"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#reportModale">Add Or Remove</button></div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Report Description<span class="require-field">*</span></label>
							<div class="col-sm-8">
								<textarea id="" maxlength="150" class="form-control" name="report_description"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label " for="enable">Doctor Visiting Charge</label>
							<div class="col-sm-8">
								 <div class="checkbox">
									<label>
										<input id="doctor_visiting_charge" type="checkbox" value="1" name="doctor_visiting_charge">
									</label>
								</div>				 
							</div>
						</div>
						<input type="hidden" id="_wpnonce" name="_wpnonce" value="9461173855"><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=prescription&amp;tab=addprescription&amp;action=insert">				<div class="form-group">
							<label class="col-sm-2 control-label " for="enable">Doctor Consulting Charge</label>
							<div class="col-sm-8">
								 <div class="checkbox">
									<label>
										<input id="doctor_consulting_charge" type="checkbox" value="1" name="doctor_consulting_charge" checked>
									</label>
								</div>				 
							</div>
						</div>
					</div>
				<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px; margin-left: 180px;">
					<input type="submit" value="Create Prescription" name="save_prescription" class="btn btn-success"/>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>