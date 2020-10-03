$(document).ready(function(){
	var count = 0;
	var supportstaffusername;
	var username="accountantStaffList";
		$.get('AccountantStaff',{flag:username},function(response) {
			var obj = JSON.parse(response);
			$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td><img src="Accountant_Staff_Image/'+obj[index].profileimage+'" height="50px" width="50px" class="img-circle"></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;" ><a href="#">'+obj[index].firstname+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].mobileno+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].email+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  edit" data-edit_id="'+count+'" id="accountantStaffId'+count+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger delete" data-delete_id="'+count+'" id="accountantStaffId'+count+'" value="'+obj[index].id+'">Delete</button></td></tr>';
			$('.accountant').append(html);
	 	});
			 $('#example').DataTable();
	});
	$("#txt_username").keyup(function(){
		
	      var pharmacist = $(this).val().trim();
	      var username = "chackusername";
	      console.log(pharmacist);
	      if(pharmacist != ''){
	         $.ajax({
	            url: 'AccountantStaff',
	            type: 'post',
	            data: {flag:username , pharmacistusername1:pharmacist},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
	            	if(obj[0].chackusername == "false"){
	        			$("#btnSubmit").prop("disabled", true);
		                $('#available').html("Username Already Taken");		
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
	$("#username").keyup(function(){
	      var pharmacist = $(this).val().trim();
	      var username = "chackusername";
	      if(pharmacist != ''){
	         $.ajax({
	            url: 'AccountantStaff',
	            type: 'post',
	            data: {flag:username , pharmacistusername1:pharmacist},
	            success: function(response){
	            	var obj = JSON.parse(response);
	            	console.log(response);
		        	if(obj[0].chackusername == "false"){
		        		console.log("------------1245123461+7+4----------------");
		        		if(obj[0].username == supportstaffusername){
		        			console.log("-------------789456---------------");
		        			$('#available1').html("");
		        			$("#btnSubmit").prop("disabled", false);
		        		}else {
		        			console.log("--------------123456--------------");
		        			$("#btnSubmit").prop("disabled", true);
			                $('#available1').html("Username Already Taken");		
						}
	             	}
		        	else if (obj[0].chackusername == "true") {
		        		console.log("--------------dadada--------------");
		                $('#available1').html("");
		                $("#btnSubmit").prop("disabled", false);
					}
		        }
	         });
	      }else{
	         $("#available1").html("");
	      }
	 });
	$('#insert_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#insert_form')[0];
	    var data = new FormData(form);
	    console.log(form);
	    console.log(data);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "AccountantStaff",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	console.log(response);
	        	var obj = JSON.parse(response);
	        	if(obj[0].accountantstaffupdate == "true"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#insert_form")[0].reset();
	        	}
	        	else if(obj[0].accountantstaffemail == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id , Please try again");
	        	}
	        	
	        	else if(obj[0].accountantstaffemailinvalid == "false"){
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
		console.log(editid);
		var accountantStaff = $('#accountantStaffId'+editid).val();
		var username = "editAccountantStaff";
		$.get('AccountantStaff',{flag:username , accountantStaffId:accountantStaff},function(response){
 			$("#accountantStaffTab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#accountantStaffTab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#accountantStaffId').val(obj[0].id);
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
			$('#hometownaddress').val(obj[0].homeeaddrss);
			$('#homecity').val(obj[0].homecity);
			$('#homestate').val(obj[0].homestate);
			$('#homecountry').val(obj[0].homecountry);
			$('#homezipcode').val(obj[0].homezipcode);
			$('#standardcode').val(obj[0].mobilecountrycode);
			$('#mobilenumber').val(obj[0].mobileno);
			$('#phonenumber').val(obj[0].phoneno);
			$('#email').val(obj[0].email);
			$('#username').val(obj[0].username);
			supportstaffusername= obj[0].username;
			$('#password').val(obj[0].password);
			$('#chargeid').val(obj[0].charge);
			if(obj[0].profileimagename){
				$('#profileimageid').show();
				$('#profileimageid').text(obj[0].profileimagename);
				$('#editprofileImage').val(obj[0].profileimage);
				$("#coveredit").attr("src", "Accountant_Staff_Image/"+obj[0].profileimage+"");
			}else{
				$('#profileimageid').hide();
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
        url: "AccountantStaff",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response ,textStatus , jqXHR ){
        	var obj = JSON.parse(response);
        	console.log(obj);
        	if(obj[0].accountantstaffupdate == "true"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Recored Update Successsfully");
        		 $("#update").prop("disabled", false);
        		
        	}
        	else if(obj[0].accountantstaffemail == "false"){
        		$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Email Id  , Please try again");
        	}
        	
        	else if(obj[0].accountantstaffemailinvalid == "false"){
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
		var accountantStaff = $('#accountantStaffId'+deleteid).val();
		var username = "deleteAccountantStaff";
		$.get('AccountantStaff',{flag:username , accountantStaffId:accountantStaff},function(response){
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
   		$("#accountantStaffTab2").hide();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	    var supportStaffList =  $(this).text(); 
   	    console.log(supportStaffList);
   	    if(supportStaffList=="Accountant Staff List"){
   	    	location.reload();
   	    }
   	});
});