$(document).ready(function() {
	var username = "bloodstock";
	var count = 0;
	$.post('BloodManage', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$.each(obj, function(index, value) {
			if (obj[index].numberofbags <= 5) {
				$("#stockchak" + count + "").addClass("info-box1");
			} else if (obj[index].numberofbags > 5 && obj[index].numberofbags <= 10) {
				$("#stockchak" + count + "").addClass("info-box2");
			}
			else if (obj[index].numberofbags > 10) {
				$("#stockchak" + count + "").addClass("info-box3");
			}
			count++;
		});
		$('#obloodstock').text(obj[0].numberofbags);
		$('#o-bloodstock1').text(obj[1].numberofbags);
		$('#abloodstock2').text(obj[2].numberofbags);
		$('#a-bloodstock3').text(obj[3].numberofbags);
		$('#bbloodstock4').text(obj[4].numberofbags);
		$('#b-bloodstock5').text(obj[5].numberofbags);
		$('#abbloodstock6').text(obj[6].numberofbags);
		$('#ab-bloodstock7').text(obj[7].numberofbags);
	});
	var blooddoner = 0;
	var username = "donorList";
	$.get('BloodManage', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			blooddoner++;
			var html = '';
			html += '<tr id=' + blooddoner + '>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].donorid + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].age + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].email + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].phone + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].joiningdate + '</td>';
			html += '<td style="text-align: center;"><button style="margin-left: 10px; " type="button" class="btn btn-info viewBloodDonor" data-view_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">View</button>';
			html += '<button style="margin-left: 10px;" type="button" class="btn btn-warning  editBloodDonor" data-edit_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Delete</button></td></tr>';

			$('.bloodDonorList').append(html);
		});
		$("#donorcount").text(blooddoner);
		$('#tableBloodDoner').DataTable();
		var select = $('#inworddonorid');
		select.find('option').remove();
		$('<option disabled selected hidden="">').val("").text("Select Donor").appendTo(select);
		$.each(obj, function(index, value) {
			$('<option>').val(obj[index].id).text(obj[index].donorid).appendTo(select);
		});
		var selectedit = $('#inworddonoreditid');
		selectedit.find('option').remove();
		$('<option disabled selected hidden="">').val("").text("Select Donor").appendTo(selectedit);
		$.each(obj, function(index, value) {
			$('<option>').val(obj[index].id).text(obj[index].donorid).appendTo(selectedit);
		});
	});
	var bloodinword = 0;
	var username = "bloodinwordlist";
	$.get('BloodManage', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			bloodinword++;
			var html = '';
			html += '<tr id=' + bloodinword + '>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].age + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].address + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].numberofbags + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].lastdonationdate + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodInword" data-edit_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodInword" data-delete_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.bloodinwordList').append(html);
		});
		$('#tableBloodInword').DataTable();
	});
	var bloodoutword = 0;
	var username = "bloodoutwordlist";
	$.get('BloodManage', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			bloodoutword++;
			var html = '';
			html += '<tr id=' + bloodinword + '>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].email + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].Mobile + '</a></td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].numberofbags + '</td>';
			html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].lastdonationdate + '</td>';
			html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodInword" data-edit_id="' + bloodoutword + '" id="bloodInwordId' + bloodoutword + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodInword" data-delete_id="' + bloodoutword + '" id="bloodInwordId' + bloodoutword + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.bloodOutwordList').append(html);
		});
		$('#tableoutwordlist').DataTable();
	});
	$('#bloodDonor_form').on('submit', function(event) {
		event.preventDefault();
		var form = $('#bloodDonor_form')[0];
		var data = new FormData(form);
		console.log("data");
		console.log("form");
		$("#blooddonerbten").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "BloodManage",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(response, textStatus, jqXHR) {
				var obj = JSON.parse(response);
				var donorcount = 0;
				table = $('#tableBloodDoner').DataTable();
				table.destroy();
				$('.bloodDonorList').children('tr').remove();
				$.each(obj, function(index, value) {
					blooddoner++;
					donorcount++;
					var html = '';
					html += '<tr id=' + blooddoner + '>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].donorid + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].age + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].email + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].phone + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].joiningdate + '</td>';
					html += '<td style="text-align: center;"><button style="margin-left: 10px; " type="button" class="btn btn-info viewBloodDonor" data-view_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '"value="' + obj[index].id + '">View</button>';
					html += '<button style="margin-left: 10px;"type="button" class="btn btn-warning  editBloodDonor" data-edit_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Edit</button>';
					html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Delete</button></td></tr>';
					$('.bloodDonorList').append(html);
				});
				console.log(blooddoner);
				$("#donorcount").text(donorcount);
				var select = $('#inworddonorid');
				select.find('option').remove();
				$('<option disabled selected hidden="">').val("").text("Select Donor").appendTo(select);
				$.each(obj, function(index, value) {
					$('<option>').val(obj[index].id).text(obj[index].donorid).appendTo(select);
				});
				var editbloodinaword = $('#inworddonoreditid');
				editbloodinaword.find('option').remove();
				$('<option disabled selected hidden="">').val("").text("Select Donor").appendTo(editbloodinaword);
				$.each(obj, function(index, value) {
					$('<option>').val(obj[index].id).text(obj[index].donorid).appendTo(editbloodinaword);
				});
				var message = obj[0].bloodmanageupdate;

				console.log(message)
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#bloodDonor_form")[0].reset();
					$('#tableBloodDoner').DataTable();
				}
				$("#blooddonerbten").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#blooddonerbten").prop("disabled", false);
			}
		});
	});
	$(document).on('click', '.viewBloodDonor', function() {
		var viewid = $(this).data('view_id');
		console.log(viewid);
		var bloodDonor = $('#bloodDonorId' + viewid).val();
		var username = "editBloodDonor";
		$.get('BloodManage', { flag: username, bloodDonorId: bloodDonor }, function(response) {
			$("#Bloodtab2").hide();
			var obj = JSON.parse(response);
			console.log(response);
			$("#Bloodtab10").show();
			$('.nav-tabs a[href="#menu10"]').tab('show');
			$('#bloodDonorIdedit').val(obj[0].id);
			$('#viewFirstName').val(obj[0].name);
			$('#viewMiddleName').val(obj[0].middelname);
			$('#viewLastName').val(obj[0].lastname);
			$('#viewDOB').val(obj[0].dob);
			$('#viewEmail').val(obj[0].email);
			var gender = obj[0].gender;
			if (gender == "male") {
				$("#viewMale").prop("checked", true);
			}
			else {
				$("#ViewFemale").prop("checked", true);
			}
			$('#viewAge').val(obj[0].age);
			$('#viewBloodgroup').val(obj[0].bloodgroup);
			$('#viewCode').val(obj[0].countrycode);
			$('#viewMobile').val(obj[0].mobileno);
			$('#viewPhone').val(obj[0].phone);
		});
		var view_Blood_Inword = 0;
		var username = "viewBloodDonor";
		$.get('BloodManage', { flag: username, bloodDonorId: bloodDonor }, function(response) {
			var obj = JSON.parse(response);
			console.log(obj);
			console.log(response);
			table = $('#tableBloodDonorView1').DataTable();
			table.destroy();
			$('.viewbloodinworddetails').children('tr').remove();
			$.each(obj, function(index, value) {
				view_Blood_Inword++;
				var html = '';

				html += '<tr id=' + view_Blood_Inword + '>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].donorid + '</a></td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].address + '</a></td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].numberofbags + '</td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].lastdonationdate + '</td></tr>';
				$('.viewbloodinworddetails').append(html);
			});
			console.log("complete");
			$('#tableBloodDonorView1').DataTable();
		});
	});

	$(document).on('click', '.editBloodDonor', function() {
		var editid = $(this).data('edit_id');
		console.log(editid);
		var bloodDonor = $('#bloodDonorId' + editid).val();
		var username = "editBloodDonor";
		var username1 = "viewBloodDonor";
		console.log(bloodDonor);
		$.get('BloodManage', { flag: username, bloodDonorId: bloodDonor }, function(response) {
			$("#Bloodtab2").hide();
			$("#Bloodtab10").hide();
			var obj = JSON.parse(response);
			console.log(response);
			$("#Bloodtab3").show();
			$('.nav-tabs a[href="#menu3"]').tab('show');
			$('#blodoonerid').val(obj[0].donorid);
			$('#bloodDonorId').val(obj[0].id);
			$('#bloodDonorAdminid').val(obj[0].adminid);
			$('#bloodDonorJoiningdate').val(obj[0].joiningdate);
			$('#donerfirstname').val(obj[0].name);
			$('#donermiddlename').val(obj[0].middelname);
			$('#donerlastname').val(obj[0].lastname);
			$('#donordob').val(obj[0].dob);
			$('#donoremail').val(obj[0].email);
			var gender = obj[0].gender;
			if (gender == "male") {
				$("#donortgender").prop("checked", true);
			}
			else {
				$("#donortgenderf").prop("checked", true);
			}
			$('#donoraeg').val(obj[0].age);
			$('#donorblood_group').val(obj[0].bloodgroup);
			$('#donorcode').val(obj[0].countrycode);
			$('#donormobile').val(obj[0].mobileno);
			$('#donorphone').val(obj[0].phone);
		});
		$.get('BloodManage', { flag: username1, bloodDonorId: bloodDonor }, function(response) {
			var obj = JSON.parse(response);
			table = $('#tableBloodDonorHistry').DataTable();
			table.destroy();
			$('.blooddonorhistry').children('tr').remove();
			$.each(obj, function(index, value) {
				bloodinword++;
				var html = '';
				html += '<tr id=' + bloodinword + '>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].address + '</a></td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].numberofbags + '</td>';
				html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].lastdonationdate + '</td>';
				html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodInword" data-edit_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '"value="' + obj[index].id + '">Edit</button>';
				html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodInword" data-delete_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '" value="' + obj[index].id + '">Delete</button></td></tr>';
				$('.blooddonorhistry').append(html);
			});
			$('#tableBloodDonorHistry').DataTable();
		});
	});
	$('#updateBloodDonor_form').on('submit', function(event) {
		event.preventDefault();
		var form = $('#updateBloodDonor_form')[0];
		var data = new FormData(form);
		console.log(form);
		console.log(data);
		$("#donorupdatebtn").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "BloodManage",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(response, textStatus, jqXHR) {
				var obj = JSON.parse(response);

				table = $('#tableBloodDoner').DataTable();
				table.destroy();
				$('.bloodDonorList').children('tr').remove();
				$.each(obj, function(index, value) {
					var html = '';
					html += '<tr id=' + blooddoner + '>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].donorid + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].age + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].email + '</a></td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].phone + '</td>';
					html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].joiningdate + '</td>';
					html += '<td style="text-align: center;"><button style="margin-left: 10px; " type="button" class="btn btn-info viewBloodDonor" data-view_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">View</button>';
					html += '<button style="margin-left: 10px;"type="button" class="btn btn-warning  editBloodDonor" data-edit_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Edit</button>';
					html += '<button style="margin-left: 10px;" type="button" class="btn btn-danger deleteBloodDonor" data-delete_id="' + blooddoner + '" id="bloodDonorId' + blooddoner + '" value="' + obj[index].id + '">Delete</button></td></tr>';
					$('.bloodDonorList').append(html);
				});

				var message = obj[0].bloodmanageupdate;
				console.log(message)
				if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Update Successsfully");
					$('#tableBloodDoner').DataTable();
				}
				$("#donorupdatebtn").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#donorupdatebtn").prop("disabled", false);
			}
		});
	});
	$('#inworddonorid').change(function(event) {
		var username = "editBloodDonor";
		var bloodDonor = $('#inworddonorid').val();
		console.log(bloodDonor);
		$.get('BloodManage', { flag: username, bloodDonorId: bloodDonor }, function(response) {
			var obj = JSON.parse(response);
			console.log(response);
			$('#inwordemail').val(obj[0].email);
			var gender = obj[0].gender;
			if (gender == "male") {
				$("#inwordmale").prop("checked", true);
			}
			else {
				$("#inwordfemale").prop("checked", true);
			}
			$('#inwordage').val(obj[0].age);
			$('#inwordbloodgroup').val(obj[0].bloodgroup);
			$('#inwordphone').val(obj[0].mobileno);
		});
	});


	$('#bloodInword_form').on('submit', function(event) {
		event.preventDefault();
		var form = $('#bloodInword_form')[0];
		var data = new FormData(form);
		var count1 = 0;
		console.log("data");
		console.log("form");
		$("#inwordsubmit").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "BloodManage",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(response) {
				var obj = JSON.parse(response);
				console.log(response);
				$.each(obj, function(index, value) {
					if (obj[index].numberofbags <= 5) {
						$("#stockchak"+count1+"").addClass("info-box1");
					} else if (obj[index].numberofbags > 5 && obj[index].numberofbags <= 10) {
						$("#stockchak"+count1+"").addClass("info-box2");
					}
					else if (obj[index].numberofbags > 10) {
						$("#stockchak"+count1+"").addClass("info-box3");
					}
					count1++;
				});
				$('#obloodstock').text(obj[0].numberofbags);
				$('#o-bloodstock1').text(obj[1].numberofbags);
				$('#abloodstock2').text(obj[2].numberofbags);
				$('#a-bloodstock3').text(obj[3].numberofbags);
				$('#bbloodstock4').text(obj[4].numberofbags);
				$('#b-bloodstock5').text(obj[5].numberofbags);
				$('#abbloodstock6').text(obj[6].numberofbags);
				$('#ab-bloodstock7').text(obj[7].numberofbags);
				var bloodinword = 0;
				var status = obj[0].bloodmanageupdate;
				if (status == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#bloodInword_form")[0].reset();
					var bloodinword;
					var username = "bloodinwordlist";
					$.get('BloodManage', { flag: username }, function(response) {
						var obj = JSON.parse(response);
						table = $('#tableBloodInword').DataTable();
						table.destroy();
						$('.bloodinwordList').children('tr').remove();
						$.each(obj, function(index, value) {
							bloodinword++;
							var html = '';
							html += '<tr id=' + bloodinword + '>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].name + '</td>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].bloodgroup + '</a></td>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].age + '</td>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].address + '</a></td>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].numberofbags + '</td>';
							html += '<td style="padding-left: 15px; padding-top: 15px;">' + obj[index].lastdonationdate + '</td>';
							html += '<td style="text-align: center;"><button style="" type="button" class="btn btn-info  editBloodInword" data-edit_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '"value="' + obj[index].id + '">Edit</button>';
							html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteBloodInword" data-delete_id="' + bloodinword + '" id="bloodInwordId' + bloodinword + '" value="' + obj[index].id + '">Delete</button></td></tr>';
							$('.bloodinwordList').append(html);
						});
						$('#tableBloodInword').DataTable();
					});
				}
				$("#inwordsubmit").prop("disabled", false);
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#inwordsubmit").prop("disabled", false);
			}
		});
	});

	$(document).on('click', '.editBloodInword', function() {
		var editid = $(this).data('edit_id');
		console.log(editid);
		var bloodInword = $('#bloodInwordId' + editid).val();
		console.log(bloodInword);
		var username = "editBloodInword";
		$.get('BloodManage', { flag: username, bloodInwordId: bloodInword }, function(response) {
			$("#Bloodtab5").hide();
			$("#Bloodtab10").hide();
			var obj = JSON.parse(response);
			$("#Bloodtab6").show();
			$("#Bloodtab2").show();
			$('.nav-tabs a[href="#menu6"]').tab('show');
			$('#inworddonoreditid').val(obj[0].donorId);
			$('#bloodInwordid').val(obj[0].id);
			$('#bloodidwordadminid').val(obj[0].adminid);
			$('#bloodInwordJoiningdate').val(obj[0].joiningdate);
			$('#donorinwordemail').val(obj[0].email);
			$('#donorinwordlastdate').val(obj[0].lastdonationdate);
			$('#donorinwordaddress').val(obj[0].address);
			$('#donorinwordcity').val(obj[0].city);
			$('#donorinwordstate').val(obj[0].state);
			$('#donorinwordcontry').val(obj[0].country);
			$('#donorinwordzipcode').val(obj[0].zipcode);
			var gender = obj[0].gender;
			if (gender == "male") {
				$("#donorinwordmale").prop("checked", true);
			}
			else {
				$("#donorinwordfemale").prop("checked", true);
			}
			$('#donorinwordage').val(obj[0].age);
			$('#donorinwordnob').val(obj[0].numberofbags);
			$('#donorinwordbloodgoupe').val(obj[0].bloodgroup);
			$('#donorinwordphone').val(obj[0].mobileno);
		});
	});
});