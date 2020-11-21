$(document).ready(function() {
	var username = "Patient";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.patientcounter').text();
	});
	var username = "Doctor";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.doctorcounter').text();
	});
	var username = "Nurse";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.nursecounter').text();
	});
	var username = "SupportStaff";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.supportstaffcounter').text();
	});
	var username = "message";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.messagecounter').text();
	});
	var username = "Appointment";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.appointmentcounter').text();
	});
	var username = "Prescription";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.prescriptioncounter').text();
	});
	var username = "Assignbed";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.assignbedcounter').text();
	});
	var username = "Treatment";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.treatmentcounter').text();
	});
	var username = "Medicine";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.medicinecounter').text();
	});
	var username = "LaboratoryStaff";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.laboratorystaffcounter').text();
	});
	var username = "Diagnosis";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.diagnosiscounter').text();
	});
	var username = "Event";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.eventcounter').text();
	});
	var username = "Pharmacist";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.pharmacistcounter').text();
	});
	var username = "Accountant";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.accountantcounter').text();
	});
	var username = "Invoice";
	$.post('Admin', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		$('.invoicecounter').text();
	});
		
});