<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" />

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>

<script>
$(document).ready(function(){
	$('.input-group.date').datepicker({format: "dd/mm/yyyy",singleDatePicker: true,
	    showDropdowns: true,
	    minYear: 1901,
	    maxYear: parseInt(0)
	});
	$(document).on("click", '#invoiceteb1', function() {
		$.get('InvoiceManagement', { flag: "invoiceId"}, function(response) {
			var repo = JSON.parse(response);
			let invoice_id = repo[0].field1;
			$('#invoice_number').val(invoice_id	);
		});
		let today = new Date().toLocaleDateString();
		$('#invoice_date').val(today);
    });
	
	$("#Check_Charges").on('click', function() {
		let patientid = $('#patientid').val();
		if(patientid != null){
			$.get('InvoiceManagement', { flag: "patientChageHistory" , patientId:patientid }, function(response) {
				var obj = JSON.parse(response);
				if(obj.length != 0 ){
					let count = 0;
					$('.charges_body').empty();
					$.each(obj, function(index) {
						count++;
						var html = '';
						html += '<div class="row"><div class="col-md-1 "><input type="hidden" name="patientchargid[]" value="'+obj[index].id+'"><input id="" type="checkbox" value="'+count+'" name="cheak[]" checked style="margin: 10px;"></div>';
						html += '<div class="col-md-2 "><input class="form-control" type="text" value="'+obj[index].type+'" name="type[]" readonly></div><div class="col-md-2 ">';
						html += '<input class="form-control" type="text" value="'+obj[index].title+'" name="title[]"readonly></div><div class="col-md-1"><input class="form-control"  type="text" value="'+obj[index].date+'" name="date[]" readonly style="width:77px;"></div>';
						html += '<div class="col-md-1 "><input class="form-control" type="text" value="'+obj[index].discription+'" name="unit[]"readonly></div><div class="col-md-1 ">';
						html += '<input id="amount'+count+'" class="form-control  amount_'+count+'" type="number" min="0" step="0.01" value="'+obj[index].price+'" name="amount[]"readonly></div><div class="col-md-1 ">';
						html += '<input id="discount_amount'+count+'" class="form-control" type="number" value="0.0" name="discount_amount[]"readonly></div>';
						html += '<div class="col-md-1"><input id="total_amount" class="form-control  total_amount_'+count+'" type="number" min="0"onkeypress="if(this.value.length==10) return false;" step="0.01" value="'+obj[index].price+'" name="total_amount[]"readonly="readonly"></div></div>';
						$('.charges_body').append(html);
						$('#invoice_charges').append('<input type="hidden" name="patientchargid[]" value="'+obj[index].id+'">');
					});
					$('#invoicepoupopatientname').text(obj[0].Name);
					
				}
				else {
					$('.charges_body').empty();
				}
				$('#exampleModal').modal('show');
			}); 
		}
		else {
			console.log("dshbfsd");
			$("#myModal").modal('show');
		}
	});
	
	$(document).on("click", '.remove_transaction', function() {
		$(this).closest('div.row').remove();
    });
	
	$(document).on("keyup click",'#adjustment_amount', function() {
		let discountvalue = $(this).val();
		let subtotal = $('#invoice_amount').val();
		if(subtotal >0){
			subtotal = subtotal - discountvalue;
			$('#invoice_totalamount').val(subtotal);
		}
		else {
			alert("You can not enter any input befor Subtotal Amount");
			$('#adjustment_amount').val(0);
		}
    });

	$(document).on("click", '#invoiceClose', function() {
		let total=0.0;
        $("input[name^='cheak']:checked").each(function() {
            let chackbox = $(this).val();
            let subtotal = $('.total_amount_'+chackbox).val();
            total += parseFloat(subtotal);
        });
        $('#invoice_amount').val(total);
        $('#invoice_totalamount').val(total);
    });
	
	$.get('InvoiceManagement', {flag: "invoiceList"}, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		var count = 0;
		$.each(obj, function(index, value) {
			count++;
			var html = '';
			html += '<tr id=' +count+ '>';
			html += '<td style="padding-top: 15px;">' + obj[index].id2 + '</td>';
			html += '<td style="padding-top: 15px; ">' + obj[index].field2 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].field1 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].subtotal+ '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].discount + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].floatfield1+ '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].type+ '</td>';
			html += '<td style="word-break: break-all;">';
			if(obj[index].type != "Paid"){
				html += '<button style="" type="button" class="btn btn-success  addEvent" data-add_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Add	Income</button>';
			}
			html += '<a href="InvoiceManagement?flag=invoicePdf&invoiceId='+obj[index].id+'"" target="_blank" class="btn entry_heading color_white">PDF</a>';
			html += '<button style="margin: 5px;" type="button" class="btn btn-default addViewInvoice" data-view_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '"><i class="fa fa-eye" aria-hidden="true"></i>  View Invoice</button>';
			html += '<button style="margin: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin: 5px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="invoiceId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.invoiceTableTbody').append(html);
		});
		$('#invoiceTable').DataTable();
	});	
	
	$('#invoice_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#invoice_form')[0];
	    var data = new FormData(form);
	    $("#insretinvoicebtnSubmit").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "InvoiceManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
	        	var repo = JSON.parse(response);
	        	var message = repo[0].filed2;
	        	if (message == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
				}
	        	$("#invoice_form")[0].reset();
	        	$("#insretinvoicebtnSubmit").prop("disabled", false);
	        	$.get('InvoiceManagement', {flag: "invoiceList"}, function(response) {
					var obj = JSON.parse(response);
					var count = 0;
					table = $('#example').DataTable();
					table.destroy();
					$('.invoiceTableTbody').children('tr').remove();
					$.each(obj, function(index, value) {
						count++;
						var html = '';
						html += '<tr id=' +count+ '>';
						html += '<td style="padding-top: 15px;">' + obj[index].id2 + '</td>';
						html += '<td style="padding-top: 15px; ">' + obj[index].field2 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].field1 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].subtotal+ '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].discount + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].floatfield1+ '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].type+ '</td>';
						html += '<td style="word-break: break-all;">';
						if(obj[index].type != "Paid"){
							html += '<button style="" type="button" class="btn btn-success  addEvent" data-add_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Add	Income</button>';
						}
						html += '<a href="" target="_blank"></a>';
						html += '<a href="InvoiceManagement?flag=insert&invoiceId=1" target="_blank" class="btn entry_heading color_white">PDF</a>';
						html += '<button style="margin: 5px;" type="button" class="btn btn-default  addViewInvoice" data-view_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '"><i class="fa fa-eye" aria-hidden="true"></i>  View Invoice</button>';
						html += '<button style="margin: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
						html += '<button style="margin: 5px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="invoiceId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
						$('.invoiceTableTbody').append(html);
					});
					$('#invoiceTable').DataTable();
	        	});	
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#insretinvoicebtnSubmit").prop("disabled", false);
			}
		});
	});
	
	var addincomeList;
	var dueamount ;
	var conform ; 
	$(document).on('click', '.addEvent', function(){
  		let addid = $(this).data('add_id');
  		let invoice = $('#invoiceId'+addid).val();
 		$.get('InvoiceManagement',{flag:"invoiceEdit" , invoiceId : invoice},function(response){
  			addincomeList = JSON.parse(response);
  			console.log(response);
  			$("#income_amount").addClass("add_income_amount");
  			$('.nav-tabs a[href="#menu4"]').tab('show');
  			$('.add_income_invoice').hide();
  			$('#add_income_patientId').val(addincomeList[0].PatientID);
  			$('#add_income_invoice').val(addincomeList[0].id);
  			$('#add_invoice_income_status').val("invoiceIncome");
  			$('#income_amount').val(addincomeList[0].price);
  			dueamount = addincomeList[0].price;
  			conform = dueamount;
  		});
   	});
	
	$(document).on('click', '.addViewInvoice', function(){
  		let addid = $(this).data('view_id');
  		let invoice = $('#invoiceId'+addid).val();
 		$.get('InvoiceManagement',{flag:"invoicePdf" , invoiceId : invoice},function(response){
  			console.log(response);
  			/* console.log(response);
            let pdfWindow = window.open("");
            var bb = btoa(encodeURIComponent((response.replace(/[\u00A0-\u2666]/g, function(c) {
                return '&#' + c.charCodeAt(0) + ';';
            }))));
            console.log(bb); */
            
            var file = new Blob([response], { type: 'application/pdf;base64"' });
            var fileURL = URL.createObjectURL(file);
            window.open(fileURL);
           /*  var blob = new Blob([bb], {type: "application/pdf;base64"});
            var link = window.URL.createObjectURL(blob);
            window.open(link,'', 'height=650,width=840'); */
            
           /*  var file = new Blob([bb], {type:'application/pdf;base64 '});
            console.log(file);
            var fileUrl = URL.createObjectURL(file);
            pdfWindow.document.write("<iframe width='100%' height='100%' src= '"+file+"'></iframe>"); */
  		});
   	});
	
	$(document).on('click keyup', '.add_income_amount', function(){
  		let addincome = $(this).val();
  		if(dueamount < addincome){
  			alert("you can not enter more than this" +dueamount+" amount");
  			$('.add_income_amount').val(conform);
  		}
  		else {
			conform = addincome;
			console.log(conform);
		}
   	});
	
	$.get('InvoiceManagement', {flag: "incomeList"}, function(response) {
		var obj = JSON.parse(response);
		console.log(response);
		var count = 0;
		$.each(obj, function(index, value) {
			count++;
			var html = '';
			html += '<tr id=' +count+ '>';
			if(obj[index].id2 == 0){
				html += '<td style="padding-top: 15px;">-</td>';
			}
			else {
				html += '<td style="padding-top: 15px;">' + obj[index].id2 + '</td>';	
			}
			html += '<td style="padding-top: 15px; ">' + obj[index].field2 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].field1 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].field3 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].type+ '</td>';
			html += '<td>';
			html += '<button style="margin-left: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.invoice_income_table_list').append(html);
		});
		$('#invoice_income_table').DataTable();
	});
	
	$('#Add_income_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#Add_income_form')[0];
	    var data = new FormData(form);
	    $("#save_add_income").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "InvoiceManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
	        	console.log(response);
	        	if (response == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#invoice_form")[0].reset();
				}
	        	$("#save_add_income").prop("disabled", false);
	        	$.get('InvoiceManagement', {flag: "incomeList"}, function(response) {
					var obj = JSON.parse(response);
					var count = 0;
					table = $('#invoice_income_table').DataTable();
					table.destroy();
					$('.invoice_income_table_list').children('tr').remove();
					$.each(obj, function(index, value) {
						count++;
						var html = '';
						html += '<tr id=' +count+ '>';
						if(obj[index].id2 == 0){
							html += '<td style="padding-top: 15px;">-</td>';
						}
						else {
							html += '<td style="padding-top: 15px;">' + obj[index].id2 + '</td>';	
						}
						html += '<td style="padding-top: 15px; ">' + obj[index].field2 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].field1 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].field3 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].type+ '</td>';
						html += '<td>';
						html += '<button style="margin-left: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
						html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
						$('.invoice_income_table_list').append(html);
					});
					$('#invoice_income_table').DataTable();
	        	});	
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#save_add_income").prop("disabled", false);
			}
		});
	});
	
	$.get('InvoiceManagement', {flag: "expenseList"}, function(response) {
		var obj = JSON.parse(response);
		var count = 0;
		table = $('#invoice_expense_table').DataTable();
		table.destroy();
		$('.invoice_expense_table_list').children('tr').remove();
		$.each(obj, function(index, value) {
			count++;
			var html = '';
			html += '<tr id=' +count+ '>';
			html += '<td style="padding-top: 15px; ">' + obj[index].field1 + '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
			html += '<td style="padding-top: 15px;">' + obj[index].field3 + '</td>';
			html += '<td>';
			html += '<button style="margin: 5px;" type="button" class="btn btn-default  addViewInvoice" data-view_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '"><i class="fa fa-eye" aria-hidden="true"></i>  View Expense</button>';
			html += '<button style="margin-left: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
			html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
			$('.invoice_expense_table_list').append(html);
		});
		$('#invoice_expense_table').DataTable();
	});	
	
	$('#invocie_expense_form').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#invocie_expense_form')[0];
	    var data = new FormData(form);
	    $("#invoce_save_expense").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "InvoiceManagement",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response) {
	        	console.log(response);
	        	if (response == "true") {
					$('#message1').show();
					$('#message2').show();
					$('#message3').show();
					$('#messagepass').text("Record Added Successsfully");
					$("#invoice_form")[0].reset();
				}
	        	$("#invoce_save_expense").prop("disabled", false);
	        	$.get('InvoiceManagement', {flag: "expenseList"}, function(response) {
					var obj = JSON.parse(response);
					var count = 0;
					table = $('#invoice_expense_table').DataTable();
					table.destroy();
					$('.invoice_expense_table_list').children('tr').remove();
					$.each(obj, function(index, value) {
						count++;
						var html = '';
						html += '<tr id=' +count+ '>';
						html += '<td style="padding-top: 15px; ">' + obj[index].field1 + '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].price+ '</td>';
						html += '<td style="padding-top: 15px;">' + obj[index].field3 + '</td>';
						html += '<td>';
						html += '<button style="margin: 5px;" type="button" class="btn btn-default  addViewInvoice" data-view_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '"><i class="fa fa-eye" aria-hidden="true"></i>  View Expense</button>';
						html += '<button style="margin-left: 5px;" type="button" class="btn btn-info  editEvent" data-edit_id="' + count + '" id="invoiceId' + count + '"value="' + obj[index].id + '">Edit</button>';
						html += '<button style="margin-left: 10px; " type="button" class="btn btn-danger deleteEvent" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '">Delete</button></td></tr>';
						$('.invoice_expense_table_list').append(html);
					});
					$('#invoice_expense_table').DataTable();
	        	});	
			},
			error: function(e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
				$("#invoce_save_expense").prop("disabled", false);
			}
		});
	});
}); 
</script>
<script type="text/javascript">
function add_entry(){
	$("#income_entry").append('<div class="form-group"><label class="col-sm-2 control-label" for="income_entry">Income Entry<span class="require-field">*</span></label><div class="col-sm-2 margin_bottom_5px"><input id="income_amount" class="form-control validate[required] text-input"  min="0" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01" value="" name="income_amount[]" placeholder="Income Amount (&#x20B9;) required "></div><div class="col-sm-4 margin_bottom_5px"><input id="income_entry" class="form-control text-input" maxlength="50" type="text" value="" name="income_entry[]" placeholder="Income Entry Label" required ></div><div class="col-sm-2"><button type="button" class="btn btn-default" onclick="deleteParentElement(this)"><i class="entypo-trash">Delete</i></button></div></div>');
}
function deleteParentElement(n){
alert("Do you really want to delete this record");
	n.parentNode.parentNode.parentNode.removeChild(n.parentNode.parentNode);
}
function add_expense_entry(){
	$("#expense_entry").append('<div class="form-group"><label class="col-sm-2 control-label" for="expense_amount">Expense Entry<span class="require-field">*</span></label><div class="col-sm-2 margin_bottom_5px"><input id="expense_amount" class="form-control text-input"  min="0" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01" value="" name="expense_amount[]" placeholder="Expense Amount (&#x20B9;)"></div><div class="col-sm-4 margin_bottom_5px"><input id="income_entry" class="form-control text-input" maxlength="50" type="text" value="" name="expense_entry[]" placeholder="Expense Entry Label"></div><div class="col-sm-2"><button type="button" class="btn btn-default" onclick="deleteParentElement(this)"><i class="entypo-trash">Delete</i></button></div></div>');
}

