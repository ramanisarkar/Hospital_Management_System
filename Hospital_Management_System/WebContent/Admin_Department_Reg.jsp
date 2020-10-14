<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
$(document).ready(function(){
	var count = 0;
	var username="departmentlist";
	var deleterecord = "as" ;
   	$.get('Department',{flag:username},function(response) {
   		console.log(response);
   		console.log(deleterecord);
   		var obj = JSON.parse(response);
    	$.each(obj, function(index, value) {
    		count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td>'+count+'</td>';
 			html += '<td>'+obj[index].department+'</td>';
			html += '<td><button type="button" name="remove" class="btn btn-danger btn-xs remove1" data-remove_id="'+count+'" id="departmentid'+count+'" value="'+obj[index].id+'"><i class=" fa fa-close" style="color: white"></button></td></tr>';
			$('.department').append(html);
     	});
 	});
   	$('#insert_form').on('submit', function(event){
   		count = 0;
         event.preventDefault();
         var flag1=$("#flag").val();
         var dname=$("#department").val();
         console.log(dname);
         console.log(flag);
         $("#btnSubmit").prop("disabled", true);
         var form_data = $(this).serialize();
         $.post('Department',{flag:flag1 , departmentname:dname},function(response) {
            	var obj = JSON.parse(response);
            	var message = obj[0].message;
            	$('.department').children('tr').remove();
            	$.each(obj, function(index, value) {
             		count++;
         		   	var html = '';
         		    html += '<tr id='+count+'>';
         			html += '<td>'+count+'</td>';
         			html += '<td>'+obj[index].department+'</td>';
        			html += '<td><button type="button" name="remove" class="btn btn-danger btn-xs remove1" data-remove_id="'+count+'" id="departmentid'+count+'" value="'+obj[index].id+'"><i class=" fa fa-close" style="color: white"></button></td></tr>';
         			$('.department').append(html);
                	});
            	console.log(message);
            	if(message == "seccess"){
            		$('#departmentadd').text("Record Add Successfully");
            		$('input[name=department').val('');
            	}
            	else if (message == "exist") {
            		$('#departmentadd').text("Record Already Exist");
				}
            	$("#btnSubmit").prop("disabled", false);
              	});
         });

   	$(document).on('click', '.remove1', function(){
  		var removeid = $(this).data('remove_id');
  		var depaerment = $('#departmentid'+removeid).val();
 		var username = "deletedepartment";
 		$.post('Department',{flag:username , depid:depaerment},function(response){
 			var message=response;
 			console.log(message)
 			if(message == "seccess"){
 				count--;
	        	$(this).closest('tr').remove();
        		window.location.reload();
        		
        	}
        	else if (message == "exist") {
        		$('#departmentadd').text("Record Exist");
			}
        	
 		});
 		
  	});
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });
});
</script>

<script type="text/javascript">
function filterTable() {
	  const query = q => document.querySelectorAll(q);
	  const filters = [query('th input')].map(e => new RegExp(e.value, 'i'));

	  query('tbody tr').forEach(row => row.style.display = 
	    filters.every((f, i) => f.test(row.cells[i].textContent)) ? '' : 'none');
	}
</script>
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
li a:hover:not(.active) {
    background-color: #2C3542;;
} 
.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}

.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}


</style>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>

<body style=" background-color :#f1f4f9;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
    <div class="navbar" style="padding-right: 14px; background-color: white;">
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40"> <span style="font-size:22px; ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 70%;">
				<a style="background-color: white;" data-toggle="dropdown" class="dropdown-toggle" href="javascript:;">
						<img src="images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-left: 150px;">								
						<span>${q.hospitalname }</span> <b class="caret"></b>
				</a>
				<ul class="dropdown-menu extended logout">
					<li><a href="<%=request.getContextPath()%>/Admin?flag=editprofile&id=${q.id }"><i class="fa fa-user"></i>
							My Profile</a></li>
					<li><a href="Com_Login.jsp"><i class="fas fa-sign-out-alt"></i>Log Out </a></li>
				</ul>
			</li>
		</ul>
	</div>
	<ul class="nav nav-pills nav-stacked ullist" style="margin-top: -19px; height: 1695px; width: 217px;">
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
		<li><a href="" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
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
</c:forEach>
<div style="margin-top: 83px;">
</div>

<div style="margin-left:236px;padding:0px 16px; margin-top: -116.6%;background-color: white;">
		
		<h3 style="padding-top: 13px;">Add Department</h3>
		<div style="color: green;margin-top: 3px; "id="departmentadd"></div>
		<form id="insert_form">
			<div class="form-group row" style=" margin-top: 30px;">
				<label for="inputtext" class="col-sm-2 col-form-label" style="margin-left: 2px;">Deparment<span style="color: red">*</span></label>
				<div class="col-sm-10">
					<input type="hidden"  name="flag" id="flag" value="insert">
					<input type="text" class="form-control" id="department" name="department" style=" width: 332px;">
					<button type="submit" id="btnSubmit" style="margin-top: -56px; margin-left: 369px;" class="btn btn-success mb-2">Add</button>
				</div>
			</div>		
		</form>
	<div class="container" style="margin-right: 90px;">
		<div class="row">
        	<div class="panel panel-primary filterable">
            	<div class="panel-heading">
                	<h3 class="panel-title">Department List</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
	                       <th><input type="text" class="form-control" onkeyup="filterTable()" placeholder="No" disabled></th>
	                       <th><input type="text" class="form-control" onkeyup="filterTable()" placeholder="Department" disabled></th>
	                       <th>Action</th>
	                    </tr>
	                </thead>
	                <tbody class="department">
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>