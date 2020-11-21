<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="NewFile5.jsp" />
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

var html = '';
html += '<!--  ----Add new Out Patient----  --><div class="modal fade outpatiebnt" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">';
html += '<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">×</button><h3 class="modal-title">Add Outpatient</h3>';
html += '</div> <div class="modal-body"> <form id="out_patient_insert_form" class="form-horizontal" enctype="multipart/form-data"><div class="header"><h3 class="first_hed">Personal Information</h3><hr>';
html += '</div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="roll_id">Patient Id<span class="require-field">*</span></label> <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"> <select name="patient_id" id="insertpatientid"class="form-control"required><option value="" disabled selected hidden="">Select Patient </option><c:forEach items="${sessionScope.patientRagistrationList }" var="q"><option value="${q.id }">${q.patientid } - ${q.firstname }</option></c:forEach></select>  ';
html += '</div> <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="first_name">First Name<span class="require-field">*</span></label>  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="insertfirstname"class="form-control text-input" maxlength="50" type="text" value="" name="first_name"required></div></div> <div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="middle_name">Middle Name</label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input class="form-control" id="insertmiddlename"  type="text" maxlength="50" value="" name="middle_name"></div>';
html += ' <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="last_name">Last Name<spanclass="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input class="form-control text-input" id="insertlastname" maxlength="50" type="text" value="" name="last_name"required></div></div>';
html += '<div class="form-group row"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="birth_date">Date ofbirth<span class="require-field">*</span></label><div class="col-sm-3"> <div class="input-group date" data-date-format="dd/mm/yyyy"><input  type="text"name="birth_date" id="insertdob"  class="form-control" placeholder="dd/mm/yyyy" readonly="readonly"required><divclass="input-group-addon"><span class=""></span></div></div></div>           ';
html += '<label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label">BloodGroup</label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 "><select id="insertbloodgroup" class="form-control" name="blood_group"required><option value="" disabled selected hidden="">Select Blood Group</option><option value="O+">O+ </option><option value="O-">O- </option><option value="A+">A+ </option><option value="B+">B+ </option><option value="A-">A- </option><option value="B-">B- </option><option value="AB+">AB+ </option><option value="AB-">AB- </option></select></div></div>';
html += '<div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="gender">Gender<spanclass="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><label class="radio-inline"><input type="radio" value="male" class="tog" id="insertmale" name="gender"checked="checked">Male </label><label class="radio-inline"><input type="radio" value="female" id="insertfemale" class="tog" name="gender">Female</label></div></div>';
html += '<div class="header"><h3>HomeTown Address Information</h3><hr></div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="address">Home Town Address<span class="require-field">*</span></label> <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input class="form-control" id="inserthomeaddress" type="text" maxlength="150" name="address" required></div>';
html += '<label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="homecity">City<spanclass="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input class="form-control" id="inserthomecity"  type="text" maxlength="50" name="homecity" required></div></div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">State</label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="inserthomestate" class="form-control" type="text" maxlength="50" name="state_name" value=""></div>';
html += '<label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"for="state_name">Country</label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="inserthomecountry"class="form-control " type="text"maxlength="50" name="homecountry" value=""></div></div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="inserthomezip" class="form-control"type="text" maxlength="15" name="zip_code" required></div></div><div class="header"><h3>Contact Information</h3><hr></div>';
html += '<div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="mobile">Mobile Number<span class="require-field">*</span></label><div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 margin_bottom_5px"><input type="text" value="+91" id="insertcode" class="form-control" name="standardcode"maxlength="5"required></div><div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 has-feedback"><input id="insertmobile" class="form-control text-input"min="6" maxlength="15" type="text" value="" name="mobile"required></div><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="phone">Phone</label>';
html += '<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="insertphone" class="form-control text-input" min="6" maxlength="15" type="text" value="" name="phonenumber"></div></div>';
html += '<div class="header"><h3>Login Information</h3><hr></div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="email">Email<span class="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="outpatientemail" class="form-control text-input"maxlength="100" type="text" name="email" required><span id="error_email"style="color: red;"></span></div>';
html += '<label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="username">User Name<span class="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="outpatientusername" class="form-control"maxlength="30" type="text" name="username" required><span id="error_user"style="color: red;"></span></div></div><div class="form-group"><label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="password">Password<span class="require-field">*</span></label><div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback"><input id="password" class="form-control" type="password"maxlength="12" name="password" required></div></div><div class="header"><h3>Other Information</h3><hr></div>';
html += '<div class="form-group"><label class="col-sm-2 control-label" for="doctor">Assign Doctor<span class="require-field">*</span></label><div class="col-sm-3 margin_bottom_5px"><select name="doctor" id="doctor" class="form-control"required><option value="" disabled selected hidden="">Select Doctor </option>]<c:forEach items="${sessionScope.doctorlist }" var="q"><option value="${q.id }">${q.firstname }</option></c:forEach></select></div></div> <div class="form-group"><label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label><div class="col-sm-3"style="margin-left: 15px;"><select id="symtomsmulti" name="symptoms[]" multiple class="form-control symptomsoutpatient" required="required"></select><br></div><div class="col-sm-2">';
html += '<button style="margin-left: 40px;" id="addremove" type="button" class="btn btn-default" >Add Or Remove</button></div></div>';
html += '<div class="diagnosissnosis_div"><div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-3"><input type="file" name="dignosis1"></div></div><div id="outpatientdignosisadd"></div><div class="form-group"><div class="col-sm-2"></div><div class="col-sm-2"><input type="button" value="Add More Report" name="add_more_report"class="add_more_report_fronted btn btn-default"></div></div><div class="form-group"><label class="col-sm-2 control-label" for="photo">Image</label><div class="col-sm-3"><input type="file" name="profileimage"></div></div><div class="clearfix"></div><div class="col-sm-offset-2 col-sm-8"><div id="upload_user_avatar_preview"> </div></div></div>';
html += '<div class="col-sm-offset-2 col-sm-8"><input type="hidden" name="adminid" id="outpatientadminid"><input  type="hidden" name="count" id="outpatentdiagnosiscount"value="1"><input type="hidden" name="flag" value="precriptionOutPatientInsert"><input type="submit" value="Save Patient" id="btn-submit-outpatient" class="btn btn-success" style="margin-top: 31px;"></div> </form></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div>';
html += '<!-- ---------Add new Sytomes ------------* --><div class="popup-bg " style="display: none;z-index: 1050; background:#000000bf ;"><div class="overlay-content overlay_content_css"><div class="modal-content"><div class="notice_content"></div><div class="category_list"><div class="modal-header"> <a href="#" class="close-btn-cat badge badge-danger pull-right">X</a><h4 id="myLargeModalLabel" class="modal-title">Symptoms</h4></div><hr>';
html += '<div class="panel panel-white"><div class="category_listbox"><div class="table-responsive" style="min-height: 100%;"><form name="report_typ_form" action="" method="post" class="form-horizontal"id="report_typ_form"><table class="table"><thead><tr><th>Symptoms</th><th>Action</th></tr></thead><tbody class="symtopslisttable"></tbody></table></form></div></div>';
html += '<div class="panel panel-white"><div class="category_listbox"><div class="table-responsive" style="min-height: 100%;"><form name="report_typ_form" action="" method="post" class="form-horizontal" id="report_typ_form"><table class="table"><thead><tr><th>Symptoms</th><th>Action</th></tr></thead><tbody class="symtopslisttable"></tbody></table></form></div></div>';
html += '<form name="systomes_insert_form" id="systomes_insert_form" class="form-horizontal"> <div class="form-group"> <label class="col-sm-4 control-label" for="medicine_name">Symptoms<span class="require-field">*</span></label><div class="col-sm-4 margin_bottom_5px"> <input id="medicine_name"class="form-control text-input"maxlength="50" type="text" value="" name="name"></div><div class="col-sm-4"><input type="submit" value="Add" id="btn-insert-symptoms" name="save_category" class="btn btn-success"><input type="hidden" name="adinid" id="symptomesadminid"><input type="hidden" name="flag" value="precriptionSymptomesInsert"></div></div> </form></div></div></div></div></div>';