</script>
<style type="text/css">
.multiselect-container {
    width: 653px;
    overflow: scroll;
    overflow-x: scroll;
    overflow-y: scroll;
    height: 140px;
}
.require-field{
color: red;
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
#invoiceTable_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#invoiceTable_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#invoice_expense_table_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#invoice_expense_table_paginate{
    margin-left: 298px;
    margin-top: -29px;
}
#invoice_income_table_length{
	margin-left: 4px;
    margin-top: 15px;
    margin-bottom: 10px;
}
#invoice_income_table_paginate{
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
.row {
    margin-right: -15px;
    margin-left: -15px;
    margin-bottom: 16px;
}
.form-control {
    background: #fff;
    border-radius: 0;
    border: 1px solid #dce1e4;
    box-shadow: none!important;
    font-size: 13px;
    padding: 6px 3px!important;
    transition: all .2s ease-in-out;
}
.charges_heading {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    width: 100%;
    float: left;
    margin-bottom: 5px;
}
</style>
</head>
<body style="background-color: #f1f4f9; font-family: 'Open Sans',sans-serif;font-size: 13px;">
	
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
				<a style="background-color: white; margin-top: 17px;color: #5f5f5f !important; height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
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
			<span class="icone"> <img src="ing/outpatient-logo.png" alt=""></span>
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
			<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li>
			<li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
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
		<div class="container" style="margin-right: 90px;">
			<ul class="nav nav-tabs tabcalss">
				<li class="active" id="tab1doctorlist"><a href="#home"
					data-toggle="tab" ><i class="fa fa-bars"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Invoice list</a></li>
						
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu1" id="invoiceteb1" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Invoice</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb2" data-toggle="tab"
					href="#menu2" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Invoice</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu3" id="invoiceteb3" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Income List</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu4" id="invoiceteb4" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Income</a>
				</li>
				
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb5" data-toggle="tab"
					href="#menu5" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Income</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu6" id="invoiceteb6" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Expense List</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;">
				<a href="#menu7" id="invoiceteb7" data-toggle="tab">
				<i class="fa fa-plus-circle"aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Add Expense</a>
				</li>
				<li style="margin-left: 15px; background-color: f1f4f9;"><a 
				id="invoiceteb8" data-toggle="tab"
					href="#menu8" style="display: none;"><i class="fas fa-edit"
						aria-hidden="true" style="border-radius: 50%; padding: 8px;"></i>Edit Income</a>
				</li>
			</ul>
			<div class="tab-content">
			<div id="home" class="container tab-pane active" style="margin-top: 10px;">
			    <table id="invoiceTable" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th scope="col">Invoice Id</th>
			                <th scope="col">Title</th>
			                <th scope="col">Patient</th>
			                <th scope="col">Total Amount</th>
			                <th scope="col">Adjustment Amount </th>
			                <th scope="col">Paid Amount</th>
			                <th scope="col">Due Amount</th>
			                <th scope="col">Status</th>
			                <th scope="col" style="width: 280px;">Action</th>
			            </tr>
			        </thead>
			        <tbody class="invoiceTableTbody">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th scope="col">Invoice Id</th>
			                <th scope="col">Title</th>
			                <th scope="col">Patient</th>
			                <th scope="col">Total Amount</th>
			                <th scope="col">Adjustment Amount </th>
			                <th scope="col">Paid Amount</th>
			                <th scope="col">Due Amount</th>
			                <th scope="col">Status</th>
			                <th scope="col" style="width: 280px;">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			
			<div id="menu1" class="tab-pane">
			    <form name="invoice_form" action="" method="post" class="form-horizontal" id="invoice_form"
			        style="margin-top: 15px;">
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_number">Invoice ID<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_number" class="form-control" type="text" readonly name="invoice_number">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8 ">
			                <select id="patientid" class="form-control " name="invoice_patientId" required>
								<option value="" disabled selected hidden="">Select Patient</option>
								<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
									<option value="${q.id }">${q.firstname } - ${q.patientid }</option>
								</c:forEach>
						   </select>
			            </div>
			            <div class="col-sm-1">
			                <a href="#" id="Check_Charges"class="btn btn-default"><i class="fa fa-eye"></i> Check Charges</a>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invice_title">Invoice Title</label>
			            <div class="col-sm-8">
			                <input id="invice_title" class="form-control"maxlength="50" type="text" value="" name="invice_title">
			            </div>
			        </div>
			        
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">Subtotal Amount (&#x20B9;)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_amount"
			                    readonly required>
			            </div>
			            <div id="invoice_charges">
			            	
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="adjustment_amount">Adjustment Amount (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="adjustment_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.0" name="adjustment_amount">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">total Amount (&#x20B9;)<span
			                    class="require-field" >*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_totalamount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_total_amount" required
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control " type="text" name="invoice_date" readonly>
			            </div>
			        </div>
			        <div class="form-group margin_bottom_5px">
			            <label class="col-sm-2 control-label" for="comments">Comments</label>
			            <div class="col-sm-8">
			                <textarea id="comments" class="form-control "
			                    maxlength="150" name="comments"></textarea>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			      	  	<input type="hidden" name="flag" value="invoiceInsert"> 
			            <input type="submit" value="Create Invoice Entry" id="insretinvoicebtnSubmit" name="save_invoice" class="btn btn-success" style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu2" class="tab-pane">
			    <form name="invoice_form" action="" method="post" class="form-horizontal" id="invoice_form"
			        style="margin-top: 15px;">
			        <!-- START INVOICE FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_number">Invoice ID<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_number" class="form-control" type="text" readonly
			                    value="20102068" name="invoice_number">
			            </div>
			        </div>
			
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8 ">
			                <select name="patient" class="form-control" id="patient_id">
			                    <option value="">Select Patient</option>
			                </select>
			            </div>
			            <div class="col-sm-1">
			                <a href="#" class=" btn btn-default"><i class="fa fa-eye"></i> Check Charges</a>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invice_title">Invoice Title</label>
			            <div class="col-sm-8">
			                <input id="invice_title" class="form-control"
			                    maxlength="50" type="text" value="" name="invice_title">
			            </div>
			        </div>
			        <div class=""></div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">Subtotal Amount (&#x20B9;)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="edit_invoice_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_amount"
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="adjustment_amount">Adjustment Amount (&#x20B9;)</label>
			            <div class="col-sm-8">
			                <input id="adjustment_amount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="adjustment_amount">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="vat_percentage">total Amount (&#x20B9;)<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="edit_invoice_totalamount" class="form-control" min="0" type="number"
			                    onkeypress="if(this.value.length==12) return false;" step="0.01" value="" name="invoice_amount"
			                    readonly>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control " type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div class="form-group margin_bottom_5px">
			            <label class="col-sm-2 control-label" for="comments">Comments</label>
			            <div class="col-sm-8">
			                <textarea id="comments" class="form-control"
			                    maxlength="150" name="comments"></textarea>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Invoice Entry" name="save_invoice" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu3" class="container tab-pane " style="margin-top: 10px;">
			    <table id="invoice_income_table" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th style="">Invoice Id</th>
			                <th style="">Patient Id</th>
			                <th style="">Patient Name</th>
			                <th style="">Amount</th>
			                <th style="">Date</th>
			                <th style="">Payment Method</th>
			                <th style="">Action</th>
			            </tr>
			        </thead>
			        <tbody class="invoice_income_table_list">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th style="">Invoice Id</th>
			                <th style="">Patient Id</th>
			                <th style="">Patient Name</th>
			                <th style="">Amount</th>
			                <th style="">Date</th>
			                <th style="">Payment Method</th>
			                <th style="">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			<div id="menu4" class="tab-pane">
			    <form name="income_form" action="" method="post" class="form-horizontal" id="Add_income_form" style="margin-top: 15px;">
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select id="add_income_patientId" class="form-control " name="add_income_patientId" required >
								<option value="" disabled selected hidden="">Select Patient</option>
								<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
									<option value="${q.id }">${q.firstname } - ${q.patientid }</option>
								</c:forEach>
						   </select>
			            </div>
			        </div>
			        <div class="form-group add_income_invoice">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="add_income_payment_status" id="add_income_payment_status" class="form-control">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_method">Payment Method<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="payment_method" id="payment_method" class="form-control" required >
			                    <option value="Cash">Cash</option>
			                    <option value="Cheque">Cheque</option>
			                    <option value="Bank Transfer">Bank Transfer</option>
			                    <option value="Credit Card Or Debit Card">Credit Card Or Debit Card</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="">Payment Details</label>
			            <div class="col-sm-8">
			                <textarea name="payment_description"class="form-control" maxlength="150"id="notice_content"></textarea>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" name="invoice_income_date" id="invoice_date" class="form-control" placeholder="dd/mm/yyyy"style="width: 750px;" required="required" readonly>
					            <div class="input-group-addon" >
					              <span class=""></span>
					            </div>
							</div>    
			            </div>
			        </div>
			        <hr>
			        <div id="income_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Income Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control  text-input" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="income_amount[]"
			                        placeholder="Income Amount ($)"required >
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Income Entry Label"required>
			                </div>
			            </div>
			        </div>
			        <div class="form-group add_income_invoice">
			            <label class="col-sm-2 control-label" for="income_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Income Entry </button>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8">
			        	<input type="hidden" name="flag" value="insertIncome">
			        	<input type="hidden" name="status" value="income" id="add_invoice_income_status">
			        	<input type="hidden" name="invoiceid" value="" id="add_income_invoice">
			            <input type="submit" value="Create Income Entry" name="save_income" id="save_add_income" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu5" class="tab-pane">
			    <form name="income_form" action="" method="post" class="form-horizontal" id="income_form" style="margin-top: 15px;">
			        <!-- START INCOME FORM -->
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="party_name" class="form-control ">
			                </select>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control ">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_method">Payment Method<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="payment_method" id="payment_method" class="form-control">
			                    <option value="Cash">Cash</option>
			                    <option value="Cheque">Cheque</option>
			                    <option value="Bank Transfer">Bank Transfer</option>
			                    <option value="Credit Card Or Debit Card">Credit Card Or Debit Card</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="">Payment Details</label>
			            <div class="col-sm-8">
			                <textarea name="payment_description"
			                    class="form-control " maxlength="150"
			                    id="notice_content"></textarea>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control " type="text" value="2020-10-20" name="invoice_date">
			            </div>
			        </div>
			        <hr>
			        <div id="income_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Income Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control text-input" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="income_amount[]"
			                        placeholder="Income Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Income Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group ">
			            <label class="col-sm-2 control-label" for="income_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Income Entry </button>
			            </div>
			        </div>
			      
			        <div class="col-sm-offset-2 col-sm-8">
			            <input type="submit" value="Create Income Entry" name="save_income" class="btn btn-success"
			                style="margin-bottom: 15px;">
			        </div>
			    </form>
			</div>
			<div id="menu6" class="container tab-pane " style="margin-top: 10px;">
			    <table id="invoice_expense_table" class="display table table-striped table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th style="">Supplier Name</th>
			                <th style="">Amount</th>
			                <th style="">Date</th>
			                <th style="">Action</th>
			            </tr>
			        </thead>
			        <tbody class="invoice_expense_table_list">
			        </tbody>
			        <tfoot>
			            <tr>
			                <th style="">Supplier Name</th>
			                <th style="">Amount</th>
			                <th style="">Date</th>
			                <th style="">Action</th>
			            </tr>
			        </tfoot>
			    </table>
			    <div style="margin-top: 26px;"></div>
			</div>
			<div id="menu7" class="tab-pane">
			    <form name="expense_form" action="" method="post" class="form-horizontal" id="invocie_expense_form"style="margin-top: 15px">
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Supplier Name<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="party_name"class="form-control"maxlength="30" type="text" value="" name="party_name">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="payment_status"  class="form-control">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text" name="invoice_expense_date" class="form-control" placeholder="dd/mm/yyyy"style="width: 750px;" required="required" readonly>
					            <div class="input-group-addon" >
					              <span class=""></span>
					            </div>
							</div>    
			            </div>
			        </div>
			        <div id="expense_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Expense Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="expense_amount" class="form-control" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="expense_amount[]"
			                        placeholder="Expense Amount ($)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"
			                        class="form-control"
			                        maxlength="50" type="text" value="" name="expense_entry[]" placeholder="Expense Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="expense_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_expense_entry()">Add Expense Entry </button>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8"style="margin-bottom: 15px; ">
			        	<input type="hidden" name="flag" value="expenseInsert">
			            <input type="submit" value="Create Expense Entry"id="invoce_save_expense" name="save_expense" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div id="menu8" class="tab-pane">
			    <form name="expense_form" action="" method="post" class="form-horizontal" id="invocie_expense_form"
			        style="margin-top: 15px;" >
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="patient">Supplier Name<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="party_name"
			                    class="form-control"
			                    maxlength="30" type="text" value="" name="party_name">
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="payment_status">Status<span
			                    class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <select name="" id="payment_status" class="form-control">
			                    <option value="Paid">Paid</option>
			                    <option value="Part Paid">Part Paid</option>
			                    <option value="Unpaid">Unpaid</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="invoice_date">Date<span class="require-field">*</span></label>
			            <div class="col-sm-8">
			                <input id="invoice_date" class="form-control" type="text" value="2020-10-20"
			                    name="invoice_date">
			            </div>
			        </div>
			        <div id="expense_entry">
			            <div class="form-group">
			                <label class="col-sm-2 control-label" for="income_entry">Expense Entry<span
			                        class="require-field">*</span></label>
			                <div class="col-sm-2 margin_bottom_5px">
			                    <input id="income_amount" class="form-control" min="0" type="number"
			                        onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name=""
			                        placeholder="Expense Amount (&#x20B9;)">
			                </div>
			                <div class="col-sm-4">
			                    <input id="income_entry"
			                        class="form-control"
			                        maxlength="50" type="text" value="" name="income_entry[]" placeholder="Expense Entry Label">
			                </div>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label" for="expense_entry"></label>
			            <div class="col-sm-3">
			
			                <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name=""
			                    onclick="add_entry()">Add Expense Entry </button>
			            </div>
			        </div>
			        <div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 15px; ">
			            <input type="submit" value="Create Expense Entry" id="save_expense"name="save_expense" class="btn btn-success">
			        </div>
			    </form>
			</div>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			    aria-hidden="true">
			    <div class="modal-dialog modal-lg">
			        <div class="modal-content" style="width: 1240px;margin-left: -182px;height: 468px;">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal">x</button>
			                <h3 class="modal-title"id="invoicepoupopatientname">No Record Found</h3>
			            </div>
			            <div class="modal-body" style="background: #fff;height: 347px;overflow-y:scroll;">
			                <div class="charges_heading">
			                    <div class="col-md-1 ">
			                        #
			                    </div>
			                    <div class="col-md-2 ">
			                        Type 
			                    </div>
			                    <div class="col-md-2 ">
			                        Title </div>
			                    <div class="col-md-1 ">
			                        Date </div>
			                    <div class="col-md-1 ">
			                        Unit </div>
			                    <div class="col-md-1 ">
			                        Amount (&#x20B9;)
			                    </div>
			                    <div class="col-md-1 ">
			                        Discount Amount (&#x20B9;)
			                    </div>
			                    <div class="col-md-1 ">
			                        Total Amount (&#x20B9;)
			                    </div>
			                    <div class="col-md-1 col-sm-4 col-xs-12 align_center padding_8">
			                        Action </div>
			                </div>
			                <div class="charges_body">
			                </div>
			                <div id="entriys">
							    
							</div>
						</div>			                
		                <div class="footer">
		                    <div class="col-md-2">
		                        <input type="submit" data-dismiss="modal" class="btn btn-success" id="invoiceClose" style="width:100%;margin-top: 10px"
		                            name="get_totale" value="SAVE">
		                    </div>
		                </div>
			        </div>
			    </div>
			</div>
			<div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			        <!-- Modal content-->
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal">&times;</button>
			            </div>
			            <div class="modal-body">
			                <p>You must select patient.</p>
			                <p>0</p>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>