<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
$(document).ready(function(){
	$(document).on("click", ".delete_medicine_div", function(){
		alert("Do you really want to delete this record ?");
		$(this).parent().parent().parent().remove();
	});
});
</script>
<script type="text/javascript">
	var key=0;
	function add_entry()
	{	
	key++;	
		$(".main_medicine_div").append('<div class="medicine_div"><div class="form-group"><label class="col-sm-2 control-label" for="medicine_name">Medicine<span class="require-field">*</span></label><div class="col-sm-3 margin_bottom_5px"><input id="medicine_name" class="form-control validate[required,custom[popup_category_validation]] text-input  medicine_name" maxlength="50" type="text" placeholder="Medicine Name" value="" name="medicine_name[]"></div><div class="col-sm-6"><textarea rows="1"  name="description[]"  class="form-control validate[custom[address_description_validation]]" id="description" maxlength="150" placeholder="Description"></textarea></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="20" placeholder="Batch Number" value="" name="batch_number[]"></div><div class="col-sm-2 margin_bottom_5px"><input  class="form-control validate[required] text-input" min="0" type="number" onKeyPress="if(this.value.length==6) return false;"  placeholder="Quantity" value="" name="med_quantity[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="med_price" class="form-control validate[required] text-input" min="1" type="number" step="0.01" onKeyPress="if(this.value.length==8) return false;"  placeholder="Price (&#36;)" value="" name="med_price[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[] text-input med_uniqueid validate[custom[popup_category_validation]]" maxlength="10" type="text" placeholder="Medicine ID"	value="" name="med_uniqueid[]"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><textarea rows="1"  name="note[]"  class="form-control validate[custom[address_description_validation]]"  maxlength="150" placeholder="Note"></textarea></div><div class="col-sm-2 margin_bottom_5px"><input id="med_discount" class="form-control text-input" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01"  placeholder="Discount" value="" name="med_discount[]"></div><div class="col-sm-2 margin_bottom_5px">						<select class="form-control" name="med_discount_in[]"><option value="flat">Flat</option><option value="percentage">Percentage</option></select></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input id="mfg_cmp_name" class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="50" placeholder="Manufacturer Company Name" value="" name="mfg_cmp_name[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_manufactured_date" type="text"  name="manufactured_date[]" placeholder="Manufactured Date" value="" readonly></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_expiry_date" type="text"  name="expiry_date[]" placeholder="Expiry Date" value="" readonly></div><div class="col-sm-offset-2 col-sm-1"><button type="button" class="btn btn-default delete_medicine_div"><i class="entypo-trash">Delete</i></button></div></div></div>');
	}
</script>
</head>

<body>

			<!-- END Medicine FORM-->

</body>
</html>