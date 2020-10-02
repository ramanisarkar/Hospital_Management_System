<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="ing/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />
<script>
$(document).ready(function(){	
	$("#editpatient").hide();
	$('#framework').multiselect({
		  nonSelectedText: 'Select Doctor',
		  enableFiltering: true,
		  enableCaseInsensitiveFiltering: true,
		  buttonWidth:'653px'
		 });
	
	/* var count = 0;
	var username="patientlist";
		$.get('Patient',{flag:username},function(response) {
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td><img src="Doctor_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;" ><a href="#">'+obj[index].firstname+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px; " >'+obj[index].departmentname+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].specailizationname+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].degree+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].email+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].mobileno+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="doctorid'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="doctorid'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
			$('.Patient').append(html);
	 	});
		$('#myTable').DataTable(); 
	}); */

   	$('#insert_form').on('submit' , function(event){
        event.preventDefault();
        $("#insert_form").validate();
        var form = $('#insert_form')[0];
        var data = new FormData(form);
        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Doctor",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response ,textStatus , jqXHR ){
            	var obj = JSON.parse(response);
            	console.log(obj);
            	if(obj[0].doctorupdate == "true"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("Recored Add Successsfully");
            		$('.doctor').children('tr').remove();
            		$.each(obj, function(index, value) {
                		count++;
            		   	var html = '';
            		   	html += '<tr id='+count+'>';
            		   	html += '<td><img src="Doctor_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
            		   	html += '<td style="padding-left: 15px;" ><a href="#">'+obj[index].firstname+'</a></td>';
            		   	html += '<td style="padding-left: 15px;" >'+obj[index].departmentname+'</td>';
             			html += '<td style="padding-left: 15px;">'+obj[index].specailizationname+'</td>';
             			html += '<td style="padding-left: 15px;">'+obj[index].degree+'</td>';
            		   	html += '<td style="padding-left: 15px;">'+obj[index].email+'</td>';
             			html += '<td style="padding-left: 15px;">'+obj[index].mobileno+'</td>';
             			html += '<td><button type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="doctorid'+count+'" value="'+obj[index].id+'">Edit</button></td>';
            			html += '<td><button type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="doctorid'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
            			$('.doctor').append(html);
                 	});
            		$("#insert_form")[0].reset();
            	}
            	else if(obj[0].doctoremail == "false"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("Email Id & User Name invalid , Please try again");
            	}
            	else if(obj[0].doctoruser == "false"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("User Name invalid , Please try again");
            	}
            	else if(obj[0].doctoremailinvalid == "false"){
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
  		var doctor = $('#doctorid'+editid).val();
  		console.log(doctor);
 		var username = "editDoctor";
 		$.get('Doctor',{flag:username , doctorid:doctor},function(response){
 			$("#doctortab2").hide();
  			var obj = JSON.parse(response);
  			console.log(response);
  			$('#doctortab1').hide();
  			$("#doctortab2").show();
  			$('.nav-tabs a[href="#menu2"]').tab('show');
  			$('#doctorid').val(obj[0].id);
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
  			$('#officeaddress').val(obj[0].officeaddrss);
  			$('#officecity').val(obj[0].officecity);
  			$('#officestate').val(obj[0].officestate);
  			$('#officecountry').val(obj[0].officecountry);
  			$('#officezipcode').val(obj[0].officezipcode);
  			$('#hometownaddress').val(obj[0].homeeaddrss);
  			$('#homecity').val(obj[0].homecity);
  			$('#homestate').val(obj[0].homestate);
  			$('#homecountry').val(obj[0].homecountry);
  			$('#homezipcode').val(obj[0].homezipcode);
  			$('#degree').val(obj[0].degree);
  			$('#standardcode').val(obj[0].mobilecountrycode);
  			$('#mobilenumber').val(obj[0].mobileno);
  			$('#phonenumber').val(obj[0].phoneno);
  			$('#email').val(obj[0].email);
  			$('#username').val(obj[0].username);
  			$('#password').val(obj[0].password);
  			$('<option>').val(obj[0].departmentid).text(obj[0].departmentname).appendTo('#departmentupdateid');
  			$('<option>').val(obj[0].specializationid).text(obj[0].specailizationname).appendTo('#specializationupdateid');
  			$('#visitingchargeid').val(obj[0].visitingcharge);
  			$('#consultingchargeid').val(obj[0].consultingcharge);
  			if(obj[0].profileimagename){
  				$('#profileimageid').show();
  				$('#profileimageid').text(obj[0].profileimagename);
  				$('#editprofileImage').val(obj[0].profileimage);
  				$("#coveredit").attr("src", "Doctor_Image/"+obj[0].profileimage+"");
  			}else{
  				$('#profileimageid').hide();
  			}
  			if(obj[0].curriculumvitaename){
  				$('#curriculumvitaeid').show();
  				$('#curriculumvitaebuttonid').show();
  				$('#curriculumvitaeid').text(obj[0].curriculumvitaename);
  				$('#editcurriculumvitae').val(obj[0].curriculumvitae);
  				$("#curriculumvitaebuttonid").attr("href","Doctor_Document/"+obj[0].curriculumvitae+"");
  			}else {
  				$('#curriculumvitaeid').hide();
  				$('#curriculumvitaebuttonid').hide();
			}
  			if(obj[0].educationcertificatename){
  				$('#educationcertificateid').show();
  				$('#educationcertificatebuttonid').show();
  	  			$('#educationcertificateid').text(obj[0].educationcertificatename);
  	  			$('#editeducationCertificate').val(obj[0].educationcertificate);
  	  			$('#educationcertificatebuttonid').attr("href","Doctor_Document/"+obj[0].educationcertificate+"");
  			}else {
  				$('#educationcertificateid').hide();
  				$('#educationcertificatebuttonid').hide();
			}
  			if(obj[0].experiencecertificatename){
  				$('#experiencecertificateid').show();
  				$('#experiencecertificatebuttonid').show();
  				$('#experiencecertificateid').text(obj[0].experiencecertificatename);
  				$('#editexperienceCertificate').val(obj[0].experiencecertificate);
  				$('#experiencecertificatebuttonid').attr("href","Doctor_Document/"+obj[0].experiencecertificate+"");
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
            url: "Doctor",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response ,textStatus , jqXHR ){
            	var obj = JSON.parse(response);
            	console.log(obj);
            	if(obj[0].doctorupdate == "true"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("Recored Update Successsfully");
            		
            	}
            	else if(obj[0].doctoremail == "false"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("Email Id & User Name invalid , Please try again");
            	}
            	else if(obj[0].doctoruser == "false"){
            		$('#message1').show();
            		$('#message2').show();
            		$('#message3').show();
            		$('#messagepass').text("User Name invalid , Please try again");
            	}
            	else if(obj[0].doctoremailinvalid == "false"){
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
  		var doctor = $('#doctorid'+deleteid).val();
 		var username = "deleteDoctor";
 		$.get('Doctor',{flag:username , doctorid:doctor},function(response){
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
   		$("#doctortab2").hide();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	    var doctorlist =  $(this).text(); 
   	    console.log(doctorlist);
   	    if(doctorlist=="Doctor list"){
   	    	$("#doctortab1").show();
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
	background-color: #2c3542;
	height: 100%;
	overflow: auto;
}
.nav>li>a {
	color:#555555;
    position: relative;
    display: block;
    padding: 10px 15px;
    background-color: #f1f4f9;
}
</style>
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
			<li><a href="Admin_Login.jsp"><span class="icone"><img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/dashboard.png"></span><span
					class="title">Dashboard</span></a></li>
			<li><a
				href="<%=request.getContextPath()%>/Department?flag=insert&id=${q.id }"><span
					class="icone"><i class="fas fa-briefcase"
						style="color: gray;"></i></span><span class="title">Department</span></a></li>
			<li><a
				href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><span
					class="icone"><i class="fa fa-lightbulb"
						style="color: gray;"></i></span><span class="title">Specialization</span></a></li>
			<li><a
				href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"
				class="left-tooltip" data-tooltip="Doctor" title="Doctor"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/doctor.png"></span><span
					class="title">Doctor</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Outpatient"
				title="Outpatient"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/outpatient.png"></span><span
					class="title">Outpatient</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient"
				title="Inpatient"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Patient.png"></span><span
					class="title">Inpatient</span></a></li>
			<li><a href="?dashboard=user&amp;page=nurse"
				class="left-tooltip" data-tooltip="Nurse" title="Nurse"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Nurse.png"></span><span
					class="title">Nurse</span></a></li>
			<li><a href="?dashboard=user&amp;page=supportstaff"
				class="left-tooltip" data-tooltip="Support Staff"
				title="Support Staff"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/support.png"></span><span
					class="title">Support Staff</span></a></li>
			<li><a href="?dashboard=user&amp;page=pharmacist"
				class="left-tooltip" data-tooltip="Pharmacist" title="Pharmacist">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Pharmacist.png"></span><span
					class="title">Pharmacist</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=laboratorystaff"
				class="left-tooltip" data-tooltip="Laboratory Staff"
				title="Laboratory Staff"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Laboratorist.png"></span><span
					class="title">Laboratory Staff</span></a></li>
			<li><a href="?dashboard=user&amp;page=accountant"
				class="left-tooltip" data-tooltip="Accountant" title="Accountant">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Accountant.png"></span><span
					class="title">Accountant</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=medicine"
				class="left-tooltip" data-tooltip="Medicine" title="Medicine"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Medicine.png"></span><span
					class="title">Medicine</span></a></li>
			<li><a href="?dashboard=user&amp;page=treatment"
				class="left-tooltip" data-tooltip="Treatment" title="Treatment">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Treatment.png"></span><span
					class="title">Treatment</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=prescription"
				class="left-tooltip" data-tooltip="Prescription"
				title="Prescription"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Prescription.png"></span><span
					class="title">Prescription</span></a></li>
			<li><a href="?dashboard=user&amp;page=bedallotment"
				class="left-tooltip" data-tooltip="Assign Bed-Nurse"
				title="Assign Bed-Nurse"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Assign--Bed-nurse.png"></span><span
					class="title">Assign Bed-Nurse</span></a></li>
			<li><a href="?dashboard=user&amp;page=operation"
				class="left-tooltip" data-tooltip="Operation List"
				title="Operation List"> <span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Operation-List.png"></span><span
					class="title">Operation List</span></a></li>
			<li><a href="?dashboard=user&amp;page=diagnosis"
				class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Diagnosis-Report.png"></span><span
					class="title">Diagnosis</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=bloodbank"
				class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Blood-Bank.png"></span><span
					class="title">Blood Bank</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=appointment"
				class="left-tooltip" data-tooltip="Appointment" title="Appointment">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Appointment.png"></span><span
					class="title">Appointment</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=invoice"
				class="left-tooltip" data-tooltip="Invoice" title="Invoice"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/payment.png"></span><span
					class="title">Invoice</span></a></li>
			<li><a href="?dashboard=user&amp;page=event"
				class="left-tooltip" data-tooltip="Event" title="Event"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/notice.png"></span><span
					class="title">Event</span></a></li>
			<li><a href="?dashboard=user&amp;page=message"
				class="left-tooltip" data-tooltip="Message" title="Message"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/message.png"></span><span
					class="title">Message</span></a></li>
			<li><a href="?dashboard=user&amp;page=ambulance"
				class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Ambulance.png"></span><span
					class="title">Ambulance</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=instrument"
				class="left-tooltip" data-tooltip="instrument" title="instrument">
					<span class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Instrument.png"></span><span
					class="title">Instrument</span>
			</a></li>
			<li><a href="?dashboard=user&amp;page=report"
				class="left-tooltip" data-tooltip="Report" title="Report"> <span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/Report.png"></span><span
					class="title">Report</span></a></li>
			<li><a href="?dashboard=user&amp;page=account"
				class="left-tooltip" data-tooltip="Account" title="Account"><span
					class="icone"> <img
						src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/icon/account.png"></span><span
					class="title">Account</span></a></li>
		</ul>
	</c:forEach>
	<div style="margin-top: 83px;"></div>
	<div id="message2" style="margin-top: 149px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -77%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div id="insertpationt">
		<form id="insert_form" enctype="multipart/form-data">	
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#home"
					style="background-color: f1f4f9;"><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient list</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a 
					href="#addmenu1"  ><i class="fa fa-plus-circle"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add
						New Patient</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
					href="#addmenu2">
					<i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>
					Add New Patient Stap2</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
					href="#addmenu3">
					<i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>
					Add New Patient Stap3</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
       				<table id="myTable" class="display" style="width:100%">
				        <thead>
				            <tr>
   				                 <th>Photo</th>
								 <th>Patient Name</th>
								 <th>Patient ID</th>
								 <th>Mobile Number</th>
								 <th>Status</th>
								 <th>BloodGroup</th>
								 <th>Assigned Doctor Name</th>
								 <th>Admitted Date</th>
								 <th colspan="4">Action</th>
				            </tr>
				        </thead>
				        <tbody class="Patient" >
				        	<tr style="visibility: hidden;">
				            	 <th>Photo</th>
								 <th>Patient Name</th>
								 <th>Patient ID</th>
								 <th>Mobile Number</th>
								 <th>Status</th>
								 <th>BloodGroup</th>
								 <th>Assigned Doctor Name</th>
								 <th>Admitted Date</th>
								 <th colspan="4">Action</th>
							</tr>
						</tbody>
						<tfoot>
				            <tr>
				            	 <th>Photo</th>
								 <th>Patient Name</th>
								 <th>Patient ID</th>
								 <th>Mobile Number</th>
								 <th>Status</th>
								 <th>BloodGroup</th>
								 <th>Assigned Doctor Name</th>
								 <th>Admitted Date</th>
								 <th colspan="4">Action</th>
							</tr>
				        </tfoot>
				   	</table>
				</div>
				<div id="addmenu1" class="tab-pane fade">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="pationtid" required readonly="readonly">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="firstname" placeholder="First Name"  required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="middlename"  placeholder="Middle Name">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="date" class="form-control" name="dob" placeholder="Date of birth" required>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<select id="blood_group" class="form-control " name="blood_group" > 
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
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" name="gender" value="male" required>Male</label>
									<label class="radio-inline"><input type="radio" name="gender" value="female" required>Female</label>
					    		</div>
				  			</div>
						</div>
					</div>
				<div style="margin-top: 20px;"><h4>Home Town Address Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Home Town Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="hometownaddress" placeholder="Home Town Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-1">
			      			<input type="tel" class="form-control" name="standardcode"  required>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Login Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
						<div class="form-group row">
				    		<label class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="email" class="form-control" name="email" required>
				    		</div>
				    		<label class="col-sm-2 col-form-label text"> User Name<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" class="form-control"  name="username" id="userid" placeholder="User Name" required>
				    		</div>
				    	</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="password" class="form-control" name="password" required>
				    		</div>
				    	</div>
				   	</div>
		   	    <div style="margin-top: 20px;"><h4>Other Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Image</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"style="background-color: #f1f4f9; " readonly="readonly">
			    		</div>
			    		<div class="col-sm-4">
			      			<input type="file" name="profileimage" accept="image/*" 
								onchange="document.getElementById('cover').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="cover"  alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 210px;background-color: #22BAA0;">Save And Next Step</button>
  					</div>
				</div>
			</div>				
			<div id="addmenu2" class="tab-pane fade">
				<div style="margin-top: 15px; font: bold;"><h4>Guardian Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Guardian Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardianid" required readonly="readonly">
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardpationtid" required readonly="readonly">
			    		</div>
			    		
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardfirstname" placeholder="First Name"  required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardmiddlename"  placeholder="Middle Name">
			    		</div>
		  			</div>
		  			<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardlastname" placeholder="Last Name" required>
			    		</div>
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<label class="radio-inline"><input type="radio" name="guardgender" value="male" required>Male</label>
							<label class="radio-inline"><input type="radio" name="guardgender" value="female" required>Female</label>
			    		</div>
		  			</div>
		  			<div class="form-group row">
		  				<label  class="col-sm-2 col-form-label text" >Relation With Patient<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="raletionwithpatient" placeholder="Relation With Patient" required>
			    		</div>
		  			</div>
				</div>
				<div style="margin-top: 20px;"><h4>Home Town Address Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Home Town Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="guardhometownaddress" placeholder="Home Town Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="guardhomecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="guardhomestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="guardhomecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="guardhomezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-1">
			      			<input type="tel" class="form-control" name="guardstandardcode"  required>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel" class="form-control" name="guardmobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" class="form-control" name="guardphonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			   
		   	    <div style="margin-top: 20px;"><h4>Other Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Image</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"style="background-color: #f1f4f9; " readonly="readonly">
			    		</div>
			    		<div class="col-sm-4">
			      			<input type="file" name="guardianimage" accept="image/*" 
								onchange="document.getElementById('guardianimage').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="guardianimage"  alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 210px; background-color: #22BAA0;">Back to Last Step</button>
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 10px; background-color: #22BAA0;">Save And Next Step</button>
  					</div>
				</div>
			</div>
			<div id="addmenu3" class="tab-pane fade">
				<div style="margin-top: 15px;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit Date<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<input type="date" class="form-control" name="admitdate"  required>
			    		</div>
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit time<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<input type="time"  class="form-control" name="admittime"  required>
			    		</div>
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >Patient Status<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<select class="form-control " name="patientstatus" > 
								<option value="" disabled selected hidden="">Select Status</option>
								<option value="Admit">Admit</option>
								<option value="Discharge">Discharge</option>
							</select>
			    		</div>
		  			</div>
		  			<div class="form-group">
				     	<label class="col-sm-2 col-form-label text" style="margin-right: -10px;">Assign Doctor<span style="color: red;">*</span></label>
				     	<div class="col-sm-7">
					     	<select id="framework" name="doctorlist[]" multiple class="form-control">
						      	<option value="Codeigniter">Codeigniter</option>
						      	<option value="CakePHP">CakePHP</option>
							    <option value="Laravel">Laravel</option>
							    <option value="YII">YII</option>
							    <option value="Zend">Zend</option>
							    <option value="Symfony">Symfony</option>
							    <option value="Phalcon">Phalcon</option>
							    <option value="Slim">Slim</option>
					     	</select>
				     	</div>
				    </div>
				    <div class="form-group">
				    <div style="margin-top: 67px; "></div>
				     	<label class="col-sm-2 col-form-label text" >Symptoms<span style="color: red;">*</span></label>
				     	<div class="col-sm-7" style=" margin-left: -10px;width: 782px;">
			      			<input type="text" class="form-control" name="symptoms"  required>
			    		</div>
				    </div>
  					<div class="form-group row">
  					<div class="col-sm-7" style="margin-top: 15px;">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 195px; background-color: #22BAA0;">Back to Last Step</button>
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 10px; background-color: #22BAA0;">Save Patient</button>
  					</div>
  					</div>
				</div>
			</div>
			
			</div>
		</div>
	</form>
</div>
<div id="editpatient">
<form id="edit_form" enctype="multipart/form-data">	 
	<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#edithome"
					style="background-color: f1f4f9;"><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient list</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu1"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Patient</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu2"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Patient Stap2</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu3"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Patient Stap3</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="edithome" class="tab-pane fade in active" style="margin-top: 10px;">
       					<table id="myTable" class="display" style="width:100%">
				        <thead>
				            <tr>
   				                 <th>Photo</th>
								 <th > Doctor Name</th>
								 <th >Department</th>
								 <th > Specialization</th>
								 <th > Degree</th>
								 <th > Doctor Email</th>
								 <th > Mobile Number</th>
								 <th colspan="2">Action</th>
				            </tr>
				        </thead>
				        <tbody class="doctor" >
						</tbody>
						<tfoot>
				            <tr>
				            <th >Photo</th>
				            <th >Doctor Name</th>
				            <th >Department</th>
				            <th >Specialization</th>
				            <th >Degree</th>
				            <th >Doctor Email</th>
				            <th >Mobile Number</th>
				            <th colspan="2">Action</th></tr>
				        </tfoot>
				        </table>
			 
				</div>
				
				<div id="editmenu1" class="tab-pane fade">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="pationtid" required readonly="readonly">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="firstname" placeholder="First Name"  required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="middlename"  placeholder="Middle Name">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="date" class="form-control" name="dob" placeholder="Date of birth" required>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<select id="blood_group" class="form-control " name="blood_group" > 
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
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" name="gender" value="male" required>Male</label>
									<label class="radio-inline"><input type="radio" name="gender" value="female" required>Female</label>
					    		</div>
				  			</div>
						</div>
					</div>
				<div style="margin-top: 20px;"><h4>Home Town Address Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Home Town Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="hometownaddress" placeholder="Home Town Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-1">
			      			<input type="tel" class="form-control" name="standardcode"  required>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Login Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
						<div class="form-group row">
				    		<label class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="email" class="form-control" name="email" required>
				    		</div>
				    		<label class="col-sm-2 col-form-label text"> User Name<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" class="form-control"  name="username" id="userid" placeholder="User Name" required>
				    		</div>
				    	</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="password" class="form-control" name="password" required>
				    		</div>
				    	</div>
				   	</div>
		   	    <div style="margin-top: 20px;"><h4>Other Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Image</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"style="background-color: #f1f4f9; " readonly="readonly">
			    		</div>
			    		<div class="col-sm-4">
			      			<input type="file" name="profileimage" accept="image/*" 
								onchange="document.getElementById('cover').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="cover"  alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 210px;background-color: #22BAA0;">Save And Next Step</button>
  					</div>
				</div>
			</div>				
			<div id="editmenu2" class="tab-pane fade">
				<div style="margin-top: 15px; font: bold;"><h4>Guardian Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Guardian Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardianid" required readonly="readonly">
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="pationtid" required readonly="readonly">
			    		</div>
			    		
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="firstname" placeholder="First Name"  required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="middlename"  placeholder="Middle Name">
			    		</div>
		  			</div>
		  			<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
			    		</div>
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<label class="radio-inline"><input type="radio" name="gender" value="male" required>Male</label>
							<label class="radio-inline"><input type="radio" name="gender" value="female" required>Female</label>
			    		</div>
		  			</div>
		  			<div class="form-group row">
		  				<label  class="col-sm-2 col-form-label text" >Relation With Patient<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="raletionwithpatient" placeholder="Relation With Patient" required>
			    		</div>
		  			</div>
				</div>
				<div style="margin-top: 20px;"><h4>Home Town Address Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Home Town Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="hometownaddress" placeholder="Home Town Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="homecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-1">
			      			<input type="tel" class="form-control" name="standardcode"  required>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
		   	    <div style="margin-top: 20px;"><h4>Other Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Image</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"style="background-color: #f1f4f9; " readonly="readonly">
			    		</div>
			    		<div class="col-sm-4">
			      			<input type="file" name="guardianimage" accept="image/*" 
								onchange="document.getElementById('guardianimage').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="guardianimage"  alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 210px; background-color: #22BAA0;">Back to Last Step</button>
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 10px; background-color: #22BAA0;">Save And Next Step</button>
  					</div>
				</div>
			</div>
			<div id="editmenu3" class="tab-pane fade">
				<div style="margin-top: 15px;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit Date<span style="color: red;">*</span></label>
			    		<div class="col-sm-8">
			      			<input type="date" class="form-control" name="admitdate"  required>
			    		</div>
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit time<span style="color: red;">*</span></label>
			    		<div class="col-sm-8">
			      			<input type="time" class="form-control" name="admittime"  required>
			    		</div>
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >Patient Status<span style="color: red;">*</span></label>
			    		<div class="col-sm-8">
			      			<select class="form-control " name="patientstatus" > 
								<option value="" disabled selected hidden="">Select Blood Group</option>
								<option value="Admit">Admit</option>
								<option value="Discharge">Discharge</option>
							</select>
			    		</div>
		  			</div>
		  			<div class="form-group">
				     	<label class="col-sm-2 col-form-label text" style="margin-right: -10px;">Assign Doctor<span style="color: red;">*</span></label>
				     	<div class="col-sm-8">
					     	<select id="framework" name="framework[]" multiple class="form-control" >
						      	<option value="Codeigniter">Codeigniter</option>
						      	<option value="CakePHP">CakePHP</option>
							    <option value="Laravel">Laravel</option>
							    <option value="YII">YII</option>
							    <option value="Zend">Zend</option>
							    <option value="Symfony">Symfony</option>
							    <option value="Phalcon">Phalcon</option>
							    <option value="Slim">Slim</option>
					     	</select>
				     	</div>
				    </div>
				    <div class="form-group">
				    <div style="margin-top: 67px; "></div>
				     	<label class="col-sm-2 col-form-label text" >Symptoms<span style="color: red;">*</span></label>
				     	<div class="col-sm-7" style=" margin-left: -10px;width: 782px;">
			      			<input type="text" class="form-control" name="admittime"  required>
			    		</div>
				    </div>
  					<div class="form-group row">
  					<div class="col-sm-8" style="margin-top: 15px;">
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 195px; background-color: #22BAA0;">Back to Last Step</button>
			    		<button  class="btn btn-success"  id="update"  style="margin-left: 10px; background-color: #22BAA0;">Save Patient</button>
  					</div>
  					</div>
				</div>
			</div>
			</div>
		</div>
	</form>
</div>
</div>
</body>
</html>