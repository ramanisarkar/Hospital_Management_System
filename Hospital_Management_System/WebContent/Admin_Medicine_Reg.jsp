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

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
 
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<script>

$(document).ready(function(){
	var count = 0;
	var username="categoryList";
 	$.get('Category',{flag:username},function(response) {
    	var obj = JSON.parse(response);
    	var select = $('#category_data');
    	select.find('option').remove();
    	$('<option disabled selected hidden="">').val("").text("Select Category").appendTo(select);  
	   	$.each(obj, function(index, value) {
	   		$('<option>').val(obj[index].id).text(obj[index].categoryname).appendTo(select);
		});
	   	var editcategory = $('#edit_category_data');
	   	editcategory.find('option').remove();
    	$('<option disabled selected hidden="">').val("").text("Select Category").appendTo(editcategory);  
	   	$.each(obj, function(index, value) {
	   		$('<option>').val(obj[index].id).text(obj[index].categoryname).appendTo(editcategory);
		});
	   	$.each(obj, function(index, value) {
			count++;
		   	var html = '';
		   	html += '<tr id='+count+'>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
			html += '<td><button style="margin-left: 10px; margin-top: 10px;" type="button" class=" delete" data-delete_id="'+count+'" id="categoryid'+count+'" value="'+obj[index].id+'"><i class="fa fa-close"style="color: red;padding: 3px;"></i></button></td></tr>';
			$('.category').append(html);
	 	});
   	 });
 	
	$('#category_insert').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#category_insert')[0];
	    var data = new FormData(form);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        url: "Category",
	        enctype: 'multipart/form-data',
	       
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = JSON.parse(response);
	        	var select = $('#category_data');
	        	select.find('option').remove();
	        	$('<option disabled selected hidden="">').val("").text("Select Category").appendTo(select);  
	    	   	$.each(obj, function(index, value) {
	    	   		$('<option>').val(obj[index].id).text(obj[index].categoryname).appendTo(select);
	    		});
	    	   	
	    	   	var editcategory = $('#edit_category_data');
	    	   	editcategory.find('option').remove();
	        	$('<option disabled selected hidden="">').val("").text("Select Category").appendTo(editcategory);  
	    	   	$.each(obj, function(index, value) {
	    	   		$('<option>').val(obj[index].id).text(obj[index].categoryname).appendTo(editcategory);
	    		});
	    	   	
	    	   	$('.category').children('tr').remove();
	    	   	$.each(obj, function(index, value) {
	    			count++;
	    		   	var html = '';
	    		   	html += '<tr id='+count+'>';
	    		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
	    			html += '<td><button style="margin-left: 10px; margin-top: 10px;" type="button" class=" delete" data-delete_id="'+count+'" id="categoryid'+count+'" value="'+obj[index].id+'"><i class="fa fa-close"style="color: red;padding: 3px;"></i></button></td></tr>';
	    			$('.category').append(html);
	    	 	});
	        }
	    });
	});
	$(document).on('click', '.delete', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var category = $('#categoryid'+deleteid).val();
		var username = "deleteCategory";
		$.get('Category',{flag:username , categoryId:category},function(response){
			var message=response;
			console.log(message)
			if(message == "seccess"){
				$('#category_data').find('[value="' + category + '"]').remove();
				count--;
				$('#edit_category_data').find('[value="' + category + '"]').remove();
        		$('#'+deleteid+'').closest('tr').remove();
    		}
		});
	});
	
	var countMedicine = 0;
	var username="medicineList";
 	$.get('Medicine',{flag:username},function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index, value) {
			countMedicine++;
		   	var html = '';
		   	html += '<tr id='+countMedicine+'>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinename+'</a></td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinebatchnumber+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinequantity+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].price+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].discount+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].expirydate+'</td>';
		   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].stock+'</td>';
			html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editMedicine" data-edit_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value="'+obj[index].id+'">Edit</button>';
			html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteMedicine" data-delete_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
			$('.medicine').append(html);
	 	});
			 $('#example').DataTable();
	});
	
	$(".main_medicine_div").append('<div class="medicine_div"><div class="form-group"><label class="col-sm-2 text" for="medicine_name">Medicine<span class="require-field"style="color: red;">*</span></label><div class="col-sm-3 margin_bottom_5px"><input id="medicine_name" class="form-control  text-input  medicine_name" maxlength="50" type="text" placeholder="Medicine Name"  name="medicine_name[]"></div><div class="col-sm-6"><textarea rows="1"  name="description[]"  class="form-control " id="description" maxlength="150" placeholder="Description"></textarea></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input class="form-control" type="text" maxlength="20" placeholder="Batch Number" name="batch_number[]"></div><div class="col-sm-2 margin_bottom_5px"><input  class="form-control text-input" min="0" type="number" onKeyPress="if(this.value.length==6) return false;"  placeholder="Quantity" name="med_quantity[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="med_price" class="form-control text-input" min="1" type="number" step="0.01" onKeyPress="if(this.value.length==8) return false;"  placeholder="Price (&#36;)"  name="med_price[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control text-input med_uniqueid" maxlength="10" type="text" placeholder="Medicine ID"	value="" name="med_uniqueid[]"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><textarea rows="1"  name="note[]"  class="form-control"  maxlength="150" placeholder="Note"></textarea></div><div class="col-sm-2 margin_bottom_5px"><input id="med_discount" class="form-control text-input" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01"  placeholder="Discount" name="med_discount[]"></div><div class="col-sm-2 margin_bottom_5px"><select class="form-control" name="med_discount_in[]"><option value="flat">Flat</option><option value="percentage">Percentage</option></select></div><div class="col-sm-2"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input id="mfg_cmp_name" class="form-control" type="text" maxlength="50" placeholder="Manufacturer Company Name" name="mfg_cmp_name[]"></div><div class="col-sm-2 margin_bottom_5px"><div class="input-group date" data-date-format="dd/mm/yyyy"><input  type="text" name="manufactured_date[]"  class="form-control" placeholder="dd/mm/yyyy"style="width:165px;"><div class="input-group-addon" ><span class=""></span></div></div></div><div class="col-sm-2 margin_bottom_5px"><div class="input-group date" data-date-format="dd/mm/yyyy"><input  type="text" name="expiry_date[]"  class="form-control" placeholder="dd/mm/yyyy" style="width:165px;"><div class="input-group-addon" ><span class=""></span></div></div></div></div></div>');
	
	$(document).on("click", ".delete_medicine_div", function(){
		alert("Do you really want to delete this record ?");
		$(this).parent().parent().parent().remove();
	});
	
	$(document).on("click", "#add_new_entry", function(){
		$(".main_medicine_div").append('<div class="medicine_div"><div class="form-group"><label class="col-sm-2 text" for="medicine_name">Medicine<span class="require-field"style="color: red;">*</span></label><div class="col-sm-3 margin_bottom_5px"><input id="medicine_name" class="form-control  text-input  medicine_name" maxlength="50" type="text" placeholder="Medicine Name"  name="medicine_name[]"></div><div class="col-sm-6"><textarea rows="1"  name="description[]"  class="form-control " id="description" maxlength="150" placeholder="Description"></textarea></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input class="form-control" type="text" maxlength="20" placeholder="Batch Number" name="batch_number[]"></div><div class="col-sm-2 margin_bottom_5px"><input  class="form-control text-input" min="0" type="number" onKeyPress="if(this.value.length==6) return false;"  placeholder="Quantity" name="med_quantity[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="med_price" class="form-control text-input" min="1" type="number" step="0.01" onKeyPress="if(this.value.length==8) return false;"  placeholder="Price (&#36;)"  name="med_price[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control text-input med_uniqueid" maxlength="10" type="text" placeholder="Medicine ID"	value="" name="med_uniqueid[]"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><textarea rows="1"  name="note[]"  class="form-control"  maxlength="150" placeholder="Note"></textarea></div><div class="col-sm-2 margin_bottom_5px"><input id="med_discount" class="form-control text-input" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01"  placeholder="Discount" name="med_discount[]"></div><div class="col-sm-2 margin_bottom_5px"><select class="form-control" name="med_discount_in[]"><option value="flat">Flat</option><option value="percentage">Percentage</option></select></div><div class="col-sm-2"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input id="mfg_cmp_name" class="form-control" type="text" maxlength="50" placeholder="Manufacturer Company Name" name="mfg_cmp_name[]"></div><div class="col-sm-2 margin_bottom_5px"><div class="input-group date" data-date-format="dd/mm/yyyy"><input  type="text" name="manufactured_date[]"  class="form-control" placeholder="dd/mm/yyyy"style="width:165px;"><div class="input-group-addon" ><span class=""></span></div></div></div><div class="col-sm-2 margin_bottom_5px"><div class="input-group date" data-date-format="dd/mm/yyyy"><input  type="text" name="expiry_date[]"  class="form-control" placeholder="dd/mm/yyyy"style="width:165px;"><div class="input-group-addon" ><span class=""></span></div></div></div><div class="col-sm-offset-2 col-sm-1"><button type="button" class="btn btn-default delete_medicine_div"><i class="entypo-trash">Delete</i></button></div></div></div>');
		$('.input-group.date').datepicker({format: "dd/mm/yyyy"}); 
	});
	
	$('.input-group.date').datepicker({format: "dd/mm/yyyy"}); 
	$(document).on("keyup", ".medicine_name", function(){
		var that = this;
		var medicine_name = $(this).val();		
		var no = 0;		
		 var username = "chackMedicineName";
		$('.medicine_name').each(function()
		{
			if($(this).val()== medicine_name){
				no=no+1;
			}
		});
		if(no>1){
			alert('Please Enter Unique Medicine Name');
			$(that).val('');
			return false; 	
		}
		else if(medicine_name != ''){
			 $.ajax({
		            url: 'Medicine',
		            type: 'post',
		            data: {flag:username , medicineName:medicine_name},
		            success: function(response){
		            	var obj = JSON.parse(response);
		            	console.log(response);
		            	if(obj[0].chackmedicinename == "false"){
		            		alert('Please Enter Unique Medicine Name');
		        			$(that).val('');		
		             	}
		            }
			 });
		}
	});
	$(document).on("keyup", ".med_uniqueid", function(){
		var that = this;
		var medicine_Id = $(this).val();		
		var no = 0;		
		var username = "chackMedicineId";
		$('.med_uniqueid').each(function()
		{
			if($(this).val()== medicine_Id)
			{
				no=no+1;
			}		
		});
		if(no>1)				
		{
			alert('Please Enter Unique Medicine Id');
			$(that).val('');
			return false; 	
		}
		else if(medicine_Id != ''){
			 $.ajax({
		            url: 'Medicine',
		            type: 'post',
		            data: {flag:username , medicineId:medicine_Id},
		            success: function(response){
		            	var obj = JSON.parse(response);
		            	console.log(response);
		            	if(obj[0].chackmedicineid == "false"){
		            		alert('Please Enter Unique Medicine ID');
		        			$(that).val('');		
		             	}
		            }
			 });
		}
	});
    
	$('#medicine_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#medicine_form')[0];
	    var data = new FormData(form);
	    $("#btnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "Medicine",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	var obj = JSON.parse(response);
				var countMedicine = 0;
				table = $('#example').DataTable();
				table.destroy();
				$('.medicine').children('tr').remove();
				$.each(obj, function(index, value) {
					countMedicine++;
				   	var html = '';
				   	html += '<tr id='+countMedicine+'>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinename+'</a></td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinebatchnumber+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinequantity+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].price+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].discount+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].expirydate+'</td>';
				   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].stock+'</td>';
					html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editMedicine" data-edit_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value="'+obj[index].id+'">Edit</button>';
					html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteMedicine" data-delete_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
					$('.medicine').append(html);
			 	});
			 	var message=obj[0].medicineupdate;
				console.log(message);
				if(message == "true"){
					$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Record Added Successsfully");
	        		$("#medicine_form")[0].reset();
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
	
	$(document).on('click', '.editMedicine', function(){
		var editid = $(this).data('edit_id');
		console.log(editid);
		var medicine = $('#meicineid'+editid).val();
		var username = "editMedicine";
		$.get('Medicine',{flag:username , medicineId:medicine},function(response){
 			$("#medicinetab1").hide();
 			var obj = JSON.parse(response);
			console.log(response);
			$("#medicinetab2").show();
			$('.nav-tabs a[href="#menu2"]').tab('show');
			$('#medicineeditid').val(obj[0].id);
			$('#adminid').val(obj[0].adminid);
			$('#joiningdateid').val(obj[0].joiningdate);
			$('#edit_medicine_name').val(obj[0].medicinename);
			$('#edit_description').val(obj[0].medicinedesrciption);
			$('#bathnumber').val(obj[0].medicinebatchnumber);
			$('#quntity').val(obj[0].medicinequantity);
			$('#price').val(obj[0].price);
			$('#medicineid').val(obj[0].medicineid);
			$('#note').val(obj[0].note);
			$('#edit_med_discount').val(obj[0].discount);
			$('#typeofdicount').val(obj[0].typeofdiscount);
			$('#edit_mfg_cmp_name').val(obj[0].manufacturercompanyname);
			$('#edit_manufactured_date').val(obj[0].manufacturedate);
			$('#edit_expiry_date').val(obj[0].expirydate);
			$('#edit_category_data').val(obj[0].categoryid);
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
        url: "Medicine",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function(response ,textStatus , jqXHR ){
        	var obj = JSON.parse(response);
			var countMedicine = 0;
			table = $('#example').DataTable();
			table.destroy();
			$('.medicine').children('tr').remove();
			$.each(obj, function(index, value) {
				countMedicine++;
			   	var html = '';
			   	html += '<tr id='+countMedicine+'>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinename+'</a></td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinebatchnumber+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinequantity+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].price+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].discount+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].expirydate+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].stock+'</td>';
				html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editMedicine" data-edit_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value="'+obj[index].id+'">Edit</button>';
				html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteMedicine" data-delete_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
				$('.medicine').append(html);
		 	});
			var message=obj[0].medicineupdate;
			console.log(message);
        	if(message == "seccess"){
				$('#message1').show();
        		$('#message2').show();
        		$('#message3').show();
        		$('#messagepass').text("Record Update Successsfully");
        		$("#update").prop("disabled", false);
    		}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            $("#update").prop("disabled", false);
        	}
    	});
	});
	$(document).on('click', '.deleteMedicine', function(){
		var deleteid = $(this).data('delete_id');
		console.log(deleteid);
		var medicine = $('#meicineid'+deleteid).val();
		var username = "deleteMedicine";
		$.get('Medicine',{flag:username , medicineId:medicine},function(response){
			var obj = JSON.parse(response);
			var countMedicine = 0;
			table = $('#example').DataTable();
			table.destroy();
			$('.medicine').children('tr').remove();
			$.each(obj, function(index, value) {
				countMedicine++;
			   	var html = '';
			   	html += '<tr id='+countMedicine+'>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinename+'</a></td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].categoryname+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinebatchnumber+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].medicinequantity+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].price+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].discount+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].expirydate+'</td>';
			   	html += '<td style="padding-left: 15px; padding-top: 23px;">'+obj[index].stock+'</td>';
				html += '<td><button style="margin-top: 10px;" type="button" class="btn btn-info  editMedicine" data-edit_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value="'+obj[index].id+'">Edit</button>';
				html += '<button style="margin-left: 10px; margin-top: 10px;" type="button" class="btn btn-danger deleteMedicine" data-delete_id="'+countMedicine+'" id="meicineid'+countMedicine+'" value-="'+obj[index].id+'">Delete</button></td></tr>';
				$('.medicine').append(html);
		 	});
			var message=obj[0].medicineupdate;
			console.log(message);
			if(message == "true"){
			$('#message1').show();
    		$('#message2').show();
    		$('#message3').show();
    		$('#messagepass').text("Record Deleted Successsfully");
    		}
		});
	});
	
	$(document).on('change', '#insert_patientId', function(){
		var patientid = $(this).val();
		var username = "getPriscriptionRecord";
		$.get('Medicine',{flag:username , patientId : patientid},function(response){
			var obj = JSON.parse(response);
			var priscription = $('#insert_priscription_record');
			priscription.find('option').remove();
        	$('<option disabled selected hidden="">').val("").text("Select Prescription").appendTo(priscription);  
    	   	$.each(obj, function(index, value) {
    	   		$('<option>').val(obj[index].prescriptionId).text(obj[index].patientName + obj[index].date ).appendTo(priscription);
    		});
		});
	});

	$(document).on('change', '#insert_priscription_record', function(){
		var priscriptionid = $(this).val();
		var username = "getPriscriptionMedicineRecord";
		$.get('Medicine',{flag:username , prescriptionId : priscriptionid},function(response){
			var obj = JSON.parse(response);
			console.log(response);
			console.log(obj.length === 0);
			if((obj.length === 0) == false){
				$('#prescriptionMedicineList').empty();
				var count = 1; 
				var html = '';
				html += '<div id="madicinedata">';
				html += '<div class="form-group row"><div class="col-sm-2"></div><div class="col-sm-2">Medicine</div><div class="col-sm-1">Quantity</div><div class="col-sm-1">Price (&#x20B9;)</div>';
				html += '<div class="col-sm-2">Discount</div><div class="col-sm-1"style="margin-left: 19px;width: 175px;">Discount Amount</div><div class="col-sm-2"></div></div>';
				
				$.each(obj, function(index, value) {
					count++;
					html += '<div id="invoice_entry"><div class="form-group row"><div class="col-sm-2 margin_bottom_5px"></div>';
					html +='<input type="hidden" name="madicine_id[]" value="'+obj[index].id+'"><input type="hidden" class="madicine_quantity_'+count+'" name="madicine_quantity" value="'+obj[index].quantity+'">';
					html +='<div class="col-sm-2 margin_bottom_5px"><input type="text" name="madicine_title[]" class="form-control" value="'+obj[index].Name+'" readonly>';
					html +='</div><div class="col-sm-1 margin_bottom_5px"><input id="qty_'+count+'" class="days form-control  medicineqty_'+count+'" data-id="'+count+'" counter="1" type="number" min="0" value="0" name="qty[]">';
					html +='</div><div class="col-sm-1 margin_bottom_5px"><input type="hidden" id="med_discount_Price'+count+'" value="'+obj[index].price+'">';
					html +='<input id="price_'+count+'" class="med_price_ form-control" type="text" value="0" name="price[]" readonly></div>';
					html +='<div class="col-sm-1 margin_bottom_5px" style="padding-right:0px;"><input id="discount_value_'+count+'" data-id="'+count+'" onkeypress="if(this.value.length==10) return false;" step="0.01"class="med_discount_value form-control" type="number" value="0.00" name="discount_value[]"counter="1"></div>';
					html +='<div class="col-sm-1 margin_bottom_5px"style="width: 114px;"><select class="form-control" id="med_discount_in_'+count+'" name="med_discountin[]" disabled="">';
					html +='<option value="flat">Flat</option><option value="percentage">%</option></select><input type="hidden" id="med_discount_type'+count+'" name="med_discount_in[]" value="'+obj[index].type+'"></div>';
					html +='<div class="col-sm-1 margin_bottom_5px"style="width: 175px;"><input id="discount_'+count+'" class="med_discount form-control" type="text" value="0" name="discount_amount[]"readonly=""></div>';
					html +='<div class="col-sm-2"></div></div></div>';
	    		});
				html += '</div>';
				$('#prescriptionMedicineList').append(html);
				count=1;
				$.each(obj, function(index, value) {
					count++;
					$('#med_discount_in_'+count+'').val(obj[index].type);
				});
			}else{
				$('#prescriptionMedicineList').empty();
				$('#prescriptionMedicineList').append('<p style="margin-left: 197px;color: red;font-weight: bold;">No Record Found</p>');
			}
		});
	});
	
	$(document).on("change", ".days", function(){
		var quntittyId = $(this).data('id');
		var totalQuntity = $('.madicine_quantity_'+quntittyId).val();
		var quntity = $('#qty_'+quntittyId).val();
		var medicinePrice= $('#med_discount_Price'+quntittyId).val();
		var discount = $('#discount_value_'+quntittyId).val();
		var discountType = $('#med_discount_type'+quntittyId).val();
		var totalAmount;
		if(parseInt(totalQuntity) >= parseInt(quntity)){
			$('#price_'+quntittyId).val(quntity*medicinePrice);
			var price = [];
			var med_price = document.querySelectorAll('.med_price_');
			for(var i =0; i < med_price.length; i++){ 
				price.push(med_price[i].value);
			}
			var amountTotal =0; 
			$.each(price, function(index, value) {
				amountTotal+=parseFloat(price[index]);
			});
			var discount = [];
			$('#dispatch_medicine_price').val(amountTotal);
			var med_discount = document.querySelectorAll('.med_discount');
			for(var i =0; i < med_discount.length; i++){ 
				discount.push(med_discount[i].value);
			}
			var discountTotal =0; 
			$.each(discount, function(index, value) {
				discountTotal+=parseFloat(discount[index]);
			});
			$('#discount').val(discountTotal);
			if(parseFloat(amountTotal) < parseFloat(discountTotal)){
				alert("please chack the discount");
			}
			else {
				var subtotal = amountTotal - discountTotal;
				console.log(subtotal);
				$('#sub_total').val(subtotal);
			}
			
		}
		else {
			alert("no stock");
			$('#qty_'+quntittyId).val(0);
			$('#discount_value_'+quntittyId).val(0);
			$('#discount_'+quntittyId).val(0);
		}
	});
	
	$(document).on("change", ".med_discount_value", function(){
		var quntittyId = $(this).data('id');
		var totalQuntity = $('.madicine_quantity_'+quntittyId).val();
		var quntity = $('#qty_'+quntittyId).val();
		var medicinePrice= $('#med_discount_Price'+quntittyId).val();
		var discount = $('#discount_value_'+quntittyId).val();
		var discountType = $('#med_discount_type'+quntittyId).val();
		var totalAmount;
		if (parseInt(quntity) > 0){
			if(discountType == "flat"){
				$('#discount_'+quntittyId).val(discount);
			}
			else if (discountType == "percentage") {
				$('#discount_'+quntittyId).val((quntity*medicinePrice)/100 * discount);
			}
			
			var price = [];
			var med_price = document.querySelectorAll('.med_price_');
			for(var i =0; i < med_price.length; i++){ 
				price.push(med_price[i].value);
			}
			var amountTotal =0; 
			$.each(price, function(index, value) {
				amountTotal+=parseFloat(price[index]);
			});
			var discount = [];
			$('#dispatch_medicine_price').val(amountTotal);
			var med_discount = document.querySelectorAll('.med_discount');
			for(var i =0; i < med_discount.length; i++){ 
				discount.push(med_discount[i].value);
			}
			var discountTotal =0; 
			$.each(discount, function(index, value) {
				discountTotal+=parseFloat(discount[index]);
			});
			$('#discount').val(discountTotal);
			if(parseFloat(amountTotal) < parseFloat(discountTotal)){
				alert("Your discount was out of total");
				$('#discount_value_'+quntittyId).val(0);
				
			}
			else {
				var subtotal = amountTotal - discountTotal;
				console.log(subtotal);
				$('#sub_total').val(subtotal);
			}
		}
		else{
			alert("Please Select Quntity");
			$('#discount_value_'+quntittyId).val(0);
		}
		
	});
	
 	$(".nav-tabs a").click(function(){
   		$("#medicinetab2").hide();
   		$('#message1').hide();
		$('#message2').hide();
		$('#message3').hide();
   	    $(this).tab('show');
   	});
});
</script>
<script type="text/javascript">
$(function () {
	$('[data-toggle="popover"]').popover({
	    container: "body",
	    sanitize: false,
	    content: function () {
	        return $("#choose-user-popover-content").html();
	    }
	}).on('shown.bs.popover', function () {
	    $('#ExecutorSNPSearchStr').focus();
	});
});
</script>
<style type="text/css">

