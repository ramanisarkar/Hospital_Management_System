<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="panel-body"><!--START PANEL BODY DIV-->
			<form name="bed_form" action="" method="post" class="form-horizontal" id="instrument_form"><!--START INSTRUMENT FORM-->
								<input type="hidden" name="action" value="insert">
				<input type="hidden" name="instrument_id" value="">
				<div class="col-sm-6" style="min-height: 400px;">
					<fieldset>
						<legend>Instrument Info:</legend>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="instrument_code">Instrument Code<span class="require-field">*</span></label>
								<div class="col-sm-9">
									<input id="instrument_code" class="form-control validate[required] text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;" value="" name="instrument_code">
								</div>
							</div>
				
							<div class="form-group">
								<label class="col-sm-3 control-label" for="instrument_name">Instrument Name<span class="require-field">*</span></label>
								<div class="col-sm-9">
									<input id="instrument_name" class="form-control validate[required,custom[popup_category_validation]]" type="text" maxlength="50" value="" name="instrument_name">
								</div>
							</div>
				
				
							<div class="form-group">
								<label class="col-sm-3 control-label" for="charge_type">Charges Type<span class="require-field">*</span></label>
								<div class="col-sm-9">
																	<label class="radio-inline">
									 <input type="radio" value="Daily" class="tog validate[required]" name="charge_type" checked="checked">Daily									</label>
									<label class="radio-inline">
									  <input type="radio" value="Hourly" class="tog validate[required]" name="charge_type">Hourly 
									</label>
								</div>
							</div>
				
							<div class="form-group">
								<label class="col-sm-3 control-label" for="instrument_charge">Instrument charge ($)<span class="require-field">*</span></label>
								<div class="col-sm-9">
									<input id="instrument_charge" class="form-control validate[required] " min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="instrument_charge">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="">Tax</label>
								<div class="col-sm-9">
									<select class="form-control" id="tax_charge" name="tax[]" multiple="multiple" style="display: none;">					
																					<option value="1">GST-9</option>
																					<option value="2">SGST-8</option>
																					<option value="3">VAT-5</option>
																					<option value="4">cgst-2</option>
																			</select><div class="btn-group"><button type="button" class="multiselect dropdown-toggle btn btn-default" data-toggle="dropdown" title="Select Tax"><span class="multiselect-selected-text">Select Tax</span> <b class="caret"></b></button><ul class="multiselect-container dropdown-menu"><li class="multiselect-item multiselect-all"><a tabindex="0" class="multiselect-all"><label class="checkbox"><input type="checkbox" value="multiselect-all"> Select all</label></a></li><li><a tabindex="0"><label class="checkbox"><input type="checkbox" value="1"> GST-9</label></a></li><li><a tabindex="0"><label class="checkbox"><input type="checkbox" value="2"> SGST-8</label></a></li><li><a tabindex="0"><label class="checkbox"><input type="checkbox" value="3"> VAT-5</label></a></li><li><a tabindex="0"><label class="checkbox"><input type="checkbox" value="4"> cgst-2</label></a></li></ul></div>		
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="instrument_description">Description</label>
								<div class="col-sm-9">
									<textarea id="instrument_description" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="instrument_description"></textarea>									
								</div>
							</div>		
					</fieldset>
				</div>
				<div class="col-sm-6" style="min-height: 400px;">
					<fieldset>
									<legend>Firm Info:</legend>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="code">Code</label>
										<div class="col-sm-10">
											<input id="code" class="form-control text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;" value="" name="code">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="name">Name</label>
										<div class="col-sm-10">
											<input id="name" class="form-control text-input  validate[custom[popup_category_validation]]" type="text" maxlength="30" value="" name="name">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="address">Address</label>
										<div class="col-sm-10">
											<textarea id="address" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="address" cols="29"></textarea>
										</div>
									</div>	
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="contact">Contact</label>
										<div class="col-sm-10">
											<input id="contact" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="contact">	
										</div>
									</div>			
					</fieldset>
				</div>
				<div class="col-sm-6" style="min-height: 350px;">
					<fieldset>
									<legend>Asset Info:</legend>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="description">Description</label>
										<div class="col-sm-10">
											<textarea name="description" maxlength="150" class="form-control validate[custom[address_description_validation]]"></textarea>
										</div>
									</div>	
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="quantity">Quantity</label>
										<div class="col-sm-10">
											<input id="quantity" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==4) return false;" value="" name="quantity">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="price">Price ($)</label>
										<div class="col-sm-10">
											<input id="price" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="price">
										</div>
									</div>
									
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="class">Class</label>
										<div class="col-sm-10">
											<input id="class" class="form-control  text-input validate[custom[popup_category_validation]]" type="text" maxlength="30" value="" name="class">
										</div>
									</div>			
					</fieldset>
				</div>
				<input type="hidden" id="_wpnonce" name="_wpnonce" value="5f790c3c19"><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=instrument&amp;tab=addinstrument&amp;action=insert">				<div class="col-sm-6" style="min-height: 350px;">
					<fieldset>
						<legend>Invoice Info:</legend>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="serial">Serial</label>
							<div class="col-sm-10">
								<input id="serial" class="form-control  text-input" type="number" min="0" onkeypress="if(this.value.length==6) return false;" value="" name="serial">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="acquire">Acquire</label>
							<div class="col-sm-10">
								<input id="acquire" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" value="" name="acquire">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="asset_id">Asset ID</label>
							<div class="col-sm-10">
								<input id="asset_id" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" value="" name="asset_id">
							</div>
						</div>				
					</fieldset>
				</div>
				<div class="col-sm-offset-2 col-sm-8">
							<input type="submit" value="Save" name="save_instrument" class="btn btn-success">
				</div>
	        </form><!--END INSTRUMENT FORM-->
	    </div>
</body>
</html>