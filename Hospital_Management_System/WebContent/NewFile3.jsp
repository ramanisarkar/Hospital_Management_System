<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.input-group.date').datepicker({
			format : "dd/mm/yyyy",
			singleDatePicker : true,
			showDropdowns : true,
			minYear : 1901,
			maxYear : parseInt(0)
		});
		$('#dateofbarth').change(function(event){  
			var from = $("#dateofbarth").val().split("/");
			var f = new Date(from[2], from[1] / 1, from[0]);
			var today = new Date();
			var dob = f;
			var age = Math.floor((today-dob) / (365 * 24 * 60 * 60 * 1000));
			console.log(age);
			$('.age').html(age+' years old');
		});
	});
</script>

<title></title>
</head>
<body>

	<label class="fieldlabel" for="Date"
		style="height: 22px; font-size: 14px; color: #615f5f; font-weight: 500;">Date
		of Birth</label>
	<br>
	<div class="input-group">
		<div class="dobgroup">
			<div class="input-group date" data-date-format="dd/mm/yyyy">
				<input type="text" name="dob" id="dateofbarth" class="form-control"
					placeholder="dd/mm/yyyy" style="width: 361px;" required readonly>
				<div class="input-group-addon">
					<span class="age"></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>