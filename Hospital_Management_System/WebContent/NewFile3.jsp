<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


</head>
<body>
<div class="container box">
   <form method="post" id="register_form">
    <ul class="nav nav-tabs tabcalss" style="margin-top: 15px;">
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
    <div class="tab-content" style="margin-top:16px;">
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
				
     <div id="addmenu1" class="tab-pane fade" id="login_details" >
      <div style="margin-top: 15px;"><h4>Personal Information</h4></div>
		<div style="border-bottom: 1px solid gray;"></div>
        <div style="margin-top: 10px;">
        <div class="form-group row">
    		<label class="col-sm-2 col-form-label text" >Patient Id<span style="color: red;">*</span></label>
    		
			<div class="col-sm-4">
				<select id="insertpatientid" class="form-control " name="blood_group">
					<option value="" disabled selected hidden="">Select Patient</option>
					<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
						<option value="${q.patientid }">${q.firstname }</option>
					</c:forEach>
			   </select>
			</div>
    		<label class="col-sm-2 col-form-label text" >First Name<span style="color: red;">*</span></label>
    		<div class="col-sm-4">
      			<input type="text" name="first_name" id="first_name" class="form-control" />
         		<span id="error_first_name" class="text-danger"></span>
    		</div>
    	</div>
		<div class="form-group row">
	        <label>Enter Email Address</label>
	        <input type="text" name="email" id="email" class="form-control" />
	        <span id="error_email" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label>Enter Password</label>
         <input type="password" name="password" id="password" class="form-control" />
         <span id="error_password" class="text-danger"></span>
        </div>
        <br />
        <div align="center">
         <button type="button" name="btn_login_details" id="btn_login_details" class="btn btn-info btn-lg">Next</button>
        </div>
        <br />
     
       </div>
     
      </div>
      
     </div>
     
     <div id="addmenu2" class="tab-pane fade" id="personal_details">
      <div class="panel panel-default">
       <div class="panel-heading">Fill Personal Details</div>
       <div class="panel-body">
        <div class="form-group">
         <label>Enter First Name</label>
         <input type="text" name="first_name" id="first_name" class="form-control" />
         <span id="error_first_name" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label>Enter Last Name</label>
         <input type="text" name="last_name" id="last_name" class="form-control" />
         <span id="error_last_name" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label>Gender</label>
         <label class="radio-inline">
          <input type="radio" name="gender" value="male" checked> Male
         </label>
         <label class="radio-inline">
          <input type="radio" name="gender" value="female"> Female
         </label>
        </div>
        <br />
        <div align="center">
         <button type="button" name="previous_btn_personal_details" id="previous_btn_personal_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_personal_details" id="btn_personal_details" class="btn btn-info btn-lg">Next</button>
        </div>
        <br />
       </div>
      </div>
     </div>
     <div class="tab-pane fade" id="addmenu3"	id="contact_details">
      <div class="panel panel-default">
       <div class="panel-heading">Fill Contact Details</div>
       <div class="panel-body">
        <div class="form-group">
         <label>Enter Address</label>
         <textarea name="address" id="address" class="form-control"></textarea>
         <span id="error_address" class="text-danger"></span>
        </div>
        <div class="form-group">
         <label>Enter Mobile No.</label>
         <input type="text" name="mobile_no" id="mobile_no" class="form-control" />
         <span id="error_mobile_no" class="text-danger"></span>
        </div>
        <br />
        <div align="center">
         <button type="button" name="previous_btn_contact_details" id="previous_btn_contact_details" class="btn btn-default btn-lg">Previous</button>
         <button type="button" name="btn_contact_details" id="btn_contact_details" class="btn btn-success btn-lg">Register</button>
        </div>
        <br />
       </div>
      </div>
     </div>
    </div>
   </form>
  </div>
</body>
</html>