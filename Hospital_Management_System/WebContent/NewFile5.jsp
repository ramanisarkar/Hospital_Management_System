<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
$.get('BloodManage', { flag: username }, function(response) {
		var obj = JSON.parse(response);
		$.each(obj, function(index) {
			blooddoner++;
			var html = '';
			html += '<!--  ----Add new Out Patient----  --><div class="modal fade outpatiebnt" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
			html += '<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">×</button><h3 class="modal-title">Add Outpatient</h3>';
			html += '';
			html += '';
			html += '';
			html += '';
			html += '';
			html += '';
			html += '';
			$('.bloodDonorList').append(html);
		});
	});
</script>
</head>
<body>
<!--  ----Add new Out Patient----  -->
	<div class="modal fade outpatiebnt" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">×</button>
	                <h3 class="modal-title">Add Outpatient</h3>
	            </div>
	            <div class="modal-body">
	                <form id="out_patient_insert_form" class="form-horizontal" enctype="multipart/form-data">
	                    <div class="header">
	                        <h3 class="first_hed">Personal Information</h3>
	                        <hr>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="roll_id">Patient Id<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                        	<select name="patient_id" id="insertpatientid" class="form-control"required>
	                                <option value="" disabled selected hidden="">Select Patient </option>	
									<c:forEach items="${sessionScope.patientRagistrationList }" var="q">
										<option value="${q.id }">${q.patientid } - ${q.firstname }   </option>
									</c:forEach>
	                            </select>   
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="first_name">First Name<span class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="insertfirstname"class="form-control text-input" maxlength="50" type="text" value="" name="first_name"required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="middle_name">Middle
	                            Name</label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input class="form-control" id="insertmiddlename"  type="text" maxlength="50" value="" name="middle_name">
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="last_name">Last Name<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input class="form-control text-input" id="insertlastname" maxlength="50" type="text" value="" name="last_name"required>
	                        </div>
	                    </div>
	                    <div class="form-group row">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="birth_date">Date of
	                            birth<span class="require-field">*</span></label>
	                         <div class="col-sm-3">   
							<div class="input-group date" data-date-format="dd/mm/yyyy">
				            	<input  type="text"name="birth_date" id="insertdob"  class="form-control" placeholder="dd/mm/yyyy" readonly="readonly"required>
					            <div class="input-group-addon" >
					              <span class=""></span>
					            </div>
				          	</div>
				          	</div>               
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label">Blood
	                            Group</label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 ">
	
	                            <select id="insertbloodgroup" class="form-control" name="blood_group"required>
	                                <option value="" disabled selected hidden="">Select Blood Group</option>	
	                                <option value="O+">O+ </option>
	                                <option value="O-">O- </option>
	                                <option value="A+">A+ </option>
	                                <option value="B+">B+ </option>
	                                <option value="A-">A- </option>
	                                <option value="B-">B- </option>
	                                <option value="AB+">AB+ </option>
	                                <option value="AB-">AB- </option>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="gender">Gender<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <label class="radio-inline">
	                                <input type="radio" value="male" class="tog" id="insertmale" name="gender"checked="checked">Male </label>
	                            <label class="radio-inline">
	                                <input type="radio" value="female" id="insertfemale" class="tog" name="gender">Female
	                            </label>
	                        </div>
	                    </div>
	
	                    <div class="header">
	                        <h3>HomeTown Address Information</h3>
	                        <hr>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="address">Home Town Address<span class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input class="form-control" id="inserthomeaddress" type="text" maxlength="150" name="address" required>
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="homecity">City<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input class="form-control" id="inserthomecity"  type="text" maxlength="50" name="homecity" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">State</label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="inserthomestate" class="form-control" type="text" maxlength="50" name="state_name" value="">
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"
	                            for="state_name">Country</label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="inserthomecountry"class="form-control " type="text"maxlength="50" name="homecountry" value="">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="zip_code">Zip Code<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="inserthomezip" class="form-control"type="text" maxlength="15" name="zip_code" required>
	                        </div>
	                    </div>
	                    <div class="header">
	                        <h3>Contact Information</h3>
	                        <hr>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="mobile">Mobile
	                            Number<span class="require-field">*</span></label>												
	                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 margin_bottom_5px">
	                            <input type="text" value="+91" id="insertcode" class="form-control" name="standardcode"maxlength="5"required>
	                        </div>
	                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 has-feedback">
	                            <input id="insertmobile" class="form-control text-input"min="6" maxlength="15" type="text" value="" name="mobile"required>
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="phone">Phone</label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="insertphone" class="form-control text-input" min="6" maxlength="15" type="text" value="" name="phonenumber">
	                        </div>
	                    </div>
	                    <div class="header">
	                        <h3>Login Information</h3>
	                        <hr>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="email">Email<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="outpatientemail" class="form-control text-input"maxlength="100" type="text" name="email" required>
	                            <span id="error_email"style="color: red;"></span>
	                        </div>
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="username">User Name<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="outpatientusername" class="form-control"maxlength="30" type="text" name="username" required>
	                            <span id="error_user"style="color: red;"></span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="password">Password<span
	                                class="require-field">*</span></label>
	                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
	                            <input id="password" class="form-control" type="password"maxlength="12" name="password" required>
	                        </div>
	                    </div>
	                    <div class="header">
	                        <h3>Other Information</h3>
	                        <hr>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="doctor">Assign Doctor<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-3 margin_bottom_5px">
	                            <select name="doctor" id="doctor" class="form-control"required>
	                                <option value="" disabled selected hidden="">Select Doctor </option>	
									<c:forEach items="${sessionScope.doctorlist }" var="q">
										<option value="${q.id }">${q.firstname }</option>
									</c:forEach>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label" for="symptoms">Symptoms<span
	                                class="require-field">*</span></label>
	                        <div class="col-sm-3"style="margin-left: 15px;">
	                        	<select id="symtomsmulti" name="symptoms[]" multiple class="form-control symptomsoutpatient" required="required">
	                            </select>
	                            <br>
	                        </div>
	                        <div class="col-sm-2">
	                            <button style="margin-left: 40px;" id="addremove" type="button" class="btn btn-default" >Add Or Remove</button>
	                        </div>
	                    </div>
	
	                    <div class="diagnosissnosis_div">
	                        <div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-3"><input type="file" name="dignosis1"></div></div>
	                        <div id="outpatientdignosisadd">
	                        	
	                        </div>
	                        <div class="form-group">
	                            <div class="col-sm-2">
	                            </div>
	                            <div class="col-sm-2">
	                                <input type="button" value="Add More Report" name="add_more_report"class="add_more_report_fronted btn btn-default">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label" for="photo">Image</label>
	                            <div class="col-sm-3">
	                                <input type="file" name="profileimage">
	                            </div>
	                        </div>
	
	                        <div class="clearfix"></div>
	
	                        <div class="col-sm-offset-2 col-sm-8">
	                            <div id="upload_user_avatar_preview">
	
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-sm-offset-2 col-sm-8">
							<input type="hidden" name="adminid" id="outpatientadminid">
							<input  type="hidden" name="count" id="outpatentdiagnosiscount"value="1">
                               <input type="hidden" name="flag" value="precriptionOutPatientInsert">
	                        <input type="submit" value="Save Patient" id="btn-submit-outpatient" class="btn btn-success" style="margin-top: 31px;">
	                    </div>
	                </form>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!--  -----------------------------------Add new Out Patient Exit -------------------------------------------*  -->
	
	<!--  -----------------------------------Add new Sytomes -------------------------------------------*  -->
	
	<div class="popup-bg " style="display: none;z-index: 1050; background:#000000bf ;">
	    <div class="overlay-content overlay_content_css">
	        <div class="modal-content">
	            <div class="notice_content"></div>
	            <div class="category_list">
	                <div class="modal-header"> <a href="#" class="close-btn-cat badge badge-danger pull-right">X</a>
	                    <h4 id="myLargeModalLabel" class="modal-title">Symptoms</h4>
	                </div>
	                <hr>
	                <div class="panel panel-white">
	                    <div class="category_listbox">
	                        <div class="table-responsive" style="min-height: 100%;">
	                            <form name="report_typ_form" action="" method="post" class="form-horizontal"
	                                id="report_typ_form">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>Symptoms</th>
	                                            <th>Action</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody class="symtopslisttable">
	                                    </tbody>
	                                </table>
	                            </form>
	                        </div>
	                    </div>
	                    <form name="systomes_insert_form" id="systomes_insert_form" class="form-horizontal">
	                        <div class="form-group">
	                            <label class="col-sm-4 control-label" for="medicine_name">Symptoms<span class="require-field">*</span></label>
	                            <div class="col-sm-4 margin_bottom_5px">
	                                <input id="medicine_name"class="form-control text-input"maxlength="50" type="text" value="" name="name">
	                            </div>
	                            <div class="col-sm-4">
	                                <input type="submit" value="Add" id="btn-insert-symptoms" name="save_category" class="btn btn-success">
	                                <input type="hidden" name="adinid" id="symptomesadminid">
	                                <input type="hidden" name="flag" value="precriptionSymptomesInsert">
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--  -----------------------------------Add new Sytomes Exit -------------------------------------------*  -->
</body>
</html>