<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script>
$(document).ready(function(){
	 $('#insert_form').on('submit', function(event){
        event.preventDefault();
        var form = $('#insert_form')[0];
        var data = new FormData(form);
        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Admin",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response ,textStatus , jqXHR ){
            	var re=response;
            	console.log(re);
            	if(re == "Email id"){
            		$('#emailid').text("Email ID already exist")
            		$('#success').empty();
            	}
            	else if(re == "Email id Error"){
            		$('#emailid').text("Please valid email id")
            		$('#success').empty();
            	}
            	else if(re == "Success"){
            		
            		$('#success').text("Recored Add Successsfully");
            		$('#insert_form')[0].reset();
                	$('#blah').remove();
                	$('#cover').remove();
                	$('#emailid').empty();
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
});
</script>
<style type="text/css">
.text {
	text-align: right;
	padding-right: 20px;
}

.border {
	border-bottom: 1px solid gray;
}
.image{
    margin-left: 211px;
    margin-top: 43px;
}
.chakbox{
    margin-left: 8px;
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40"> <span style="font-size:22px; ">Hospital
					Management System</span>
			</h3>
		</div>
	</div>

	<div>
		<h3 style="margin-left: 8%;">General Settings</h3>
		<div style="color: green; margin-left: 26.4;" id="success"></div>
		<div class="container">
		
		<form id="insert_form" method="post" enctype="multipart/form-data">
			<div class="form-group row">
	    		<label for="hospitalname" class="col-sm-2 col-form-label text" >Hospital Name<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input type="text" class="form-control" id="hospitalname" name="hospitalname" placeholder="Hospital Name"  required>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label class="col-sm-2 col-form-label text" >Starting Year</label>
	    		<div class="col-sm-10">
	      			<input type="tel" class="form-control" name="startingyear" pattern="[0-9]{4}"  placeholder="Starting Year">
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Hospital Address<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input type="text" class="form-control" name="hospitaladdress" placeholder="Hospital Addres" required>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label class="col-sm-2 col-form-label text" >Office Phone Number<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input type="tel" class="form-control" name="officeno" placeholder="123-456-7890" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" required>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Country<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<select class="form-control"  name="country"  required>
	      				<option value="" disabled selected hidden>Select Country</option>	
						<option value="Afganistan">Afghanistan</option>
						<option value="Albania">Albania</option>
						<option value="Algeria">Algeria</option>
						<option value="American Samoa">American Samoa</option>
					</select>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Select Currency<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<select  class="form-control" name="currency" required="required">
	      				<option value="" disabled selected hidden="">Select Currency</option>	
						<option value="rupee">&#8377;(Rupee)</option>
					</select>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Email<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input type="email" class="form-control" name="email" placeholder="Hospital email"  required >
	      			<div id="emailid" style="color:red;"></div>
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Password<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input class="form-control" type="password" name="pass" placeholder="Password" required >
	      			
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Hospital Logo<span style="color: red;">*</span></label>
	    		<div class="col-sm-10">
	      			<input type="file" name="hospitallogo" accept="image/*"
						onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
						
						
	    		</div>
	    	
	    		<div class="image">
	    			<img id="blah" alt="your image" width="100" height="100" />
	    		</div>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Profile Cover Image</label>
	    		<div class="col-sm-10">
	      			<input type="file" name="coverimage" accept="image/*"
						onchange="document.getElementById('cover').src = window.URL.createObjectURL(this.files[0])">
	    		</div>
	    		<div class="image">
	    			<img id="cover" alt="your image" width="900" height="300" />
	    		</div>
  			</div>
  			<div>
  				<label >User Can Change Profile Picture Settings</label>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >User Can Change Profile</label>
	    		<div class="col-sm-10">
	      			<input type="checkbox" name="userchangeprofile"
						value="True"><label class="chakbox">Enable</label>
	    		</div>
  			</div>
  			<div style="border-bottom: 1px solid gray; ">
  			</div>
  			<div style="margin-top: 2px;">
  				<label>Keeps Hospital Name In Prescription Print</label>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Hospital Name Print In Prescription</label>
	    		<div class="col-sm-10">
	      			<input type="checkbox" name="prescriptionprint"
						value="True"><label class="chakbox">Enable</label>
	    		</div>
  			</div>
  			<div style="border-bottom: 1px solid gray; ">
  			</div>
  			<div style="margin-top: 2px;">
  				<label>Massage Settings</label>
  			</div>
  			<div class="form-group row">
	    		<label  class="col-sm-2 col-form-label text" >Staff Can Message To Admin</label>
	    		<div class="col-sm-10 ">
	      			<input type="checkbox" name="staffmessage"
						value="True"><label class="chakbox">Enable</label>
	    		</div>
  			</div>
  			<div>
  				<input type="hidden" name="flag" value="insert">
  				<input  class="btn btn-info" type="submit" value="Submit" id="btnSubmit"style="margin-left: 17%;background-color:green;"/>
  			</div>
		</form>
		<div style="margin-top: -25px;">
			<a class="btn btn-info" href="Com_Login.jsp" style="margin-left: 88%;margin-top: -15px; background-color:green;">Go To Login Page</a>
		</div>
	</div>
</div>
</body>
</html>