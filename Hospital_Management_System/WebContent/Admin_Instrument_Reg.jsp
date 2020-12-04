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
.require-field{
color: red;}
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
#assginInstrumentTable_length {
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#assginInstrumentTable_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#example_length {
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
<script>
$(document).ready(function () {
    /*
    $('#start_time').timepicki(
        {
            show_meridian: false,
            min_hour_value: 0,
            max_hour_value: 23,
            step_size_minutes: 15,
            overflow_minutes: true,
            increase_direction: 'up',
            disable_keyboard_mobile: true
        }
    );
    $('#end_time').timepicki(
        {
            show_meridian: false,
            min_hour_value: 0,
            max_hour_value: 23,
            step_size_minutes: 15,
            overflow_minutes: true,
            increase_direction: 'up',
            disable_keyboard_mobile: true
        }
    ); */
    var objinstrumentList;
	$.get('InstrumentManagement', { flag: "instrumentList" }, function(response) {
		var count=0;
		objinstrumentList = JSON.parse(response);
		var select = $('.insert_instrument_id');
		select.find('option').remove();
		$('<option disabled selected hidden="">').val("").text("Select Instrument").appendTo(select); 
		$.each(objinstrumentList, function(index) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td style="padding-top: 15px;">' + objinstrumentList[index].instrumentcode + '</td>';
			html += '<td style="padding-top: 15px;">' + objinstrumentList[index].instrumentname + '</td>';
			html += '<td style="padding-top: 15px;">' + objinstrumentList[index].instrumentcharge + '</td>';
			html += '<td style="padding-top: 15px;">' + objinstrumentList[index].instrumentchargestype + '</td>';
			html += '<td style="padding-top: 15px;">' + objinstrumentList[index].instrumentdescription + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + objinstrumentList[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + objinstrumentList[index].id + '">Delete</button></td></tr>';
			$('.InstrumentList').append(html);
			$('<option>').val(objinstrumentList[index].id).text((objinstrumentList[index].instrumentcode) +" - "+ (objinstrumentList[index].instrumentname )).appendTo(select);
		});
		$('#example').DataTable();
		
	});
	
	$(document).on('change','.insert_instrument_id', function() {
		var instrumentid = $(this).val();
		var patientId  =  $('#patient_id').val();
		if(patientId !== null){
			$.get('InstrumentManagement', { flag:"checkInstrument" , instrumentId : instrumentid}, function(response) {
				objinstrumentList = JSON.parse(response);
				console.log(response);
				var start = new Date();
                var end = new Date(new Date().setYear(start.getFullYear() + 1));
                $.fn.datepicker.defaults.format = "dd-mm-yyyy";
				if(objinstrumentList[0].instrumentchargestype == "Daily"){
					$('#select_instrument_block').empty();
					var html = '';
	                html += '<input id="charge_type" type="hidden"  name="charge_type" value="Daily"><div class="form-group"><label class="col-sm-2 control-label" for="instrument_start_date"> Start Date <span class="require-field">*</span></label>';
	                html += '<div class="col-sm-8"><input id="start_date" class="form-control start" type="text" value="" name="start_date"></div></div>';
	                html += '<div class="form-group"><label class="col-sm-2 control-label" for="end_date">Expected End Date <span class="require-field">*</span></label>';
	                html += '<div class="col-sm-8"><input id="end_date" class="form-control end" type="text"value="" name="end_date"></div></div>';
	                $('#select_instrument_block').append(html);
	                
	                $('#start_date').datepicker({
	                    endDate: end,
	                    autoclose: true
	                }).on('changeDate', function (selected) {
	                    var minDate = new Date(selected.date.valueOf());
	                    $('#end_date').datepicker('setStartDate', minDate);
	                });
	                
	                $('#end_date').datepicker({
	                    startDate: start,
	                    endDate: end,
	                    autoclose: true
	                }).on('changeDate', function (selected) {
	                    var maxDate = new Date(selected.date.valueOf());
	                    $('#start_date').datepicker('setEndDate', maxDate);
	                });
				}
				else if (objinstrumentList[0].instrumentchargestype == "Hourly") {
					$('#select_instrument_block').empty();
					var html = '';
					html += '<input id="charge_type" type="hidden"  name="charge_type" value="Hourly"><div class="form-group"><label class="col-sm-2 control-label">Instrument Assign Date <span class="require-field">*</span></label>';
					html += '<div class="col-sm-8"><input id="start_date" class="form-control start" type="text" value="" name="start_date"></div></div>';
					html += '<div class="form-group"><label class="col-sm-2 control-label" for="instrument_start_date">Start Time <span class="require-field">*</span></label>';
					html += '<div class="col-sm-8"><input id="start_time" type="time" value="" class="form-control " name="start_time"></div></div>';
					html += '<div class="form-group"><label class="col-sm-2 control-label" for="end_date">Expected End Time <span class="require-field">*</span></label>';
					html += '<div class="col-sm-8"><input id="end_time" type="time" class="form-control" name="end_time"></div></div>';
					$('#select_instrument_block').append(html);
					$('#start_date').datepicker({
	                    endDate: end,
	                    autoclose: true
	                }); 
				}
			});
		}
	});
    
    $('#Insert_instrument_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#Insert_instrument_form')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#insretbtnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "InstrumentManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
				var obj = JSON.parse(response);
				var count = 0;
				table = $('#example').DataTable();
				table.destroy();
				$('.InstrumentList').children('tr').remove();
				$.each(obj, function(index, value) {
					count++;
					var html = '';
					html += '<tr id=' + count + '>';
					html += '<td style="padding-top: 15px;">' + obj[index].instrumentcode + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].instrumentname + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].instrumentcharge + '</td>';
					html += '<td style="padding-top: 15px;">' + obj[index].instrumentchargestype + '</td>';
					html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].instrumentdescription + '</td>';
					html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">Edit</button>';
					html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
					$('.InstrumentList').append(html);
				});
				var message = obj[0].assetclass;
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#Insert_instrument_form")[0].reset();
					$('#example').DataTable();
				}
				$("#insertevent").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#insertevent").prop("disabled", false);
			}
		});
	});
	
	$('#assign_insert_instrument_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#assign_insert_instrument_form')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#assigned_instrument_validation").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "InstrumentManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
				var obj = JSON.parse(response);
				$("#assigned_instrument_validation").prop("disabled", false);
				if(obj.length == 0){
					console.log("brak");
					return;
				}
				var count = 0;
				console.log(response);
				if(obj[0].field2 == "erorr"){
					$('#patientname').text(obj[0].field1);
					$('#untiletime').text(obj[0].field3);
					$('#basicModal').modal('show');
				}
				else {
					table = $('#assginInstrumentTable').DataTable();
					table.destroy();
					$('.inssginInstrumentlist').children('tr').remove();
					$.each(obj, function(index, value) {
						count++;
						var html = '';
						html += '<tr id=' + count + '>';
						html += '<td style="padding-top: 15px;">' + obj[index].patientname + '</td>';
						html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].instrument + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].assigndate + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].charege + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].total + '</td>';
						html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  endAssginInstrument" data-end_id="' + count + '" id="AssginId' + count + '"value="' + obj[index].id + '">Get</button>';
						html += '<button style="margin-left: 10px; " type="button" class="btn btn-info  editAssginInstrument" data-edit_id="' + count + '" id="AssginId' + count + '"value="' + obj[index].id + '">Edit</button>';
						html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteAssginInstrument" data-delete_id="' + count + '" id="AssginId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
						$('.inssginInstrumentlist').append(html);
					});
					var message = obj[0].instrumentUpdate;
					if (message == "true") {
						$('#message1').show();
						$('#message2').show();
						$('#message3').show();
						$('#messagepass').text("Record Added Successsfully");
						$("#assign_insert_instrument_form")[0].reset();
					}
					$('#assginInstrumentTable').DataTable();
				}
				$("#assigned_instrument_validation").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#assigned_instrument_validation").prop("disabled", false);
			}
		});
	});
	
	$.get('InstrumentManagement', { flag: "instrumentAssignList" }, function(response) {
		var obj = JSON.parse(response);
		var count = 0;
		$.each(obj, function(index, value) {
			count++;
			var html = '';
			html += '<tr id=' + count + '>';
			html += '<td style="padding-top: 15px;">' + obj[index].patientname + '</td>';
			html += '<td style="padding-top: 15px; word-break: break-all;">' + obj[index].instrument + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].assigndate + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].enddate + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].charege + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].total + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  endAssginInstrument" data-end_id="' + count + '" id="AssginId' + count + '"value="' + obj[index].id + '">Get</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-info  editAssginInstrument" data-edit_id="' + count + '" id="AssginId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteAssginInstrument" data-delete_id="' + count + '" id="AssginId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.inssginInstrumentlist').append(html);
		});
		$('#assginInstrumentTable').DataTable();
	});
	
	$(document).on('click', '.endAssginInstrument', function(){
		var endid = $(this).data('end_id');
		console.log(endid);
		var instrumentId= $('#AssginId'+endid).val();
		console.log(instrumentId);
		$.get('InstrumentManagement',{flag:"assginInstrumentEnd", instrumentId:instrumentId},function(response){
 			$("#laboratoryStaffListtab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#laboratoryStaffListtab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#laboratoryStaffId').val(obj[0].id);
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
				$("#coveredit").attr("src", "Laboratory_Staff_Image/"+obj[0].profileimage+"");
			}else{
				$('#profileimageid').hide();
			}
		});
	});
});
</script>
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
	    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		
		            <div class="modal-body">
		                <i class="fa fa-times-circle" style="font-size: 100px;margin-left: 250px; color: red;"></i>
		                <p style="color: red;font-size: 19px;margin-top: 10px;">Already Assigned Instrument TO <span id="patientname"></span> Until <span id="untiletime"></span>.</p>
		            </div>
		
		            <button type="button" class="btn btn-info" data-dismiss="modal"
		                style="margin-bottom: 20px;margin-left: 276px;padding: 11px 24px 10px">Ok</button>
		        </div>
		    </div>
		</div>
	    <div class="container" style="margin-right: 90px;">
	        <ul class="nav nav-tabs tabcalss">
		        <li style="background-color: f1f4f9;">
	                <a href="#home" id="instrumenttab" data-toggle="tab">
	                    <i class="fa fa-bars" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Instrument List
	                </a>
	            </li>
	            <li style="margin-left: 15px; background-color: f1f4f9;">
	                <a href="#menu1" id="instrumenttab1" data-toggle="tab">
	                    <i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add
		                Instrument
	                </a>
	            </li>
		        <li style="margin-left: 15px; background-color: #f1f4f9;">
		            <a href="#menu2" id="instrumenttab2" data-toggle="tab">
		                <i class="fa fa-bars" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Assigned
		                Instrument List</a>
		        </li>
		        <li style="margin-left: 15px; background-color: #f1f4f9;">
		            <a href="#menu3" id="instrumenttab3" data-toggle="tab">
		                <i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Assigned
		                Instrument</a>
		        </li>
		        <li style="margin-left: 15px; background-color: #f1f4f9;">
		            <a href="#menu4" id="instrumenttab5" data-toggle="tab">
		                <i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
		                Instrument</a>
		        </li>
		    </ul>
	        <div class="tab-content">
	        <div id="home" class="container tab-pane active" style="margin-top: 10px;">
	            <table id="example" class="display table table-striped table-hover" style="width:100%">
	                <thead>
	                    <tr>
	                        <th style="padding-left: 15px;"> Instrument code</th>
	                        <th style="padding-left: 15px;">Name</th>
	                        <th style="padding-left: 15px;">Charges(&#x20B9;)</th>
	                        <th style="padding-left: 15px;">Charges Type </th>
	                        <th style="padding-left: 15px;">Descripation</th>
	                        <th style="padding-left: 15px;">Actiion</th>
	                    </tr>
	                </thead>
	                <tbody class="InstrumentList">
	                </tbody>
	                <tfoot>
	                    <tr>
	                        <th style="padding-left: 15px;"> Instrument code</th>
	                        <th style="padding-left: 15px;">Name</th>
	                        <th style="padding-left: 15px;">Charges(&#x20B9;)</th>
	                        <th style="padding-left: 15px;">Charges Type </th>
	                        <th style="padding-left: 15px;">Descripation</th>
	                        <th style="padding-left: 15px;">Actiion</th>
	                    </tr>
	                </tfoot>
	            </table>
	            <div style="margin-top: 26px;"></div>
	        </div>
	        <div id="menu1" class="tab-pane">
	            <div class="panel-body">
	                <!--START PANEL BODY DIV-->
	                <form class="form-horizontal" id="Insert_instrument_form">
	                    <!--START INSTRUMENT FORM-->
	                    <div class="col-sm-6" style="min-height: 360px;">
	                        <fieldset>
	                            <legend>Instrument Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_code">Instrument Code<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_code" class="form-control  text-input"
	                                        min="0" type="number" onkeypress="if(this.value.length==8) return false;"
	                                        value="" name="instrument_code">
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_name">Instrument Name<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_name"
	                                        class="form-control "
	                                        type="text" maxlength="50" value="" name="instrument_name">
	                                </div>
	                            </div>
	
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="charge_type">Charges Type<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <label class="radio-inline">
	                                        <input type="radio" value="Daily" class="tog "
	                                            name="charge_type" checked="checked">Daily </label>
	                                    <label class="radio-inline">
	                                        <input type="radio" value="Hourly" class="tog "
	                                            name="charge_type">Hourly
	                                    </label>
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_charge">Instrument charge ($)<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_charge" class="form-control  " min="0"
	                                        type="number" onkeypress="if(this.value.length==8) return false;" step="0.01"
	                                        value="" name="instrument_charge">
	                                </div>
	                            </div>
	                           
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_description">Description</label>
	                                <div class="col-sm-9">
	                                    <textarea id="instrument_description"
	                                        class="form-control "
	                                        maxlength="150" name="instrument_description"></textarea>
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 360px;">
	                        <fieldset>
	                            <legend>Firm Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="code">Code</label>
	                                <div class="col-sm-10">
	                                    <input id="code" class="form-control text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==8) return false;" value="" name="code">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="name">Name</label>
	                                <div class="col-sm-10">
	                                    <input id="name"
	                                        class="form-control text-input  "
	                                        type="text" maxlength="30" value="" name="name">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="address">Address</label>
	                                <div class="col-sm-10">
	                                    <textarea id="address"
	                                        class="form-control "
	                                        maxlength="150" name="address" cols="29"></textarea>
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="contact">Contact</label>
	                                <div class="col-sm-10">
	                                    <input id="contact" class="form-control  text-input"min="6" maxlength="15" type="text" value="" name="contact">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 300px;">
	                        <fieldset>
	                            <legend>Asset Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="description">Description</label>
	                                <div class="col-sm-10">
	                                    <textarea name="description" maxlength="150"
	                                        class="form-control "></textarea>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="quantity">Quantity</label>
	                                <div class="col-sm-10">
	                                    <input id="quantity" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==4) return false;" value="" name="quantity">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="price">Price ($)</label>
	                                <div class="col-sm-10">
	                                    <input id="price" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==8) return false;" step="0.01" value=""
	                                        name="price">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="class">Class</label>
	                                <div class="col-sm-10">
	                                    <input id="class"
	                                        class="form-control  text-input "
	                                        type="text" maxlength="30" value="" name="class">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 300px;">
	                        <fieldset>
	                            <legend>Invoice Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="serial">Serial</label>
	                                <div class="col-sm-10">
	                                    <input id="serial" class="form-control  text-input" type="number" min="0"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="serial">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="acquire">Acquire</label>
	                                <div class="col-sm-10">
	                                    <input id="acquire" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="acquire">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="asset_id">Asset ID</label>
	                                <div class="col-sm-10">
	                                    <input id="asset_id" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="asset_id">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
	                    	<input type="hidden" name="flag" value="insertInstrument">
	                        <input type="submit" value="Save" name="save_instrument" id="insretbtnSubmit"class="btn btn-success">
	                    </div>
	                </form>
	                <!--END INSTRUMENT FORM-->
	            </div>
	        </div>
	        <div id="menu2" class="tab-pane">
	            <table id="assginInstrumentTable" class="display table table-striped table-hover" style="width:100%">
	                <thead>
	                    <tr>
	                        <th style="padding-left: 15px;">Patient</th>
	                        <th style="padding-left: 15px;">Instrument</th>
	                        <th style="padding-left: 15px;">Assigned Date</th>
	                        <th style="padding-left: 15px;">Expected Return Date</th>
	                        <th style="padding-left: 15px;">Charges Amount(&#x20B9;)</th>
	                        <th style="padding-left: 15px;">Total Charges Amout (%)</th>
	                        <th style="padding-left: 15px;">Action</th>
	                    </tr>
	                </thead>
	                <tbody class="inssginInstrumentlist">
	                </tbody>
	                <tfoot>
	                    <tr>
	                        <th style="padding-left: 15px;"> Patient</th>
	                        <th style="padding-left: 15px;">Instrument</th>
	                        <th style="padding-left: 15px;">Assigned Date</th>
	                        <th style="padding-left: 15px;">Expected Return Date</th>
	                        <th style="padding-left: 15px;">Charges Amount(&#x20B9;)</th>
	                        <th style="padding-left: 15px;">Total Charges Amout (%)</th>
	                        <th style="padding-left: 15px;">Action</th>
	
	                    </tr>
	                </tfoot>
	            </table>
	            <div style="margin-top: 26px;"></div>
	        </div>

	        <div id="menu3" class="tab-pane">
	            <form name="assign_insert_instrument_form" action="" method="post" class="form-horizontal"
	                id="assign_insert_instrument_form" style="margin-top: 15px">
	                <!--START Assign INSTRUMENT FORM-->
	                <input type="hidden" name="flag" value="instrumentAssginInsert">
	                <div class="form-group">
	                    <label class="col-sm-2 control-label" for="patient">Patient<span
	                            class="require-field">*</span></label>
	                    <div class="col-sm-8">
	                        <select name="patient_id" class="form-control  " id="patient_id">
	                            <option value="" disabled selected hidden="">Select Patient </option>	
								<c:forEach items="${sessionScope.patientList }" var="q">
									<option value="${q.id }">${q.patientregistrationid.patientid } - ${q.patientregistrationid.firstname }</option>
								</c:forEach>
	                        </select>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-2 control-label" for="patient">Instrument<span
	                            class="require-field">*</span></label>
	                    <div class="col-sm-8">
	                        <select name="instrument_id" class="form-control  insert_instrument_id">
	                            <option disabled selected hidden>Select Instrument</option>
	                        </select>
	                    </div>
	                </div>
	                <div id="select_instrument_block">
	                </div>
	                
	                <div class="form-group">
	                    <label class="col-sm-2 control-label" for="description">Description</label>
	                    <div class="col-sm-8">
	                        <textarea id="description" class="form-control "
	                            maxlength="150" name="description"></textarea>
	                    </div>
	                </div>
	
	                <div class="col-sm-offset-2 col-sm-8">
	                    <input type="submit" value="Assign Instrument" name="assign_instrument"
	                        class="btn btn-success"id="assigned_instrument_validation" style="margin-bottom: 15px">
	                </div>
	            </form>
	        </div>
	        <div id="menu4" class="tab-pane">
	            <div class="panel-body">
	                <!--START PANEL BODY DIV-->
	                <form name="bed_form" action="" method="post" class="form-horizontal" id="instrument_form">
	                    <!--START INSTRUMENT FORM-->
	                    <input type="hidden" name="action" value="insert">
	                    <input type="hidden" name="instrument_id" value="">
	                    <div class="col-sm-6" style="min-height: 400px;">
	                        <fieldset>
	                            <legend>Instrument Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_code">Instrument Code<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_code" class="form-control  text-input"
	                                        min="0" type="number" onkeypress="if(this.value.length==8) return false;"
	                                        value="" name="instrument_code">
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_name">Instrument Name<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_name"
	                                        class="form-control "
	                                        type="text" maxlength="50" value="" name="instrument_name">
	                                </div>
	                            </div>
	
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="charge_type">Charges Type<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <label class="radio-inline">
	                                        <input type="radio" value="Daily" class="tog "
	                                            name="charge_type" checked="checked">Daily </label>
	                                    <label class="radio-inline">
	                                        <input type="radio" value="Hourly" class="tog "
	                                            name="charge_type">Hourly
	                                    </label>
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_charge">Instrument charge ($)<span
	                                        class="require-field">*</span></label>
	                                <div class="col-sm-9">
	                                    <input id="instrument_charge" class="form-control  " min="0"
	                                        type="number" onkeypress="if(this.value.length==8) return false;" step="0.01"
	                                        value="" name="instrument_charge">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label" for="instrument_description">Description</label>
	                                <div class="col-sm-9">
	                                    <textarea id="instrument_description"
	                                        class="form-control "
	                                        maxlength="150" name="instrument_description"></textarea>
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 400px;">
	                        <fieldset>
	                            <legend>Firm Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="code">Code</label>
	                                <div class="col-sm-10">
	                                    <input id="code" class="form-control text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==8) return false;" value="" name="code">
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="name">Name</label>
	                                <div class="col-sm-10">
	                                    <input id="name"
	                                        class="form-control text-input  "
	                                        type="text" maxlength="30" value="" name="name">
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="address">Address</label>
	                                <div class="col-sm-10">
	                                    <textarea id="address"
	                                        class="form-control "
	                                        maxlength="150" name="address" cols="29"></textarea>
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="contact">Contact</label>
	                                <div class="col-sm-10">
	                                    <input id="contact" class="form-control text-input"min="6" maxlength="15" type="text" value="" name="contact">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 350px;">
	                        <fieldset>
	                            <legend>Asset Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="description">Description</label>
	                                <div class="col-sm-10">
	                                    <textarea name="description" maxlength="150"class="form-control"></textarea>
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="quantity">Quantity</label>
	                                <div class="col-sm-10">
	                                    <input id="quantity" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==4) return false;" value="" name="quantity">
	                                </div>
	                            </div>
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="price">Price ($)</label>
	                                <div class="col-sm-10">
	                                    <input id="price" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==8) return false;" step="0.01" value=""
	                                        name="price">
	                                </div>
	                            </div>
	
	
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="class">Class</label>
	                                <div class="col-sm-10">
	                                    <input id="class"
	                                        class="form-control  text-input"type="text" maxlength="30" value="" name="class">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-6" style="min-height: 300px;">
	                        <fieldset>
	                            <legend>Invoice Info:</legend>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="serial">Serial</label>
	                                <div class="col-sm-10">
	                                    <input id="serial" class="form-control  text-input" type="number" min="0"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="serial">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="acquire">Acquire</label>
	                                <div class="col-sm-10">
	                                    <input id="acquire" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="acquire">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-2 control-label" for="asset_id">Asset ID</label>
	                                <div class="col-sm-10">
	                                    <input id="asset_id" class="form-control  text-input" min="0" type="number"
	                                        onkeypress="if(this.value.length==6) return false;" value="" name="asset_id">
	                                </div>
	                            </div>
	                        </fieldset>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
	                        <input type="submit" value="Save" name="save_instrument" class="btn btn-success">
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>