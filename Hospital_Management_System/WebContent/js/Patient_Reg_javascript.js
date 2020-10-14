$(document).ready(function() {
	$(document).on('click', '.delete', function(){
  		var deleteid = $(this).data('delete_id');
  		var patient = $('#patientId'+deleteid).val();
 		var username = "deletePatient";
	 
 		$.get('Patient',{flag:username , patientId:patient},function(response){
 			var message=response;
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
	
	$(".nav-tabs a").click(function() {
		var patientList = $(this).text();
		if (patientList == "Patient List") {
			location.reload();
		}
	});
	
	var count = 0;
	var username="patientList";
		$.get('Patient',{flag:username},function(response) {
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td><img src="Patient_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;" ><a href="#">'+obj[index].firstname+'</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;" >'+obj[index].patientid+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].mobileno+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].patientstatus+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].bloodgroup+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].doctorname+'</td>';
			html += '<td style="padding-left: 15px; padding-top: 23px;" >'+obj[index].admintdate+'</td>';
		   	
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="patientId'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="patientId'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
			$('.patient').append(html);
	 	});
			 $('#example').DataTable();
	});
		
	$('#insertpatientid').change(function(event){  
        var patient = $('#insertpatientid').val();
		var username = "insertPatientId";
		$.get('Patient',{flag:username , patientId:patient},function(response){
 			var obj = JSON.parse(response);
			$('#insertfirstname').val(obj[0].firstname);
			$('#insertmiddlename').val(obj[0].midalname);
			$('#insertlastname').val(obj[0].lastname);
			$('#insertdob').val(obj[0].date);
			var gender = obj[0].gender;
			if(gender=="male"){
				$("#insertmale").prop("checked", true);
			}
			else {
				$("#insertfemale").prop("checked", true);
			}
			$('#insertbloodgroup').val(obj[0].bloodgroup);
			$('#insertsymptoms').val(obj[0].symptoms);
			$('#inserthomeaddress').val(obj[0].homeeaddrss);
			$('#inserthomecity').val(obj[0].homecity);
			$('#inserthomestate').val(obj[0].homestate);
			$('#inserthomecountry').val(obj[0].homecountry);
			$('#inserthomezip').val(obj[0].homezipcode);
			$('#insertcode').val(obj[0].mobilecountrycode);
			$('#insertmobile').val(obj[0].mobileno);
			$('#insertphone').val(obj[0].phoneno);
			$('#insertguardian').val(obj[0].guardianid);
			$('#insertstep2patientid').val(obj[0].patientid);
		});
  	});
	
	$("#insertusername").keyup(function(){
	      var patient = $(this).val().trim();
	      var username = "chackusername";
	      if(patient != ''){
	         $.ajax({
	            url: 'Patient',
	            type: 'post',
	            data: {flag:username , patientusername:patient},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	if(obj[0].chackusername == "false"){
	        			$("#btnSubmit").prop("disabled", true);
		                $('#available').html("Username Already Taken");
						error_user_name = '';
						$('#error_user_name').text(error_user_name);
	             	}
		        	else if (obj[0].chackusername == "true") {
		                $('#available').html("");
		                $("#btnSubmit").prop("disabled", false);
					}
		        }
	         });
	      }else{
	         $("#available").html("");
	      }
	 });

	$('#register_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#register_form')[0];
        var data = new FormData(form);
        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Patient",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
            	var obj = response;
	        	if(obj== "success"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#register_form")[0].reset();
	        	}
	        	else if(obj == "error"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id Already Exist , Please try again");
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
		var patient = $('#patientId'+editid).val();
		var username = "editPatient";
		$.get('Patient',{flag:username , patientId:patient},function(response){
 			$("#patientregistrationdiv1").hide();
 			var obj = JSON.parse(response);
			$("#editpatientragistration").show();
			$('.nav-tabs a[href="#editmenu1"]').tab('show');
			$('#patientid').val(obj[0].id);
			$("#editpatientid").val(obj[0].patientintid);
			$('#adminid').val(obj[0].adminid);
			$('#joiningdateid').val(obj[0].joiningdate);
			$('#editfirstname').val(obj[0].firstname);
			$('#editmiddlename').val(obj[0].midalname);
			$('#editlastname').val(obj[0].lastname);
			$('#editdob').val(obj[0].date);
			$('#editbloodgroup').val(obj[0].bloodgroup);
			var gender = obj[0].gender;
			if(gender=="male"){
				$("#editmale").prop("checked", true);
			}
			else {
				$("#editfemale").prop("checked", true);
			}
			$('#edithomeaddress').val(obj[0].homeeaddrss);
			$('#edithomecity').val(obj[0].homecity);
			$('#edithomestate').val(obj[0].homestate);
			$('#edithomecountry').val(obj[0].homecountry);
			$('#edithomezip').val(obj[0].homezipcode);
			$('#editcode').val(obj[0].mobilecountrycode);
			$('#editmobile').val(obj[0].mobileno);
			$('#editphone').val(obj[0].phoneno);
			$('#editemail').val(obj[0].email);
			$('#editusername').val(obj[0].username);
			$('#editpassword').val(obj[0].password);
			if(obj[0].profileimagename){
  				$('#editpatientimageid').show();
  				$('#editpatientimageid').text(obj[0].profileimagename);
  				$('#editprofileImage').val(obj[0].profileimage);
  				$("#editpatientimage").attr("src", "Patient_Image/"+obj[0].profileimage+"");
  			}else{
  				$('#editpatientimageid').hide();
  			}
			$('#editguardianid').val(obj[0].guardianid);
			$('#editstep2patientid').val(obj[0].patientid);
			$('#edit_guardian_first_name').val(obj[0].guardianfirstname);
			$('#edit_guardian_middle_name').val(obj[0].guardianmidalname);
			$('#edit_guardian_last_name').val(obj[0].guardianlastname);
			var gender1 = obj[0].Guardiangender;
			if(gender1=="male"){
				$("#editgurdianmail").prop("checked", true);
			}
			else {
				$("#editgurdianfemail").prop("checked", true);
			}
			$('#edit_guardian_raletion').val(obj[0].relationwithpatient);
			$('#edit_guardian_home_address').val(obj[0].guardianhomeeaddrss);
			$('#edit_guardian_home_city').val(obj[0].guardianhomecity);
			$('#edit_guardian_home_state').val(obj[0].guardianhomestate);
			$('#edit_guardian_home_country').val(obj[0].guardianhomecountry);
			$('#edit_guardian_zip_code').val(obj[0].guardianhomezipcode);
			$('#edit_guardian_mobile').val(obj[0].guardianmobileno);
			$('#edit_guardian_phone').val(obj[0].guardianphoneno);
			if(obj[0].guardianimagename){
  				$('#editguardianimagid').show();
  				$('#editguardianimagid').text(obj[0].guardianimagename);
  				$('#editgurdianImage').val(obj[0].guardianimage);
  				$('#editgurdianimage').attr("src","Patient_Gurdian_Image/"+obj[0].guardianimage+"");
  			}else {
  				$('#editguardianimagid').hide();
			}
			$('#edit_admiit_date').val(obj[0].admintdate);
			$('#edit_admint_time').val(obj[0].adminttime);
			$('#edit_status').val(obj[0].patientstatus);
			$('#edit_doctor').val(obj[0].doctorid);
			$('#editsymptoms').val(obj[0].symptoms);

		});
	});
	$('#editpatientid').change(function(){  
        var patient = $('#editpatientid').val();
		var username = "insertPatientId";
		$.get('Patient',{flag:username , patientId:patient},function(response){
 			var obj = JSON.parse(response);
			$('#editfirstname').val(obj[0].firstname);
			$('#editmiddlename').val(obj[0].midalname);
			$('#editlastname').val(obj[0].lastname);
			$('#editdob').val(obj[0].date);
			var gender = obj[0].gender;
			if(gender=="male"){
				$("#editmale").prop("checked", true);
			}
			else {
				$("#editfemale").prop("checked", true);
			}
			$('#editbloodgroup').val(obj[0].bloodgroup);
			$('#editsymptoms').val(obj[0].symptoms);
			$('#edithomeaddress').val(obj[0].homeeaddrss);
			$('#edithomecity').val(obj[0].homecity);
			$('#edithomestate').val(obj[0].homestate);
			$('#edithomecountry').val(obj[0].homecountry);
			$('#edithomezip').val(obj[0].homezipcode);
			$('#editcode').val(obj[0].mobilecountrycode);
			$('#editmobile').val(obj[0].mobileno);
			$('#editphone').val(obj[0].phoneno);
			$('#editguardianid').val(obj[0].guardianid);
			$('#editstep2patientid').val(obj[0].patientid);
		});
  	});
	$('#update_form').on('submit', function(event){
        event.preventDefault();
        var form = $('#update_form')[0];
        var data = new FormData(form);
        $("#update").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Patient",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response ,textStatus , jqXHR ){
            	var obj = JSON.parse(response);
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
	
	$('.input-group.date').datepicker({format: "dd/mm/yyyy"});
	var filter = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	$("#list_personal_details").prop("disabled", true);
	$("#list_contact_details").prop("disabled", true);
	$('#btn_patient_details').click(function() {
		var error_patient_id = '';
		var error_first_name = '';
		var error_last_name = '';
		var error_date_of_birth = '';
		var error_blood_group = '';
		var error_home_address = '';
		var error_home_city = '';
		var error_zip_code = '';
		var error_code = '';
		var error_mobile_number = '';
		var error_email = '';
		var error_user_name = '';
		var error_password = '';
		if ($.trim($('#insertpatientid').val()).length == 0) {
			
			error_patient_id = 'Please Select Patient';
			$('#error_patient_id').text(error_patient_id);
		}
		else {
			error_patient_id = '';
			$('#error_patient_id').text(error_patient_id);
		}

		if ($.trim($('#insertfirstname').val()).length == 0) {
			
			error_first_name = 'First Name is required';
			$('#error_first_name').text(error_first_name);
		}
		else {
			error_first_name = '';
			$('#error_first_name').text(error_first_name);
		}


		if ($.trim($('#insertlastname').val()).length == 0) {
			error_last_name = 'Last Name is required';
			$('#error_last_name').text(error_last_name);
		}
		else {
			error_last_name = '';
			$('#error_last_name').text(error_last_name);
		}


		if ($.trim($('#insertdob').val()).length == 0) {
			error_date_of_birth = 'Date_Of_Birth is required';
			$('#error_date_of_birth').text(error_date_of_birth);
		}
		else {
			error_date_of_birth = '';
			$('#error_date_of_birth').text(error_date_of_birth);
		}


		if ($.trim($('#insertbloodgroup').val()).length == 0) {
			error_blood_group = 'Blood Group is required';
			$('#error_blood_group').text(error_blood_group);
		}
		else {
			error_blood_group = '';
			$('#error_blood_group').text(error_blood_group);
		}


		if ($.trim($('#inserthomeaddress').val()).length == 0) {
			error_home_address = 'Home Address is required';
			$('#error_home_address').text(error_home_address);
		}
		else {
			error_home_address = '';
			$('#error_home_address').text(error_home_address);
		}

		if ($.trim($('#inserthomecity').val()).length == 0) {
			error_home_city = 'City is required';
			$('#error_home_city').text(error_home_city);
		}
		else {
			error_home_city = '';
			$('#error_home_city').text(error_home_city);
		}


		if ($.trim($('#inserthomezip').val()).length == 0) {
			error_zip_code = 'Zip Code is required';
			$('#error_zip_code').text(error_zip_code);
		}
		else {
			error_zip_code = '';
			$('#error_zip_code').text(error_zip_code);
		}


		if ($.trim($('#insertcode').val()).length == 0) {
			error_code = 'Contry code is required';
			$('#error_code').text(error_code);
		}
		else {
			error_code = '';
			$('#error_code').text(error_code);
		}


		if ($.trim($('#insertmobile').val()).length == 0) {
			error_mobile_number = 'Mobile Number is required';
			$('#error_mobile_number').text(error_mobile_number);
		}
		else {
			error_mobile_number = '';
			$('#error_mobile_number').text(error_mobile_number);
		}


		if ($.trim($('#insertemail').val()).length == 0) {
			error_email = 'Email is required';
			$('#error_email').text(error_email);
		}
		else {
			if (!filter.test($('#insertemail').val())) {
				error_email = 'Invalid Email';
				$('#error_email').text(error_email);
			}
			else {
				error_email = '';
				$('#error_email').text(error_email);
			}
		}


		if ($.trim($('#insertusername').val()).length == 0) {
			error_user_name = 'User Name is required';
			$('#error_user_name').text(error_user_name);
		}
		else {
			error_user_name = '';
			$('#error_user_name').text(error_user_name);
		}


		if ($.trim($('#insertpassword').val()).length == 0) {
			error_password = 'Password is required';
			$('#error_password').text(error_password);
		}
		else {
			error_password = '';
			$('#error_password').text(error_password);
		}

		if (error_patient_id != '' || error_first_name != '' || error_last_name != '' || error_date_of_birth != '' || error_blood_group != '' || error_home_address != '' ||
			error_home_city != '' || error_zip_code != '' || error_code != '' || error_mobile_number != '' || error_email != '' || error_user_name != '' ||
			error_password != '') {
			return false;
		}

		else {
			$('.nav-tabs a[href="#addmenu2"]').tab('show');
		}
	});

	$('#btn_guardian_details').click(function() {
		var error_guardian_first_name = '';
		var error_guardian_last_name = '';
		var error_guardian_raletion = '';
		var error_guardian_home_address = '';
		var error_guardian_home_city = '';
		var error_guardian_zip_code = '';
		var error_guardian_mobile = '';

		if ($.trim($('#insert_guardian_first_name').val()).length == 0) {
			error_guardian_first_name = 'First Name is required';
			$('#error_guardian_first_name').text(error_guardian_first_name);
		}
		else {
			error_guardian_first_name = '';
			$('#error_guardian_first_name').text(error_guardian_first_name);
		}

		if ($.trim($('#insert_guardian_last_name').val()).length == 0) {
			error_guardian_last_name = 'Last Name is required';
			$('#error_guardian_last_name').text(error_guardian_last_name);
		}
		else {
			error_guardian_last_name = '';
			$('#error_guardian_last_name').text(error_guardian_last_name);
		}

		if ($.trim($('#insert_guardian_raletion').val()).length == 0) {
			error_guardian_raletion = 'Patient Raletion is required';
			$('#error_guardian_raletion').text(error_guardian_raletion);
		}
		else {
			error_guardian_raletion = '';
			$('#error_guardian_raletion').text(error_guardian_raletion);
		}

		if ($.trim($('#insert_guardian_home_address').val()).length == 0) {
			error_guardian_home_address = 'Home Address is required';
			$('#error_guardian_home_address').text(error_guardian_home_address);
		}
		else {
			error_guardian_home_address = '';
			$('#error_guardian_home_address').text(error_guardian_home_address);
		}

		if ($.trim($('#insert_guardian_home_city').val()).length == 0) {
			error_guardian_home_city = 'City is required';
			$('#error_guardian_home_city').text(error_guardian_home_city);
		}
		else {
			error_guardian_home_city = '';
			$('#error_guardian_home_city').text(error_guardian_home_city);
		}

		if ($.trim($('#insert_guardian_zip_code').val()).length == 0) {
			error_guardian_zip_code = 'Zip Code is required';
			$('#error_guardian_zip_code').text(error_guardian_zip_code);
		}
		else {
			error_guardian_zip_code = '';
			$('#error_guardian_zip_code').text(error_guardian_zip_code);
		}


		if ($.trim($('#insert_guardian_mobile').val()).length == 0) {
			error_guardian_mobile = 'Mobile Number is required';
			$('#error_guardian_mobile').text(error_guardian_mobile);
		}
		else {
			error_guardian_mobile = '';
			$('#error_guardian_mobile').text(error_guardian_mobile);
		}

		if (error_guardian_first_name != '' || error_guardian_last_name != '' || error_guardian_raletion != '' || error_guardian_zip_code != ''
			|| error_guardian_mobile != '') {
			return false;
		}

		else {
			$('.nav-tabs a[href="#addmenu3"]').tab('show');
		}
	});

	$('#btn_back_to_login_patient').click(function() {
		$('.nav-tabs a[href="#addmenu1"]').tab('show');
	});

	$('#btn_back_to_guardian_tab').click(function() {
		$('.nav-tabs a[href="#addmenu2"]').tab('show');
	});

	$('#btn_edit_patient_details').click(function() {
		var error_edit_patient_id = '';
		var error_edit_first_name = '';
		var error_edit_last_name = '';
		var error_edit_date_of_birth = '';
		var error_edit_blood_group = '';
		var error_edit_home_address = '';
		var error_edit_home_city = '';
		var error_edit_zip_code = '';
		var error_edit_code = '';
		var error_edit_mobile_number = '';
		var error_edit_email = '';
		var error_edit_user_name = '';
		var error_edit_password = '';

		if ($.trim($('#editpatientid').val()).length == 0) {
			error_edit_patient_id = 'Please Select Patient';
			$('#error_edit_patient_id').text(error_edit_patient_id);
		}
		else {
			error_edit_patient_id = '';
			$('#error_edit_patient_id').text(error_edit_patient_id);
		}

		if ($.trim($('#editfirstname').val()).length == 0) {
			error_edit_first_name = 'First Name is required';
			$('#error_edit_first_name').text(error_edit_first_name);
		}
		else {
			error_edit_first_name = '';
			$('#error_edit_first_name').text(error_edit_first_name);
		}

		if ($.trim($('#editlastname').val()).length == 0) {
			error_edit_last_name = 'Last Name is required';
			$('#error_edit_last_name').text(error_edit_last_name);
		}
		else {
			error_edit_last_name = '';
			$('#error_edit_last_name').text(error_edit_last_name);
		}


		if ($.trim($('#editdob').val()).length == 0) {
			error_edit_date_of_birth = 'Date_Of_Birth is required';
			$('#error_edit_date_of_birth').text(error_edit_date_of_birth);
		}
		else {
			error_edit_date_of_birth = '';
			$('#error_edit_date_of_birth').text(error_edit_date_of_birth);
		}


		if ($.trim($('#editbloodgroup').val()).length == 0) {
			error_edit_blood_group = 'Blood Group is required';
			$('#error_edit_blood_group').text(error_edit_blood_group);
		}
		else {
			error_edit_blood_group = '';
			$('#error_edit_blood_group').text(error_edit_blood_group);
		}


		if ($.trim($('#edithomeaddress').val()).length == 0) {
			error_edit_home_address = 'Home Address is required';
			$('#error_edit_home_address').text(error_edit_home_address);
		}
		else {
			error_edit_home_address = '';
			$('#error_edit_home_address').text(error_edit_home_address);
		}

		if ($.trim($('#edithomecity').val()).length == 0) {
			error_edit_home_city = 'City is required';
			$('#error_edit_home_city').text(error_edit_home_city);
		}
		else {
			error_edit_home_city = '';
			$('#error_edit_home_city').text(error_edit_home_city);
		}


		if ($.trim($('#edithomezip').val()).length == 0) {
			error_edit_zip_code = 'Zip Code is required';
			$('#error_edit_zip_code').text(error_edit_zip_code);
		}
		else {
			error_edit_zip_code = '';
			$('#error_edit_zip_code').text(error_edit_zip_code);
		}


		if ($.trim($('#editcode').val()).length == 0) {
			error_edit_code = 'Contry code is required';
			$('#error_edit_code').text(error_edit_code);
		}
		else {
			error_edit_code = '';
			$('#error_edit_code').text(error_edit_code);
		}


		if ($.trim($('#editmobile').val()).length == 0) {
			error_edit_mobile_number = 'Mobile Number is required';
			$('#error_edit_mobile_number').text(error_edit_mobile_number);
		}
		else {
			error_edit_mobile_number = '';
			$('#error_edit_mobile_number').text(error_edit_mobile_number);
		}


		if ($.trim($('#editemail').val()).length == 0) {
			error_edit_email = 'Email is required';
			$('#error_edit_email').text(error_edit_email);
		}
		else {
			if (!filter.test($('#editemail').val())) {
				error_edit_email = 'Invalid Email';
				$('#error_edit_email').text(error_edit_email);
			}
			else {
				error_edit_email = '';
				$('#error_edit_email').text(error_edit_email);
			}
		}


		if ($.trim($('#editusername').val()).length == 0) {
			error_edit_user_name = 'User Name is required';
			$('#error_edit_user_name').text(error_edit_user_name);
		}
		else {
			error_edit_user_name = '';
			$('#error_edit_user_name').text(error_edit_user_name);
		}


		if ($.trim($('#editpassword').val()).length == 0) {
			error_edit_password = 'Password is required';
			$('#error_edit_password').text(error_edit_password);
		}
		else {
			error_edit_password = '';
			$('#error_edit_password').text(error_edit_password);
		}

		if (error_edit_patient_id != '' || error_edit_first_name != '' || error_edit_last_name != '' || error_edit_date_of_birth != '' || error_edit_blood_group != '' || error_edit_home_address != '' ||
			error_edit_home_city != '' || error_edit_zip_code != '' || error_edit_code != '' || error_edit_mobile_number != '' || error_edit_email != '' || error_edit_user_name != '' ||
			error_edit_password != '') {
			return false;
		}

		else {
			$('.nav-tabs a[href="#editmenu2"]').tab('show');
		}
	});

	$('#btn_edit_guardian_details').click(function() {
		var error_edit_guardian_first_name = '';
		var error_edit_guardian_last_name = '';
		var error_edit_guardian_raletion = '';
		var error_edit_guardian_home_address = '';
		var error_edit_guardian_home_city = '';
		var error_edit_guardian_zip_code = '';
		var error_edit_guardian_mobile = '';

		if ($.trim($('#edit_guardian_first_name').val()).length == 0) {
			error_edit_guardian_first_name = 'First Name is required';
			$('#error_edit_guardian_first_name').text(error_edit_guardian_first_name);
		}
		else {
			error_edit_guardian_first_name = '';
			$('#error_edit_guardian_first_name').text(error_edit_guardian_first_name);
		}

		if ($.trim($('#edit_guardian_last_name').val()).length == 0) {
			error_edit_guardian_last_name = 'Last Name is required';
			$('#error_edit_guardian_last_name').text(error_edit_guardian_last_name);
		}
		else {
			error_edit_guardian_last_name = '';
			$('#error_edit_guardian_last_name').text(error_edit_guardian_last_name);
		}

		if ($.trim($('#edit_guardian_raletion').val()).length == 0) {
			error_edit_guardian_raletion = 'Patient Raletion is required';
			$('#error_edit_guardian_raletion').text(error_edit_guardian_raletion);
		}
		else {
			error_edit_guardian_raletion = '';
			$('#error_edit_guardian_raletion').text(error_edit_guardian_raletion);
		}

		if ($.trim($('#edit_guardian_home_address').val()).length == 0) {
			error_edit_guardian_home_address = 'Home Address is required';
			$('#error_edit_guardian_home_address').text(error_edit_guardian_home_address);
		}
		else {
			error_edit_guardian_home_address = '';
			$('#error_edit_guardian_home_address').text(error_edit_guardian_home_address);
		}

		if ($.trim($('#edit_guardian_home_city').val()).length == 0) {
			error_edit_guardian_home_city = 'City is required';
			$('#error_edit_guardian_home_city').text(error_edit_guardian_home_city);
		}
		else {
			error_edit_guardian_home_city = '';
			$('#error_edit_guardian_home_city').text(error_edit_guardian_home_city);
		}

		if ($.trim($('#edit_guardian_zip_code').val()).length == 0) {
			error_edit_guardian_zip_code = 'Zip Code is required';
			$('#error_edit_guardian_zip_code').text(error_edit_guardian_zip_code);
		}
		else {
			error_edit_guardian_zip_code = '';
			$('#error_edit_guardian_zip_code').text(error_edit_guardian_zip_code);
		}


		if ($.trim($('#edit_guardian_mobile').val()).length == 0) {
			error_edit_guardian_mobile = 'Mobile Number is required';
			$('#error_edit_guardian_mobile').text(error_edit_guardian_mobile);
		}
		else {
			error_edit_guardian_mobile = '';
			$('#error_edit_guardian_mobile').text(error_edit_guardian_mobile);
		}

		if (error_edit_guardian_first_name != '' || error_edit_guardian_last_name != '' || error_edit_guardian_raletion != '' || error_edit_guardian_zip_code != ''
			|| error_edit_guardian_mobile != '') {
			return false;
		}

		else {
			$('.nav-tabs a[href="#editmenu3"]').tab('show');
		}
	});

	$('#btn_edit_back_to_login_patient').click(function() {
		$('.nav-tabs a[href="#editmenu1"]').tab('show');
	});

	$('#btn_edit_back_to_guardian_tab').click(function() {
		$('.nav-tabs a[href="#editmenu2"]').tab('show');
	});
});