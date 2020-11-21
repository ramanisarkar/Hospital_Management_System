<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet'  type='text/css'>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style type="text/css">
.popup-bg {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    cursor: pointer;
    z-index: 1000;
    background: #000;
    background: rgba(0,0,0,0.35);
}
element.style {
    background: rgba(0, 0, 0, 0);
    display: block;
    height: 1120px;
}
.popup-bg {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    cursor: pointer;
    z-index: 1000;
    background: #000;
    background: rgba(0,0,0,0.35);
}
.invoice_entry_popup {
    left: 30%;
    width: 77%;
}
.overlay-content {
    background: #ffffff none repeat scroll 0 0;
    border-radius: 4px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.9);
    cursor: default;
    float: left;
    left: 40%;
    margin: 0 0 0 -13%;
    padding: 10px 10px 10px;
    position: fixed;
    top: 6%;
    width: 60%;
}.charges_heading {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    width: 100%;
    float: left;
    margin-bottom: 5px;
}@media only screen and (min-width: 992px)
.charges_body {
    height: 270px;
    overflow-y: scroll;
    overflow-x: hidden;
}
.charges_body {
    float: left;
}.row {
    margin-right: -15px;
    margin-left: -15px;
}@media only screen and (min-width: 992px)
#patient_transaction .col-md-1 {
    width: 9%!important;
}@media only screen and (min-width: 992px)
.div_padding_bottom_5 {
    padding-bottom: 5px!important;
    padding-left: 5px!important;
}
@media only screen and (min-width: 992px)
.div_padding_right_0 {
    padding-right: 0px!important;
}
body {
    position: relative;
    height: 100%!important;
    width: 100%;
    font-family: 'Open Sans',sans-serif;
    font-size: 13px;
    background: #ccc;
    color: #4E5E6A;
}
</style>
</head>
<body>
<div class="popup-bg" style="background: rgba(0, 0, 0, 0); display: block; height: 1120px;">
		<div class="overlay-content invoice_entry_popup"style="    width: 1250px;
    margin-right: 0%;
    margin-left: -358px;
}">   
			<div class="patient_invoice">	<!-- POP up code -->
	<div class="popup-bg medicine_details">
		<div class="overlay-content overlay_content_css">
			<div class="modal-content">			
				<div class="medicine_data"></div>			
			</div>
		</div>     
	</div> 
	<!-- End POP-UP Code -->
	<div class="modal-header"> 
		<a href="#" class="close-btn-cat badge badge-danger pull-right">X</a>
	</div>
			<script>
		$(document).ready(function()
		{ 
			var date = new Date();
			date.setDate(date.getDate()-0);
			$.fn.datepicker.defaults.format =" yyyy-mm-dd";
			$('.invoice_date').datepicker({
			endDate: '+0d',
			autoclose: true
		   }); 
		});
		</script>
		<style>
		.table123 td, .table123>tbody>tr>td, .table123>tbody>tr>th, .table123>tfoot>tr>td, .table123>tfoot>tr>th, .table123>thead>tr>td, .table123>thead>tr>th
		{
			padding: 8px!important;
		}
		</style>
		<h4>Himanshu Patel</h4>
		<form method="post" name="totle_form">
			<input type="hidden" name="patient_id" value="118">
			<div class="table123" id="patient_transaction">
				<div class="charges_heading">
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">				
						#
					</div>
					<div class="col-md-2 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">				
						Type					</div>
					<div class="col-md-2 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Title					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Date					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Unit					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Amount ($)
					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Discount Amount ($)
					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Tax Amount ($)
					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center padding_8">
					Total Amount ($)
					</div>
					<div class="col-md-1 col-sm-4 col-xs-12 align_center padding_8">
					Action					</div>
				</div>
				<div class="charges_body">
										
								<div class="row">
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input type="hidden" name="transaction_ids[cheak_0]" value="243">
										<input type="hidden" name="patient" value="118">
										<input id="" type="checkbox" value="1" name="cheak[cheak_0]" checked="">
									</div>
									<div class="col-md-2 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">		
										<input id="type" class="form-control text-input" type="text" value="Instrument Charges" name="type[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-2 col-sm-4 col-xs-12 align_center div_padding_right_0 div_padding_bottom_5">	
										<input id="title" class="form-control text-input" type="text" value="sdfasfsdafsaf" name="title[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="date" class="form-control text-input" type="text" value="2019-09-02" name="date[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="unit" class="form-control text-input" type="text" value="9 Days" name="unit[]" placeholder="" readonly="readonly">
									</div>		
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="amount" class="form-control text-input amount_0" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="594.00" name="amount[cheak_0]" placeholder="" readonly="readonly">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">
										<input type="hidden" name="old_discount_amount" class="old_discount_amount_0" value="0.00"> 							
										<input id="discount_amount" class="form-control text-input transaction_discount discount_amount_0" type="number" dataid1="0" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.00" name="discount_amount[cheak_0]" placeholder="">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input type="hidden" name="old_tax_amount" class="old_tax_amount_0" value="53.46"> 
										<input id="tax_amount" class="form-control text-input tax_amount_0" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="53.46" name="tax_amount[cheak_0]" placeholder="" readonly="readonly">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="total_amount" class="form-control text-input total_amount_0" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="647.46" name="total_amount[cheak_0]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 align_center div_padding_bottom_5">	
										
									</div>												
								</div>									
												
								<div class="row">
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input type="hidden" name="transaction_ids[cheak_170]" value="900">
										<input type="hidden" name="patient" value="118">
										<input id="" type="checkbox" value="1" name="cheak[cheak_170]" checked="">
									</div>
									<div class="col-md-2 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">		
										<input id="type" class="form-control text-input" type="text" value="Medicine Charges" name="type[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-2 col-sm-4 col-xs-12 align_center div_padding_right_0 div_padding_bottom_5">	
										<input id="title" class="form-control text-input" type="text" value="Medicine" name="title[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="date" class="form-control text-input" type="text" value="2020-10-30" name="date[]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="unit" class="form-control text-input" type="text" value="" name="unit[]" placeholder="" readonly="readonly">
									</div>		
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="amount" class="form-control text-input amount_170" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="50.00" name="amount[cheak_170]" placeholder="" readonly="readonly">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">
										<input type="hidden" name="old_discount_amount" class="old_discount_amount_170" value="0.01"> 							
										<input id="discount_amount" class="form-control text-input transaction_discount discount_amount_170" type="number" dataid1="170" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.01" name="discount_amount[cheak_170]" placeholder="" readonly="readonly">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input type="hidden" name="old_tax_amount" class="old_tax_amount_170" value="0.00"> 
										<input id="tax_amount" class="form-control text-input tax_amount_170" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="0.00" name="tax_amount[cheak_170]" placeholder="" readonly="readonly">
										
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 div_padding_right_0 align_center div_padding_bottom_5">	
										<input id="total_amount" class="form-control text-input total_amount_170" type="number" min="0" onkeypress="if(this.value.length==10) return false;" step="0.01" value="49.99" name="total_amount[cheak_170]" placeholder="" readonly="readonly">
									</div>
									<div class="col-md-1 col-sm-4 col-xs-12 align_center div_padding_bottom_5">	
																			<a href="?page=hmgt_medicine&amp;dispatchmedicinepdf=dispatchmedicinepdf&amp;dispatch_medicine_id=81" target="_blank" class="btn btn-primary"> View</a>
										
									</div>												
								</div>									
													<div id="entriys">
						</div>
							
				</div>
			</div>
			<div class="col-md-12" style="padding-top:10px;padding-bottom:10px;">
				<button id="add_new_entry" style="width:100%;" class="btn btn-default btn-sm btn-icon icon-left add_more_charge_entry" type="button" name="add_new_entry"><span class="dashicons dashicons-plus-alt"></span> NEW ROW</button>
			</div>
			<div>
				<div class="col-md-3">	
					<button id="addremove" model="invoice_charge" style="width:100%;margin-bottom: 10px;" class="btn btn-default btn-sm btn-icon icon-left" type="button"><span class="dashicons dashicons-plus-alt"></span><span class="dashicons dashicons-minus"></span> CHARGE CATEGORY</button>
				</div>
				<div class="col-md-2">	
					<input type="submit" class="btn btn-success" style="width:100%;" name="get_totale" value="SAVE">
				</div>
			</div>
			<script>
				// CREATING BLANK INVOICE ENTRY
				var blank_income_entry ='';
				var blank_custom_label ='';
				$(document).ready(function()
				{ 
					blank_income_entry = $('#invoice_entry').html();
					blank_custom_label = $('#custom_labels').html();
						
				}); 	
				function add_entry()
				{
					$("#invoice_entry").append(blank_income_entry);
				}  
				// REMOVING INVOICE ENTRY
				function deleteParentElement(n)
				{
					n.parentNode.parentNode.parentNode.removeChild(n.parentNode.parentNode);
				}
			 </script>
		</form>
	</div>     
		</div>     
	</div>
</body>
</html>