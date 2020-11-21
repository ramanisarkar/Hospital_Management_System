<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<style>
.ullist {
   list-style-type: none;
   margin: 0;
   padding: 0;
   width: 15%;
   background-color: #364150;
   height: 100%;
    overflow: auto;
}
.extended li a:hover:not(.active) {
    background-color: white;
}
.title{
color: white;
padding: 8px;
}
.text{
font-weight:100;
text-align: right;
}
li a:hover:not(.active) {
    background-color: #2C3542;;
} 
.profile-image img {
    display: block;
    margin: 0 auto;
    width: 148px;
    border-radius: 50%;
    -webkit-box-shadow: 0 0 0 5px #fff;
    -moz-box-shadow: 0 0 0 5px #fff;
    -o-box-shadow: 0 0 0 5px #fff;
    box-shadow: 0 0 0 5px #fff;
}
.profile-cover {
    background: url(../images/school_life.jpg);
    background-size: cover;
    width: 100%;
    height: 300px;
}
.profile-cover {
    height: 210px!important;
}.profile-cover {
    background: url(../images/school_life.jpg);
    background-size: cover;
    width: 100%;
    height: 300px;
    position: relative;
}
.profile-cover {
    margin-left: -10px;
    width: 1301px;
    background: url(http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/hospital_background.png) repeat scroll 0 0 / cover rgba(0, 0, 0, 0);
}
.profile-image {
    position: relative;
    margin: 100px 15px 15px;
}
@media (min-width: 992px)
.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9 {
    float: none !important;
}
.row {
    margin-right: 0px !important;
    margin-left: 0px !important;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: inherit;
}
.panel .panel-heading {
    padding: 20px;
    overflow: hidden;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border: 0!important;
    height: 55px;
    font-weight: 600;
}
.panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 18px;
    color: inherit;
}
.modal-header {
    padding: 15px;
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

<body style=" background-color :#f1f4f9;font-family: 'Open Sans', sans-serif;">
<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
    <div class="navbar" style="padding-right: 14px;  background-color: white; height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px;font-weight: 600;font-family: 'Open Sans', sans-serif; ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;margin-top: 17px;">
				<a style="background-color: white;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
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
<div>
	<ul class="nav nav-pills nav-stacked ullist" style="margin-top: -20px; height: 1695px; width: 217px;">
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
		<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
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
	
	<div style="margin-left:15%;margin-top: -111.6%;">
	<div class="row right_side" style="padding-right: 14px;">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="margin-top: 77px;width: 166%;margin-left: -168px;height: 180px;">
            <div class="modal-header"   style="padding: 21px; border-bottom: 0px !important;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" >&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <div class="col-xs-2" style="margin-left: 61px;width: 23.666667% !important; ">
                        <label for="ex1" style="font-weight: 100 !important;">Select Profile picture</label>
                    </div>
                    <div class="col-xs-3">
                        <input type="file" name="file">
                    </div>
                </div>
                <button type="button" class="btn btn-success" style="background-color: #1DB198;border-radius: 0px;margin-left: 166px;">Save</button>
                <div class="container">

                </div>
            </div>
        </div>
    </div>
</div>
	<div class="profile-cover"><!-- START PROFILE COVER DIV -->
		<div class="row"><!-- START ROW DIV -->
			<div class="col-md-3 profile-image"><!-- START Profile IMAGE DIV -->
				<div class="profile-image-container">
					<img src="images/<%=session.getAttribute("hospitalimage")%>" height="150px" width="150px" class="img-circle" id="profile_pic" />				</div>
				<div class="col-md-1 update_dp">
					<button class="btn btn-default btn-file"  data-toggle="modal" data-target="#exampleModal" style="margin-top: 15px;margin-left: 72px;"  name="profile_change" id="profile_change">Update Profile</button>
				</div>
			</div>						
		</div>
	</div>
	</div>		
	<div class="form-group row"> 	
			<div class="col-sm-3 "> 
				<h3 class="text-center">Fernando Therrie</h3>				
				<hr>
				<ul class="list-unstyled text-center">
					<li>
						<i class="fa fa-map-marker m-r-xs"></i><a href="#">162,nikol,</a>
					</li>	
					<li><i class="fa fa-envelope m-r-xs"></i><a href="#">marcosjuniiorx@gmail.com.pt</a>
					</li>
				</ul>
			</div>	
						
			<div class="col-md-8 m-t-lg" style="margin-top: -58px;">
				<div class="panel panel-white">
					<div class="panel-heading">
						<div class="panel-title" style="font-weight: 600;">Account Settings 	</div>
					</div>
					<div class="panel-body">	
					<form class="form-horizontal" id="acountform" name="acountform" action="#" method="post"><!-- START ACCOUNT FORM -->	
					
							<div class="form-group">
								<label  class="control-label col-xs-2"></label>
								<div class="col-xs-10">	
								<h4 class="bg-danger"></h4>
								</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label text">Name</label>
				    		<div class="col-sm-10">
				      			<input type="text" class="form-control" name="firstname" required="required">
				    		</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-label text" >Username</label>
							<div class="col-sm-10">
								<input type="username" class="form-control validate[custom[username_validation]" id="name" placeholder="Full Name" maxlength="30" value="doctor" readonly>
							</div>

						</div>
						<div class="form-group">

							<div class="col-xs-offset-2 col-sm-10">

								<button type="submit" class="btn btn-success" name="save_change">Save</button>

							</div>
					
						</div>

					</form><!-- END ACCOUNT FORM -->	
					</div>	<!-- END PANEL BODY DIV -->		   
				</div>					
					 
			
				<div class="panel panel-white"><!-- START PANEL WHITE DIV -->	
					<div class="panel-heading">
						<div class="panel-title">Other Information	</div>
					</div>
					<div class="panel-body"><!-- START PANEL BODY DIV -->	
						<form class="form-horizontal" action="#" method="post" id="doctor_form"><!-- START USER INORMATION FORM -->	
							<input type="hidden" value="edit" name="action">
							<input type="hidden" value="doctor" name="role">
							<input type="hidden" value="2" name="user_id">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
								<div class="col-sm-10">
									<input id="birth_date" class="form-control validate[required]" type="text" type="text"  name="birth_date" 
									value="2019-03-16" readonly>
								</div>
							</div>	
														<div class="form-group">
								<label class="col-sm-2 control-label" for="department">Department</label>
								<div class="col-sm-10">
																	<select name="department" class="form-control" id="category_data">
									<option>select Department</option>
																					<option value="7" >Cardiology</option>
																							<option value="8" >General surgery</option>
																							<option value="9" >Haematology</option>
																							<option value="10" >Neurology</option>
																							<option value="325"  selected='selected'>pychology</option>
																				</select>
								</div>
								
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="birth_date">Specialization<span class="require-field">*</span></label>
								<div class="col-sm-10">
																		
									<select class="form-control validate[required]" 
									id="specialization" name="specialization" >
										<option>Select Specialization</option>
																						<option value="11" >Cardiologists</option>
																							<option value="12" >Emergency Medicine Specialists</option>
																							<option value="13" >Family Physicia</option>
																							<option value="14" >Neurologists</option>
																							<option value="326"  selected='selected'>pychologist</option>
																					</select>
								</div>
								
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="birth_date">Degree<span class="require-field">*</span></label>
								<div class="col-sm-10">
									<input id="doc_degree" class="form-control validate[required,custom[popup_category_validation]]" maxlength="50" type="text"  name="doc_degree" 
									value="MD">
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="visiting_fees">Visting Charge</label>
								<div class="col-sm-10">
									<input id="doc_degree" class="form-control" type="number" min="0" onKeyPress="if(this.value.length==8) return false;" step="0.01"  name="visiting_fees"
									value="7000">
								</div>									
							</div>
														<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">Home Town Address<span class="require-field">*</span></label>

								<div class="col-sm-10">

									<input id="address" class="form-control validate[required,custom[address_description_validation]]" maxlength="150" type="text"  name="address" maxlength="150" value="162,nikol">

								</div>

							</div>
														<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">City<span class="require-field">*</span></label>

								<div class="col-sm-10">

									<input id="address" class="form-control validate[required,custom[city_state_country_validation]]" type="text"  name="home_city_name" maxlength="50" value="A'bad">

								</div>

							</div>
							<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">State</label>

								<div class="col-sm-10">

									<input id="address" class="form-control validate[custom[city_state_country_validation]]" type="text"  name="home_state_name" maxlength="50" value="Gujarat">

								</div>

							</div>
							<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">Country</label>

								<div class="col-sm-10">

									<input id="address" class="form-control validate[custom[city_state_country_validation]]" type="text"  name="home_country_name" maxlength="50" value="India">

								</div>

							</div>
							<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">Office Address<span class="require-field">*</span></label>

								<div class="col-sm-10">

							<input id="" class="form-control validate[required,custom[address_description_validation]]" type="text"  name="office_address" maxlength="150" value="Rua Rio Jari">

								</div>

							</div>
														<div class="form-group">

								<label for="inputEmail" class="control-label col-sm-2">City<span class="require-field">*</span></label>

								<div class="col-sm-10">

									<input id="" class="form-control validate[required,custom[city_state_country_validation]]" maxlength="50" type="text"  name="city_name" value="Barra  Corda">

								</div>

							</div>
							<div class="form-group">

								<label for="inputstate" class="control-label col-sm-2">State</label>

								<div class="col-sm-10">

									<input id="" class="form-control validate[custom[city_state_country_validation]]" maxlength="50" type="text"  name="state_name" value="Ma">

								</div>

							</div>
							<div class="form-group">

								<label for="inputstate" class="control-label col-sm-2">Country</label>

								<div class="col-sm-10">

									<input id="" class="form-control validate[custom[city_state_country_validation]]" type="text"  name="country_name" maxlength="50" value="Brasil">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="control-label col-sm-2">Phone</label>

								<div class="col-sm-10">
									<input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="99984424723" name="phone">
								</div>
							</div>
							<input type="hidden" id="_wpnonce" name="_wpnonce" value="a527f7d997" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=account&amp;sucess=2" />							<div class="form-group">
								<label for="inputEmail" class="control-label col-sm-2">Email<span class="require-field">*</span></label>

								<div class="col-sm-10">

									<input id="email" class="form-control validate[required,custom[email]] text-input" type="text"  maxlength="100" name="email" value="marcosjuniiorx@gmail.com.pt">

								</div>

							</div>
							<div class="form-group">

								<div class="col-sm-offset-2 col-sm-10">

									<button type="submit" class="btn btn-success" name="profile_save_change">Save</button>

								</div>
								
							</div>
						</form><!-- END USER INFORMATION FORM -->	
					</div><!-- END PANEL BODY DIV -->	
				</div><!-- END PANEL WHITE DIV -->	 
			</div><!-- END USER PROFILE DIV -->	
		</div><!-- END ROW DIV -->	
 	</div>	<!-- END MAIN WRAPPER DIV -->		</div>
</div>
</div>
</c:forEach>
</body>
</html>