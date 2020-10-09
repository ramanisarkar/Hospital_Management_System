$(document).ready(function() {
	$(document).on('click', '.delete', function(){
  		var deleteid = $(this).data('delete_id');
  		console.log(deleteid);
  		var patient = $('#patientId'+deleteid).val();
 		var username = "deletePatient";
	 
 		$.get('Patient',{flag:username , patientId:patient},function(response){
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
	
	$(".nav-tabs a").click(function() {
		var patientList = $(this).text();
		console.log(patientList);
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
			console.log(response);
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
	      console.log(patient);
	      if(patient != ''){
	         $.ajax({
	            url: 'Patient',
	            type: 'post',
	            data: {flag:username , patientusername:patient},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
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
	        	console.log(obj);
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
		console.log(editid);
		var patient = $('#patientId'+editid).val();
		var username = "editPatient";
		$.get('Patient',{flag:username , patientId:patient},function(response){
 			$("#patientregistrationdiv1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#editpatientragistration").show();
			$('.nav-tabs a[href="#editmenu1"]').tab('show');
			$('#patientid').val(obj[0].id);
			$("#editpatientid").val(obj[0].patientid);
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
  				console.log(obj[0].profileimage);
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
			console.log(obj[0].adminttime);
			
			$('#edit_admint_time').val(obj[0].adminttime);
			$('#edit_status').val(obj[0].patientstatus);
			$('#edit_doctor').val(obj[0].doctorid);
			$('#editsymptoms').val(obj[0].symptoms);

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
            url: "Patient",
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
	
});