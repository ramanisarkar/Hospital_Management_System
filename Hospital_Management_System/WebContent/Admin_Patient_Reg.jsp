<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>

<script src="js/Patient_Reg_javascript.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.require-field{
color: red;
}
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
#tableBloodDoner_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#tableBloodDoner_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
.btn {
border-radius: 0px;
}
.active_tab1
  {
   background-color:#fff;
   color:#333;
   font-weight: 600;
  }
  .inactive_tab1
  {
   background-color: #f5f5f5;
   color: #333;
   cursor: not-allowed;
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
		<div class="container" style="margin-right: 90px;">
		<div id="patientregistrationdiv1">
			<form id="register_form">
			<ul class="nav nav-tabs tabcalss" style="margin-top: 15px;">
				<li class="active" id="tab1doctorlist"><a href="#home"
					style="background-color: f1f4f9;"><i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient List</a>
				</li>
				<li id="tabdoctoradd"style="margin-left: 15px; background-color: f1f4f9;"><a href="#addmenu1" id="list_login_details"data-toggle="tab"><i class="fa fa-plus-circle"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add
						New Patient</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
					href="#addmenu2" id="list_personal_details" >
					<i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>
					Add New Patient Stap2</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;" id="list_contact_details"><a 
					href="#addmenu3"  >
					<i class="fa fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>
					Add New Patient Stap3</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active" style="margin-top: 10px;">
       			<table id="example" class="display table table-striped table-hover" style="width:100%">
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
								 <th>Action</th>
				            </tr>
				        </thead>
				        <tbody class="patient" >
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
								 <th>Action</th>
							</tr>
				        </tfoot>
				   	</table>
				</div>
				<div id="addmenu1" id="checkdiv" class="tab-pane fade">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
					    		
								<div class="col-sm-4">
									<select id="insertpatientid" class="form-control " name="patientId">
										<option value="" disabled selected hidden="">Select Patient</option>
										<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
											<option value="${q.id }">${q.patientid }-${q.firstname }</option>
										</c:forEach>
								   </select>
								   <span id="error_patient_id" class="text-danger"></span>
								</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertfirstname" class="form-control" name="firstname" placeholder="First Name">
					      			<span id="error_first_name" class="text-danger"></span>
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertmiddlename"  class="form-control" name="middlename"  placeholder="Middle Name">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insertlastname"class="form-control" name="lastname" placeholder="Last Name" required>
					      			<span id="error_last_name" class="text-danger"></span>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					    			<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" id="insertdob" name="dob"  class="form-control" placeholder="dd/mm/yyyy">
							            <div class="input-group-addon" >
							              <span class="glyphicon glyphicon-th"></span>
							            </div>
						          	</div>
					      			<span id="error_date_of_birth" class="text-danger"></span>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<select id="insertbloodgroup" class="form-control " name="blood_group" > 
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
									<span id="error_blood_group" class="text-danger"></span>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" id="insertmale" name="gender" value="male" checked>Male</label>
									<label class="radio-inline"><input type="radio" id="insertfemale" name="gender" value="female" >Female</label>
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
					      			<input type="text" id="inserthomeaddress"class="form-control" name="hometownaddress" placeholder="Home Town Address">
					      			<span id="error_home_address" class="text-danger"></span>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="inserthomecity"class="form-control" name="homecity" placeholder="city">
					      			<span id="error_home_city" class="text-danger"></span>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="inserthomestate" class="form-control" name="homestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="inserthomecountry" class="form-control" name="homecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" id="inserthomezip" class="form-control" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					      			<span id="error_zip_code" class="text-danger"></span>
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
			      			<input type="tel" id="insertcode" class="form-control" name="standardcode">
			      			<span id="error_code" class="text-danger"></span>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel"id="insertmobile" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			      			<span id="error_mobile_number" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" id="insertphone" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Login Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
						<div class="form-group row">
				    		<label class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="email" id="insertemail" class="form-control" name="email">
				      			<span id="error_email" class="text-danger"></span>
				    		</div>
				    		<label class="col-sm-2 col-form-label text"> User Name<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" id="insertusername" class="form-control"  name="username" id="userid" placeholder="User Name" >
				      			<span id="error_user_name" class="text-danger"></span>
				    		</div>
				    		<div style="margin-left: 797px;margin-top: 36px;color: red;">
					    		<span id="available"></span>
				    		</div>
				    	</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="password"id="insertpassword" class="form-control" name="password">
				      			<span id="error_password" class="text-danger"></span>
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
								onchange="document.getElementById('insertcoveredit').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="insertcoveredit" alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<input  class="btn btn-success" id="btn_patient_details" value="Save And Next Step"  type="button" style="margin-left: 210px;background-color: #22BAA0;" >
  					</div>
				</div>
			</div>				
			<div id="addmenu2"  class="tab-pane fade" style="des">
				<div style="margin-top: 15px; font: bold;"><h4>Guardian Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Guardian Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="insertguardian" class="form-control" name="guardianid" required readonly="readonly">
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="insertstep2patientid" class="form-control" name="guardpationtid" required readonly="readonly">
			    		</div>
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="insert_guardian_first_name"class="form-control" name="guardfirstname" placeholder="First Name">
			      			<span id="error_guardian_first_name" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" name="guardmiddlename"  placeholder="Middle Name">
			    		</div>
		  			</div>
		  			<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" id="insert_guardian_last_name" name="guardlastname" placeholder="Last Name">
			      			<span id="error_guardian_last_name" class="text-danger"></span>
			    		</div>
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<label class="radio-inline"><input type="radio" name="guardgender" value="male" checked>Male</label>
							<label class="radio-inline"><input type="radio" name="guardgender" value="female">Female</label>
			    		</div>
		  			</div>
		  			<div class="form-group row">
		  				<label  class="col-sm-2 col-form-label text" >Relation With Patient<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="insert_guardian_raletion" class="form-control" name="raletionwithpatient" placeholder="Relation With Patient">
			      			<span id="error_guardian_raletion" class="text-danger"></span>
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
					      			<input type="text" id="insert_guardian_home_address" class="form-control" name="guardhometownaddress" placeholder="Home Town Address">
					      			<span id="error_guardian_home_address" class="text-danger"></span>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="insert_guardian_home_city" class="form-control" name="guardhomecity" placeholder="city">
					      			<span id="error_guardian_home_city" class="text-danger"></span>
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
					      			<input type="tel" id="insert_guardian_zip_code" class="form-control" name="guardhomezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					      			<span id="error_guardian_zip_code" class="text-danger"></span>
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-3">
			      			<input type="tel" id="insert_guardian_mobile"class="form-control" name="guardmobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			      			<span id="error_guardian_mobile" class="text-danger"></span>
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
			    		<input  class="btn btn-success"  id="btn_back_to_login_patient" value="Back to Last Step"  type="button" style="margin-left: 210px;background-color: #22BAA0;" >
			    		<input  class="btn btn-success"  id="btn_guardian_details" value="Save And Next Step"  type="button" style="margin-left: 10px;background-color: #22BAA0;" >
  					</div>
				</div>
			</div>
			<div id="addmenu3" class="tab-pane fade">
				<div style="margin-top: 15px;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit Date<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			    			<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" id="insert_admiit_date" name="admitdate"class="form-control" placeholder="dd/mm/yyyy" required>
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
			      			<span id="error_admiit_date" class="text-danger"></span>
			    		</div>
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit time<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<input type="time" id="insert_admint_time" class="form-control" name="admittime"  required>
			      			<span id="error_admiit_time" class="text-danger"></span>
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
		  			<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Assign Doctor<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
					     	<select  class="form-control " name="doctor" required>
								<option value="" disabled selected hidden="">Select Doctor</option>
								<c:forEach items="${sessionScope.doctorlist }" var="q">
									<option value="${q.id }">${q.firstname }</option>
								</c:forEach>
						   </select>
				     	</div>
			    	</div>
				    <div class="form-group row">
				     	<label class="col-sm-2 col-form-label text" >Symptoms<span style="color: red;">*</span></label>
				     	<div class="col-sm-7">
			      			<input type="text"id="insertsymptoms" class="form-control" name="symptoms"  required>
			    		</div>
				    </div>
  					<div class="form-group row">
  					<div class="col-sm-7" style="margin-top: 15px;">
  						<input type="hidden" name="flag" value="insert">
			    		<input class="btn btn-success" id="btn_back_to_guardian_tab"  type="button" value="Back to Last Step"  style="margin-left: 195px; background-color: #22BAA0;">
			    		<input type="submit" class="btn btn-success" value="Save Patient"  style="margin-left: 10px; background-color: #22BAA0;">
  					</div>
  					</div>
				</div>
			</div>
		</div>
		</form>
		</div>
		<div id="editpatientragistration" style="display: none;">
		<form id="update_form" enctype="multipart/form-data">	 
		<div class="container" style="margin-right: 90px;">
						<ul class="nav nav-tabs tabcalss" style="margin-top: 15px;">
							<li class="active" id="tab1doctorlist"><a href="#edithome"
								style="background-color: f1f4f9;"><i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Patient List</a></li>
							<li style="margin-left: 15px; background-color: f1f4f9;"><a data-toggle="tab"
								id="editpatienttab2" href="#editmenu1"><i
									class="fas fa-edit" aria-hidden="true"
									style="border-radius: 50%; padding: 8px;"></i>Edit Patient</a></li>
							<li style="margin-left: 15px; background-color: f1f4f9;"><a
								id="editpatienttab3" href="#editmenu2"><i
									class="fas fa-edit" aria-hidden="true"
									style="border-radius: 50%; padding: 8px;"></i>Edit Patient
									Stap2</a></li>
							<li style="margin-left: 15px; background-color: f1f4f9;"><a
								id="editpatienttab4" href="#editmenu3"><i
									class="fas fa-edit" aria-hidden="true"
									style="border-radius: 50%; padding: 8px;"></i>Edit Patient
									Stap3</a></li>
						</ul>
						<div class="tab-content">
				<div id="editmenu1" class="tab-pane fade">
					<div style="margin-top: 15px;"><h4>Personal Information</h4></div>
					<div style="border-bottom: 1px solid gray;"></div>
					<div>
						<div style="margin-top: 10px;">
							<div class="form-group row">
					    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
								<div class="col-sm-4">
								   <select id="editpatientid"class="form-control" name="patientId">
										<option value="" disabled selected hidden="">Select Patient</option>
										<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
											<option value="${q.id }">${q.patientid }-${q.firstname }</option>
										</c:forEach>
								   </select>
								</div>
					    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editfirstname" class="form-control" name="firstname" placeholder="First Name">
					      			<span id="error_edit_first_name" class="text-danger"></span>
					    		</div>
					    	</div>
				  			<div class="form-group row">
				  				
					    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editmiddlename"  class="form-control" name="middlename"  placeholder="Middle Name">
					    		</div>
				  				
					    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="editlastname"class="form-control" name="lastname" placeholder="Last Name" required>
					      			<span id="error_edit_last_name" class="text-danger"></span>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label class="col-sm-2 col-form-label text" >Date of birth<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					    			<div class="input-group date" data-date-format="dd/mm/yyyy">
						            	<input  type="text" id="editdob" name="dob"class="form-control" placeholder="dd/mm/yyyy" required>
							            <div class="input-group-addon" >
							              <span class="glyphicon glyphicon-th"></span>
							            </div>
						          	</div>
					      			<span id="error_edit_date_of_birth" class="text-danger"></span>
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<select id="editbloodgroup" class="form-control " name="blood_group" > 
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
									<span id="error_edit_blood_group" class="text-danger"></span>
					    		</div>
				  			</div>
				  			<div class="form-group row">
				  				<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<label class="radio-inline"><input type="radio" id="editmale" name="gender" value="male">Male</label>
									<label class="radio-inline"><input type="radio" id="editfemale" name="gender" value="female" >Female</label>
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
				      			<input type="text" id="edithomeaddress"class="form-control" name="hometownaddress" placeholder="Home Town Address">
				      			<span id="error_edit_home_address" class="text-danger"></span>
				    		</div>

				    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="text" id="edithomecity"class="form-control" name="homecity" placeholder="city">
				      			<span id="error_edit_home_city" class="text-danger"></span>
				    		</div>
				    	</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >State</label>
				    		<div class="col-sm-4">
				      			<input type="text" id="edithomestate" class="form-control" name="homestate" placeholder="State">
				    		</div>
				    		<label class="col-sm-2 col-form-label text" >Country</label>
				    		<div class="col-sm-4">
				      			<input type="text" id="edithomecountry" class="form-control" name="homecountry" placeholder="Country">
				    		</div>
			  			</div>
			  			<div class="form-group row">
				    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
				    		<div class="col-sm-4">
				      			<input type="tel" id="edithomezip" class="form-control" name="homezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
				      			<span id="error_edit_zip_code" class="text-danger"></span>
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
			      			<input type="tel" id="editcode" class="form-control" name="standardcode">
			      			<span id="error_edit_code" class="text-danger"></span>
			    		</div>
			    		<div class="col-sm-3">
			      			<input type="tel"id="editmobile" class="form-control" name="mobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			      			<span id="error_edit_mobile_number" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" id="editphone" class="form-control" name="phonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			    		</div>
			    	</div>
			    </div>
			    <div style="margin-top: 20px;"><h4>Login Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="email" id="editemail" class="form-control" name="email">
			      			<span id="error_edit_email" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text"> User Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="editusername" class="form-control"  name="username" id="userid" placeholder="User Name" >
			      			<span id="error_edit_user_name" class="text-danger"></span>
			    		</div>
			    		<div style="margin-left: 797px;margin-top: 36px;color: red;">
				    		<span id="available"></span>
			    		</div>
			    	</div>
		  			<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="password"id="editpassword" class="form-control" name="password">
			      			<span id="error_edit_password" class="text-danger"></span>
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
			    			<span hidden id="editpatientimageid"></span>
			      			<input id="updateprofileimage" type="file" name="profileimage" accept="image/*" 
								onchange="document.getElementById('editpatientimage').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="editpatientimage" alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<input  class="btn btn-success" id="btn_edit_patient_details" value="Save And Next Step"  type="button" style="margin-left: 210px;background-color: #22BAA0;" >
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
			      			<input type="text" id="editguardianid" class="form-control" name="guardianid" required readonly="readonly">
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="editstep2patientid" class="form-control" name="guardpationtid" required readonly="readonly">
			    		</div>
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="edit_guardian_first_name"class="form-control" name="guardfirstname" placeholder="First Name">
			      			<span id="error_edit_guardian_first_name" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Middle Name</label>
			    		<div class="col-sm-4">
			      			<input type="text" id="edit_guardian_middle_name" class="form-control" name="guardmiddlename"  placeholder="Middle Name">
			    		</div>
		  			</div>
		  			<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Last Name<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" class="form-control" id="edit_guardian_last_name" name="guardlastname" placeholder="Last Name">
			      			<span id="error_edit_guardian_last_name" class="text-danger"></span>
			    		</div>
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<label class="radio-inline"><input type="radio" id="editgurdianmail" name="guardgender" value="male" >Male</label>
							<label class="radio-inline"><input type="radio" id="editgurdianfemail" name="guardgender" value="female">Female</label>
			    		</div>
		  			</div>
		  			<div class="form-group row">
		  				<label  class="col-sm-2 col-form-label text" >Relation With Patient<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<input type="text" id="edit_guardian_raletion" class="form-control" name="raletionwithpatient" placeholder="Relation With Patient">
			      			<span id="error_edit_guardian_raletion" class="text-danger"></span>
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
					      			<input type="text" id="edit_guardian_home_address" class="form-control" name="guardhometownaddress" placeholder="Home Town Address">
					      			<span id="error_edit_guardian_home_address" class="text-danger"></span>
					    		</div>

					    		<label class="col-sm-2 col-form-label text" >City<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="text" id="edit_guardian_home_city" class="form-control" name="guardhomecity" placeholder="city">
					      			<span id="error_edit_guardian_home_city" class="text-danger"></span>
					    		</div>
					    	</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >State</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="edit_guardian_home_state" class="form-control" name="guardhomestate" placeholder="State">
					    		</div>
					    		<label class="col-sm-2 col-form-label text" >Country</label>
					    		<div class="col-sm-4">
					      			<input type="text" id="edit_guardian_home_country" class="form-control" name="guardhomecountry" placeholder="Country">
					    		</div>
				  			</div>
				  			<div class="form-group row">
					    		<label  class="col-sm-2 col-form-label text" >Zip Code<span style="color: red;">*</span></label>
					    		<div class="col-sm-4">
					      			<input type="tel" id="edit_guardian_zip_code" class="form-control" name="guardhomezipcode" pattern="[0-9]{6}"  placeholder="Zip Code">
					      			<span id="error_edit_guardian_zip_code" class="text-danger"></span>
					    		</div>
				  			</div>
						</div>
					</div>
			    <div style="margin-top: 20px;"><h4>Contact Information</h4></div>
				<div style="border-bottom: 1px solid gray;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Mobile Number<span style="color: red;">*</span></label>
			    		<div class="col-sm-3">
			      			<input type="tel" id="edit_guardian_mobile"class="form-control" name="guardmobilenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
			      			<span id="error_edit_guardian_mobile" class="text-danger"></span>
			    		</div>
			    		<label class="col-sm-2 col-form-label text" >Phone</label>
			    		<div class="col-sm-4">
			      			<input type="tel" id="edit_guardian_phone" class="form-control" name="guardphonenumber" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
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
			    			<span hidden id="editguardianimagid"></span>
			      			<input type="file" name="gurdianimage" accept="image/*" 
								onchange="document.getElementById('editpatientimage').src = window.URL.createObjectURL(this.files[0])">
			    		</div>
			    	</div>
			    	 <div class="form-group row">
			    		<div class="image">
			    			<img id="editgurdianimage" alt="your image" width="150" height="150" style="margin-left: 210px;" />
			    		</div>
  					</div>
  					<div class="form-group row">
			    		<input  class="btn btn-success"  id="btn_edit_back_to_login_patient" value="Back to Last Step"  type="button" style="margin-left: 210px;background-color: #22BAA0;" >
			    		<input  class="btn btn-success"  id="btn_edit_guardian_details" value="Save And Next Step"  type="button" style="margin-left: 10px;background-color: #22BAA0;" >
  					</div>
				</div>
			</div>
			<div id="editmenu3" class="tab-pane fade">
				<div style="margin-top: 15px;"></div>
				<div style="margin-top: 10px;">
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit Date<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			    			<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text"  name="admitdate" id="edit_admiit_date" class="form-control" placeholder="dd/mm/yyyy">
					            <div class="input-group-addon" >
					              <span class="glyphicon glyphicon-th"></span>
					            </div>
				          	</div>
			    		</div>
			    	</div>
			    	<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Admit time<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<input type="time" id="edit_admint_time" class="form-control" value="10:15:00" name="admittime"  required>
			      			<span id="error_edit_admiit_time" class="text-danger"></span>
			    		</div>
			    	</div>
		  			<div class="form-group row">
		  				<label class="col-sm-2 col-form-label text" >Patient Status<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
			      			<select class="form-control" id="edit_status" name="patientstatus" > 
								<option value="" disabled selected hidden="">Select Status</option>
								<option value="Admit">Admit</option>
								<option value="Discharge">Discharge</option>
							</select>
			    		</div>
		  			</div>
		  			<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Assign Doctor<span style="color: red;">*</span></label>
			    		<div class="col-sm-7">
					     	<select  class="form-control" id="edit_doctor" name="doctor" required>
								<option value="" disabled selected hidden="">Select Doctor</option>
								<c:forEach items="${sessionScope.doctorlist }" var="q">
									<option value="${q.id }">${q.firstname }</option>
								</c:forEach>
						   </select>
				     	</div>
			    	</div>
				    <div class="form-group row">
				     	<label class="col-sm-2 col-form-label text" >Symptoms<span style="color: red;">*</span></label>
				     	<div class="col-sm-7">
			      			<input type="text"id="editsymptoms" class="form-control" name="symptoms"  required>
			    		</div>
				    </div>
  					<div class="form-group row">
  					<div class="col-sm-7" style="margin-top: 15px;">
  						<input type="hidden" name="editprofileImage" id="editprofileImage">
  						<input type="hidden" name="editgurdianImage" id="editgurdianImage">
  						<input type="hidden" name="id" id="patientid">
  						<input type="hidden" name="adminId" id="adminid">
  						<input type="hidden" id="joiningdateid" name="joinig">
  						<input type="hidden" name="flag" value="update">
			    		<input class="btn btn-success" id="btn_edit_back_to_guardian_tab"  type="button" value="Back to Last Step"  style="margin-left: 195px; background-color: #22BAA0;">
			    		<input type="submit" class="btn btn-success" value="Save Patient"  style="margin-left: 10px; background-color: #22BAA0;">
  					</div>
  					</div>
				</div>
			</div>
			</div>
		</div>
	</form>
	</div>
</div>
</div>
</body>
</html>