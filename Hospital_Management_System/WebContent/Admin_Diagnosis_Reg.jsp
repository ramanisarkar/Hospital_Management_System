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
	$('#priscriptadminidreport').val(adminid);
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
	
	$('#Priscription_report_insert').on('submit' , function(){
	    event.preventDefault();
	    var form = $('#Priscription_report_insert')[0];
	    var data = new FormData(form);
	    $("#btn-add-cat-report").prop("disabled", true);
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
	        	$("#btn-add-cat-report").prop("disabled", false);
	        	var count=0;
	    		var obj = JSON.parse(response);
	    		$('.priscriptionreportdate').children('tr').remove();
	    		$.each(obj, function(index) {
	    			count++;
	    			var html = '';
	    			html += '<tr id=' + count + '>';
	    			html += '<td>' + obj[index].reportname + '</td>';
	    			html += '<td>' + obj[index].amount + '</td>';
	    			html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
	    			html += '<td><button type="button" class="btn-delete-cat badge priscriptionreportdelete" data-delete_id="' + count + '" id="prescriptreportId'+count+'" value="'+obj[index].id+'">X</button></td>';
	    			html += '<td><button type="button" class="btn-edit-cat badge priscriptionreportedit" data-edit_id="' + count + '" id="prescriptreportId'+count+'" value="'+obj[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
	    			$('.priscriptionreportdate').append(html);
	    		});
	    		var select = $('.priscriptionreportmulti');
				$('#multiselect').multiselect('destroy');
				select.find('option').remove();
				$.each(obj, function(index, value) {
					$('<option>').val(obj[index].id).text(obj[index].reportname).appendTo(select);
				});
				$('#multiselect').multiselect({
			        includeSelectAllOption: true,
			        enableFiltering: true,
			        enableCaseInsensitiveFiltering: true,
			        filterPlaceholder: 'Search for something...'
			    });
	       		$("#Priscription_report_insert")[0].reset();
	        },
	        error: function (e) {
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#btn-add-cat-report").prop("disabled", false);
	        }
	    });
	});
	var reportList;
	$.get('Report', { flag: "ReportList", adminId : adminid }, function(response) {
		var count=0;
		reportList = JSON.parse(response)
		console.log(reportList);
		$.each(reportList, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td>' + reportList[index].reportname + '</td>';
			html += '<td>' + reportList[index].amount + '</td>';
			html += '<td style="word-break: break-all;">' + reportList[index].description + '</td>';
			html += '<td><button type="button" class="btn-delete-cat badge priscriptionreportdelete" data-delete_id="' + count + '" id="prescriptreportId'+count+'" value="'+reportList[index].id+'">X</button></td>';
			html += '<td><button type="button" class="btn-edit-cat badge priscriptionreportedit" data-edit_id="' + count + '" id="prescriptreportId'+count+'" value="'+reportList[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
			$('.priscriptionreportdate').append(html);
		});
		var select = $('.priscriptionreportmulti');
		select.find('option').remove();
		$.each(reportList, function(index, value) {
			$('<option>').val(reportList[index].id).text(reportList[index].reportname).appendTo(select);
		});
		$('#multiselect').multiselect({
	        includeSelectAllOption: true,
	        enableFiltering: true,
	        enableCaseInsensitiveFiltering: true,
	        filterPlaceholder: 'Search for something...'
	    });
	});
	
	$(document).on('click', '.priscriptionreportdelete', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var report = $("#prescriptreportId"+deleteid).val();
		console.log(report);
		var username = "reportdelete";
		$.get('Report',{flag:username , reportId:report , adminId : adminid },function(response){
			$(".priscriptionreportdelete").prop("disabled", false);
	    	var count=0;
			var obj = JSON.parse(response);
			$('.priscriptionreportdate').children('tr').remove();
			$.each(obj, function(index) {
				count++;
				var html = '';
				html += '<tr id=' + count + '>';
				html += '<td>' + obj[index].reportname + '</td>';
				html += '<td>' + obj[index].amount + '</td>';
				html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
				html += '<td><button type="button" class="btn-delete-cat badge priscriptionreportdelete" data-delete_id="' + count + '" id="prescriptreportId'+count+'" value="'+obj[index].id+'">X</button></td>';
				html += '<td><button type="button" class="btn-edit-cat badge priscriptionreportedit" data-edit_id="' + count + '" id="prescriptreportId'+count+'" value="'+obj[index].id+'"><i class="fa fa-pencil-square-o" aria-hidden="true"></button></td></tr>';
				$('.priscriptionreportdate').append(html);
			});
			var select = $('.priscriptionreportmulti');
			$('#multiselect').multiselect('destroy');
			select.find('option').remove();
			$.each(obj, function(index, value) {
				$('<option>').val(obj[index].id).text(obj[index].reportname).appendTo(select);
			});
			$('#multiselect').multiselect({
		        includeSelectAllOption: true,
		        enableFiltering: true,
		        enableCaseInsensitiveFiltering: true,
		        filterPlaceholder: 'Search for something...'
		    });
		});
	});
	
	$(document).on('click', '.priscriptionreportedit', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var report = $("#prescriptreportId"+editid).val();
		console.log(report);
		var username = "reportEdit";
		$.get('Report',{flag:username , reportId:report},function(response){
			var obj = JSON.parse(response);
			console.log(response);
			$('.editform').show();
			$('.insertform').hide();
			var s = obj[0].adminid;
			console.log(s);
			var sd = obj[0].adminid.id;
			console.log(sd);
			$('#editReportname').val(obj[0].reportname);
			$('#editAmount').val(obj[0].amount);
			$('#editDescription').val(obj[0].description);
			$('#joining').val(obj[0].joiningdate);
			$('#reportid').val(obj[0].id);
		});
	});
	
	$('.priscriptionreportmulti').on('change' , function(){
		var operation = $(this).val();
		console.log(operation);
		$('.insert_manu_dignosis').css('display','block');
		if(operation.length === 0){
			$('.insert_manu_dignosis').css('display','none');
		}
		var count = 0;
		var total = 0; 
	 	$('.add_document_div_main_class').empty();
		$.each(operation, function(i, v)  {
			$.each(reportList, function(index, value)  {
				if(operation[i] == reportList[index].id){
					var html = '';
			        html +='<div class="form-group"><div class="col-sm-offset-2 col-sm-2">';
			    	html +='<input type="hidden" name="report_id[]" value="'+reportList[index].id+'"><input type="text" class="form-control fronted_file report_name" style="text-align: center;"value="'+ reportList[index].reportname +'"name="report_name[]" readonly></div>';
					html +='<div class="col-sm-3"><input type="file" class="form-control fronted_file document" style="text-align: center;"name="document'+count+'"></div>';	    
			        html +='<div class="col-sm-2"><input type="text" class="form-control fronted_file diagnosis_total_amount" style="text-align: center;"value="'+ reportList[index].amount +'" name="diagnosis_total_amount[]" readonly>';
			        html +='</div></div>';
			        total = total + reportList[index].amount;
			        $('.add_document_div_main_class').append(html);
				}
			});
			count++;
		});
		$('#count_digosisreport').val(count);
		$('#report_cost').val(total);
	});
	
	$('#diagnosis_insert_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#diagnosis_insert_form')[0];
        var data = new FormData(form);
		console.log(form);
        $("#btn-insert-diagnosis").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "DiagnosisReport",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
            },
            error: function (e) {
                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btn-insert-diagnosis").prop("disabled", false);
            }
        });
    });
});
</script>
<style>
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
}
table.dataTable thead .sorting_asc:after {
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
.upload_document_text_align{
	text-align: center !important;
}
</style>
</head>
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;font-size: 13px;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0"> 
	<input type="hidden" id="adminid" value="${q.id }">
		 <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="    margin-top: -8px;"> <span style="font-size:21px ">Hospital
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
	<div id="message2" style="margin-top: 67px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="conmmonpoppop"></div>
		<!--  -----------------------------------Add new Report -------------------------------------------*  -->
		<div class="modal fade" id="priscriptreport" tabindex="-1" role="dialog" aria-labelledby="priscriptreportLabel"aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">×</button>
		                <h3 class="modal-title">Diagnosis Report</h3>
		            </div>
		            
		            <div class="modal-body" style="background: #fff;height: 265px;">
		                <div class="category_listbox">
		                    <div class="table-responsive" style="min-height: 100%;">
		                        <form name="report_typ_form" action="" method="post" class="form-horizontal"id="report_typ_form">
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
		                                <tbody class="priscriptionreportdate">
		                                </tbody>
		                            </table>
		                        </form>
		                    </div>
		                </div>
		            </div>
		            <div class="insertform">
		            <form class="form-horizontal" id="Priscription_report_insert">
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Report Name<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4 margin_bottom_5px">
		                        <input class="form-control text-input"maxlength="50" type="text" value="" name="reportname" required>
		                    </div>
		                    <label class="col-sm-1 control-label" for="medicine_name">Amount<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-3 margin_bottom_5px">
		                        <input class="form-control text-input" type="number" min="0" onkeypress="if(this.value.length==8) return false;" step="0.01" name="report_cost" required>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label" for="medicine_name">Description<span
		                            class="require-field">*</span></label>
		                    <div class="col-sm-4">
		                        <textarea id="diagno_description" maxlength="40"class="form-control"name="diagno_description"required> </textarea>
		                    </div>
		                    <div class="col-sm-2 margin_bottom_5px">
		                    	<input type="hidden" name="adminid" id="priscriptadminidreport">
		                    	<input type="hidden" name="flag" value="priscriptionReportInsert">
		                        <input type="submit" value="Add" class="btn btn-success" id="btn-add-cat-report">
		                    </div>
		                </div>
		            </form>
		            </div>
		            <div class="editform" style="display: none;" >
		            	<form class="form-horizontal" id="Priscription_report_update">
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Report Name<span
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
		<!--  -----------------------------------Add new Report exit -------------------------------------------  -->
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
				<div id="home" class="container tab-pane active" style="margin-top: 10px;">
				    <table id="example" class="display table table-striped table-hover" style="width:100%">
				        <thead>
				            <tr>
				                <th style="padding-left: 15px;"> Date</th>
				                <th style="padding-left: 15px;">Patient Id Name</th>
				                <th style="padding-left: 15px;">Report Type & Amount</th>
				                <th style="padding-left: 15px;">Description</th>
				                <th style="padding-left: 15px;">Reprt<span>(&#x20B9;)</span> </th>
				                <th style="padding-left: 15px;">Report Cost($)</th>
				                <th style="padding-left: 15px;">Tax Amount($)</th>
				                <th style="padding-left: 15px;">Total Report</th>
				                <th style="padding-left: 15px;">Action</th>
				
				            </tr>
				        </thead>
				        <tbody class="medicine">
				        </tbody>
				        <tfoot>
				            <tr>
				            <tr>
				                <th style="padding-left: 15px;"> Date</th>
				                <th style="padding-left: 15px;">Patient Id Name</th>
				                <th style="padding-left: 15px;">Report Type & Amount</th>
				                <th style="padding-left: 15px;">Description</th>
				                <th style="padding-left: 15px;">Reprt<span>(&#x20B9;)</span> </th>
				                <th style="padding-left: 15px;">Report Cost($)</th>
				                <th style="padding-left: 15px;">Tax Amount($)</th>
				                <th style="padding-left: 15px;">Total Report</th>
				                <th style="padding-left: 15px;">Action</th>
				
				            </tr>
				        </tfoot>
				    </table>
				    <div style="margin-top: 26px;"></div>
				</div>
				<div id="menu1" class="tab-pane">
				    <form name="diagnosis_form" method="post" class="form-horizontal" id="diagnosis_insert_form"
				        enctype="multipart/form-data" style="margin-top: 15px">
				
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="patient_id">Patient<span class="require-field">*</span></label>
				            <div class="col-sm-8 ">
				                <select id="insertpatientid" class="form-control " name="patientId">
										<option value="" disabled selected hidden="">Select Patient</option>
										<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
											<option value="${q.id }">${q.patientid }-${q.firstname }</option>
										</c:forEach>
								   </select>
				
				            </div>
				            <!--ADD OUT PATIENT POPUP BUTTON -->
				            <div class="col-sm-2">
				                <!--<a href="?page=gmgt_staff&tab=add_staffmember" class="btn btn-default"> Add Doctor</a>-->
				                <a href="#" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"> Add
				                    Outpatient</a>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="patient">Report Type<span class="require-field">*</span></label>
				            <div class="col-sm-8 multiselect_validation_Report margin_bottom_5px">
				                <select id="multiselect" name="report_type[]" multiple class="form-control priscriptionreportmulti">
								</select>
				            </div>
				            <div class="col-sm-2"><a href="#" class="btn btn-default" data-toggle="modal" data-target="#priscriptreport"> Add Or Remove</a></div>
				        </div>
						
							<div class="form-group insert_manu_dignosis" style="display: none;">		   
								<label class="col-sm-offset-2 col-sm-2 control-label upload_document_text_align" for="document">Report Name</label>
								<label class="col-sm-3 control-label upload_document_text_align" for="document">Upload Report </label>
								<label class="col-sm-2 control-label upload_document_text_align" for="document">Amount($)</label>
							</div>
							<div class="add_document_div_main_class">
						</div>
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="report_cost">Report Total Cost ($)</label>
				            <div class="col-sm-8">
				                <input id="report_cost" class="form-control" min="0" type="number"onkeypress="if(this.value!= this.value) return false;" step="0.01" value="" name="report_cost"readonly>
				            </div>
				        </div>
				
				        <div class="form-group">
				            <label class="col-sm-2 control-label" for="description">Description</label>
				            <div class="col-sm-8">
				                <textarea id="diagno_description" class="form-control validate[custom[address_description_validation]]"
				                    maxlength="150" name="diagno_description"> </textarea>
				            </div>
				        </div>
				
				        <div class="form-group">
				            <label class="col-sm-2 control-label " for="enable">Send Email to Patient </label>
				            <div class="col-sm-8">
				                <div class="checkbox">
				                    <label>
				                        <input type="checkbox" value="1" name="hmgt_send_mail_to_patient">
				                    </label>
				                </div>
				
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="col-sm-2 control-label " for="enable">Send Email to Doctor </label>
				            <div class="col-sm-8">
				                <div class="checkbox">
				                    <label>
				                        <input type="checkbox" value="1" name="hmgt_send_mail_to_doctor" checked>
				                    </label>
				                </div>
				            </div>
				        </div>
				        <div class="col-sm-offset-2 col-sm-8">
				        <input type="hidden" name="report_count_total" id="count_digosisreport" >
				        <input type="hidden" name="flag" value="insert">
				            <input type="submit" id="btn-insert-diagnosis" value="Save" name="save_diagnosis"
				                class="btn btn-success " style="margin-bottom: 15px">
				        </div>
				    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>