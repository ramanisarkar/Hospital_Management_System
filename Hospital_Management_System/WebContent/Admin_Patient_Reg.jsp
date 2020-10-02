<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>


<link href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
$(document).ready(function(){	
	$('#departmentid').change(function(event){  
        var username="searchdepartment";
        var departmentid=$('#departmentid').val();
        console.log()  
     	$.get('Doctor',{flag:username , department:departmentid},function(response) {
    	var obj = JSON.parse(response);
    	var select = $('#specializationid');
    	select.find('option').remove();
    	$('<option disabled selected hidden="">').val("").text("Select Specialization").appendTo(select);  
		   	 $.each(obj, function(index, value) {
		   		$('<option>').val(obj[index].id).text(obj[index].specialization).appendTo(select);
			 });
    	 });
  	});
	$('#departmentupdateid').change(function(event){  
        var username="searchdepartment";
        var departmentid=$('#departmentupdateid').val();
        console.log()  
     	$.get('Doctor',{flag:username , department:departmentid},function(response) {
    	var obj = JSON.parse(response);
    	var select = $('#specializationupdateid');
    	select.find('option').remove();
    	$('<option disabled selected hidden>').val("").text("Select Specialization").appendTo(select);  
		   	 $.each(obj, function(index, value) {
		   		$('<option>').val(obj[index].id).text(obj[index].specialization).appendTo(select);
			 });
    	 });
  	});
	
	/* var count = 0;
	var username="doctorlist";
		$.get('Doctor',{flag:username},function(response) {
			count++;
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
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
			$('#myTable').DataTable(); 
	});  */

   	$('#insert_form').on('submit' , function(event){
        event.preventDefault();
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
  		var doctor = $('#doctorid'+editid).val();
 		var username = "editDoctor";
 		$.get('Doctor',{flag:username , doctorid:doctor},function(response){
  			var obj = JSON.parse(response);
  			console.log(response);
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
  			}
  			if(obj[0].curriculumvitaename){
  				$('#curriculumvitaeid').show();
  				$('#curriculumvitaebuttonid').show();
  				$('#curriculumvitaeid').text(obj[0].curriculumvitaename);
  				$('#editcurriculumvitae').val(obj[0].curriculumvitae);
  				$("#curriculumvitaebuttonid").attr("href","Doctor_Document/"+obj[0].curriculumvitae+"");
  			}
  			if(obj[0].educationcertificatename){
  				$('#educationcertificateid').show();
  				$('#educationcertificatebuttonid').show();
  	  			$('#educationcertificateid').text(obj[0].educationcertificatename);
  	  			$('#editeducationCertificate').val(obj[0].educationcertificate);
  	  			$('#educationcertificatebuttonid').attr("href","Doctor_Document/"+obj[0].educationcertificate+"");
  			}if(obj[0].experiencecertificatename){
  				$('#experiencecertificateid').show();
  				$('#experiencecertificatebuttonid').show();
  				$('#experiencecertificateid').text(obj[0].experiencecertificatename);
  				$('#editexperienceCertificate').val(obj[0].experiencecertificate);
  				$('#experiencecertificatebuttonid').attr("href","Doctor_Document/"+obj[0].experiencecertificate+"");
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
   	 	var nurselist =  $(this).text(); 
	    console.log(nurselist);
	    if(nurselist== "Doctor list"){
	    	console.log("--------------------");
	    	location.reload();
	    }
	    	
	    
});
</script>
<style>

.ullist {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 15%;
	background-color: #2c3542;
	height: 100%;
	overflow: auto;
}

.title {
	color: white;
	padding: 8px;
}
.text{
text-align: right;
}

#message1 {
    background: #fff none repeat scroll 0 0;
    border-left: 4px solid #7ad03a;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
    margin: 5px 15px 9px;
    padding: 9px 0px 1px 13px;
}
.updated.below-h2 {
    text-transform: capitalize;
}
</style>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
				<a style="background-color: white;     height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
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
					<i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add New Patient Stap2</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#addmenu3" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Doctor</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu1" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Doctor</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Doctor</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a id="doctortab2"
					href="#editmenu3" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit
						Doctor</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
					<div class="container">
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
					</div>
				<div id="addmenu1" class="tab-pane fade">
				<form id="insert_form" enctype="multipart/form-data">
				<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
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
					    		<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="date" class="form-control" name="dob" placeholder="Date of birth" required>
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
				<div style="margin-top: 20px;"><h4>Office Address Information</h4></div>
				<div style="margin-top: 40px;">
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Office Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="officeaddress" placeholder="Office Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="officecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="officestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" name="officecountry" placeholder="Country">
					    		</div>
					    		
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control"  name="officezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
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
				<div style="margin-top: 20px;"><h4>Education Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Degree<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="degree" placeholder="Degree"  required>
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
			    		<label class="col-sm-2 col-form-label text" >Phone Number</label>
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
			    		<label class="col-sm-2 col-form-label text" >Department<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
							<select class="form-control" name="departmentid" id="departmentid" required>
								<option value="" disabled selected hidden="">Select Department</option>	
								<c:forEach items="${sessionScope.departmentlist }" var="q">
									<option value="${q.id }">${q.department }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Specialization<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<select class="form-control"  id="specializationid" name="specialization"  required>
			      				<option value="" disabled selected hidden="">Select Specialization</option>	
							</select>
						</div>
					</div>
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Visiting Charges(&#x20B9;)</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="visitingcharge" required>
			    		</div>
			    		<div  class="form-group" style="margin-top: 10px;">
			      			<p>/ Per Session</p>
			    		</div>
				    </div>
				    <div class="form-group row" style="margin-top: -10px;">
			    		<label class="col-sm-2 col-form-label text" >consulting charge(&#x20B9;)</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="consultingcharge"required>
			    		</div>
			    		<div  class="form-group" style="margin-top: 10px;">
			      			<p>/ Per Session</p>
			    		</div>
				    </div>
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
			    		<label  class="col-sm-2 col-form-label text" >Curriculum Vitae</label>
			    		<div class="col-sm-4">
			      			<input type="file" name="curriculumvitae" accept="application/pdf">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
  					</div>
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Education Certificate</label>
			    		<div class="col-sm-4">
			      			<input type="file" name="educationcertificate" accept="application/pdf">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Experience Certificate</label>
			    		<div class="col-sm-4">
			      			<input type="file" name="experiencecertificate" accept="application/pdf ">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
			    		<input type="hidden" name="flag" value="insert">
  					</div>
  					<div class="form-group row">
			    		<input  class="btn btn-info" type="submit" id="btnSubmit" style="margin-left: 210px;background-color:green;"/>
  					</div>
				</div>
				</form>
			</div>
			<div id="menu2" class="tab-pane fade">
				<form id="update_form" enctype="multipart/form-data">
				<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="firstname" class="form-control" name="firstname" placeholder="First Name"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="middlename" name="middlename"  placeholder="Middle Name">
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" required>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="date" class="form-control" id="dob" name="dob" placeholder="Date of birth" required>
					    		</div>
					    		
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" id="male" name="gender" value="male" required>Male</label>
									<label class="radio-inline"><input type="radio" id="female" name="gender" value="female" required>Female</label>
					    		</div>
				  			</div>
						</div>
					</div>
				<div style="margin-top: 20px;"><h4>Office Address Information</h4></div>
				<div style="margin-top: 40px;">
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Office Address<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="officeaddress" name="officeaddress" placeholder="Office Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="officecity" name="officecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="officestate" name="officestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="officecountry" name="officecountry" placeholder="Country">
					    		</div>
					    		
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" id="officezipcode" name="officezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
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
					      			<input type="text" class="form-control" id="hometownaddress" name="hometownaddress" placeholder="Home Town Address"  required>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="homecity" name="homecity" placeholder="city" required>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="homestate" name="homestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" class="form-control" id="homecountry" name="homecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" class="form-control" id="homezipcode" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					    		</div>
				  			</div>
						</div>
					</div>
				<div style="margin-top: 20px;"><h4>Education Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Degree<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" id="degree" name="degree" placeholder="Degree"  required>
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-1">
			      			<input type="tel" class="form-control" id="standardcode" name="standardcode"  required>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel" class="form-control" id="mobilenumber" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone Number</label>
			    		<div class="col-sm-4">
			      			<input type="tel" class="form-control" id="phonenumber" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Login Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
						<div class="form-group row">
				    		<label class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="email" class="form-control" id="email" name="email" required>
				    		</div>
				    		<label class="col-sm-2 col-form-label text"> User Name<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" class="form-control" id="username" name="username" id="userid" placeholder="User Name" required>
				    		</div>
				    	</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" class="form-control"id="password" name="password" required>
				    		</div>
				    	</div>
				   	</div>
		   	    <div style="margin-top: 20px;"><h4>Other Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Department<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
							<select class="form-control" name="departmentupdateid" id="departmentupdateid" required>
								<c:forEach items="${sessionScope.departmentlist }" var="q">
									<option value="${q.id }">${q.department }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Specialization<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<select class="form-control"  id="specializationupdateid" name="specialization"  required>
							</select>
						</div>
					</div>
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Visiting Charges(&#x20B9;)</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control"  id="visitingchargeid" name="visitingcharge" required>
			    		</div>
			    		<div  class="form-group" style="margin-top: 10px;">
			      			<p>/ Per Session</p>
			    		</div>
				    </div>
				    <div class="form-group row" style="margin-top: -10px;">
			    		<label class="col-sm-2 col-form-label text" >consulting charge(&#x20B9;)</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" id="consultingchargeid" name="consultingcharge"required>
			    		</div>
			    		<div  class="form-group" style="margin-top: 10px;">
			      			<p>/ Per Session</p>
			    		</div>
				    </div>
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Image</label>
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
  					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Curriculum Vitae</label>
			    		<div class="col-sm-4">
			      			<input id="curriculumvitae" type="file" name="curriculumvitae" accept="application/pdf">
			      			<span id="curriculumvitaeid" hidden></span><a href="#" hidden id="curriculumvitaebuttonid"  target="_blank" class="w3-btn w3-black" >Link Button</a>
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
  					</div>
				    <div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Education Certificate</label>
			    		<div class="col-sm-4">
			      			<input id="educationcertificate" type="file" name="educationcertificate" accept="application/pdf">
			      			<span id="educationcertificateid" hidden></span><a hidden href="#" id="educationcertificatebuttonid"  target="_blank" class="w3-btn w3-black" >Link Button</a>
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Experience Certificate</label>
			    		<div class="col-sm-4">
			      			<input type="file" id="experiencecertificate" name="experiencecertificate" accept="application/pdf ">
			      			<span id="experiencecertificateid" hidden></span><a hidden href="#" id="experiencecertificatebuttonid"  target="_blank" class="w3-btn w3-black" >Link Button</a>
			      			
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div style="margin-left: 210px;">
			    			Upload document PDF
			    		</div>
			    		<input type="hidden" id="editprofileImage" name="editprofileImage">
			    		<input type="hidden" id="editcurriculumvitae" name="editcurriculumvitae">
			    		<input type="hidden" id="editeducationCertificate" name="editeducationCertificate">
			    		<input type="hidden" id="editexperienceCertificate" name="editexperienceCertificate">
			    		
			    		<input type="hidden" id="doctorid" name="doctorid">
			    		<input type="hidden" id="adminid" name="adminid" >
			    		<input type="hidden" id="joiningdateid" name="joinig" >
			    		<input type="hidden" name="flag" value="update">
  					</div>
  					<div class="form-group row">
			    		<input  class="btn btn-info"  id="update" type="submit" style="margin-left: 210px;background-color:green;"/>
  					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>