.multiselect-container {
    width: 653px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.icone {
    float: left;
    height: 20px !important;
    line-height: 0px;
    margin-right: 0px;
    overflow: hidden;
    width: 25px !important;
    text-align: center;
}
.title {
	color: white;
}
.text{
text-align: right;
}
.require-field{
color: red;
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
.btn {
border-radius: 0px;
}
.input-group-addon {
    background-color: white !important;
    border: none!important;
}
.icone {
  float: left;
  height: 20px !important;
  margin-right: 5px;
  overflow: hidden;
  width: 25px !important;
  text-align: center;
}
</style>
</head>

<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif; font-size: 13px;">
	<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0"> 
		 <div class="navbar" style="padding-right: 14px;  background-color: white;height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="margin-top: -8px;"> <span style="font-size:21px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white;color: #5f5f5f !important; margin-top: 17px; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
						<img src="Admin_Images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-top: -15px;" >								
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
			<li><a href="<%=request.getContextPath()%>/Prescription?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
			<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li>
			<li><a href="<%=request.getContextPath()%>/Patient?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
			<span class="icone"><i class="fa fa-bed" aria-hidden="true" style="color: gray;"></i></span>
			<span class="title">Add Bad</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
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
	
	<div id="message2" style="margin-top: 67px;"hidden="" ></div>
	<div style="margin-left: 236px; padding: 0px 16px; margin-top: -73%; background-color: white;">
		<div style="color: green; margin-top: 3px;" id="specializationadd"></div>
		<div style="padding-top: 15px;"></div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content"
					style="width: 773px; margin-left: -117px;">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel">Medicine Category</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" style="margin-top: -26px; color: red ; padding-right: 5px;">
							<span aria-hidden="true"><i class="fa fa-close"></i></span>
						</button>
					</div>
					<div class="modal-body" style="height: 300px;overflow: scroll;">
						<table class="table ">
							<thead>
								<tr>
									<th>Medicine Category</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody class="category">
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<form id="category_insert" >
						<div class="form-group">
							<label class="text col-sm-3" for="text" style="    margin-top: 8px;">Category
								Name<span style="color: red">*</span>
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="text" name="category">
								<input type="hidden" name="flag" value="insert">
							</div>
							<div class="col-sm-3" style="text-align: left;">
								<button type="submit" class="btn  mb-2"
									style="background-color: #22BAA0; color: #fff; border: 1px solid transparent;">Add</button>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Medicine list</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="medicinetab1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add New Medicine</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="medicinetab2" data-toggle="tab"
					href="#menu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Medicine</a>
				</li>
				<li style="margin-left: 15px; background-color: #f1f4f9;"><a
					id="medicinetab3" data-toggle="tab"
					href="#menu3"><i class="fas fa-bars"
					aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Dispatched Medicine List</a>
					
				</li>
					<li style="margin-left: 15px; background-color: #f1f4f9;"><a id="medicinetab4" data-toggle="tab"href="#menu4" >
					<i class="fas fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Dispatched  Medicine</a>
				</li>
					<li style="margin-left: 15px; background-color: #f1f4f9;"><a id="medicinetab5" data-toggle="tab" href="#menu5" style="display: none;">
					<i class="fas fa-plus-circle" aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit  Dispatched  Medicine</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home"  class="container tab-pane active"style="margin-top: 10px;">
					<table id="example" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
							 <th style="padding-left: 15px;"> Medicine Name</th>
							 <th style="padding-left: 15px;">Category</th>
							 <th style="padding-left: 15px;">Batch Number</th>
							 <th style="padding-left: 15px;">Quantity</th>
							 <th style="padding-left: 15px;">Price<span>(&#x20B9;)</span> </th>
							 <th style="padding-left: 15px;">Discount</th>
							 <th style="padding-left: 15px;">Expiry Date</th>
							 <th style="padding-left: 15px;">Stock</th>
							 <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="medicine">
			        </tbody>
			        <tfoot>
			            <tr>
			            	 <th style="padding-left: 15px;"> Medicine Name</th>
							 <th style="padding-left: 15px;">Category</th>
							 <th style="padding-left: 15px;">Batch Number</th>
							 <th style="padding-left: 15px;">Quantity</th>
							 <th style="padding-left: 15px;">Price<span>(&#x20B9;)</span> </th>
							 <th style="padding-left: 15px;">Discount</th>
							 <th style="padding-left: 15px;">Expiry Date</th>
							 <th style="padding-left: 15px;">Stock</th>
							 <th style="padding-left: 15px;">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
   			 </div>
   			  <div id="menu3" class="tab-pane">
				<table id="despatichetable" class="display table table-striped table-hover" style="width:100%">
			       <thead>
			           <tr>
							<th style="padding-left: 15px;">Patient Name</th>
							<th style="padding-left: 15px;">Prescription </th>
							<th style="padding-left: 15px;">Medicine Price($)</th>
							<th style="padding-left: 15px;">Discount(&#x20B9;)</th>
							<th style="padding-left: 15px;">Tax Amount<span>(&#x20B9;)</span> </th>
							<th style="padding-left: 15px;">Sub Total(&#x20B9;)</th>
							<th style="padding-left: 15px;">Action</th>
			           </tr>
				       </thead>
				       <tbody class="medicine">
				       </tbody>
				       <tfoot>
				           <tr>
				            <th style="padding-left: 15px;">Patient Name</th>
							<th style="padding-left: 15px;">Prescription</th>
							<th style="padding-left: 15px;">Medicine Price($)</th>
							<th style="padding-left: 15px;">Discount(&#x20B9;)</th>
							<th style="padding-left: 15px;">Tax Amount<span>(&#x20B9;)</span> </th>
							<th style="padding-left: 15px;">Sub Total(&#x20B9;)</th>
							<th style="padding-left: 15px;">Action</th>
				           </tr>
				       </tfoot>
				   </table>
				   <div style="margin-top: 26px;"></div>
		    </div>
			<div id="menu1" class="tab-pane">
				<form name="medicine_form" action="" method="post" class="form-horizontal" id="medicine_form">
				<div class="form-group"style="    margin-top: 15px;">
				<label class="col-sm-2 text" for="medicine_category">Category Name<span class="require-field" style="color: red;">*</span></label>
				<div class="col-sm-8 margin_bottom_5px">
				
					<select class="form-control validate[required]" name="medicine_category" id="category_data">
					<option value="">Select Category</option>
					</select>
				</div>
				
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Add Or Remove</button>
				</div>
			</div>
				
			<div class="main_medicine_div">				
				<div class="medicine_div">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 text" for="expense_entry"></label>
				<div class="col-sm-3 margin_bottom_5px">				
					<button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button"   name="add_new_entry" >Add More Medicine						</button>
				</div>
			</div>
				<input type="hidden" name="flag" value="insert" />
			<div class="col-sm-offset-2 col-sm-8">
				<input type="submit" value="Save" name="save_medicine" class="btn btn-success"style="margin-bottom: 15px;"/>
			</div>
			</form>
			</div>
			<div id="menu2" class="tab-pane" style="margin-top: 15px;">
				<form action="" method="post" class="form-horizontal" id="update_form">
					<div class="form-group">
						<label class="col-sm-2 text" >Category Name<span class="require-field">*</span></label>
						<div class="col-sm-8 margin_bottom_5px">
							<select class="form-control validate[required]" name="edit_medicine_category" id="edit_category_data">
							</select>
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Add Or Remove</button>
					</div>
					<div class="form-group">
						<label class="col-sm-2 text" for="medicine_name">Medicine<span class="require-field">*</span></label>
						<div class="col-sm-3 margin_bottom_5px">
							<input id="edit_medicine_name" class="form-control validate[required,custom[popup_category_validation]] text-input edit_medicine_name" maxlength="50" type="text" placeholder="Medicine Name" value="adetest" name="medicine_name">
						</div>
						<div class="col-sm-6 margin_bottom_5px">				
							<textarea rows="1" name="description" class="form-control validate[custom[address_description_validation]]" id="edit_description" maxlength="150" placeholder="Description" name="description"></textarea>
						</div>				
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">
							<input id="bathnumber" class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="20" placeholder="Batch Number" value="fdasdfa" name="batch_number">
						</div>	
						<div class="col-sm-2 margin_bottom_5px">
							<input id="quntity" class="form-control validate[required] text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" placeholder="Quantity" value="100" name="med_quantity">
						</div>		
						<div class="col-sm-2 margin_bottom_5px">
							<input id="med_price" class="form-control validate[required] text-input" min="1" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" placeholder="Price ($)" value="2" name="med_price">
						</div>
						<div class="col-sm-2 margin_bottom_5px">
							<input id="" class="form-control validate[custom[popup_category_validation]] text-input edit_med_uniqueid" maxlength="10" type="text" placeholder="Medicine ID" value="eee258" name="med_uniqueid">
						</div>
					</div>
					<div class="form-group">				
						<div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">				
						<textarea rows="1" id="note" name="note" class="form-control validate[custom[address_description_validation]]" maxlength="150" placeholder="Note"></textarea>
						</div>
						<div class="col-sm-2 margin_bottom_5px">
							<input id="edit_med_discount" class="form-control text-input" type="number" onkeypress="if(this.value.length==10) return false;" step="0.01" placeholder="Discount" value="0" name="med_discount">
						</div>	
						<div class="col-sm-2 margin_bottom_5px">
							<select class="form-control" name="med_discount_in" id="typeofdicount">
								<option value="flat" selected="selected">Flat</option>
								<option value="percentage">Percentage</option>
							</select>
						</div>	
						<div class="col-sm-2 margin_bottom_5px">					
						</div>		
					</div>
					<div class="form-group">				
						<div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">
							<input id="edit_mfg_cmp_name" class="form-control " type="text" maxlength="50" placeholder="Manufacturer Company Name" value="fasffeeee" name="mfg_cmp_name">
						</div>
						<div class="col-sm-2 margin_bottom_5px">
							<input id="edit_manufactured_date" class="form-control " type="text" name="manufactured_date" placeholder="Manufactured Date" value="2020-03-01" readonly="">
						</div>	
						<div class="col-sm-2 margin_bottom_5px">
							<input id="edit_expiry_date" class="form-control " type="text" name="expiry_date" placeholder="Expiry Date" value="2021-01-22">
						</div>									
					</div>			
					<div class="col-sm-offset-2 col-sm-8">
						<input type="hidden" name="flag" value="update">
						<input type="hidden" name="adminId" id="adminid" >
						<input type="hidden" name="Id" id="medicineeditid" >
						<input type="hidden" id="joiningdateid" name="joinig" >
						<input type="submit" value="Save" name="save_medicine" id="update" class="btn btn-success"style="margin-bottom: 15px;">
					</div>	
				</form>
			</div>
			 <div id="menu4" class="tab-pane">
			    <form id="dipatch_medicine_insert_form">
			        <div class="form-group row" style="    margin-top: 15px;">
			            <label class="col-sm-2 text">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="patient_id" id="insert_patientId"  class="form-control">
								<option value="" disabled selected hidden="">Select Patient </option>	
								<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
									<option value="${q.id }">${q.patientid } - ${q.firstname }</option>
								</c:forEach>
							</select>
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="patient">Prescription<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="prescription_id" class="form-control" id="insert_priscription_record">
			                    <option>Select Prescription</option>
			                </select>
			            </div>
			        </div>
			
			        <div id="prescriptionMedicineList"></div>
			
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="med_price">Total Price Amount (&#x20B9;)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="dispatch_medicine_price" class="form-control text-input" type="text" value=""
			                    name="med_price" readonly>
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="discount">Total Discount Amount (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="discount" class="form-control discount text-input" min="0" type="number"
			                    onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="discount" readonly>
			            </div>
			        </div>
			        <div class="form-group  row">
			            <label class="col-sm-2 text" for="sub_total">Sub Total (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="sub_total" class="form-control  text-input" type="text" value="" name="sub_total" readonly>
			            </div>
			        </div>
			
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="description">Description</label>
			            <div class="col-sm-8">
			                <textarea name="description" id="description" maxlength="150"
			                    class="form-control validate[custom[address_description_validation]]"></textarea>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px;">
			            <input type="submit" value="Save" name="save_dispatch_medicine" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div id="menu5" class="tab-pane">
			    <form method="post" class="form-horizontal" id="dipatch_medicine_form">
			        <div class="form-group row" style="margin-top: 15px;">
			
			            <label class="col-sm-2 text" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="patient" class="form-control" id="Edit_ patient_id">
			                    <option value="">select Patient</option>
			                </select>
			            </div>
			
			        </div>
			
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="patient">Prescription<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="prescription_id" class="form-control" id="Edit_prescription">
			                    <option>Select Prescription</option>
			                </select>
			            </div>
			        </div>
			
			        <div id="madicinedata"></div>
			
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="med_price">Total Price Amount (&#x20B9;)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="Edit_dispatch_medicine_price" class="form-control  text-input" type="text" value=""
			                    name="med_price" readonly>
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="discount">Total Discount Amount (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="Edit_discount" class="form-control discount text-input" min="0" type="number"
			                    onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="discount"
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="sub_total">Sub Total (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="Edit_sub_total" class="form-control  text-input" type="text" value="" name="sub_total"readonly>
			            </div>
			        </div>
			
			        <div class="form-group row">
			            <label class="col-sm-2 text" for="description">Description</label>
			            <div class="col-sm-8">
			                <textarea name="description" id="description" maxlength="150"
			                    class="form-control validate[custom[address_description_validation]]"></textarea>
			
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Save" name="save_dispatch_medicine" class="btn btn-success">
			        </div>
			    </form>
			</div>
		</div>
	</div>
</div>
</body>
</html>