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
 
<script>

$(document).ready(function(){
	var table;
	var count = 0;
	var name="bloodManageList";
 	$.get('BloodManage',{flag:name},function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</td>';
			html += '<td style="text-align: center;"><button style=" margin-left: 93px;" type="button" class="btn btn-info  editBloodManage" data-edit_id="'+count+'" id="bloodManageId'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodManage" data-delete_id="'+count+'" id="bloodManageId'+count+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
			$('.bloodManage').append(html);
	 	});
			 $('#example').DataTable();
	});
	
 	var blooddoner = 0;
 	var username="donorList";
 	$.get('BloodManage',{flag:username},function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			blooddoner++;
		   	var html = '';
		   	html += '<tr id='+blooddoner+'>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].name+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].age+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].gender+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].lastdonationdate+'</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodDonor" data-edit_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
			$('.bloodDonor').append(html);
	 	});
			 $('#tableBloodDoner').DataTable();
	});
	
	$('#BloodManage_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#BloodManage_form')[0];
	    var data = new FormData(form);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "BloodManage",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = JSON.parse(response);
	        	table = $('#example').DataTable();
	        	table.destroy();
	        	$('.bloodManage').children('tr').remove();
	    		$.each(obj, function(index, value) {
	    			count++;
	    		   	var html = '';
	    		   	html += '<tr id='+count+'>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</td>';
	    			html += '<td style="text-align: center;"><button style=" margin-left: 93px;" type="button" class="btn btn-info  editBloodManage" data-edit_id="'+count+'" id="bloodManageId'+count+'" value="'+obj[index].id+'">Edit</button>';
	    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodManage" data-delete_id="'+count+'" id="bloodManageId'+count+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
	    			$('.bloodManage').append(html);
	    	 	});
	    		var message=obj[0].bloodmanageupdate;
				console.log(message)
				if(message == "true"){
					$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#BloodManage_form")[0].reset();
	        		$('#example').DataTable();
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
	
	$('#BloodDonor_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#BloodDonor_form')[0];
	    var data = new FormData(form);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "BloodManage",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = JSON.parse(response);
	        	table = $('#tableBloodDoner').DataTable();
	        	table.destroy();
	        	$('.bloodDonor').children('tr').remove();
	        	$.each(obj, function(index, value) {
	    			blooddoner++;
	    		   	var html = '';
	    		   	html += '<tr id='+blooddoner+'>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].name+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].age+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].gender+'</td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].lastdonationdate+'</td>';
	    			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodDonor" data-edit_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value="'+obj[index].id+'">Edit</button>';
	    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
	    			$('.bloodDonor').append(html);
	    	 	});
	        	var message=obj[0].bloodmanageupdate;
				console.log(message)
				if(message == "true"){
					$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#BloodDonor_form")[0].reset();
	        		$('#tableBloodDoner').DataTable();
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
	
	$(document).on('click', '.editBloodManage', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var bloodManage = $('#bloodManageId'+editid).val();
		var username = "editBloodManage";
		$.get('BloodManage',{flag:username , bloodManageId:bloodManage},function(response){
 			$("#BloodManagetab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#BloodManagetab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#bloodManageId').val(obj[0].id);
			$('#adminid').val(obj[0].adminid);
			$('#joiningdateid').val(obj[0].joiningdate);
			$('#blood_group').val(obj[0].bloodgroup);
			$('#number_Of_Bags').val(obj[0].numberofbags);
		});
	});
	
	$(document).on('click', '.editBloodDonor', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var bloodDonor = $('#bloodDonorId'+editid).val();
		var username = "editBloodDonor";
		$.get('BloodManage',{flag:username , bloodDonorId:bloodDonor},function(response){
 			$("#BloodDonortab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#BloodDonortab2").show();
			$('.nav-tabs a[href="#menu5"]').tab('show');
			$('#bloodDonorId').val(obj[0].id);
			$('#bloodDonorAdminid').val(obj[0].adminid);
			$('#bloodDonorJoiningdateid').val(obj[0].joiningdate);
			$('#bloodDonoremail').val(obj[0].email);
			$('#bloodDonorphone').val(obj[0].phone);
			$('#bloodDonoraeg').val(obj[0].age);
			$('#bloodDonorbool_dodnor_name').val(obj[0].name);
			var gender = obj[0].gender;
  			if(gender=="male"){
  				$("#bloodDonormale").prop("checked", true);
  			}
  			else {
  				$("#bloodDonorfemale").prop("checked", true);
			}
			$('#bloodDonorblood_group').val(obj[0].bloodgroup);
			$('#bloodDonorblood_status').val(obj[0].numberofbags);
			$('#bloodDonorlast_donet_date').val(obj[0].lastdonationdate);
		});
	});
	
	$('#BloodManageupdate_form').on('submit', function(event){
    event.preventDefault();
    var form = $('#BloodManageupdate_form')[0];
    var data = new FormData(form);
    console.log(form);
    console.log(data);
    $("#update").prop("disabled", true);
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "BloodManage",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response ,textStatus , jqXHR ){
        	var obj = JSON.parse(response);
        	table = $('#example').DataTable();
        	table.destroy();
        	$('.bloodManage').children('tr').remove();
    		$.each(obj, function(index, value) {
    			count++;
    		   	var html = '';
    		   	html += '<tr id='+count+'>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</a></td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</td>';
    			html += '<td style="text-align: center;"><button style=" margin-left: 93px;" type="button" class="btn btn-info  editBloodManage" data-edit_id="'+count+'" id="bloodManageId'+count+'" value="'+obj[index].id+'">Edit</button>';
    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodManage" data-delete_id="'+count+'" id="bloodManageId'+count+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
    			$('.bloodManage').append(html);
    	 	});
    		var message=obj[0].bloodmanageupdate;
			console.log(message)
			if(message == "true"){
				$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Recored Update Successsfully");
        		$("#BloodManage_form")[0].reset();
        		$('#example').DataTable();
        		$("#update").prop("disabled", false);
    		}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            $("#update").prop("disabled", false);
        	}
    	});
	});
	
	$('#BloodDonorupdate_form').on('submit', function(event){
	    event.preventDefault();
	    var form = $('#BloodDonorupdate_form')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#blooddonorupdate").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "BloodManage",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = JSON.parse(response);
	        	table = $('#tableBloodDoner').DataTable();
	        	table.destroy();
	        	$('.bloodDonor').children('tr').remove();
	        	$.each(obj, function(index, value) {
	    			blooddoner++;
	    		   	var html = '';
	    		   	html += '<tr id='+blooddoner+'>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].name+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].age+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].gender+'</td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</a></td>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].lastdonationdate+'</td>';
	    			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodDonor" data-edit_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value="'+obj[index].id+'">Edit</button>';
	    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
	    			$('.bloodDonor').append(html);
	    	 	});
	        	var message=obj[0].bloodmanageupdate;
				console.log(message)
				if(message == "true"){
					$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Update Successsfully");
	        		$('#tableBloodDoner').DataTable();
	    		}
	            $("#blooddonorupdate").prop("disabled", false);
	        },
	        error: function (e) {
	            $("#result").text(e.responseText);
	            console.log("ERROR : ", e);
	            $("#blooddonorupdate").prop("disabled", false);
	        }
    	});
	});
	
	$(document).on('click', '.deleteBloodManage', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var bloodManage = $('#bloodManageId'+deleteid).val();
		var username = "deleteBloodManage";
		$.get('BloodManage',{flag:username , bloodManageId:bloodManage},function(response){
			var obj = JSON.parse(response);
        	table = $('#example').DataTable();
        	table.destroy();
        	$('.bloodManage').children('tr').remove();
    		$.each(obj, function(index, value) {
    			count++;
    		   	var html = '';
    		   	html += '<tr id='+count+'>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</a></td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</td>';
    			html += '<td style="text-align: center;"><button style=" margin-left: 93px;" type="button" class="btn btn-info  editBloodManage" data-edit_id="'+count+'" id="bloodManageId'+count+'" value="'+obj[index].id+'">Edit</button>';
    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodManage" data-delete_id="'+count+'" id="bloodManageId'+count+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
    			$('.bloodManage').append(html);
    	 	});
    		var message=obj[0].bloodmanageupdate;
			console.log(message)
			if(message == "true"){
				$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#example').DataTable();
        		$('#messagepass').text("Recored Delete Successsfully");
    		}
		});
	});
	
	$(document).on('click', '.deleteBloodDonor', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var bloodDonor = $('#bloodDonorId'+deleteid).val();
		var username = "deleteBloodDonor";
		$.get('BloodManage',{flag:username , bloodDonorId:bloodDonor},function(response){
			var obj = JSON.parse(response);
        	table = $('#tableBloodDoner').DataTable();
        	table.destroy();
        	$('.bloodDonor').children('tr').remove();
        	$.each(obj, function(index, value) {
    			blooddoner++;
    		   	var html = '';
    		   	html += '<tr id='+blooddoner+'>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].name+'</a></td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].bloodgroup+'</td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].age+'</a></td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].gender+'</td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].numberofbags+'</a></td>';
    		   	html += '<td style="padding-left: 15px; padding-top: 15px;">'+obj[index].lastdonationdate+'</td>';
    			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodDonor" data-edit_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value="'+obj[index].id+'">Edit</button>';
    			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="'+blooddoner+'" id="bloodDonorId'+blooddoner+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
    			$('.bloodDonor').append(html);
    	 	});
        	var message=obj[0].bloodmanageupdate;
			console.log(message)
			if(message == "true"){
				$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Recored Delete Successsfully");
        		$('#tableBloodDoner').DataTable();
    		}
		});
	});
	
 	$(".nav-tabs a").click(function(){
   		$("#BloodManagetab2").hide();
   		$("#BloodDonortab2").hide();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	});
});
</script>