$('.bloodDonorList').append(html);
$(document).on("click", "#addremove", function(){
	document.getElementById("exampleModal").style.zIndex = "-1";
	$('#exampleModal').css('display', 'none');
	$('.popup-bg').css('display' , 'block');
	});

$("body").on("click", ".close-btn-cat", function(){	
	 document.getElementById("exampleModal").style.zIndex = "";
	 $('#exampleModal').css('display', 'block');
	 $('.popup-bg').hide(); // hide the overlay	
});

});
</script>
<style type="text/css">

.multiselect-container {
    width: 237px;
    overflow: scroll;
    height: 200px;
    margin-left: -15px;
}
.dropdown-toggle{
   width: 237px !important;
}
.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
    color: black;
    text-decoration: none;
    background-color: #f1f1f1;
    border: 1px solid #e5e5e5;
    outline: 0;
}
.btn-group>.btn:first-child {
    margin-left: -15px;
}
.title {
	color: white;
	padding: 8px;
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
.modal.fade.in {
   background: #000000bf;
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
.overlay-content {
    background: #ffffff none repeat scroll 0 0;
    border-radius: 4px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.9);
    cursor: default;
    float: left;
    left: 34%;
    margin: 0 0 0 -13%;
    padding: 10px 10px 10px;
    position: fixed;
    top: 6%;
    width: 60%;
}

.modal-content {
    -webkit-box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    -moz-box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    box-shadow: 0 5px 5px -5px rgba(0,0,0,.1);
    border: 0;
    border-radius: 0;
}

.badge {
    -webkit-border-radius: 12px!important;
    -moz-border-radius: 12px!important;
    border-radius: 12px!important;
    font-weight: 300;
    font-size: 11px!important;
    text-align: center;
    vertical-align: middle;
    line-height: 11px;
    height: 18px;
    padding: 3px 6px;
    text-shadow: none!important;
}
.pull-right {
    float: right!important;
}
.badge {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 12px;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    background-color: #777;
    border-radius: 10px;
}
.pull-right {
    float: right;
}
.modal-title {
    margin: 0;
    line-height: 1.42857143;
}.panel-white {
    background: #fff;
}
.category_listbox {
    height: 250px;
    overflow: scroll;
    float: left;
    margin-bottom: 10px;
    width: 100%;
}.table-responsive {
    min-height: .01%;
    overflow-x: auto;
}
.table-responsive {
    padding-top: 10px;
}
.input-group-addon {
	padding: 0px !important;
    background-color: white !important;
    border: none!important;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    transform: translate(0, 0);
}
</style>
</head>
<body>
<div id ="vishvas"></div>
<a href="#" class="btn btn-default" data-toggle="modal" data-target="#exampleModal"> Add Outpatient</a>
</body>
</html>