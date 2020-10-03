<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
$(document).ready(function(){
	  var count = 1;
  	$(document).on('click', '.add_more_report', function(){
		count++;
		$(".diagnosissnosis_div").append('<div class="form-group"><label class="col-sm-1 control-label" >Diagnosis Report</label><div class="col-sm-2"><input type="file" class="form-control" name="diagnosis'+count+'"></div><div class="col-sm-2"><input type="button" value="Delete" onclick="deleteParentElement(this)" class="remove_cirtificate btn btn-default"></div></div>');
		$('#count').val(count);
	});
	$(document).on("click", ".remove_cirtificate", function()
	{
		alert("Do you really want to delete this record ?");
		$(this).parent().parent().remove();
	});

	 $('#insert_form').on('submit', function(event){
	        event.preventDefault();
	        var form = $('#insert_form')[0];
	        var data = new FormData(form);
	        $("#btnSubmit").prop("disabled", true);
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "PatientRegistration",
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
  .require-field{
  color: red;
  }
  label{
  	text-align: right;
  }
  </style>
</head>
<body>
    <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="    margin-top: -8px;"> <span style="font-size:22px ">Hospital
					Management System</span>
			</h3>
		</div>
	</div>

	<form id="insert_form" method="post" enctype="multipart/form-data">
  		
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="first_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="first_name">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="middle_name" >Middle Name</label>
			<div class="col-sm-8">
				<input id="middle_name" class="form-control validate[custom[onlyLetter_specialcharacter]]" maxlength="50" type="text" value="" name="middle_name">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="last_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="last_name">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
			<div class="col-sm-8">
							<label class="radio-inline">
			     <input type="radio" value="male" class="tog validate[required]" name="gender" checked="checked">Male			    </label>
			    <label class="radio-inline">
			      <input type="radio" value="female" class="tog validate[required]" name="gender">Female 
			    </label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="birth_date" class="form-control validate[required] " type="date"  name="birth_date">
			</div>
		</div>		
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="blood_group">Blood Group<span class="require-field">*</span></label>
			<div class="col-sm-8">
								<select id="blood_group" class="form-control validate[required]" name="blood_group">
				<option value="">Select Blood Group</option>
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
				<label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
				<div class="col-sm-8">
					<input class="form-control validate[required]" type="text" name="symptoms" >
				</div>					
			</div>	
		<div class="diagnosissnosis_div">
			<div class="form-group row">
				<label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
				<div class="col-sm-8">
					<input type="file" class="form-control file dignosisreport" name="diagnosis1">
				</div>
			</div>	
		</div>
		<div class="form-group row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8 row">
				<input type="button" value="Add More Report" name="add_more_report" class="add_more_report btn btn-default" style="margin-left: 15px;">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="address" class="form-control validate[required,custom[address_description_validation]]" type="text" maxlength="150" name="address" value="">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="city_name">City<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="city_name" class="form-control validate[required,custom[city_state_country_validation]]" type="text" name="city_name" maxlength="50" value="">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="state_name">State</label>
			<div class="col-sm-8">
				<input id="state_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="state_name" maxlength="50" value="">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="state_name">Country</label>
			<div class="col-sm-8">
				<input id="country_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="country_name" maxlength="50" value="">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="zip_code" class="form-control  validate[required,custom[onlyLetterNumber]]" type="text" maxlength="15" name="zip_code" value="">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label " for="mobile">Mobile<span class="require-field">*</span></label>
			<div class="col-sm-1" style="padding-right: 0px;">
			<input type="text" value="+91" class="form-control  validate[required] onlynumber_and_plussign" name="phonecode" maxlength="5">
			</div>
			<div class="col-sm-7">
				<input id="mobile" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="mobile">				
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label " for="phone">Phone</label>
			<div class="col-sm-8">
				<input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="phone">				
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="email" class="form-control validate[required,custom[email]] text-input" maxlength="100" type="text" name="email" value="">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="username" class="form-control validate[required,custom[username_validation]]" type="text" name="username" maxlength="30" value="">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label" for="password">Password<span class="require-field">*</span></label>
			<div class="col-sm-8">
				<input id="password" class="form-control validate[required,minSize[8]]" type="password" name="password" maxlength="12" value="">
			</div>
		</div>
	
			<div class="form-group row">
			<label class="col-sm-2 control-label" for="photo">Image</label>
			
				<div class="col-sm-8">
				<input class="form-control file" type="file" name="profileimage" accept="image/*" 
								onchange="document.getElementById('coveredit').src = window.URL.createObjectURL(this.files[0])">
				</div>
				
				<div class="form-group row">
			    		<div class="image">
			    			<img id="coveredit" alt="your image" width="150" height="150" style="margin-left: 290px; margin-top: 10px;" />
			    		</div>
  					</div>
			</div>	
			<div class="col-sm-offset-2 col-sm-8">
        	<input type="hidden" name="flag" value="insert">
        	<input type="hidden" name="count" id="count" >
        	<input type="submit" value="Patient Registration" name="registration_front_patient" class="btn btn-success">
        </div>
    </form>
</body>
</html>