<style type="text/css">
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
</style>
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
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="BloodManagetab">
					<a href="#home"	data-toggle="tab"><i class="fa fa-bars"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Blood Manage</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu1" id="BloodManagetab1" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i> Add Blood Group
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a id="BloodManagetab2" data-toggle="tab"href="#menu2" style="display: none;">
						<i class="fas fa-edit"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Blood Group</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu3" id="BloodDonortab" data-toggle="tab"><i class="fa fa-bars"aria-hidden="true"style="border-radius: 50%;padding: 8px;"></i>Blood Donor List</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a href="#menu4" id="BloodDonortab1" data-toggle="tab">
						<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Blood Donor
					</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
					<a id="BloodDonortab2" data-toggle="tab"href="#menu5" style="display: none;">
						<i class="fas fa-edit"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Blood Donor</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home"  class="container tab-pane active"style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
							<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="bloodManage">
			        </tbody>
			        <tfoot>
			            <tr>
			            	<th style="padding-left: 15px;">Blood Group</th>
							<th style="padding-left: 15px;">Number Of Bags</th>
							<th style="padding-left: 15px; text-align: center ;">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
   			 </div>
			<div id="menu1" class="tab-pane">
				<form id="BloodManage_form" style="margin-top: 20px;" >
					<div class="form-group row">
			    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
			    		<div class="col-sm-8 ">
			      			<select class="form-control " name="bloodgroup" required="required">
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
						<label class="col-sm-2 col-form-label text" >Number Of Bags<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<input type="number" class="form-control" name="numberofbags"  min="0" required>
						</div>
					</div>
					
					<input type="hidden" name="flag" value="insert" />
					<div class="col-sm-offset-2 col-sm-8">
						<input type="submit" value="Save" name="save_medicine" class="btn btn-success"style="margin-bottom: 15px;"/>
					</div>
				</form>
			</div>
			<div id="menu2" class="tab-pane" style="margin-top: 15px;">
				<form name="medicine_form" action="" method="post" class="form-horizontal" id="BloodManageupdate_form">
					<div class="form-group row"style="margin-top: 20px;">
			    		<label class="col-sm-2 col-form-label text" >Blood Group<span style="color: red;">*</span></label>
			    		<div class="col-sm-8 ">
			      			<select id="blood_group" class="form-control validate[required]" name="bloodgroup" required="required">
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
					<div class="form-group">
						<label class="col-sm-2 col-form-label text" >Number Of Bags<span style="color: red;">*</span></label>
						<div class="col-sm-8 ">
							<input id="number_Of_Bags" class="form-control " min="0" type="number" name="numberofbags">
						</div>
					</div>
					<div class="col-sm-offset-2 col-sm-8">
						<input type="hidden" name="flag" value="update">
						<input type="hidden" name="adminId" id="adminid">
						<input type="hidden" name="Id" id="bloodManageId">
						<input type="hidden" id="joiningdateid" name="joinig" >
						<input type="submit" value="Save" name="save_medicine" id="update" class="btn btn-success"style="margin-bottom: 15px;">
					</div>	
				</form>
			</div>
			<div id="menu3"  class="container tab-pane "style="margin-top: 10px;">
				<table id="tableBloodDoner" class="display table table-striped table-hover" style="width:100%">
		        <thead>
		            <tr>
						<th style="padding-left: 15px;">Name</th>
						<th style="padding-left: 15px;">Blood Group</th>
						<th style="padding-left: 15px;">Age</th>
						<th style="padding-left: 15px;">Gender</th>
						<th style="padding-left: 15px;">Number Of Bags</th>
						<th style="padding-left: 15px;">Last Donation Date</th>
						<th style="padding-left: 15px; text-align: center ;">Action</th>
		            </tr>
		        </thead>
		        <tbody class="bloodDonor">
		        </tbody>
		        <tfoot>
		            <tr>
		            	<th style="padding-left: 15px;">Name</th>
						<th style="padding-left: 15px;">Blood Group</th>
						<th style="padding-left: 15px;">Age</th>
						<th style="padding-left: 15px;">Gender</th>
						<th style="padding-left: 15px;">Number Of Bags</th>
						<th style="padding-left: 15px;">Last Donation Date</th>
						<th style="padding-left: 15px; text-align: center ;">Action</th>
		            </tr>
		        </tfoot>
		    	</table>
		    	<div style="margin-top: 26px;"></div>
   			 </div>
   			 <div id="menu4" class="tab-pane">
				<form id="BloodDonor_form" style="margin-top: 20px;" >
					<div class="form-group row">
						<label class="col-sm-2 text" for="first_name">Full Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  text-input" maxlength="50" type="text" value="" name="bool_dodnor_name"required>
						</div>
					</div>
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-8">
			      			<label class="radio-inline"><input type="radio" name="gender" value="male" required>Male</label>
							<label class="radio-inline"><input type="radio" name="gender" value="female" required>Female</label>
			    		</div>
		  			</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  text-input" min="0" max="99" type="number" onkeypress="if(this.value.length==2) return false;" value="" name="age" required>
						</div>
					</div>
					<div class="form-group row">	
						<label class="col-sm-2 text " for="phone">Phone<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control text-input" minlength="6" maxlength="15" type="text" value="" name="phone" required>						
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control  text-input" maxlength="100" type="text" name="email" value=""required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="bloodgruop">Blood Group<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<select class="form-control validate[required]" name="blood_group"required>
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
						<label class="col-sm-2 text" for="blood_status">Number Of Bags<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control validate[required] text-input" type="number" min="1"  value="" name="numberofbags"required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="last_donet_date">Last Donation Date</label>
						<div class="col-sm-8">
							<input  class="form-control " type="date"  name="last_donate_date">
						</div>
					</div>
					<div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
					<input type="hidden" name="flag" value="insertblooddonor">
			        	<input type="submit" value="Save" name="save_blooddonor" class="btn btn-success">
			        </div>
       			 </form>
			</div>
			<div id="menu5" class="tab-pane" style="margin-top: 15px;">
				<form id="BloodDonorupdate_form">
					<div class="form-group row">
						<label class="col-sm-2 text" for="first_name">Full Name<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="bloodDonorbool_dodnor_name" class="form-control  text-input" maxlength="50" type="text" value="" name="bool_dodnor_name"required>
						</div>
					</div>
					<div class="form-group row">
			    		<label  class="col-sm-2 col-form-label text" >Gender<span style="color: red;">*</span></label>
			    		<div class="col-sm-4">
			      			<label class="radio-inline"><input type="radio" id="bloodDonormale" name="gender" value="male" required>Male</label>
							<label class="radio-inline"><input type="radio" id="bloodDonorfemale" name="gender" value="female" required>Female</label>
			    		</div>
		  			</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="med_category_name">Age<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control" id="bloodDonoraeg" min="0" max="99" type="number" onkeypress="if(this.value.length==2) return false;" name="age" required>
						</div>
					</div>
					<div class="form-group row">	
						<label class="col-sm-2 text " for="phone">Phone<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="bloodDonorphone" class="form-control text-input" minlength="6" maxlength="15" type="text" value="" name="phone" required>						
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text " for="email">Email<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input id="bloodDonoremail" class="form-control  text-input" maxlength="100" type="text" name="email" value=""required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="bloodgruop">Blood Group<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<select id="bloodDonorblood_group" class="form-control validate[required]" name="blood_group"required>
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
						<label class="col-sm-2 text" for="blood_status">Number Of Bags<span class="require-field">*</span></label>
						<div class="col-sm-8">
							<input class="form-control" id="bloodDonorblood_status" type="number" min="1"  value="" name="numberofbags"required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 text" for="last_donet_date">Last Donation Date</label>
						<div class="col-sm-8">
							<input  class="form-control" id="bloodDonorlast_donet_date" type="date"  name="last_donate_date">
						</div>
					</div>
					<div class="col-sm-offset-2 col-sm-8">
						<input type="hidden" name="flag" value="blooddonorupdate">
						<input type="hidden" name="adminId" id="bloodDonorAdminid">
						<input type="hidden" name="Id" id="bloodDonorId">
						<input type="hidden" id="bloodDonorJoiningdateid" name="joinig" >
						<input type="submit" value="Save" name="save_medicine" id="blooddonorupdate" class="btn btn-success"style="margin-bottom: 15px;">
					</div>	
				</form>
			</div>
			</div>
		</div>
	</div>
</body>
</html>