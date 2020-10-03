<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.multiselect-container{position:absolute;list-style-type:none;margin:0;padding:0}.multiselect-container .input-group{margin:5px}.multiselect-container>li{padding:0}.multiselect-container>li>a.multiselect-all label{font-weight:700}.multiselect-container>li.multiselect-group label{margin:0;padding:3px 20px 3px 20px;height:100%;font-weight:700}.multiselect-container>li.multiselect-group-clickable label{cursor:pointer}.multiselect-container>li>a{padding:0}.multiselect-container>li>a>label{margin:0;height:100%;cursor:pointer;font-weight:400;padding:3px 20px 3px 40px}.multiselect-container>li>a>label.radio,.multiselect-container>li>a>label.checkbox{margin:0}.multiselect-container>li>a>label>input[type=checkbox]{margin-bottom:5px}.btn-group>.btn-group:nth-child(2)>.multiselect.btn{border-top-left-radius:4px;border-bottom-left-radius:4px}.form-inline .multiselect-container label.checkbox,.form-inline .multiselect-container label.radio{padding:3px 20px 3px 40px}.form-inline .multiselect-container li a label.checkbox input[type=checkbox],.form-inline .multiselect-container li a label.radio input[type=radio]{margin-left:-20px;margin-right:0}
/*!
 * Bootstrap-select v1.12.2 (http://silviomoreto.github.io/bootstrap-select)
 *
 * Copyright 2013-2017 bootstrap-select
 * Licensed under MIT (https://github.com/silviomoreto/bootstrap-select/blob/master/LICENSE)
 */

select.bs-select-hidden,
select.selectpicker {
  display: none !important;
}
.bootstrap-select {
  width: 220px \0;
  /*IE9 and below*/
}
.bootstrap-select > .dropdown-toggle {
  width: 100%;
  padding-right: 25px;
  z-index: 1;
}
.bootstrap-select > .dropdown-toggle.bs-placeholder,
.bootstrap-select > .dropdown-toggle.bs-placeholder:hover,
.bootstrap-select > .dropdown-toggle.bs-placeholder:focus,
.bootstrap-select > .dropdown-toggle.bs-placeholder:active {
  color: #999;
}
.bootstrap-select > select {
  position: absolute !important;
  bottom: 0;
  left: 50%;
  display: block !important;
  width: 0.5px !important;
  height: 100% !important;
  padding: 0 !important;
  opacity: 0 !important;
  border: none;
}
.bootstrap-select > select.mobile-device {
  top: 0;
  left: 0;
  display: block !important;
  width: 100% !important;
  z-index: 2;
}
.has-error .bootstrap-select .dropdown-toggle,
.error .bootstrap-select .dropdown-toggle {
  border-color: #b94a48;
}
.bootstrap-select.fit-width {
  width: auto !important;
}
.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
  width: 220px;
}
.bootstrap-select .dropdown-toggle:focus {
  outline: thin dotted #333333 !important;
  outline: 5px auto -webkit-focus-ring-color !important;
  outline-offset: -2px;
}
.bootstrap-select.form-control {
  margin-bottom: 0;
  padding: 0;
  border: none;
}
.bootstrap-select.form-control:not([class*="col-"]) {
  width: 100%;
}
.bootstrap-select.form-control.input-group-btn {
  z-index: auto;
}
.bootstrap-select.form-control.input-group-btn:not(:first-child):not(:last-child) > .btn {
  border-radius: 0;
}
.bootstrap-select.btn-group:not(.input-group-btn),
.bootstrap-select.btn-group[class*="col-"] {
  float: none;
  display: inline-block;
  margin-left: 0;
}
.bootstrap-select.btn-group.dropdown-menu-right,
.bootstrap-select.btn-group[class*="col-"].dropdown-menu-right,
.row .bootstrap-select.btn-group[class*="col-"].dropdown-menu-right {
  float: right;
}
.form-inline .bootstrap-select.btn-group,
.form-horizontal .bootstrap-select.btn-group,
.form-group .bootstrap-select.btn-group {
  margin-bottom: 0;
}
.form-group-lg .bootstrap-select.btn-group.form-control,
.form-group-sm .bootstrap-select.btn-group.form-control {
  padding: 0;
}
.form-group-lg .bootstrap-select.btn-group.form-control .dropdown-toggle,
.form-group-sm .bootstrap-select.btn-group.form-control .dropdown-toggle {
  height: 100%;
  font-size: inherit;
  line-height: inherit;
  border-radius: inherit;
}
.form-inline .bootstrap-select.btn-group .form-control {
  width: 100%;
}
.bootstrap-select.btn-group.disabled,
.bootstrap-select.btn-group > .disabled {
  cursor: not-allowed;
}
.bootstrap-select.btn-group.disabled:focus,
.bootstrap-select.btn-group > .disabled:focus {
  outline: none !important;
}
.bootstrap-select.btn-group.bs-container {
  position: absolute;
  height: 0 !important;
  padding: 0 !important;
}
.bootstrap-select.btn-group.bs-container .dropdown-menu {
  z-index: 1060;
}
.bootstrap-select.btn-group .dropdown-toggle .filter-option {
  display: inline-block;
  overflow: hidden;
  width: 100%;
  text-align: left;
}
.bootstrap-select.btn-group .dropdown-toggle .caret {
  position: absolute;
  top: 50%;
  right: 12px;
  margin-top: -2px;
  vertical-align: middle;
}
.bootstrap-select.btn-group[class*="col-"] .dropdown-toggle {
  width: 100%;
}
.bootstrap-select.btn-group .dropdown-menu {
  min-width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bootstrap-select.btn-group .dropdown-menu.inner {
  position: static;
  float: none;
  border: 0;
  padding: 0;
  margin: 0;
  border-radius: 0;
  -webkit-box-shadow: none;
          box-shadow: none;
}
.bootstrap-select.btn-group .dropdown-menu li {
  position: relative;
}
.bootstrap-select.btn-group .dropdown-menu li.active small {
  color: #fff;
}
.bootstrap-select.btn-group .dropdown-menu li.disabled a {
  cursor: not-allowed;
}
.bootstrap-select.btn-group .dropdown-menu li a {
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.bootstrap-select.btn-group .dropdown-menu li a.opt {
  position: relative;
  padding-left: 2.25em;
}
.bootstrap-select.btn-group .dropdown-menu li a span.check-mark {
  display: none;
}
.bootstrap-select.btn-group .dropdown-menu li a span.text {
  display: inline-block;
}
.bootstrap-select.btn-group .dropdown-menu li small {
  padding-left: 0.5em;
}
.bootstrap-select.btn-group .dropdown-menu .notify {
  position: absolute;
  bottom: 5px;
  width: 96%;
  margin: 0 2%;
  min-height: 26px;
  padding: 3px 5px;
  background: #f5f5f5;
  border: 1px solid #e3e3e3;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
  pointer-events: none;
  opacity: 0.9;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bootstrap-select.btn-group .no-results {
  padding: 3px;
  background: #f5f5f5;
  margin: 0 5px;
  white-space: nowrap;
}
.bootstrap-select.btn-group.fit-width .dropdown-toggle .filter-option {
  position: static;
}
.bootstrap-select.btn-group.fit-width .dropdown-toggle .caret {
  position: static;
  top: auto;
  margin-top: -1px;
}
.bootstrap-select.btn-group.show-tick .dropdown-menu li.selected a span.check-mark {
  position: absolute;
  display: inline-block;
  right: 15px;
  margin-top: 5px;
}
.bootstrap-select.btn-group.show-tick .dropdown-menu li a span.text {
  margin-right: 34px;
}
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle {
  z-index: 1061;
}
.bootstrap-select.show-menu-arrow .dropdown-toggle:before {
  content: '';
  border-left: 7px solid transparent;
  border-right: 7px solid transparent;
  border-bottom: 7px solid rgba(204, 204, 204, 0.2);
  position: absolute;
  bottom: -4px;
  left: 9px;
  display: none;
}
.bootstrap-select.show-menu-arrow .dropdown-toggle:after {
  content: '';
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 6px solid white;
  position: absolute;
  bottom: -4px;
  left: 10px;
  display: none;
}
.bootstrap-select.show-menu-arrow.dropup .dropdown-toggle:before {
  bottom: auto;
  top: -3px;
  border-top: 7px solid rgba(204, 204, 204, 0.2);
  border-bottom: 0;
}
.bootstrap-select.show-menu-arrow.dropup .dropdown-toggle:after {
  bottom: auto;
  top: -3px;
  border-top: 6px solid white;
  border-bottom: 0;
}
.bootstrap-select.show-menu-arrow.pull-right .dropdown-toggle:before {
  right: 12px;
  left: auto;
}
.bootstrap-select.show-menu-arrow.pull-right .dropdown-toggle:after {
  right: 13px;
  left: auto;
}
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle:before,
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle:after {
  display: block;
}
.bs-searchbox,
.bs-actionsbox,
.bs-donebutton {
  padding: 4px 8px;
}
.bs-actionsbox {
  width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bs-actionsbox .btn-group button {
  width: 50%;
}
.bs-donebutton {
  float: left;
  width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bs-donebutton .btn-group button {
  width: 100%;
}
.bs-searchbox + .bs-actionsbox {
  padding: 0 8px 4px;
}
.bs-searchbox .form-control {
  margin-bottom: 0;
  width: 100%;
  float: none;
}
/*# sourceMappingURL=bootstrap-select.css.map */
/*!
 * Bootstrap-select v1.12.2 (http://silviomoreto.github.io/bootstrap-select)
 *
 * Copyright 2013-2017 bootstrap-select
 * Licensed under MIT (https://github.com/silviomoreto/bootstrap-select/blob/master/LICENSE)
 */

select.bs-select-hidden,
select.selectpicker {
  display: none !important;
}
.bootstrap-select {
  width: 220px \0;
  /*IE9 and below*/
}
.bootstrap-select > .dropdown-toggle {
  width: 100%;
  padding-right: 25px;
  z-index: 1;
}
.bootstrap-select > .dropdown-toggle.bs-placeholder,
.bootstrap-select > .dropdown-toggle.bs-placeholder:hover,
.bootstrap-select > .dropdown-toggle.bs-placeholder:focus,
.bootstrap-select > .dropdown-toggle.bs-placeholder:active {
  color: #999;
}
.bootstrap-select > select {
  position: absolute !important;
  bottom: 0;
  left: 50%;
  display: block !important;
  width: 0.5px !important;
  height: 100% !important;
  padding: 0 !important;
  opacity: 0 !important;
  border: none;
}
.bootstrap-select > select.mobile-device {
  top: 0;
  left: 0;
  display: block !important;
  width: 100% !important;
  z-index: 2;
}
.has-error .bootstrap-select .dropdown-toggle,
.error .bootstrap-select .dropdown-toggle {
  border-color: #b94a48;
}
.bootstrap-select.fit-width {
  width: auto !important;
}
.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
  width: 220px;
}
.bootstrap-select .dropdown-toggle:focus {
  outline: thin dotted #333333 !important;
  outline: 5px auto -webkit-focus-ring-color !important;
  outline-offset: -2px;
}
.bootstrap-select.form-control {
  margin-bottom: 0;
  padding: 0;
  border: none;
}
.bootstrap-select.form-control:not([class*="col-"]) {
  width: 100%;
}
.bootstrap-select.form-control.input-group-btn {
  z-index: auto;
}
.bootstrap-select.form-control.input-group-btn:not(:first-child):not(:last-child) > .btn {
  border-radius: 0;
}
.bootstrap-select.btn-group:not(.input-group-btn),
.bootstrap-select.btn-group[class*="col-"] {
  float: none;
  display: inline-block;
  margin-left: 0;
}
.bootstrap-select.btn-group.dropdown-menu-right,
.bootstrap-select.btn-group[class*="col-"].dropdown-menu-right,
.row .bootstrap-select.btn-group[class*="col-"].dropdown-menu-right {
  float: right;
}
.form-inline .bootstrap-select.btn-group,
.form-horizontal .bootstrap-select.btn-group,
.form-group .bootstrap-select.btn-group {
  margin-bottom: 0;
}
.form-group-lg .bootstrap-select.btn-group.form-control,
.form-group-sm .bootstrap-select.btn-group.form-control {
  padding: 0;
}
.form-group-lg .bootstrap-select.btn-group.form-control .dropdown-toggle,
.form-group-sm .bootstrap-select.btn-group.form-control .dropdown-toggle {
  height: 100%;
  font-size: inherit;
  line-height: inherit;
  border-radius: inherit;
}
.form-inline .bootstrap-select.btn-group .form-control {
  width: 100%;
}
.bootstrap-select.btn-group.disabled,
.bootstrap-select.btn-group > .disabled {
  cursor: not-allowed;
}
.bootstrap-select.btn-group.disabled:focus,
.bootstrap-select.btn-group > .disabled:focus {
  outline: none !important;
}
.bootstrap-select.btn-group.bs-container {
  position: absolute;
  height: 0 !important;
  padding: 0 !important;
}
.bootstrap-select.btn-group.bs-container .dropdown-menu {
  z-index: 1060;
}
.bootstrap-select.btn-group .dropdown-toggle .filter-option {
  display: inline-block;
  overflow: hidden;
  width: 100%;
  text-align: left;
}
.bootstrap-select.btn-group .dropdown-toggle .caret {
  position: absolute;
  top: 50%;
  right: 12px;
  margin-top: -2px;
  vertical-align: middle;
}
.bootstrap-select.btn-group[class*="col-"] .dropdown-toggle {
  width: 100%;
}
.bootstrap-select.btn-group .dropdown-menu {
  min-width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bootstrap-select.btn-group .dropdown-menu.inner {
  position: static;
  float: none;
  border: 0;
  padding: 0;
  margin: 0;
  border-radius: 0;
  -webkit-box-shadow: none;
          box-shadow: none;
}
.bootstrap-select.btn-group .dropdown-menu li {
  position: relative;
}
.bootstrap-select.btn-group .dropdown-menu li.active small {
  color: #fff;
}
.bootstrap-select.btn-group .dropdown-menu li.disabled a {
  cursor: not-allowed;
}
.bootstrap-select.btn-group .dropdown-menu li a {
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.bootstrap-select.btn-group .dropdown-menu li a.opt {
  position: relative;
  padding-left: 2.25em;
}
.bootstrap-select.btn-group .dropdown-menu li a span.check-mark {
  display: none;
}
.bootstrap-select.btn-group .dropdown-menu li a span.text {
  display: inline-block;
}
.bootstrap-select.btn-group .dropdown-menu li small {
  padding-left: 0.5em;
}
.bootstrap-select.btn-group .dropdown-menu .notify {
  position: absolute;
  bottom: 5px;
  width: 96%;
  margin: 0 2%;
  min-height: 26px;
  padding: 3px 5px;
  background: #f5f5f5;
  border: 1px solid #e3e3e3;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
  pointer-events: none;
  opacity: 0.9;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bootstrap-select.btn-group .no-results {
  padding: 3px;
  background: #f5f5f5;
  margin: 0 5px;
  white-space: nowrap;
}
.bootstrap-select.btn-group.fit-width .dropdown-toggle .filter-option {
  position: static;
}
.bootstrap-select.btn-group.fit-width .dropdown-toggle .caret {
  position: static;
  top: auto;
  margin-top: -1px;
}
.bootstrap-select.btn-group.show-tick .dropdown-menu li.selected a span.check-mark {
  position: absolute;
  display: inline-block;
  right: 15px;
  margin-top: 5px;
}
.bootstrap-select.btn-group.show-tick .dropdown-menu li a span.text {
  margin-right: 34px;
}
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle {
  z-index: 1061;
}
.bootstrap-select.show-menu-arrow .dropdown-toggle:before {
  content: '';
  border-left: 7px solid transparent;
  border-right: 7px solid transparent;
  border-bottom: 7px solid rgba(204, 204, 204, 0.2);
  position: absolute;
  bottom: -4px;
  left: 9px;
  display: none;
}
.bootstrap-select.show-menu-arrow .dropdown-toggle:after {
  content: '';
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 6px solid white;
  position: absolute;
  bottom: -4px;
  left: 10px;
  display: none;
}
.bootstrap-select.show-menu-arrow.dropup .dropdown-toggle:before {
  bottom: auto;
  top: -3px;
  border-top: 7px solid rgba(204, 204, 204, 0.2);
  border-bottom: 0;
}
.bootstrap-select.show-menu-arrow.dropup .dropdown-toggle:after {
  bottom: auto;
  top: -3px;
  border-top: 6px solid white;
  border-bottom: 0;
}
.bootstrap-select.show-menu-arrow.pull-right .dropdown-toggle:before {
  right: 12px;
  left: auto;
}
.bootstrap-select.show-menu-arrow.pull-right .dropdown-toggle:after {
  right: 13px;
  left: auto;
}
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle:before,
.bootstrap-select.show-menu-arrow.open > .dropdown-toggle:after {
  display: block;
}
.bs-searchbox,
.bs-actionsbox,
.bs-donebutton {
  padding: 4px 8px;
}
.bs-actionsbox {
  width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bs-actionsbox .btn-group button {
  width: 50%;
}
.bs-donebutton {
  float: left;
  width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.bs-donebutton .btn-group button {
  width: 100%;
}
.bs-searchbox + .bs-actionsbox {
  padding: 0 8px 4px;
}
.bs-searchbox .form-control {
  margin-bottom: 0;
  width: 100%;
  float: none;
}
/*# sourceMappingURL=bootstrap-select.css.map */
@media only screen and (max-width : 767px) 
{
	.panel .panel-body 
	{
		padding: 5px!important;
	}
	.dropdown-menu li
	{
		margin-top: 5px!important;
	}	
	.form-group 
	{
		margin-bottom: 0px!important;
	}
	.panel-body form label
	{
		margin-top: 5px!important;
	}	
	.padding_left_0 
	{
		padding-left: 15px!important;
	}
	.radio-inline 
	{
		padding-left: 30px!important;
	}
	.medicine_padding_right_0
	{
		padding-right: 15px!important;
	}	
	.mail_template_panel .panel-heading
	{
		padding: 5px!important;
		height: 50px!important;
	}	
}	
@media only screen and (min-width : 768px) 
{
	.padding_left_0 
	{
		padding-left: 0px!important;
	}
	.medicine_padding_right_0
	{
		padding-right: 0px!important;
	}
}
/*start popup scroll css*/
@media only screen and (max-width : 1800px) 
{
	.overlay_content_css
	{
		overflow-y: scroll;
		height: 487px;
		position: relative;
	} 
}
@media only screen and (max-width : 800px) 
{
	.overlay_content_css
	{
		overflow-y: scroll;
		height: 350px;
		position: relative;
	} 
}		
/*end popup scroll css */
/*start dashboard  view details popup */
.model_header_padding
{
    height: 55px!important;
}
.content_width 
{
    width: 40%!important;
    padding: 0px!important;
}
.view_details_body
{
	height: 400px!important;
    overflow: scroll!important;	
}	
#examlist 
{
    font-weight: 600!important;
}
@media only screen and (max-width : 1000px) 
{
	.content_width 
	{
		width: 50%!important;
		left: 40%!important;
	}	
}	
@media only screen and (max-width : 800px) 
{
	.content_width 
	{
		width: 50%!important;
		left: 35%!important;
	}	
}
@media only screen and (max-width : 700px) 
{
	.content_width 
	{
		width: 65%!important;
		left: 30%!important;
	}	
}
@media only screen and (max-width : 550px) 
{
	.content_width 
	{
		width: 85%!important;
		left: 20%!important;
	}	
}
@media only screen and (max-width : 450px) 
{
	.content_width 
	{
		width: 96%!important;
		left: 15%!important;
	}	
}
/*End dashboard  view details popup */
/*start charges popup */
.charges_heading
{
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;
	width: 100%;
    float: left;
    margin-bottom: 5px;
}
.padding_8
{
	padding-bottom: 5px;
    padding-top: 5px;
    padding-left: 0px!important;
}	
.charges_body
{
	float:left;	
}
.dropdown_width_100_per
{
	width:100%!important;
}
#patient_transaction input[type=checkbox]
{
	margin: 10px 0 0!important;
}
@media only screen and (min-width : 992px) 
{
	.div_padding_right_0
	{
		padding-right:0px!important;	
	}	
	.div_padding_bottom_5
	{
		padding-bottom:5px!important;	
		padding-left:5px!important;	
	}
	.div_padding_left_0
	{
		padding-left:0px!important;	
	}
	.charges_body
	{
		height: 270px;		
		overflow-y: scroll;
		overflow-x: hidden;
	}
	#patient_transaction .col-md-2
	{
	    width: 14%!important;
	}	
	#patient_transaction .col-md-1 
	{
		width: 9%!important;
	}
}
@media only screen and (max-width : 991px) 
{
	#patient_transaction
	{
		height: 250px;		
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.charges_body>div.row>div
	{
		margin-bottom:5px!important;
	}
}
/* @media screen and (max-width: 991px) and (min-width: 766px) {
{
	.charges_body
	{
		height: 250px;		
		overflow-y: scroll;
		overflow-x: hidden;
	}
} */
/*end charges popup */		
/*invoice responsive */
@media (min-width: 1301px) and (max-width: 1357px)
{
	/* .address_css
	{
		font-size: 12px!important;
		width: 8.8%!important;	
	}	 */
	.invoice_address_css
	{
		padding-right: 0px!important;
	}	
}
@media (min-width: 1201px) and (max-width: 1500px)
{
	.address_css
	{
		width:11%!important;
	}	 
}
@media (min-width: 992px) and (max-width: 1200px)
{
	.address_css
	{
		width:13%!important;
	}	 
}
@media (min-width: 551px) and (max-width: 700px)
{
	.address_css
	{
		width:12%!important;
	}	 
}
@media (min-width: 471px) and (max-width: 550px)
{
	.address_css
	{
		width:15%!important;
	}	 
}
@media (min-width: 400px) and (max-width: 470px)
{
	.address_css
	{
		width:21%!important;
	}	 
}
@media only screen and (max-width : 991px) 
{
	.address_css
	{
		padding-left: 0px!important;
	}	 
}
@media only screen and (max-width : 1300px) 
{
	.invoice_address
	{
		font-size:12px;
	}
}
@media only screen and (max-width : 900px) 
{
	.view_invoice_lable_css .view_invoice_lable
	{
		padding-left: 15px!important;
	}	
	
}
@media only screen and (max-width : 600px) 
{
	.view_invoice_lable_css .view_invoice_lable
	{
		padding-left: 18px!important;
	}	
		
}	
/*start payment receipt*/
.width_20_payment_receipt
{
	width:20%!important;
}	
/*end payment receipt*/
/* start popup background color*/
.modal.fade.in
{
	background: #000000bf;
}
/* end popup background color*/
/* start invoice entry css */
.invoice_entry_popup
{
	left: 30%;
	width: 77%;
}
/* end invoice entry css */
/* start multiselect dropdown */
.multiselect-container>li>a>label
{
	padding: 0px 21px 0px 29px!important;
}
@media only screen and (max-width : 769px) 
{
	.multiselect-container>li>a>label
	{
		padding: 0px 21px 0px 41px!important;
	}
}
.multiselect-container li a
{
	padding: 0px 0px!important;
}	
/* end multiselect dropdown */

/* start medicine details */
.medicine_details_table>tbody>tr>td, .medicine_details_table>tbody>tr>th, .medicine_details_table>thead>tr>td, .medicine_details_table>thead>tr>th
{
	 border: 1px solid #ddd;
}	
.medicine_details_table>thead>tr>th
{
	border-top:1px solid #ddd!important;
}
/* End medicine details */
/*start invoice css */
.patient_invoice>.modal-header
{
	    padding: 10px;
		height: 29px;
}		
/*end invoice css */
.out_come_status
{
	display:none;	
}	
/*start dashboard calendar event popup css*/
@media only screen and (max-width : 518px) 
{
	.fc-more-popover
	{
		top:0px!important;
	}
}	
@media only screen and (max-width : 600px) 
{
	.tooltipevent
	{
		font-size:12px!important;			
	}
	/**rinkal**/	
	.modal-body1
	{
		height: 187px!important;
		overflow: auto!important;
	}
}

	
/*end dashboard calendar event popup css*/
/*start multiselect dropdown css*/
.multiselect-container
{
	overflow: scroll;
    height: 140px;
}
/*end multiselect dropdown css*/
/*start fronted tab css */
@media only screen and (max-width : 1600px) 
{	
	.panel_tabs>li>a
	{
		margin: 10px 10px 0 0;		
	}	
}
@media only screen and (max-width : 437px) 
{	
	.panel_tabs>li.active>a.active
	{		
		border-bottom: 1px solid #ccc;
	}
	ul.panel_tabs>li.active>a
	{		
		border-bottom: 1px solid #ccc;
	}
/**add invoice css**/
.align_right {
    text-align: left!important;
}
.amount_padding_15 {
    float: right;
}
.grand_total_lable {
    float: left;
    background-color: #0f63af;
    padding-left: 25px!important;
    margin-top: 20px;
}
h3.padding.color_white.margin {
    text-align: right;
}
/**add precscription css**/
.width_20_date {
    width: 100%!important;
    padding-right: 0px!important;
}
.width_100_123 {
    width: 100%;
    padding-top: 34px;
    margin-top: 31px!important;
}
.width_30 {
    width: 0%!important;
 }
 .align_left_d{
	float:right!important;
}
.invoicefont123 {
    vertical-align: top;
    position: absolute;
    top: 0px;
    right: 1px!important;
    background-repeat: no-repeat;
}
}
/*end fronted tab css */
@media only screen and (max-width : 767px) 
{
	.margin_bottom_5px
	{
		margin-bottom:5px!important;
	}
	.width_50_per
	{
		width:50%!important;
	}
	.padding_left_right_15px
	{
		padding-left: 15px!important;
		padding-right: 15px!important;
	}
}
/*popup scroll*/
/* .all_popup_scroll
{
	overflow-x: auto;
	height: 500px;
} */	
/*Start image preview */
.image_preview_css
{
    height: 150px;
    width: 150px;
    margin-top: 5px;
}
/* end image preview */
/*calander event popup */
.fc-popover .fc-event-container 
{
	height: 100px!important;
    overflow: auto!important;
}
/*start prescription Module */
#prescription_report_div
{
	display:none;	
}	

/*end prescription Module */
/*start access right css*/
.access_right_menucroll
{
    overflow: scroll; 
    height: 530px;
	padding:0px!important;
	margin-right:0px;
}
.access_right_heading
{
    overflow: scroll; 
    width: 100%;
}
.access_right_hed .col-sm-2
{		
	padding:0px;
}
@media (min-width: 726px) and (max-width: 767px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:70px!important;
	}	
	.padding_left_18
	{
		padding-left:60px!important;
	}
	.padding_left_12
	{
		padding-left:50px!important;
	}	
	.padding_left_22
	{
		padding-left:32px!important;
	}	
}
@media (min-width: 681px) and (max-width: 725px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:54px!important;
	}	
	.padding_left_18
	{
		padding-left:56px!important;
	}
	.padding_left_12
	{
		padding-left:50px!important;
	}	
	.padding_left_22
	{
		padding-left:32px!important;
	}	
}	
@media (min-width: 641px) and (max-width: 680px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:54px!important;
	}	
	.padding_left_18
	{
		padding-left:37px!important;
	}
	.padding_left_12
	{
		padding-left:50px!important;
	}	
	.padding_left_22
	{
		padding-left:32px!important;
	}	
}	
@media (min-width: 601px) and (max-width: 640px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:52px!important;
	}	
	.padding_left_18
	{
		padding-left:34px!important;
	}
	.padding_left_12
	{
		padding-left:35px!important;
	}	
	.padding_left_22
	{
		padding-left:22px!important;
	}	
}
@media (min-width: 551px) and (max-width: 600px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:45px!important;
	}	
	.padding_left_18
	{
		padding-left:36px!important;
	}
	.padding_left_12
	{
		padding-left:26px!important;
	}	
	.padding_left_22
	{
		padding-left:5px!important;
	}	
}
@media (min-width: 511px) and (max-width: 550px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:33px!important;
	}	
	.padding_left_18
	{
		padding-left:28px!important;
	}
	.padding_left_12
	{
		padding-left:24px!important;
	}	
}
@media (min-width: 481px) and (max-width: 510px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:32px!important;
	}	
	.padding_left_18
	{
		padding-left:17px!important;
	}
	.padding_left_12
	{
		padding-left:22px!important;
	}	
}
@media (min-width: 451px) and (max-width: 480px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:28px!important;
	}	
	.padding_left_18
	{
		padding-left:10px!important;
	}
	.padding_left_12
	{
		padding-left:18px!important;
	}	
}	 
@media (min-width: 426px) and (max-width: 450px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:13px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:22px!important;
	}	
	.padding_left_18
	{
		padding-left:8px!important;
	}
	.padding_left_12
	{
		padding-left:13px!important;
	}	
}
@media (min-width: 401px) and (max-width: 425px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:12px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:30px!important;
	}	
	.padding_left_18
	{
		padding-left:7px!important;
	}
	.padding_left_12
	{
		padding-left:14px!important;
	}	
}
@media (min-width: 381px) and (max-width: 400px)
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:12px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:15px!important;
	}	
	.padding_left_18
	{
		padding-left:6px!important;
	}
	.padding_left_12
	{
		padding-left:6px!important;
	}	
}
@media only screen and (max-width : 380px) 
{
	.access_right_hed .col-sm-2
	{		
		width:14%!important;	
		display:inline;
		padding:0px;
		font-size:12px;
	}
	.access_right_menucroll .col-sm-2
	{		
		width:14%!important;		
		padding:0px;
		font-size:10px;		
		float: left;
	}	
	.access_right_menucroll .row
	{
		display:inline!important;		
	}	
	.access_right_menucroll .checkbox input[type=checkbox]
	{
		margin-left:2px!important;
	}
	.padding_left_heading
	{
		padding-left:12px!important;
	}	
}
/*end access right css*/

/*prescription multiselect */
.select2-container .select2-choice 
{
    height: 31px!important;
}
div.select2-container
{
    padding: 0px 0px!important;
	border:0px!important;
}
/*end  prescription css*/
/* .form-control[readonly]
{
	background-color:white!important;
} */
/*Doctor Details */
.profile-cover 
{
    height: 210px!important;
}
.profile-image 
{
    margin: 109px 20px 20px!important;
} 
/* End Doctor Details */

#patient_transaction tbody
{
	width: 100%;
}
#patient_transaction tbody tr th
{
	text-align:center;
}
.patient_invoice>h4
{
	 padding-left: 15px;
}
.show_msg,.show_msg1
{
    display: none;
}
/*Start invoice CSS*/
.disply_name_margin_top_28
{
	/* margin-top: 28px!important; */
	margin-top: 45px!important;
}
.invoice_disply_name_margin_top_28
{
	 margin-top: 28px!important; 	
}
/**rinkal.main_div
{
    margin: -100px 0px 0px 0px;
}**/
.main_div_pdf
{
    margin: -100px 0px 0px 0px;
}
.width_100
{
	width:100%;
	padding-top: 34px;
}
.width_80
{
	width:80%;
}
.width_1
{
	width:1%;
}
.width_40
{
	width:40%;
}
.amount_padding_15
{
	padding-right:15px!important;
}
.margin
{
	margin-bottom: 5px;
    margin-top: 5px;
}
.grand_total_lable
{
	float:right; 
	background-color:#0f63af;
}
.amount_padding_8
{
	padding-right:15px;
}

.padding_11
{
	padding-bottom: 11px;
	padding-top: 11px;
}

.grand_total_amount
{
	background-color:#0f63af; 
}
h3.padding
{
	margin-top: 5px!important;
}
.padding_left_5
{
	padding-left: 5px;
}
.padding_top_18
{
	padding-top: 18px;
}
.system_logo
{
	float:left;
	/**padding-right: 20px;
	padding-left: 20px;** changes invoice**/
}
.width_24
{
	width:24%;
}
.width_50
{
	width:50%;
	float: left;
}
.billed_to
{
	vertical-align:top; 
	/**add*/float: left;
	/** width: 20%;changes invoice**/
}
.billed_to_print
{
	vertical-align:top; 
	width: 9%;
	padding-top:5px;
}
.billed_to_lable
{
	font-weight: bold; 
	font-size: 15px;
}
.width_60
{
	width:60%;
}
.width_30
{
	width:30%;
}
.width_20
{
	width:20%;
	padding-right:120px!important;
}

.grand_amount_width_20
{
	width:20%; 
	padding-bottom: 11px;
    padding-top: 11px;
	padding-right: 15px;
	
}
.invoice_lable
{
	background-color:#0f63af;
	color:white;
	padding:10px!important;
 	margin-top: 40px!important; 
}
.table_row_color tbody tr:nth-child(even)
{
	background:#a3caec;
}
.entry_heading
{
	background-color:#0f63af;
}
.color_white
{
	color:white;
}
.align_center
{
	text-align:center;
}
.align_left
{
	text-align:left;
}
.align_right
{
	text-align:right;
}
.print_css_heading h3
{
	margin-bottom:10px!important;
}	
.print_css_heading h5
{
	margin-top:10px!important;
	margin-bottom:10px!important;
}
.invoice_print1,#invoice_print
{
	 font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;	
}	
table.print_table_border
{
	border: 1;
	border-collapse: collapse!important;	
}
.margin_bottom_10
{
	margin-bottom:10px;
} 
.invoice_print1 .table>thead>tr>th ,.invoice_print1 .table>tbody>tr>td,#invoice_print .table>thead>tr>th ,#invoice_print .table>tbody>tr>td,
.invoice_body .table>thead>tr>th ,.invoice_body .table>tbody>tr>td	
{
	padding:5px!important;
}
.amount_padding_5
{
	padding:5px;
}
.font_weight
{
	font-weight: normal;
}
.width_100_print
{
	width:500px;
}
.width_1_print
{
	width:100px;
}
.system_logo_print
{
	height: 48px!important;
	width: 52px!important;
}
.only_width_20_print
{
	width:290px;
}
.font_family
{
	 font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;	
}	
.table_td_font
{
	font-size: 13px!important;	
    font-weight: 400!important;
	font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;		
} 
.width_50_print
{
	width:300px;
	float: left;
}
.width_40_print
{
	width:250px;
}
.width_30_print
{
	width:150px;
}
.width_20_print
{
	width:150px;
	padding-right:30px;
}
.width_70
{
	width:70%;	
}
.width_85
{
	width:85%;	
}
.h5_pdf
{
	font-weight: 0!important;
    font-size: 14px!important;
}
.h4_pdf
{
	font-weight: bold!important;
    font-size: 14px!important
}
.h3_pdf
{
	font-weight: 600!important;
    font-size: 16px!important;
}
.invoiceimage,.invoicefont1
{
	vertical-align:top;
	position: absolute;
    top: 0px;
    right: 24px;
	background-repeat:no-repeat;
	
}
.invoicefont1{
	z-index:-1;
}
.prescription_pop_content{
	position:relative;
}
.img_padding_right_pdf
{
	padding-right:20px;
}
.billed_to_pdf
{
	vertical-align:top; 
	width: 100px;
}
.width_93
{
	width:97%;
	margin-left: 25px;
	border-collapse:collapse;
}
.width_97
{
	width:97%;
}
.padding_10_pdf
{
	padding: 5px!important;
}
.width_54_print
{
	float: right;
	width:385px;
	margin-bottom: 70px;
}
.width_20_prescription
{
	width:20%;
	padding-right:28px!important;
}
.invoice_payment_receipt 
{
	background-color:#0f63af!important;
	color:white!important;			
	padding-bottom:5px!important;	
	padding-top:5px!important;	
}
@media print 
{
	.width_20
	{
		width:20%;
		padding-right:28px!important;
	}
	.width_20_prescription
	{
		width:30%;
		padding-right:20px!important;
	}
	.padding_10_pdf
	{
		padding: 5px!important;
	}
	.font_family
	{
		 font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;	
	}
	.font_weight
	{
		font-weight: normal;
	}
	.billed_to_print
	{
		vertical-align:top; 
		width: 20%;
		padding-top:5px;
	}

	.invoice_color 
	{
		background-color:#0f63af;
		-webkit-print-color-adjust: exact; 
		color:white!important;	
		padding:10px;
		margin-top: 20px;
		margin-bottom: 10px;		
	}
	.table_row_color tbody tr:nth-child(even)
	{
		background-color:#a3caec!important;	
		-webkit-print-color-adjust: exact; 
	}
	.grand_total_lable1 
	{
		background-color:#0f63af;
		-webkit-print-color-adjust: exact; 
		color:white!important;	
		float:right; 		
		padding-left:20px;	
	}
	.grand_total_amount1 
	{
		background-color:#0f63af;
		-webkit-print-color-adjust: exact; 
		color:white!important;				
	}
	.invoice_payment_receipt 
	{
		background-color:#0f63af!important;
		-webkit-print-color-adjust: exact; 
		color:white!important;			
		padding-bottom:5px!important;	
		padding-top:5px!important;	
	}
	.entry_heading_print
	{
		background-color:#0f63af;
		-webkit-print-color-adjust: exact; 
	}
	.invoice_print1,#invoice_print
	{
		 font-family: 'lucida grande', helvetica, verdana, arial, sans-serif!important;	
	}
	table.print_table_border
	{
		border: 1;
		border-collapse: collapse!important;	
	}
	.margin_bottom_10
	{
		margin-bottom:10px;
	} 
	.invoice_print1 .table>thead>tr>th ,.invoice_print1 .table>tbody>tr>td,#invoice_print .table>thead>tr>th ,#invoice_print .table>tbody>tr>td,
	.invoice_body .table>thead>tr>th ,.invoice_body .table>tbody>tr>td	
	{
		padding:5px!important;
	}	
}
/*End invoice CSS*/
div.scroll_css
{
	overflow:scroll;
	height:163px;
	margin-top: 45px;
}
.removeselect>input[type=radio]
{
	visibility: hidden;
}
.removeselect .time
{
	float:unset;
}
.bootstrap-timepicker-widget.timepicker-orient-top::before {
  top: -7px;
}
.bootstrap-timepicker-widget.timepicker-orient-left::before {
  left: 6px;
}
.bootstrap-timepicker-widget.dropdown-menu::before {
  border-bottom: 7px solid rgba(0, 0, 0, 0.2);
  border-left: 7px solid rgba(0, 0, 0, 0);
  border-right: 7px solid rgba(0, 0, 0, 0);
  content: "";
  display: inline-block;
  position: absolute;
}
.bootstrap-timepicker-widget table td a {
  border: 1px solid rgba(0, 0, 0, 0);
  color: #303641;
  display: inline-block;
  margin: 0;
  outline: 0 none;
  padding: 0;
  width: 100%;
}
input.bootstrap-timepicker-hour,input.bootstrap-timepicker-minute {
  border-radius: 0px !important;
  border: 1px solid #dedede !important;
}

#calendar .fc-content {
    background: #22baa0 none repeat scroll 0 0;
    border: 0 none;
    padding: 5px;
}
/********         Chart *****************/
#chart_div{margin-top: 70px;}

/**** Message ****/
.mailbox-content .message_for{width:135px;}
.mailbox-content .message_title{width:200px;}

.profile_data {
  height: 500px;
  overflow: scroll;
  float: left;
  width: 100%;
}
.profile_data .profile-image {
  margin: 100px 20px 20px;
}

.profile_data .profile-cover {
  height: 200px;

}
.profile_data #main-wrapper{margin-top:50px;}

.updated.below-h2 {
    text-transform: capitalize;
}
/********messagebox css*********/

.hospital-management-content  #message   {
    background: #fff none repeat scroll 0 0;
    border-left: 4px solid #7ad03a;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
    margin: 5px 15px 9px;
    padding: 9px 0px 1px 13px;
}
input[type=number] 
{
    height: 34px!important;
}
/*****/
#main-wrapper a:focus {
  box-shadow: none;
}


/**** Rinkal changes media query*****/

.modal-body1
{
	height:450px;
    overflow: auto;
}
.modal-body1 {
    position: relative;
    padding: 20px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
@media only screen and (max-width : 800px) 
{
	.modal-body1
	{
		height:316px!important;
		overflow: auto!important;
	}
	.overlay-content .prescription_pop_content
	{
		height: 358px;
		overflow: auto;
	}
}
@media only screen and (max-width : 1320px) 
{
	.modal-body1
	{
		height:186px!important;     /**322px!important;**/
		overflow: auto!important;
    }
	.overlay-content .prescription_pop_content
	{
		height: 256px;
		overflow: auto;
	}

}
/**dashboard css rinkal**/
@media only screen and (max-width : 431px) 
{
	.calendar-event .remainder_date {
    float: left!important;
	}
   .calendar-event .remainder_title {
    float: left!important;
    width:100%!important;
    cursor: pointer!important;
}
}
@media only screen and (max-width : 480px) 
{
.calendar-event .remainder_date {
	padding-top:5px!important;
	padding-bottom:5px!important;
	}

}
/*new add deshboard rinkal css*/
.dashboard_panel_heading_border .panel .panel-heading 
{
    border-top: 3px solid #d2d6de  !important;
    border-bottom: 1px solid #ddd !important;
}
.panel-white.event .panel-heading {
    border-top-color: #f39c12 !important;
}
.panel-white.priscription .panel-heading {
    border-top-color: #F25656 !important;
}
.panel-white.Appoinment .panel-heading {
    border-top-color: #12AFCB !important;
}
.panel-white.operation .panel-heading {
    border-top-color: #999933 !important;
}
.panel-white.assignbed .panel-heading {
    border-top-color: #996600 !important;
}
.panel-white.nt .panel-heading {
    border-top-color: #00a65a !important;
}
.calendar-event .remainder_date {
    float: right;
	width: 180px;
    box-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    padding: 0 5px;
    color: #FFF;
    border-radius: 2px;
	background-color: #f39c12;
    background-image: url(../images/vertical_line.png);
    background-repeat: no-repeat;
    background-position: center;
}
.calendar-event .remainder_date_pr {
    float: right;
    width: 88px;
    box-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    padding: 0 10px;
    color: #FFF;
    border-radius: 2px;
}

.calendar-event .remainder_date_pr {
    background-color: #F25656;
}
.Appoinment .calendar-event .remainder_date {
    background-color: #12AFCB;
}
.operation .calendar-event .remainder_date_pr {
    background-color: #999933;
}
.assignbed .calendar-event .remainder_date {
    background-color: #996600;
}
.nt .calendar-event .remainder_date, .nt .panel-heading .view_all {
    background-color: #00a65a;
}
.calendar-event {
    padding: 10px 0px;
    text-transform: capitalize;
    border-bottom: 1px solid #f4f4f4;
    overflow: hidden;
    background-color: #ffffff;
}
p
{
    font-size: 13px;
}

/*new add rinkal css*/
.panel-body.patient {
    border-bottom: 3px solid #22baa0;
}
.panel-body.doctor {
    border-bottom: 3px solid #12AFCB;
}
.panel-body.nurse {
    border-bottom: 3px solid #6A5FAC;
}
.panel-body.receptionist {
    border-bottom: 3px solid #4E5E6A;
}
.panel-body.message {
    border-bottom: 3px solid #0066FF;
}
.panel-body.setting {
    border-bottom: 3px solid #999933;
}
.panel-body.appointment {
    border-bottom: 3px solid #FF9966;
}
.panel-body.prescription {
    border-bottom: 3px solid #0099FF;
}
.panel-body.assignbed {
    border-bottom: 3px solid #996600;
}
.panel-body.treatment {
    border-bottom: 3px solid #003333;
}
.panel-body.eventnotice {
    border-bottom: 3px solid #009933;
}
.panel-body.operation_report {
    border-bottom: 3px solid #330033;
}
.panel-body.pharmacist {
    border-bottom: 3px solid #3B5998;
}
.panel-body.medicine {
    border-bottom: 3px solid #CC0066;
}
.panel-body.laboratorist {
    border-bottom: 3px solid #380000;
}
.panel-body.diagnosis {
    border-bottom: 3px solid #330033;
}
.panel-body.accountant {
    border-bottom: 3px solid #F25656;
}
.panel-body.invoice {
    border-bottom: 3px solid #660033;
}
.no-paddingR {
    padding-right: 0px;
}

.calendar-event .remainder_title {
    float: left;
    width: calc(100% - 180px);
    cursor: pointer;
}
.calendar-event .remainder_title_pr {
    float: left;
    width: calc(100% - 88px);
    cursor: pointer;
}
.calendar-event p.Bold {
    font-weight: 700;
}
.panel .panel-heading>img {
    float: left;
    padding-right: 6px;
}
.width_60b2 {
    float: left;
}
.width_20c {
    float: left;
}
.width_50a1112 {
    float: left;
}
/** rinkal precscription css**/
.width_20_date {
    width: 25%;
    padding-right: 28px;
}
.invoicefont123
{
    vertical-align: top;
    position: absolute;
    top: 0px;
	right: 24px;
    background-repeat: no-repeat;
}
.invoicefont123 
{
    z-index: -1;
}
.width_100_123 {
    width: 100%;
    padding-top: 34px;
	float: right;
}
.align_left_d{
	float:left;
}
/***rinkal add css in contact***/
.first_hed 
{
    margin-top: 0px;
}
/*
 * Table styles
 */
table.dataTable {
  width: 100%;
  margin: 0 auto;
  clear: both;
  border-collapse: separate;
  border-spacing: 0;
  /*
   * Header and footer styles
   */
  /*
   * Body styles
   */
}
table.dataTable thead th,
table.dataTable tfoot th {
  font-weight: bold;
}
table.dataTable thead th,
table.dataTable thead td {
  padding: 10px 18px;
  border-bottom: 1px solid #111111;
}
table.dataTable thead th:active,
table.dataTable thead td:active {
  outline: none;
}
table.dataTable tfoot th,
table.dataTable tfoot td {
  padding: 10px 18px 6px 18px;
  border-top: 1px solid #111111;
}
table.dataTable thead .sorting_asc,
table.dataTable thead .sorting_desc,
table.dataTable thead .sorting {
  cursor: pointer;
  *cursor: hand;
}
table.dataTable thead .sorting {
  background: url("../images/sort_both.png") no-repeat center right;
}
table.dataTable thead .sorting_asc {
  background: url("../images/sort_asc.png") no-repeat center right;
}
table.dataTable thead .sorting_desc {
  background: url("../images/sort_desc.png") no-repeat center right;
}
table.dataTable thead .sorting_asc_disabled {
  background: url("../images/sort_asc_disabled.png") no-repeat center right;
}
table.dataTable thead .sorting_desc_disabled {
  background: url("../images/sort_desc_disabled.png") no-repeat center right;
}
table.dataTable tbody tr {
  background-color: white;
}
table.dataTable tbody tr.selected {
  background-color: #b0bed9;
}
table.dataTable tbody th,
table.dataTable tbody td {
  padding: 8px 10px;
}
table.dataTable.row-border tbody th, table.dataTable.row-border tbody td, table.dataTable.display tbody th, table.dataTable.display tbody td {
  border-top: 1px solid #dddddd;
}
table.dataTable.row-border tbody tr:first-child th,
table.dataTable.row-border tbody tr:first-child td, table.dataTable.display tbody tr:first-child th,
table.dataTable.display tbody tr:first-child td {
  border-top: none;
}
table.dataTable.cell-border tbody th, table.dataTable.cell-border tbody td {
  border-top: 1px solid #dddddd;
  border-right: 1px solid #dddddd;
}
table.dataTable.cell-border tbody tr th:first-child,
table.dataTable.cell-border tbody tr td:first-child {
  border-left: 1px solid #dddddd;
}
table.dataTable.cell-border tbody tr:first-child th,
table.dataTable.cell-border tbody tr:first-child td {
  border-top: none;
}
table.dataTable.stripe tbody tr.odd, table.dataTable.display tbody tr.odd {
  background-color: #f9f9f9;
}
table.dataTable.stripe tbody tr.odd.selected, table.dataTable.display tbody tr.odd.selected {
  background-color: #abb9d3;
}
table.dataTable.hover tbody tr:hover,
table.dataTable.hover tbody tr.odd:hover,
table.dataTable.hover tbody tr.even:hover, table.dataTable.display tbody tr:hover,
table.dataTable.display tbody tr.odd:hover,
table.dataTable.display tbody tr.even:hover {
  background-color: whitesmoke;
}
table.dataTable.hover tbody tr:hover.selected,
table.dataTable.hover tbody tr.odd:hover.selected,
table.dataTable.hover tbody tr.even:hover.selected, table.dataTable.display tbody tr:hover.selected,
table.dataTable.display tbody tr.odd:hover.selected,
table.dataTable.display tbody tr.even:hover.selected {
  background-color: #a9b7d1;
}
table.dataTable.order-column tbody tr > .sorting_1,
table.dataTable.order-column tbody tr > .sorting_2,
table.dataTable.order-column tbody tr > .sorting_3, table.dataTable.display tbody tr > .sorting_1,
table.dataTable.display tbody tr > .sorting_2,
table.dataTable.display tbody tr > .sorting_3 {
  background-color: #f9f9f9;
}
table.dataTable.order-column tbody tr.selected > .sorting_1,
table.dataTable.order-column tbody tr.selected > .sorting_2,
table.dataTable.order-column tbody tr.selected > .sorting_3, table.dataTable.display tbody tr.selected > .sorting_1,
table.dataTable.display tbody tr.selected > .sorting_2,
table.dataTable.display tbody tr.selected > .sorting_3 {
  background-color: #acbad4;
}
table.dataTable.display tbody tr.odd > .sorting_1, table.dataTable.order-column.stripe tbody tr.odd > .sorting_1 {
  background-color: #f1f1f1;
}
table.dataTable.display tbody tr.odd > .sorting_2, table.dataTable.order-column.stripe tbody tr.odd > .sorting_2 {
  background-color: #f3f3f3;
}
table.dataTable.display tbody tr.odd > .sorting_3, table.dataTable.order-column.stripe tbody tr.odd > .sorting_3 {
  background-color: whitesmoke;
}
table.dataTable.display tbody tr.odd.selected > .sorting_1, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_1 {
  background-color: #a6b3cd;
}
table.dataTable.display tbody tr.odd.selected > .sorting_2, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_2 {
  background-color: #a7b5ce;
}
table.dataTable.display tbody tr.odd.selected > .sorting_3, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_3 {
  background-color: #a9b6d0;
}
table.dataTable.display tbody tr.even > .sorting_1, table.dataTable.order-column.stripe tbody tr.even > .sorting_1 {
  background-color: #f9f9f9;
}
table.dataTable.display tbody tr.even > .sorting_2, table.dataTable.order-column.stripe tbody tr.even > .sorting_2 {
  background-color: #fbfbfb;
}
table.dataTable.display tbody tr.even > .sorting_3, table.dataTable.order-column.stripe tbody tr.even > .sorting_3 {
  background-color: #fdfdfd;
}
table.dataTable.display tbody tr.even.selected > .sorting_1, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_1 {
  background-color: #acbad4;
}
table.dataTable.display tbody tr.even.selected > .sorting_2, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_2 {
  background-color: #adbbd6;
}
table.dataTable.display tbody tr.even.selected > .sorting_3, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_3 {
  background-color: #afbdd8;
}
table.dataTable.display tbody tr:hover > .sorting_1,
table.dataTable.display tbody tr.odd:hover > .sorting_1,
table.dataTable.display tbody tr.even:hover > .sorting_1, table.dataTable.order-column.hover tbody tr:hover > .sorting_1,
table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_1,
table.dataTable.order-column.hover tbody tr.even:hover > .sorting_1 {
  background-color: #eaeaea;
}
table.dataTable.display tbody tr:hover > .sorting_2,
table.dataTable.display tbody tr.odd:hover > .sorting_2,
table.dataTable.display tbody tr.even:hover > .sorting_2, table.dataTable.order-column.hover tbody tr:hover > .sorting_2,
table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_2,
table.dataTable.order-column.hover tbody tr.even:hover > .sorting_2 {
  background-color: #ebebeb;
}
table.dataTable.display tbody tr:hover > .sorting_3,
table.dataTable.display tbody tr.odd:hover > .sorting_3,
table.dataTable.display tbody tr.even:hover > .sorting_3, table.dataTable.order-column.hover tbody tr:hover > .sorting_3,
table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_3,
table.dataTable.order-column.hover tbody tr.even:hover > .sorting_3 {
  background-color: #eeeeee;
}
table.dataTable.display tbody tr:hover.selected > .sorting_1,
table.dataTable.display tbody tr.odd:hover.selected > .sorting_1,
table.dataTable.display tbody tr.even:hover.selected > .sorting_1, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_1,
table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_1,
table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_1 {
  background-color: #a1aec7;
}
table.dataTable.display tbody tr:hover.selected > .sorting_2,
table.dataTable.display tbody tr.odd:hover.selected > .sorting_2,
table.dataTable.display tbody tr.even:hover.selected > .sorting_2, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_2,
table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_2,
table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_2 {
  background-color: #a2afc8;
}
table.dataTable.display tbody tr:hover.selected > .sorting_3,
table.dataTable.display tbody tr.odd:hover.selected > .sorting_3,
table.dataTable.display tbody tr.even:hover.selected > .sorting_3, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_3,
table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_3,
table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_3 {
  background-color: #a4b2cb;
}
table.dataTable.no-footer {
  border-bottom: 1px solid #111111;
}
table.dataTable.nowrap th, table.dataTable.nowrap td {
  white-space: nowrap;
}
table.dataTable.compact thead th,
table.dataTable.compact thead td {
  padding: 5px 9px;
}
table.dataTable.compact tfoot th,
table.dataTable.compact tfoot td {
  padding: 5px 9px 3px 9px;
}
table.dataTable.compact tbody th,
table.dataTable.compact tbody td {
  padding: 4px 5px;
}
table.dataTable th.dt-left,
table.dataTable td.dt-left {
  text-align: left;
}
table.dataTable th.dt-center,
table.dataTable td.dt-center,
table.dataTable td.dataTables_empty {
  text-align: center;
}
table.dataTable th.dt-right,
table.dataTable td.dt-right {
  text-align: right;
}
table.dataTable th.dt-justify,
table.dataTable td.dt-justify {
  text-align: justify;
}
table.dataTable th.dt-nowrap,
table.dataTable td.dt-nowrap {
  white-space: nowrap;
}
table.dataTable thead th.dt-head-left,
table.dataTable thead td.dt-head-left,
table.dataTable tfoot th.dt-head-left,
table.dataTable tfoot td.dt-head-left {
  text-align: left;
}
table.dataTable thead th.dt-head-center,
table.dataTable thead td.dt-head-center,
table.dataTable tfoot th.dt-head-center,
table.dataTable tfoot td.dt-head-center {
  text-align: center;
}
table.dataTable thead th.dt-head-right,
table.dataTable thead td.dt-head-right,
table.dataTable tfoot th.dt-head-right,
table.dataTable tfoot td.dt-head-right {
  text-align: right;
}
table.dataTable thead th.dt-head-justify,
table.dataTable thead td.dt-head-justify,
table.dataTable tfoot th.dt-head-justify,
table.dataTable tfoot td.dt-head-justify {
  text-align: justify;
}
table.dataTable thead th.dt-head-nowrap,
table.dataTable thead td.dt-head-nowrap,
table.dataTable tfoot th.dt-head-nowrap,
table.dataTable tfoot td.dt-head-nowrap {
  white-space: nowrap;
}
table.dataTable tbody th.dt-body-left,
table.dataTable tbody td.dt-body-left {
  text-align: left;
}
table.dataTable tbody th.dt-body-center,
table.dataTable tbody td.dt-body-center {
  text-align: center;
}
table.dataTable tbody th.dt-body-right,
table.dataTable tbody td.dt-body-right {
  text-align: right;
}
table.dataTable tbody th.dt-body-justify,
table.dataTable tbody td.dt-body-justify {
  text-align: justify;
}
table.dataTable tbody th.dt-body-nowrap,
table.dataTable tbody td.dt-body-nowrap {
  white-space: nowrap;
}

table.dataTable,
table.dataTable th,
table.dataTable td {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

/*
 * Control feature layout
 */
.dataTables_wrapper {
  position: relative;
  clear: both;
  *zoom: 1;
  zoom: 1;
}
.dataTables_wrapper .dataTables_length {
  float: left;
}
.dataTables_wrapper .dataTables_filter {
  float: right;
  text-align: right;
}
.dataTables_wrapper .dataTables_filter input {
  margin-left: 0.5em;
}
.dataTables_wrapper .dataTables_info {
  clear: both;
  float: left;
  padding-top: 0.755em;
}
.dataTables_wrapper .dataTables_paginate {
  float: right;
  text-align: right;
  padding-top: 0.25em;
}
.dataTables_wrapper .dataTables_paginate .paginate_button {
  box-sizing: border-box;
  display: inline-block;
  min-width: 1.5em;
  padding: 0.5em 1em;
  margin-left: 2px;
  text-align: center;
  text-decoration: none !important;
  cursor: pointer;
  *cursor: hand;
  color: #333333 !important;
  border: 1px solid transparent;
}
.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
  color: #333333 !important;
  border: 1px solid #cacaca;
  background-color: white;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(100%, gainsboro));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, white 0%, gainsboro 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, white 0%, gainsboro 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, white 0%, gainsboro 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, white 0%, gainsboro 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, white 0%, gainsboro 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
  cursor: default;
  color: #666 !important;
  border: 1px solid transparent;
  background: transparent;
  box-shadow: none;
}
.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
  color: white !important;
  border: 1px solid #111111;
  background-color: #585858;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #585858), color-stop(100%, #111111));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #585858 0%, #111111 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #585858 0%, #111111 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #585858 0%, #111111 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #585858 0%, #111111 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #585858 0%, #111111 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_paginate .paginate_button:active {
  outline: none;
  background-color: #2b2b2b;
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #2b2b2b), color-stop(100%, #0c0c0c));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* IE10+ */
  background: -o-linear-gradient(top, #2b2b2b 0%, #0c0c0c 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to bottom, #2b2b2b 0%, #0c0c0c 100%);
  /* W3C */
  box-shadow: inset 0 0 3px #111;
}
.dataTables_wrapper .dataTables_processing {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100%;
  height: 40px;
  margin-left: -50%;
  margin-top: -25px;
  padding-top: 20px;
  text-align: center;
  font-size: 1.2em;
  background-color: white;
  background: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(255, 255, 255, 0)), color-stop(25%, rgba(255, 255, 255, 0.9)), color-stop(75%, rgba(255, 255, 255, 0.9)), color-stop(100%, rgba(255, 255, 255, 0)));
  /* Chrome,Safari4+ */
  background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.9) 25%, rgba(255, 255, 255, 0.9) 75%, rgba(255, 255, 255, 0) 100%);
  /* Chrome10+,Safari5.1+ */
  background: -moz-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.9) 25%, rgba(255, 255, 255, 0.9) 75%, rgba(255, 255, 255, 0) 100%);
  /* FF3.6+ */
  background: -ms-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.9) 25%, rgba(255, 255, 255, 0.9) 75%, rgba(255, 255, 255, 0) 100%);
  /* IE10+ */
  background: -o-linear-gradient(left, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.9) 25%, rgba(255, 255, 255, 0.9) 75%, rgba(255, 255, 255, 0) 100%);
  /* Opera 11.10+ */
  background: linear-gradient(to right, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.9) 25%, rgba(255, 255, 255, 0.9) 75%, rgba(255, 255, 255, 0) 100%);
  /* W3C */
}
.dataTables_wrapper .dataTables_length,
.dataTables_wrapper .dataTables_filter,
.dataTables_wrapper .dataTables_info,
.dataTables_wrapper .dataTables_processing,
.dataTables_wrapper .dataTables_paginate {
  color: #333333;
}
.dataTables_wrapper .dataTables_scroll {
  clear: both;
}
.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody {
  *margin-top: -1px;
  -webkit-overflow-scrolling: touch;
}
.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody th > div.dataTables_sizing,
.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody td > div.dataTables_sizing {
  height: 0;
  overflow: hidden;
  margin: 0 !important;
  padding: 0 !important;
}
.dataTables_wrapper.no-footer .dataTables_scrollBody {
  border-bottom: 1px solid #111111;
}
.dataTables_wrapper.no-footer div.dataTables_scrollHead table,
.dataTables_wrapper.no-footer div.dataTables_scrollBody table {
  border-bottom: none;
}
.dataTables_wrapper:after {
  visibility: hidden;
  display: block;
  content: "";
  clear: both;
  height: 0;
}

@media screen and (max-width: 767px) {
  .dataTables_wrapper .dataTables_info,
  .dataTables_wrapper .dataTables_paginate {
    float: none;
    text-align: center;
  }
  .dataTables_wrapper .dataTables_paginate {
    margin-top: 0.5em;
  }
}
@media screen and (max-width: 640px) {
  .dataTables_wrapper .dataTables_length,
  .dataTables_wrapper .dataTables_filter {
    float: none;
    text-align: center;
  }
  .dataTables_wrapper .dataTables_filter {
    margin-top: 0.5em;
  }
}
div.DTE{position:relative}div.DTE div.DTE_Processing_Indicator{position:absolute;top:10px;right:13px;height:32px;width:32px;background:url("../images/ajax-loader.gif") no-repeat top left;display:none;z-index:20}
div.DTE div.DTE_Header{position:absolute;top:0;left:0;height:50px;width:100%;background-color:#f3f3f3;border-bottom:1px solid #ddd;padding:16px 10px 2px 16px;font-size:1.3em;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
div.DTE div.DTE_Footer{position:absolute;bottom:0;left:0;height:50px;width:100%;background-color:#f3f3f3;border-top:1px solid #ddd;padding:10px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}
div.DTE div.DTE_Form_Info{margin-bottom:0.5em;display:none}
div.DTE div.DTE_Form_Content{position:relative;padding:10px}div.DTE div.DTE_Form_Error{float:left;padding:5px;display:none;color:#b11f1f}div.DTE button.DTE_Button,div.DTE div.DTE_Form_Buttons button{position:relative;text-align:center;display:block;margin-top:0;padding:5px 15px;cursor:pointer;float:right;font-size:14px;text-shadow:0 1px 0 white;border:1px solid #999;-webkit-border-radius:4px;-moz-border-radius:4px;-ms-border-radius:4px;-o-border-radius:4px;border-radius:4px;-webkit-box-shadow:1px 1px 3px #cccccc;-moz-box-shadow:1px 1px 3px #cccccc;box-shadow:1px 1px 3px #cccccc;background-color:#f9f9f9 100%;background-image:-webkit-linear-gradient(top, #fff 0%, #eee 65%, #f9f9f9 100%);background-image:-moz-linear-gradient(top, #fff 0%, #eee 65%, #f9f9f9 100%);background-image:-ms-linear-gradient(top, #fff 0%, #eee 65%, #f9f9f9 100%);background-image:-o-linear-gradient(top, #fff 0%, #eee 65%, #f9f9f9 100%);background-image:linear-gradient(top, #fff 0%, #eee 65%, #f9f9f9 100%);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='white', EndColorStr='#f9f9f9')}div.DTE button.DTE_Button:hover,div.DTE div.DTE_Form_Buttons button:hover{border:1px solid #666;-webkit-box-shadow:1px 1px 3px #999999;-moz-box-shadow:1px 1px 3px #999999;box-shadow:1px 1px 3px #999999;background-color:#f4f4f4 100%;background-image:-webkit-linear-gradient(top, #f3f3f3 0%, #dbdbdb 65%, #f4f4f4 100%);background-image:-moz-linear-gradient(top, #f3f3f3 0%, #dbdbdb 65%, #f4f4f4 100%);background-image:-ms-linear-gradient(top, #f3f3f3 0%, #dbdbdb 65%, #f4f4f4 100%);background-image:-o-linear-gradient(top, #f3f3f3 0%, #dbdbdb 65%, #f4f4f4 100%);background-image:linear-gradient(top, #f3f3f3 0%, #dbdbdb 65%, #f4f4f4 100%);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='#f3f3f3', EndColorStr='#f4f4f4')}
div.DTE button.DTE_Button:active,div.DTE div.DTE_Form_Buttons button:active{-webkit-box-shadow:inset 1px 1px 3px #999999;-moz-box-shadow:inset 1px 1px 3px #999999;box-shadow:inset 1px 1px 3px #999999}div.DTE button.DTE_Button:focus,div.DTE div.DTE_Form_Buttons button:focus{border:1px solid #426c9e;text-shadow:0 1px 0 #c4def1;background-color:#a3d0ef 100%;background-image:-webkit-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);background-image:-moz-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);background-image:-ms-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);background-image:-o-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);background-image:linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='#a3d0ef', EndColorStr='#a3d0ef');outline:none}div.DTE button.DTE_Button:focus:after,div.DTE div.DTE_Form_Buttons button:focus:after{position:absolute;top:0;left:0;right:0;bottom:0;background:white;display:block;content:" ";-webkit-animation-duration:1s;-webkit-animation-name:buttonPulse;-webkit-animation-fill-mode:forwards;-webkit-animation-iteration-count:infinite;-webkit-animation-timing-function:linear;-webkit-animation-direction:alternate;-moz-animation-duration:1s;-moz-animation-name:buttonPulse;-moz-animation-fill-mode:forwards;-moz-animation-iteration-count:infinite;-moz-animation-timing-function:linear;-moz-animation-direction:alternate;-o-animation-duration:1s;-o-animation-name:buttonPulse;-o-animation-fill-mode:forwards;-o-animation-iteration-count:infinite;-o-animation-timing-function:linear;-o-animation-direction:alternate;animation-duration:1s;animation-name:buttonPulse;animation-fill-mode:forwards;animation-iteration-count:infinite;animation-timing-function:linear;animation-direction:alternate}div.DTE.DTE_Action_Remove div.DTE_Body_Content{text-align:center;padding:20px 0}@-webkit-keyframes buttonPulse{0%{opacity:0}100%{opacity:0.2}}@-moz-keyframes buttonPulse{0%{opacity:0}100%{opacity:0.2}}@-o-keyframes buttonPulse{0%{opacity:0}100%{opacity:0.2}}@keyframes buttonPulse{0%{opacity:0}100%{opacity:0.2}}div.DTTT_container{float:left}div.DTE_Field input,div.DTE_Field textarea{box-sizing:border-box;background-color:white;-webkit-transition:background-color ease-in-out .15s;transition:background-color ease-in-out .15s}div.DTE_Field input:focus,div.DTE_Field textarea:focus{background-color:#ffffee}div.DTE_Field input[type="color"],div.DTE_Field input[type="date"],div.DTE_Field input[type="datetime"],div.DTE_Field input[type="datetime-local"],div.DTE_Field input[type="email"],div.DTE_Field input[type="month"],div.DTE_Field input[type="number"],div.DTE_Field input[type="password"],div.DTE_Field input[type="search"],div.DTE_Field input[type="tel"],div.DTE_Field input[type="text"],div.DTE_Field input[type="time"],div.DTE_Field input[type="url"],div.DTE_Field input[type="week"]{padding:6px 4px;width:100%}div.DTE_Field div.DTE_Field_Info,div.DTE_Field div.DTE_Field_Message{font-size:11px;line-height:1em}div.DTE_Field div.DTE_Field_Error{font-size:11px;line-height:1em;display:none;color:red;margin-top:5px}div.DTE_Field_Type_textarea textarea{padding:3px;width:100%;height:80px}
div.DTE_Field.DTE_Field_Type_date img{vertical-align:middle;cursor:pointer;*cursor:hand}div.DTE_Field.DTE_Field_Type_date input.jqueryui{width:87%;margin-right:6px}div.DTE_Field_Type_checkbox div.DTE_Field_Input>div>div,div.DTE_Field_Type_radio div.DTE_Field_Input>div>div{margin-bottom:0.25em}div.DTE_Field_Type_checkbox div.DTE_Field_Input>div>div:last-child,div.DTE_Field_Type_radio div.DTE_Field_Input>div>div:last-child{margin-bottom:0}div.DTE_Field_Type_checkbox div.DTE_Field_Input>div>div label,div.DTE_Field_Type_radio div.DTE_Field_Input>div>div label{margin-left:0.75em;vertical-align:middle}div.DTE_Body{padding:50px 0}div.DTE_Body div.DTE_Body_Content{position:relative;overflow:auto}div.DTE_Body div.DTE_Body_Content div.DTE_Form_Info{padding:1em 1em 0 1em;margin:0}div.DTE_Body div.DTE_Body_Content div.DTE_Field{position:relative;zoom:1;clear:both;padding:5px 20%;border:1px solid transparent}div.DTE_Body div.DTE_Body_Content div.DTE_Field:after{display:block;content:".";height:0;line-height:0;clear:both;visibility:hidden}div.DTE_Body div.DTE_Body_Content div.DTE_Field:hover{background-color:#f9f9f9;border:1px solid #f3f3f3}div.DTE_Body div.DTE_Body_Content div.DTE_Field>label{float:left;width:40%;padding-top:6px}div.DTE_Body div.DTE_Body_Content div.DTE_Field>div.DTE_Field_Input{float:right;width:60%}html[dir="rtl"] div.DTE_Body div.DTE_Body_Content div.DTE_Field>label{float:right}html[dir="rtl"] div.DTE_Body div.DTE_Body_Content div.DTE_Field>div.DTE_Field_Input{float:left}html[dir="rtl"] div.DTE div.DTE_Form_Buttons button{float:left}@media only screen and (max-width: 768px){div.DTE_Body div.DTE_Body_Content div.DTE_Field{padding:5px 10%}}@media only screen and (max-width: 640px){div.DTE_Body div.DTE_Body_Content div.DTE_Field{padding:5px 0}}@media only screen and (max-width: 580px){div.DTE_Body div.DTE_Body_Content div.DTE_Field{position:relative;zoom:1;clear:both;padding:5px}div.DTE_Body div.DTE_Body_Content div.DTE_Field>label{float:none;width:auto;padding-top:0}div.DTE_Body div.DTE_Body_Content div.DTE_Field>div.DTE_Field_Input{float:none;width:auto}}div.DTE_Bubble{position:absolute;z-index:11;margin-top:-6px;opacity:0}div.DTE_Bubble div.DTE_Bubble_Liner{position:absolute;bottom:0;border:1px solid black;width:300px;margin-left:-150px;background-color:white;box-shadow:2px 2px 7px #555;border-radius:5px;border:2px solid #444;padding:1em;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table{display:table;width:100%}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table>form{display:table-cell}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table>form div.DTE_Form_Content{padding:0}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table>form div.DTE_Form_Content div.DTE_Field{position:relative;zoom:1;margin-bottom:0.5em}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table>form div.DTE_Form_Content div.DTE_Field:last-child{margin-bottom:0}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Table div.DTE_Form_Buttons{display:table-cell;vertical-align:bottom;padding:0 0 0 0.75em;width:1%}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Header{border-top-left-radius:5px;border-top-right-radius:5px}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Header+div.DTE_Form_Info,div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Header+div.DTE_Bubble_Table{padding-top:42px}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Form_Error{float:none;display:none;padding:0;margin-bottom:0.5em}
div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Close{position:absolute;top:-11px;right:-11px;width:22px;height:22px;border:2px solid white;background-color:black;text-align:center;border-radius:15px;cursor:pointer;*cursor:hand;z-index:12;box-shadow:2px 2px 6px #111}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Close:after{content:'\00d7';color:white;font-weight:bold;font-size:18px;line-height:18px}div.DTE_Bubble div.DTE_Bubble_Liner div.DTE_Bubble_Close:hover{background-color:#092079;box-shadow:2px 2px 9px #111}div.DTE_Bubble div.DTE_Bubble_Triangle{position:absolute;height:10px;width:10px;top:-6px;background-color:white;border:2px solid #444;border-top:none;border-right:none;-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);-ms-transform:rotate(-45deg);-o-transform:rotate(-45deg);transform:rotate(-45deg)}div.DTE_Bubble.DTE_Processing div.DTE_Bubble_Liner:after{position:absolute;content:' ';display:block;top:12px;right:18px;height:12px;width:17px;background:url("../images/ajax-loader-small.gif") no-repeat top left}div.DTE_Bubble_Background{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.7);background:-ms-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-moz-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-o-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-webkit-gradient(radial, center center, 0, center center, 497, color-stop(0, rgba(0,0,0,0.3)), color-stop(1, rgba(0,0,0,0.7)));background:-webkit-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:radial-gradient(ellipse farthest-corner at center, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);z-index:10}div.DTE_Bubble_Background>div{position:absolute;top:0;right:0;left:0;bottom:0;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)"}div.DTE_Bubble_Background>div:not([dummy]){filter:progid:DXImageTransform.Microsoft.gradient(enabled='false')}div.DTE_Inline{position:relative;display:table;width:100%}div.DTE_Inline div.DTE_Inline_Field,div.DTE_Inline div.DTE_Inline_Buttons{display:table-cell;vertical-align:middle}div.DTE_Inline div.DTE_Inline_Field div.DTE_Field,div.DTE_Inline div.DTE_Inline_Buttons div.DTE_Field{padding:0}div.DTE_Inline div.DTE_Inline_Field div.DTE_Field>label,div.DTE_Inline div.DTE_Inline_Buttons div.DTE_Field>label{display:none}div.DTE_Inline div.DTE_Inline_Field div.DTE_Form_Buttons button,div.DTE_Inline div.DTE_Inline_Buttons div.DTE_Form_Buttons button{margin:-6px 0 -6px 4px;padding:5px}div.DTE_Inline div.DTE_Field input[type="color"],div.DTE_Inline div.DTE_Field input[type="date"],div.DTE_Inline div.DTE_Field input[type="datetime"],div.DTE_Inline div.DTE_Field input[type="datetime-local"],div.DTE_Inline div.DTE_Field input[type="email"],div.DTE_Inline div.DTE_Field input[type="month"],div.DTE_Inline div.DTE_Field input[type="number"],div.DTE_Inline div.DTE_Field input[type="password"],div.DTE_Inline div.DTE_Field input[type="search"],div.DTE_Inline div.DTE_Field input[type="tel"],div.DTE_Inline div.DTE_Field input[type="text"],div.DTE_Inline div.DTE_Field input[type="time"],div.DTE_Inline div.DTE_Field input[type="url"],div.DTE_Inline div.DTE_Field input[type="week"]{margin:-6px 0}
div.DTE_Inline.DTE_Processing:after{position:absolute;content:' ';display:block;top:4px;right:10px;height:12px;width:17px;background:url("../images/ajax-loader-small.gif") no-repeat top left}span.dtr-data div.DTE_Inline{display:inline-table}div.DTED_Lightbox_Wrapper{position:fixed;top:0;left:50%;margin-left:-390px;width:780px;height:100%;z-index:11}
div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container{*position:absolute;*top:50%; position:absolute; top:50%;display:table;height:100%;width:100%}
div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper{*position:relative;position:relative;display:table-cell;vertical-align:middle;width:100%}

div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content{*top:-50%;top:-50%;position:relative;border:7px solid rgba(220,220,220,0.5);box-shadow:2px 2px 10px #555;border-radius:10px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}


div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE{background:white;border-radius:6px;box-shadow:0 0 5px #555;border:2px solid #444;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE div.DTE_Header{top:2px;left:2px;right:2px;width:auto;border-top-left-radius:5px;border-top-right-radius:5px}div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE div.DTE_Footer{bottom:2px;left:2px;right:2px;width:auto;border-bottom-left-radius:5px;border-bottom-right-radius:5px}div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTED_Lightbox_Close{position:absolute;top:-11px;right:-11px;width:22px;height:22px;border:2px solid white;background-color:black;text-align:center;border-radius:15px;cursor:pointer;*cursor:hand;z-index:12;box-shadow:2px 2px 6px #111}div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTED_Lightbox_Close:after{content:'\00d7';color:white;font-weight:bold;font-size:18px;line-height:18px}div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTED_Lightbox_Close:hover{background-color:#092079;box-shadow:2px 2px 9px #111}div.DTED_Lightbox_Background{position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.7);background:-ms-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-moz-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-o-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:-webkit-gradient(radial, center center, 0, center center, 497, color-stop(0, rgba(0,0,0,0.3)), color-stop(1, rgba(0,0,0,0.7)));background:-webkit-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);background:radial-gradient(ellipse farthest-corner at center, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.7) 100%);z-index:10}div.DTED_Lightbox_Background>div{position:absolute;top:0;right:0;left:0;bottom:0;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)"}div.DTED_Lightbox_Background>div:not([dummy]){filter:progid:DXImageTransform.Microsoft.gradient(enabled='false')}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Background{height:0}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Shown{display:none}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper{position:absolute;top:0px;left:0px;right:0px;bottom:0px;width:auto;height:auto;margin-left:0;-webkit-overflow-scrolling:touch}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container{display:block}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper{display:block}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content{border:4px solid rgba(220,220,220,0.5);border-radius:0}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE{border-radius:0;box-shadow:0 0 5px #555;border:2px solid #444}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE div.DTE_Header{border-top-left-radius:0;border-top-right-radius:0}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTE div.DTE_Footer{border-bottom-left-radius:0;border-bottom-right-radius:0}body.DTED_Lightbox_Mobile div.DTED_Lightbox_Wrapper div.DTED_Lightbox_Container div.DTED_Lightbox_Content_Wrapper div.DTED_Lightbox_Content div.DTED_Lightbox_Close{top:11px;right:15px}@media only screen and (max-width: 780px){div.DTED_Lightbox_Wrapper{position:fixed;top:0;left:0;width:100%;margin-left:0}}div.DTED_Envelope_Wrapper{position:absolute;top:0;bottom:0;left:50%;height:100%;z-index:11;display:none;overflow:hidden}div.DTED_Envelope_Wrapper div.DTED_Envelope_ShadowLeft{position:absolute;top:0;left:0;width:50%;height:9px;background:url("../images/shadow_left.png") no-repeat top left;z-index:10}div.DTED_Envelope_Wrapper div.DTED_Envelope_ShadowRight{position:absolute;top:0;right:0;width:50%;height:9px;background:url("../images/shadow_right.png") no-repeat top right;z-index:10}div.DTED_Envelope_Wrapper div.DTED_Envelope_Container{position:absolute;top:0;left:5%;width:90%;border-left:1px solid #777;border-right:1px solid #777;border-bottom:1px solid #777;box-shadow:3px 3px 10px #555;border-bottom-left-radius:5px;border-bottom-right-radius:5px;background-color:white}div.DTED_Envelope_Wrapper div.DTED_Envelope_Container div.DTE_Processing_Indicator{right:36px}div.DTED_Envelope_Wrapper div.DTED_Envelope_Container div.DTE_Footer{border-bottom-left-radius:5px;border-bottom-right-radius:5px}div.DTED_Envelope_Wrapper div.DTED_Envelope_Container div.DTED_Envelope_Close{position:absolute;top:16px;right:10px;width:18px;height:18px;cursor:pointer;*cursor:hand;z-index:12;text-align:center;font-size:12px;background:#F8F8F8;background:-webkit-gradient(linear, center bottom, center top, from(#ccc), to(#fff));background:-moz-linear-gradient(top, #fff, #ccc);background:linear-gradient(top, #fff, #ccc);text-shadow:0 1px 0 white;border:1px solid #999;border-radius:2px;-moz-border-radius:2px;-webkit-border-radius:2px;box-shadow:0px 0px 1px #999;-moz-box-shadow:0px 0px 1px #999;-webkit-box-shadow:0px 0px 1px #999}div.DTED_Envelope_Background{position:fixed;top:0;left:0;width:100%;height:100%;z-index:10;background:rgba(0,0,0,0.4);background:-ms-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.4) 100%);background:-moz-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.4) 100%);background:-o-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.4) 100%);background:-webkit-gradient(radial, center center, 0, center center, 497, color-stop(0, rgba(0,0,0,0.1)), color-stop(1, rgba(0,0,0,0.4)));background:-webkit-radial-gradient(center, ellipse farthest-corner, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.4) 100%);background:radial-gradient(ellipse farthest-corner at center, rgba(0,0,0,0.1) 0%, rgba(0,0,0,0.4) 100%)}table.dataTable tbody tr.highlight{background-color:#fffbcc !important}table.dataTable tbody tr.highlight,table.dataTable tbody tr.noHighlight,table.dataTable tbody tr.highlight td,table.dataTable tbody tr.noHighlight td{-webkit-transition:background-color 500ms linear;-moz-transition:background-color 500ms linear;-ms-transition:background-color 500ms linear;-o-transition:background-color 500ms linear;transition:background-color 500ms linear}table.dataTable.stripe tbody tr.odd.highlight,table.dataTable.display tbody tr.odd.highlight{background-color:#f9f5c7}table.dataTable.hover tbody tr:hover.highlight,table.dataTable.hover tbody tr.odd:hover.highlight,table.dataTable.hover tbody tr.even:hover.highlight,table.dataTable.display tbody tr:hover.highlight,table.dataTable.display tbody tr.odd:hover.highlight,table.dataTable.display tbody tr.even:hover.highlight{background-color:#f5f1c4}table.dataTable.order-column tbody tr.highlight>.sorting_1,table.dataTable.order-column tbody tr.highlight>.sorting_2,table.dataTable.order-column tbody tr.highlight>.sorting_3,table.dataTable.display tbody tr.highlight>.sorting_1,table.dataTable.display tbody tr.highlight>.sorting_2,table.dataTable.display tbody tr.highlight>.sorting_3{background-color:#f9f5c7}table.dataTable.display tbody tr.odd.highlight>.sorting_1,table.dataTable.order-column.stripe tbody tr.odd.highlight>.sorting_1{background-color:#f1edc0}table.dataTable.display tbody tr.odd.highlight>.sorting_2,table.dataTable.order-column.stripe tbody tr.odd.highlight>.sorting_2{background-color:#f3efc2}table.dataTable.display tbody tr.odd.highlight>.sorting_3,table.dataTable.order-column.stripe tbody tr.odd.highlight>.sorting_3{background-color:#f5f1c4}table.dataTable.display tbody tr.even.highlight>.sorting_1,table.dataTable.order-column.stripe tbody tr.even.highlight>.sorting_1{background-color:#f9f5c7}table.dataTable.display tbody tr.even.highlight>.sorting_2,table.dataTable.order-column.stripe tbody tr.even.highlight>.sorting_2{background-color:#fbf7c9}table.dataTable.display tbody tr.even.highlight>.sorting_3,table.dataTable.order-column.stripe tbody tr.even.highlight>.sorting_3{background-color:#fdf9cb}table.dataTable.display tbody tr:hover.highlight>.sorting_1,table.dataTable.display tbody tr.odd:hover.highlight>.sorting_1,table.dataTable.display tbody tr.even:hover.highlight>.sorting_1,table.dataTable.order-column.hover tbody tr:hover.highlight>.sorting_1,table.dataTable.order-column.hover tbody tr.odd:hover.highlight>.sorting_1,table.dataTable.order-column.hover tbody tr.even:hover.highlight>.sorting_1{background-color:#eae6bb}table.dataTable.display tbody tr:hover.highlight>.sorting_2,table.dataTable.display tbody tr.odd:hover.highlight>.sorting_2,table.dataTable.display tbody tr.even:hover.highlight>.sorting_2,table.dataTable.order-column.hover tbody tr:hover.highlight>.sorting_2,table.dataTable.order-column.hover tbody tr.odd:hover.highlight>.sorting_2,table.dataTable.order-column.hover tbody tr.even:hover.highlight>.sorting_2{background-color:#ebe8bc}table.dataTable.display tbody tr:hover.highlight>.sorting_3,table.dataTable.display tbody tr.odd:hover.highlight>.sorting_3,table.dataTable.display tbody tr.even:hover.highlight>.sorting_3,table.dataTable.order-column.hover tbody tr:hover.highlight>.sorting_3,table.dataTable.order-column.hover tbody tr.odd:hover.highlight>.sorting_3,table.dataTable.order-column.hover tbody tr.even:hover.highlight>.sorting_3{background-color:#eeebbf}

div.DTTT_container {
	position: relative;
	float: right;
	margin-bottom: 1em;
}

@media screen and (max-width: 640px) {
	div.DTTT_container {
		float: none !important;
		text-align: center;
	}

	div.DTTT_container:after {
		visibility: hidden;
		display: block;
		content: "";
		clear: both;
		height: 0;
	}
}


button.DTTT_button,
div.DTTT_button,
a.DTTT_button {
	position: relative;
	display: inline-block;
	margin-right: 3px;
	padding: 5px 8px;
	border: 1px solid #999;
	cursor: pointer;
	*cursor: hand;
	font-size: 0.88em;
	color: black !important;

	-webkit-border-radius: 2px;
	   -moz-border-radius: 2px;
	    -ms-border-radius: 2px;
	     -o-border-radius: 2px;
	        border-radius: 2px;

	-webkit-box-shadow: 1px 1px 3px #ccc;
	   -moz-box-shadow: 1px 1px 3px #ccc;
	    -ms-box-shadow: 1px 1px 3px #ccc;
	     -o-box-shadow: 1px 1px 3px #ccc;
	        box-shadow: 1px 1px 3px #ccc;

	/* Generated by http://www.colorzilla.com/gradient-editor/ */
	background: #ffffff; /* Old browsers */
	background: -webkit-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* Chrome10+,Safari5.1+ */
	background:    -moz-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* FF3.6+ */
	background:     -ms-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* IE10+ */
	background:      -o-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* Opera 11.10+ */
	background:         linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f9f9f9',GradientType=0 ); /* IE6-9 */
}


/* Buttons are cunning border-box sizing - we can't just use that for A and DIV due to IE6/7 */
button.DTTT_button {
	height: 30px;
	padding: 3px 8px;
}

.DTTT_button embed { 
	outline: none;
}

button.DTTT_button:hover:not(.DTTT_disabled),
div.DTTT_button:hover:not(.DTTT_disabled),
a.DTTT_button:hover:not(.DTTT_disabled) {
	border: 1px solid #666;
	text-decoration: none !important;

	-webkit-box-shadow: 1px 1px 3px #999;
	   -moz-box-shadow: 1px 1px 3px #999;
	    -ms-box-shadow: 1px 1px 3px #999;
	     -o-box-shadow: 1px 1px 3px #999;
	        box-shadow: 1px 1px 3px #999;

	background: #f3f3f3; /* Old browsers */
	background: -webkit-linear-gradient(top, #f3f3f3 0%,#e2e2e2 89%,#f4f4f4 100%); /* Chrome10+,Safari5.1+ */
	background:    -moz-linear-gradient(top, #f3f3f3 0%,#e2e2e2 89%,#f4f4f4 100%); /* FF3.6+ */
	background:     -ms-linear-gradient(top, #f3f3f3 0%,#e2e2e2 89%,#f4f4f4 100%); /* IE10+ */
	background:      -o-linear-gradient(top, #f3f3f3 0%,#e2e2e2 89%,#f4f4f4 100%); /* Opera 11.10+ */
	background:         linear-gradient(top, #f3f3f3 0%,#e2e2e2 89%,#f4f4f4 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f3f3f3', endColorstr='#f4f4f4',GradientType=0 ); /* IE6-9 */
}

button.DTTT_button:focus,
div.DTTT_button:focus,
a.DTTT_button:focus {
	border: 1px solid #426c9e;
	text-shadow: 0 1px 0 #c4def1;
	outline: none;

	background-color: #a3d0ef 100%;
	background-image: -webkit-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);
	background-image:    -moz-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);
	background-image:     -ms-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);
	background-image:      -o-linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);
	background-image:         linear-gradient(top, #a3d0ef 0%, #79ace9 65%, #a3d0ef 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='#a3d0ef', EndColorStr='#a3d0ef');
}

button.DTTT_button:active:not(.DTTT_disabled),
div.DTTT_button:active:not(.DTTT_disabled),
a.DTTT_button:active:not(.DTTT_disabled) {
	-webkit-box-shadow: inset 1px 1px 3px #999999;
	-moz-box-shadow: inset 1px 1px 3px #999999;
	box-shadow: inset 1px 1px 3px #999999;
}

button.DTTT_disabled,
div.DTTT_disabled,
a.DTTT_disabled {
	color: #999 !important;
	border: 1px solid #d0d0d0;
	cursor: default;
	background: #ffffff; /* Old browsers */
	background: -webkit-linear-gradient(top, #ffffff 0%,#f9f9f9 89%,#fafafa 100%); /* Chrome10+,Safari5.1+ */
	background:    -moz-linear-gradient(top, #ffffff 0%,#f9f9f9 89%,#fafafa 100%); /* FF3.6+ */
	background:     -ms-linear-gradient(top, #ffffff 0%,#f9f9f9 89%,#fafafa 100%); /* IE10+ */
	background:      -o-linear-gradient(top, #ffffff 0%,#f9f9f9 89%,#fafafa 100%); /* Opera 11.10+ */
	background:         linear-gradient(top, #ffffff 0%,#f9f9f9 89%,#fafafa 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#fafafa',GradientType=0 ); /* IE6-9 */
}



/*
 * BUTTON_STYLES
 * Action specific button styles
 * If you want images - comment this back in

a.DTTT_button_csv,
a.DTTT_button_xls,
a.DTTT_button_copy,
a.DTTT_button_pdf,
a.DTTT_button_print {
	padding-right: 0px;
}

a.DTTT_button_csv span,
a.DTTT_button_xls span,
a.DTTT_button_copy span,
a.DTTT_button_pdf span,
a.DTTT_button_print span {
	display: inline-block;
	height: 24px;
	line-height: 24px;
	padding-right: 30px;
}


a.DTTT_button_csv span { background: url(../images/csv.png) no-repeat bottom right; }
a.DTTT_button_csv:hover span { background: url(../images/csv_hover.png) no-repeat center right; }

a.DTTT_button_xls span { background: url(../images/xls.png) no-repeat center right; }
a.DTTT_button_xls:hover span { background: #f0f0f0 url(../images/xls_hover.png) no-repeat center right; }

a.DTTT_button_copy span { background: url(../images/copy.png) no-repeat center right; }
a.DTTT_button_copy:hover span { background: #f0f0f0 url(../images/copy_hover.png) no-repeat center right; }

a.DTTT_button_pdf span { background: url(../images/pdf.png) no-repeat center right; }
a.DTTT_button_pdf:hover span { background: #f0f0f0 url(../images/pdf_hover.png) no-repeat center right; }

a.DTTT_button_print span { background: url(../images/print.png) no-repeat center right; }
a.DTTT_button_print:hover span { background: #f0f0f0 url(../images/print_hover.png) no-repeat center right; }

 */

button.DTTT_button_collection span {
	padding-right: 17px;
	background: url(../images/collection.png) no-repeat center right;
}

button.DTTT_button_collection:hover span {
	padding-right: 17px;
	background: #f0f0f0 url(../images/collection_hover.png) no-repeat center right;
}


/*
 * SELECTING
 * Row selection styles
 */
table.DTTT_selectable tbody tr {
	cursor: pointer;
	*cursor: hand;
}

table.dataTable tr.DTTT_selected.odd {
	background-color: #9FAFD1;
}

table.dataTable tr.DTTT_selected.odd td.sorting_1 {
	background-color: #9FAFD1;
}

table.dataTable tr.DTTT_selected.odd td.sorting_2 {
	background-color: #9FAFD1;
}

table.dataTable tr.DTTT_selected.odd td.sorting_3 {
	background-color: #9FAFD1;
}


table.dataTable tr.DTTT_selected.even {
	background-color: #B0BED9;
}

table.dataTable tr.DTTT_selected.even td.sorting_1 {
	background-color: #B0BED9;
}

table.dataTable tr.DTTT_selected.even td.sorting_2 {
	background-color: #B0BED9;
}

table.dataTable tr.DTTT_selected.even td.sorting_3 {
	background-color: #B0BED9;
}


/*
 * COLLECTIONS
 * Drop down list (collection) styles
 */

div.DTTT_collection {
	width: 150px;
	padding: 8px 8px 4px 8px;
	border: 1px solid #ccc;
	border: 1px solid rgba( 0, 0, 0, 0.4 );
	background-color: #f3f3f3;
	background-color: rgba( 255, 255, 255, 0.3 );
	overflow: hidden;
	z-index: 2002;

	-webkit-border-radius: 5px;
	   -moz-border-radius: 5px;
	    -ms-border-radius: 5px;
	     -o-border-radius: 5px;
	        border-radius: 5px;
	
	-webkit-box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
	   -moz-box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
	    -ms-box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
	     -o-box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
	        box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
}

div.DTTT_collection_background {
	background: black;
	z-index: 2001;
}

div.DTTT_collection button.DTTT_button,
div.DTTT_collection div.DTTT_button,
div.DTTT_collection a.DTTT_button {
	position: relative;
	left: 0;
	right: 0;

	display: block;
	float: none;
	margin-bottom: 4px;
	
	-webkit-box-shadow: 1px 1px 3px #999;
	   -moz-box-shadow: 1px 1px 3px #999;
	    -ms-box-shadow: 1px 1px 3px #999;
	     -o-box-shadow: 1px 1px 3px #999;
	        box-shadow: 1px 1px 3px #999;
}


/*
 * PRINTING
 * Print display styles
 */

.DTTT_print_info {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 150px;
	margin-left: -200px;
	margin-top: -75px;
	text-align: center;
	color: #333;
	padding: 10px 30px;

	background: #ffffff; /* Old browsers */
	background: -webkit-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* Chrome10+,Safari5.1+ */
	background:    -moz-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* FF3.6+ */
	background:     -ms-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* IE10+ */
	background:      -o-linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* Opera 11.10+ */
	background:         linear-gradient(top, #ffffff 0%,#f3f3f3 89%,#f9f9f9 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f9f9f9',GradientType=0 ); /* IE6-9 */
	
	opacity: 0.95;

	border: 1px solid black;
	border: 1px solid rgba(0, 0, 0, 0.5);
	
	-webkit-border-radius: 6px;
	   -moz-border-radius: 6px;
	    -ms-border-radius: 6px;
	     -o-border-radius: 6px;
	        border-radius: 6px;
	
	-webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.5);
	   -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.5);
	    -ms-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.5);
	     -o-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.5);
	        box-shadow: 0 3px 7px rgba(0, 0, 0, 0.5);
}

.DTTT_print_info h6 {
	font-weight: normal;
	font-size: 28px;
	line-height: 28px;
	margin: 1em;
}

.DTTT_print_info p {
	font-size: 14px;
	line-height: 20px;
}
/*!
 * Datepicker for Bootstrap
 *
 * Copyright 2012 Stefan Petre
 * Improvements by Andrew Rowls
 * Licensed under the Apache License v2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 */.datepicker{padding:4px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;direction:ltr}.datepicker-inline{width:220px}.datepicker.datepicker-rtl{direction:rtl}.datepicker.datepicker-rtl table tr td span{float:right}.datepicker-dropdown{top:0;left:0}.datepicker-dropdown:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-top:0;border-bottom-color:rgba(0,0,0,0.2);position:absolute}.datepicker-dropdown:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #fff;border-top:0;position:absolute}.datepicker-dropdown.datepicker-orient-left:before{left:6px}.datepicker-dropdown.datepicker-orient-left:after{left:7px}.datepicker-dropdown.datepicker-orient-right:before{right:6px}.datepicker-dropdown.datepicker-orient-right:after{right:7px}.datepicker-dropdown.datepicker-orient-top:before{top:-7px}.datepicker-dropdown.datepicker-orient-top:after{top:-6px}.datepicker-dropdown.datepicker-orient-bottom:before{bottom:-7px;border-bottom:0;border-top:7px solid #999}.datepicker-dropdown.datepicker-orient-bottom:after{bottom:-6px;border-bottom:0;border-top:6px solid #fff}.datepicker>div{display:none}.datepicker.days div.datepicker-days{display:block}.datepicker.months div.datepicker-months{display:block}.datepicker.years div.datepicker-years{display:block}.datepicker table{margin:0;-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.datepicker td,.datepicker th{text-align:center;width:20px;height:20px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;border:0}.table-striped .datepicker table tr td,.table-striped .datepicker table tr th{background-color:transparent}.datepicker table tr td.day:hover,.datepicker table tr td.day.focused{background:#eee;cursor:pointer}.datepicker table tr td.old,.datepicker table tr td.new{color:#999}.datepicker table tr td.disabled,.datepicker table tr td.disabled:hover{background:0;color:#999;cursor:default}.datepicker table tr td.today,.datepicker table tr td.today:hover,.datepicker table tr td.today.disabled,.datepicker table tr td.today.disabled:hover{background-color:#fde19a;background-image:-moz-linear-gradient(top,#fdd49a,#fdf59a);background-image:-ms-linear-gradient(top,#fdd49a,#fdf59a);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fdd49a),to(#fdf59a));background-image:-webkit-linear-gradient(top,#fdd49a,#fdf59a);background-image:-o-linear-gradient(top,#fdd49a,#fdf59a);background-image:linear-gradient(top,#fdd49a,#fdf59a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdd49a',endColorstr='#fdf59a',GradientType=0);border-color:#fdf59a #fdf59a #fbed50;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#000}.datepicker table tr td.today:hover,.datepicker table tr td.today:hover:hover,.datepicker table tr td.today.disabled:hover,.datepicker table tr td.today.disabled:hover:hover,.datepicker table tr td.today:active,.datepicker table tr td.today:hover:active,.datepicker table tr td.today.disabled:active,.datepicker table tr td.today.disabled:hover:active,.datepicker table tr td.today.active,.datepicker table tr td.today:hover.active,.datepicker table tr td.today.disabled.active,.datepicker table tr td.today.disabled:hover.active,.datepicker table tr td.today.disabled,.datepicker table tr td.today:hover.disabled,.datepicker table tr td.today.disabled.disabled,.datepicker table tr td.today.disabled:hover.disabled,.datepicker table tr td.today[disabled],.datepicker table tr td.today:hover[disabled],.datepicker table tr td.today.disabled[disabled],.datepicker table tr td.today.disabled:hover[disabled]{background-color:#fdf59a}.datepicker table tr td.today:active,.datepicker table tr td.today:hover:active,.datepicker table tr td.today.disabled:active,.datepicker table tr td.today.disabled:hover:active,.datepicker table tr td.today.active,.datepicker table tr td.today:hover.active,.datepicker table tr td.today.disabled.active,.datepicker table tr td.today.disabled:hover.active{background-color:#fbf069 \9}.datepicker table tr td.today:hover:hover{color:#000}.datepicker table tr td.today.active:hover{color:#fff}.datepicker table tr td.range,.datepicker table tr td.range:hover,.datepicker table tr td.range.disabled,.datepicker table tr td.range.disabled:hover{background:#eee;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.datepicker table tr td.range.today,.datepicker table tr td.range.today:hover,.datepicker table tr td.range.today.disabled,.datepicker table tr td.range.today.disabled:hover{background-color:#f3d17a;background-image:-moz-linear-gradient(top,#f3c17a,#f3e97a);background-image:-ms-linear-gradient(top,#f3c17a,#f3e97a);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f3c17a),to(#f3e97a));background-image:-webkit-linear-gradient(top,#f3c17a,#f3e97a);background-image:-o-linear-gradient(top,#f3c17a,#f3e97a);background-image:linear-gradient(top,#f3c17a,#f3e97a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f3c17a',endColorstr='#f3e97a',GradientType=0);border-color:#f3e97a #f3e97a #edde34;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.datepicker table tr td.range.today:hover,.datepicker table tr td.range.today:hover:hover,.datepicker table tr td.range.today.disabled:hover,.datepicker table tr td.range.today.disabled:hover:hover,.datepicker table tr td.range.today:active,.datepicker table tr td.range.today:hover:active,.datepicker table tr td.range.today.disabled:active,.datepicker table tr td.range.today.disabled:hover:active,.datepicker table tr td.range.today.active,.datepicker table tr td.range.today:hover.active,.datepicker table tr td.range.today.disabled.active,.datepicker table tr td.range.today.disabled:hover.active,.datepicker table tr td.range.today.disabled,.datepicker table tr td.range.today:hover.disabled,.datepicker table tr td.range.today.disabled.disabled,.datepicker table tr td.range.today.disabled:hover.disabled,.datepicker table tr td.range.today[disabled],.datepicker table tr td.range.today:hover[disabled],.datepicker table tr td.range.today.disabled[disabled],.datepicker table tr td.range.today.disabled:hover[disabled]{background-color:#f3e97a}.datepicker table tr td.range.today:active,.datepicker table tr td.range.today:hover:active,.datepicker table tr td.range.today.disabled:active,.datepicker table tr td.range.today.disabled:hover:active,.datepicker table tr td.range.today.active,.datepicker table tr td.range.today:hover.active,.datepicker table tr td.range.today.disabled.active,.datepicker table tr td.range.today.disabled:hover.active{background-color:#efe24b \9}.datepicker table tr td.selected,.datepicker table tr td.selected:hover,.datepicker table tr td.selected.disabled,.datepicker table tr td.selected.disabled:hover{background-color:#9e9e9e;background-image:-moz-linear-gradient(top,#b3b3b3,#808080);background-image:-ms-linear-gradient(top,#b3b3b3,#808080);background-image:-webkit-gradient(linear,0 0,0 100%,from(#b3b3b3),to(#808080));background-image:-webkit-linear-gradient(top,#b3b3b3,#808080);background-image:-o-linear-gradient(top,#b3b3b3,#808080);background-image:linear-gradient(top,#b3b3b3,#808080);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3b3b3',endColorstr='#808080',GradientType=0);border-color:#808080 #808080 #595959;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.datepicker table tr td.selected:hover,.datepicker table tr td.selected:hover:hover,.datepicker table tr td.selected.disabled:hover,.datepicker table tr td.selected.disabled:hover:hover,.datepicker table tr td.selected:active,.datepicker table tr td.selected:hover:active,.datepicker table tr td.selected.disabled:active,.datepicker table tr td.selected.disabled:hover:active,.datepicker table tr td.selected.active,.datepicker table tr td.selected:hover.active,.datepicker table tr td.selected.disabled.active,.datepicker table tr td.selected.disabled:hover.active,.datepicker table tr td.selected.disabled,.datepicker table tr td.selected:hover.disabled,.datepicker table tr td.selected.disabled.disabled,.datepicker table tr td.selected.disabled:hover.disabled,.datepicker table tr td.selected[disabled],.datepicker table tr td.selected:hover[disabled],.datepicker table tr td.selected.disabled[disabled],.datepicker table tr td.selected.disabled:hover[disabled]{background-color:#808080}.datepicker table tr td.selected:active,.datepicker table tr td.selected:hover:active,.datepicker table tr td.selected.disabled:active,.datepicker table tr td.selected.disabled:hover:active,.datepicker table tr td.selected.active,.datepicker table tr td.selected:hover.active,.datepicker table tr td.selected.disabled.active,.datepicker table tr td.selected.disabled:hover.active{background-color:#666 \9}.datepicker table tr td.active,.datepicker table tr td.active:hover,.datepicker table tr td.active.disabled,.datepicker table tr td.active.disabled:hover{background-color:#006dcc;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-ms-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(top,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc',endColorstr='#0044cc',GradientType=0);border-color:#04c #0044cc #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.datepicker table tr td.active:hover,.datepicker table tr td.active:hover:hover,.datepicker table tr td.active.disabled:hover,.datepicker table tr td.active.disabled:hover:hover,.datepicker table tr td.active:active,.datepicker table tr td.active:hover:active,.datepicker table tr td.active.disabled:active,.datepicker table tr td.active.disabled:hover:active,.datepicker table tr td.active.active,.datepicker table tr td.active:hover.active,.datepicker table tr td.active.disabled.active,.datepicker table tr td.active.disabled:hover.active,.datepicker table tr td.active.disabled,.datepicker table tr td.active:hover.disabled,.datepicker table tr td.active.disabled.disabled,.datepicker table tr td.active.disabled:hover.disabled,.datepicker table tr td.active[disabled],.datepicker table tr td.active:hover[disabled],.datepicker table tr td.active.disabled[disabled],.datepicker table tr td.active.disabled:hover[disabled]{background-color:#04c}.datepicker table tr td.active:active,.datepicker table tr td.active:hover:active,.datepicker table tr td.active.disabled:active,.datepicker table tr td.active.disabled:hover:active,.datepicker table tr td.active.active,.datepicker table tr td.active:hover.active,.datepicker table tr td.active.disabled.active,.datepicker table tr td.active.disabled:hover.active{background-color:#039 \9}.datepicker table tr td span{display:block;width:23%;height:54px;line-height:54px;float:left;margin:1%;cursor:pointer;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.datepicker table tr td span:hover{background:#eee}.datepicker table tr td span.disabled,.datepicker table tr td span.disabled:hover{background:0;color:#999;cursor:default}.datepicker table tr td span.active,.datepicker table tr td span.active:hover,.datepicker table tr td span.active.disabled,.datepicker table tr td span.active.disabled:hover{background-color:#006dcc;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-ms-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(top,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc',endColorstr='#0044cc',GradientType=0);border-color:#04c #0044cc #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.datepicker table tr td span.active:hover,.datepicker table tr td span.active:hover:hover,.datepicker table tr td span.active.disabled:hover,.datepicker table tr td span.active.disabled:hover:hover,.datepicker table tr td span.active:active,.datepicker table tr td span.active:hover:active,.datepicker table tr td span.active.disabled:active,.datepicker table tr td span.active.disabled:hover:active,.datepicker table tr td span.active.active,.datepicker table tr td span.active:hover.active,.datepicker table tr td span.active.disabled.active,.datepicker table tr td span.active.disabled:hover.active,.datepicker table tr td span.active.disabled,.datepicker table tr td span.active:hover.disabled,.datepicker table tr td span.active.disabled.disabled,.datepicker table tr td span.active.disabled:hover.disabled,.datepicker table tr td span.active[disabled],.datepicker table tr td span.active:hover[disabled],.datepicker table tr td span.active.disabled[disabled],.datepicker table tr td span.active.disabled:hover[disabled]{background-color:#04c}.datepicker table tr td span.active:active,.datepicker table tr td span.active:hover:active,.datepicker table tr td span.active.disabled:active,.datepicker table tr td span.active.disabled:hover:active,.datepicker table tr td span.active.active,.datepicker table tr td span.active:hover.active,.datepicker table tr td span.active.disabled.active,.datepicker table tr td span.active.disabled:hover.active{background-color:#039 \9}.datepicker table tr td span.old,.datepicker table tr td span.new{color:#999}.datepicker th.datepicker-switch{width:145px}.datepicker thead tr:first-child th,.datepicker tfoot tr th{cursor:pointer}.datepicker thead tr:first-child th:hover,.datepicker tfoot tr th:hover{background:#eee}.datepicker .cw{font-size:10px;width:12px;padding:0 2px 0 5px;vertical-align:middle}.datepicker thead tr:first-child th.cw{cursor:default;background-color:transparent}.input-append.date .add-on i,.input-prepend.date .add-on i{cursor:pointer;width:16px;height:16px}.input-daterange input{text-align:center}.input-daterange input:first-child{-webkit-border-radius:3px 0 0 3px;-moz-border-radius:3px 0 0 3px;border-radius:3px 0 0 3px}.input-daterange input:last-child{-webkit-border-radius:0 3px 3px 0;-moz-border-radius:0 3px 3px 0;border-radius:0 3px 3px 0}.input-daterange .add-on{display:inline-block;width:auto;min-width:16px;height:20px;padding:4px 5px;font-weight:normal;line-height:20px;text-align:center;text-shadow:0 1px 0 #fff;vertical-align:middle;background-color:#eee;border:1px solid #ccc;margin-left:-5px;margin-right:-5px}.datepicker.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;float:left;display:none;min-width:160px;list-style:none;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);box-shadow:0 5px 10px rgba(0,0,0,0.2);-webkit-background-clip:padding-box;-moz-background-clip:padding;background-clip:padding-box;*border-right-width:2px;*border-bottom-width:2px;color:#333;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;line-height:20px}.datepicker.dropdown-menu th,.datepicker.dropdown-menu td{padding:4px 5px}
 @import url(http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300);
@import url(http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700);

.sweet-alert p{
	 color:red;
	 font-size:14px;
 }
 
 /*!
 *  Font Awesome 4.3.0 by @davegandy - http://fontawesome.io - @fontawesome
 *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)
 */@font-face{font-family:'FontAwesome';src:url('../fonts/fontawesome-webfont.eot?v=4.3.0');src:url('../fonts/fontawesome-webfont.eot?#iefix&v=4.3.0') format('embedded-opentype'),url('../fonts/fontawesome-webfont.woff2?v=4.3.0') format('woff2'),url('../fonts/fontawesome-webfont.woff?v=4.3.0') format('woff'),url('../fonts/fontawesome-webfont.ttf?v=4.3.0') format('truetype'),url('../fonts/fontawesome-webfont.svg?v=4.3.0#fontawesomeregular') format('svg');font-weight:normal;font-style:normal}.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;transform:translate(0, 0)}.fa-lg{font-size:1.33333333em;line-height:.75em;vertical-align:-15%}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-fw{width:1.28571429em;text-align:center}.fa-ul{padding-left:0;margin-left:2.14285714em;list-style-type:none}.fa-ul>li{position:relative}.fa-li{position:absolute;left:-2.14285714em;width:2.14285714em;top:.14285714em;text-align:center}.fa-li.fa-lg{left:-1.85714286em}.fa-border{padding:.2em .25em .15em;border:solid .08em #eee;border-radius:.1em}.pull-right{float:right}.pull-left{float:left}.fa.pull-left{margin-right:.3em}.fa.pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}.fa-rotate-90{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=1);-webkit-transform:rotate(90deg);-ms-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=2);-webkit-transform:rotate(180deg);-ms-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=3);-webkit-transform:rotate(270deg);-ms-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1);-webkit-transform:scale(-1, 1);-ms-transform:scale(-1, 1);transform:scale(-1, 1)}.fa-flip-vertical{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1);-webkit-transform:scale(1, -1);-ms-transform:scale(1, -1);transform:scale(1, -1)}:root .fa-rotate-90,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-flip-horizontal,:root .fa-flip-vertical{filter:none}.fa-stack{position:relative;display:inline-block;width:2em;height:2em;line-height:2em;vertical-align:middle}.fa-stack-1x,.fa-stack-2x{position:absolute;left:0;width:100%;text-align:center}.fa-stack-1x{line-height:inherit}.fa-stack-2x{font-size:2em}.fa-inverse{color:#fff}.fa-glass:before{content:"\f000"}.fa-music:before{content:"\f001"}.fa-search:before{content:"\f002"}.fa-envelope-o:before{content:"\f003"}.fa-heart:before{content:"\f004"}.fa-star:before{content:"\f005"}.fa-star-o:before{content:"\f006"}.fa-user:before{content:"\f007"}.fa-film:before{content:"\f008"}.fa-th-large:before{content:"\f009"}.fa-th:before{content:"\f00a"}.fa-th-list:before{content:"\f00b"}.fa-check:before{content:"\f00c"}.fa-remove:before,.fa-close:before,.fa-times:before{content:"\f00d"}.fa-search-plus:before{content:"\f00e"}.fa-search-minus:before{content:"\f010"}.fa-power-off:before{content:"\f011"}.fa-signal:before{content:"\f012"}.fa-gear:before,.fa-cog:before{content:"\f013"}.fa-trash-o:before{content:"\f014"}.fa-home:before{content:"\f015"}.fa-file-o:before{content:"\f016"}.fa-clock-o:before{content:"\f017"}.fa-road:before{content:"\f018"}.fa-download:before{content:"\f019"}.fa-arrow-circle-o-down:before{content:"\f01a"}.fa-arrow-circle-o-up:before{content:"\f01b"}.fa-inbox:before{content:"\f01c"}.fa-play-circle-o:before{content:"\f01d"}.fa-rotate-right:before,.fa-repeat:before{content:"\f01e"}.fa-refresh:before{content:"\f021"}.fa-list-alt:before{content:"\f022"}.fa-lock:before{content:"\f023"}.fa-flag:before{content:"\f024"}.fa-headphones:before{content:"\f025"}.fa-volume-off:before{content:"\f026"}.fa-volume-down:before{content:"\f027"}.fa-volume-up:before{content:"\f028"}.fa-qrcode:before{content:"\f029"}.fa-barcode:before{content:"\f02a"}.fa-tag:before{content:"\f02b"}.fa-tags:before{content:"\f02c"}.fa-book:before{content:"\f02d"}.fa-bookmark:before{content:"\f02e"}.fa-print:before{content:"\f02f"}.fa-camera:before{content:"\f030"}.fa-font:before{content:"\f031"}.fa-bold:before{content:"\f032"}.fa-italic:before{content:"\f033"}.fa-text-height:before{content:"\f034"}.fa-text-width:before{content:"\f035"}.fa-align-left:before{content:"\f036"}.fa-align-center:before{content:"\f037"}.fa-align-right:before{content:"\f038"}.fa-align-justify:before{content:"\f039"}.fa-list:before{content:"\f03a"}.fa-dedent:before,.fa-outdent:before{content:"\f03b"}.fa-indent:before{content:"\f03c"}.fa-video-camera:before{content:"\f03d"}.fa-photo:before,.fa-image:before,.fa-picture-o:before{content:"\f03e"}.fa-pencil:before{content:"\f040"}.fa-map-marker:before{content:"\f041"}.fa-adjust:before{content:"\f042"}.fa-tint:before{content:"\f043"}.fa-edit:before,.fa-pencil-square-o:before{content:"\f044"}.fa-share-square-o:before{content:"\f045"}.fa-check-square-o:before{content:"\f046"}.fa-arrows:before{content:"\f047"}.fa-step-backward:before{content:"\f048"}.fa-fast-backward:before{content:"\f049"}.fa-backward:before{content:"\f04a"}.fa-play:before{content:"\f04b"}.fa-pause:before{content:"\f04c"}.fa-stop:before{content:"\f04d"}.fa-forward:before{content:"\f04e"}.fa-fast-forward:before{content:"\f050"}.fa-step-forward:before{content:"\f051"}.fa-eject:before{content:"\f052"}.fa-chevron-left:before{content:"\f053"}.fa-chevron-right:before{content:"\f054"}.fa-plus-circle:before{content:"\f055"}.fa-minus-circle:before{content:"\f056"}.fa-times-circle:before{content:"\f057"}.fa-check-circle:before{content:"\f058"}.fa-question-circle:before{content:"\f059"}.fa-info-circle:before{content:"\f05a"}.fa-crosshairs:before{content:"\f05b"}.fa-times-circle-o:before{content:"\f05c"}.fa-check-circle-o:before{content:"\f05d"}.fa-ban:before{content:"\f05e"}.fa-arrow-left:before{content:"\f060"}.fa-arrow-right:before{content:"\f061"}.fa-arrow-up:before{content:"\f062"}.fa-arrow-down:before{content:"\f063"}.fa-mail-forward:before,.fa-share:before{content:"\f064"}.fa-expand:before{content:"\f065"}.fa-compress:before{content:"\f066"}.fa-plus:before{content:"\f067"}.fa-minus:before{content:"\f068"}.fa-asterisk:before{content:"\f069"}.fa-exclamation-circle:before{content:"\f06a"}.fa-gift:before{content:"\f06b"}.fa-leaf:before{content:"\f06c"}.fa-fire:before{content:"\f06d"}.fa-eye:before{content:"\f06e"}.fa-eye-slash:before{content:"\f070"}.fa-warning:before,.fa-exclamation-triangle:before{content:"\f071"}.fa-plane:before{content:"\f072"}.fa-calendar:before{content:"\f073"}.fa-random:before{content:"\f074"}.fa-comment:before{content:"\f075"}.fa-magnet:before{content:"\f076"}.fa-chevron-up:before{content:"\f077"}.fa-chevron-down:before{content:"\f078"}.fa-retweet:before{content:"\f079"}.fa-shopping-cart:before{content:"\f07a"}.fa-folder:before{content:"\f07b"}.fa-folder-open:before{content:"\f07c"}.fa-arrows-v:before{content:"\f07d"}.fa-arrows-h:before{content:"\f07e"}.fa-bar-chart-o:before,.fa-bar-chart:before{content:"\f080"}.fa-twitter-square:before{content:"\f081"}.fa-facebook-square:before{content:"\f082"}.fa-camera-retro:before{content:"\f083"}.fa-key:before{content:"\f084"}.fa-gears:before,.fa-cogs:before{content:"\f085"}.fa-comments:before{content:"\f086"}.fa-thumbs-o-up:before{content:"\f087"}.fa-thumbs-o-down:before{content:"\f088"}.fa-star-half:before{content:"\f089"}.fa-heart-o:before{content:"\f08a"}.fa-sign-out:before{content:"\f08b"}.fa-linkedin-square:before{content:"\f08c"}.fa-thumb-tack:before{content:"\f08d"}.fa-external-link:before{content:"\f08e"}.fa-sign-in:before{content:"\f090"}.fa-trophy:before{content:"\f091"}.fa-github-square:before{content:"\f092"}.fa-upload:before{content:"\f093"}.fa-lemon-o:before{content:"\f094"}.fa-phone:before{content:"\f095"}.fa-square-o:before{content:"\f096"}.fa-bookmark-o:before{content:"\f097"}.fa-phone-square:before{content:"\f098"}.fa-twitter:before{content:"\f099"}.fa-facebook-f:before,.fa-facebook:before{content:"\f09a"}.fa-github:before{content:"\f09b"}.fa-unlock:before{content:"\f09c"}.fa-credit-card:before{content:"\f09d"}.fa-rss:before{content:"\f09e"}.fa-hdd-o:before{content:"\f0a0"}.fa-bullhorn:before{content:"\f0a1"}.fa-bell:before{content:"\f0f3"}.fa-certificate:before{content:"\f0a3"}.fa-hand-o-right:before{content:"\f0a4"}.fa-hand-o-left:before{content:"\f0a5"}.fa-hand-o-up:before{content:"\f0a6"}.fa-hand-o-down:before{content:"\f0a7"}.fa-arrow-circle-left:before{content:"\f0a8"}.fa-arrow-circle-right:before{content:"\f0a9"}.fa-arrow-circle-up:before{content:"\f0aa"}.fa-arrow-circle-down:before{content:"\f0ab"}.fa-globe:before{content:"\f0ac"}.fa-wrench:before{content:"\f0ad"}.fa-tasks:before{content:"\f0ae"}.fa-filter:before{content:"\f0b0"}.fa-briefcase:before{content:"\f0b1"}.fa-arrows-alt:before{content:"\f0b2"}.fa-group:before,.fa-users:before{content:"\f0c0"}.fa-chain:before,.fa-link:before{content:"\f0c1"}.fa-cloud:before{content:"\f0c2"}.fa-flask:before{content:"\f0c3"}.fa-cut:before,.fa-scissors:before{content:"\f0c4"}.fa-copy:before,.fa-files-o:before{content:"\f0c5"}.fa-paperclip:before{content:"\f0c6"}.fa-save:before,.fa-floppy-o:before{content:"\f0c7"}.fa-square:before{content:"\f0c8"}.fa-navicon:before,.fa-reorder:before,.fa-bars:before{content:"\f0c9"}.fa-list-ul:before{content:"\f0ca"}.fa-list-ol:before{content:"\f0cb"}.fa-strikethrough:before{content:"\f0cc"}.fa-underline:before{content:"\f0cd"}.fa-table:before{content:"\f0ce"}.fa-magic:before{content:"\f0d0"}.fa-truck:before{content:"\f0d1"}.fa-pinterest:before{content:"\f0d2"}.fa-pinterest-square:before{content:"\f0d3"}.fa-google-plus-square:before{content:"\f0d4"}.fa-google-plus:before{content:"\f0d5"}.fa-money:before{content:"\f0d6"}.fa-caret-down:before{content:"\f0d7"}.fa-caret-up:before{content:"\f0d8"}.fa-caret-left:before{content:"\f0d9"}.fa-caret-right:before{content:"\f0da"}.fa-columns:before{content:"\f0db"}.fa-unsorted:before,.fa-sort:before{content:"\f0dc"}.fa-sort-down:before,.fa-sort-desc:before{content:"\f0dd"}.fa-sort-up:before,.fa-sort-asc:before{content:"\f0de"}.fa-envelope:before{content:"\f0e0"}.fa-linkedin:before{content:"\f0e1"}.fa-rotate-left:before,.fa-undo:before{content:"\f0e2"}.fa-legal:before,.fa-gavel:before{content:"\f0e3"}.fa-dashboard:before,.fa-tachometer:before{content:"\f0e4"}.fa-comment-o:before{content:"\f0e5"}.fa-comments-o:before{content:"\f0e6"}.fa-flash:before,.fa-bolt:before{content:"\f0e7"}.fa-sitemap:before{content:"\f0e8"}.fa-umbrella:before{content:"\f0e9"}.fa-paste:before,.fa-clipboard:before{content:"\f0ea"}.fa-lightbulb-o:before{content:"\f0eb"}.fa-exchange:before{content:"\f0ec"}.fa-cloud-download:before{content:"\f0ed"}.fa-cloud-upload:before{content:"\f0ee"}.fa-user-md:before{content:"\f0f0"}.fa-stethoscope:before{content:"\f0f1"}.fa-suitcase:before{content:"\f0f2"}.fa-bell-o:before{content:"\f0a2"}.fa-coffee:before{content:"\f0f4"}.fa-cutlery:before{content:"\f0f5"}.fa-file-text-o:before{content:"\f0f6"}.fa-building-o:before{content:"\f0f7"}.fa-hospital-o:before{content:"\f0f8"}.fa-ambulance:before{content:"\f0f9"}.fa-medkit:before{content:"\f0fa"}.fa-fighter-jet:before{content:"\f0fb"}.fa-beer:before{content:"\f0fc"}.fa-h-square:before{content:"\f0fd"}.fa-plus-square:before{content:"\f0fe"}.fa-angle-double-left:before{content:"\f100"}.fa-angle-double-right:before{content:"\f101"}.fa-angle-double-up:before{content:"\f102"}.fa-angle-double-down:before{content:"\f103"}.fa-angle-left:before{content:"\f104"}.fa-angle-right:before{content:"\f105"}.fa-angle-up:before{content:"\f106"}.fa-angle-down:before{content:"\f107"}.fa-desktop:before{content:"\f108"}.fa-laptop:before{content:"\f109"}.fa-tablet:before{content:"\f10a"}.fa-mobile-phone:before,.fa-mobile:before{content:"\f10b"}.fa-circle-o:before{content:"\f10c"}.fa-quote-left:before{content:"\f10d"}.fa-quote-right:before{content:"\f10e"}.fa-spinner:before{content:"\f110"}.fa-circle:before{content:"\f111"}.fa-mail-reply:before,.fa-reply:before{content:"\f112"}.fa-github-alt:before{content:"\f113"}.fa-folder-o:before{content:"\f114"}.fa-folder-open-o:before{content:"\f115"}.fa-smile-o:before{content:"\f118"}.fa-frown-o:before{content:"\f119"}.fa-meh-o:before{content:"\f11a"}.fa-gamepad:before{content:"\f11b"}.fa-keyboard-o:before{content:"\f11c"}.fa-flag-o:before{content:"\f11d"}.fa-flag-checkered:before{content:"\f11e"}.fa-terminal:before{content:"\f120"}.fa-code:before{content:"\f121"}.fa-mail-reply-all:before,.fa-reply-all:before{content:"\f122"}.fa-star-half-empty:before,.fa-star-half-full:before,.fa-star-half-o:before{content:"\f123"}.fa-location-arrow:before{content:"\f124"}.fa-crop:before{content:"\f125"}.fa-code-fork:before{content:"\f126"}.fa-unlink:before,.fa-chain-broken:before{content:"\f127"}.fa-question:before{content:"\f128"}.fa-info:before{content:"\f129"}.fa-exclamation:before{content:"\f12a"}.fa-superscript:before{content:"\f12b"}.fa-subscript:before{content:"\f12c"}.fa-eraser:before{content:"\f12d"}.fa-puzzle-piece:before{content:"\f12e"}.fa-microphone:before{content:"\f130"}.fa-microphone-slash:before{content:"\f131"}.fa-shield:before{content:"\f132"}.fa-calendar-o:before{content:"\f133"}.fa-fire-extinguisher:before{content:"\f134"}.fa-rocket:before{content:"\f135"}.fa-maxcdn:before{content:"\f136"}.fa-chevron-circle-left:before{content:"\f137"}.fa-chevron-circle-right:before{content:"\f138"}.fa-chevron-circle-up:before{content:"\f139"}.fa-chevron-circle-down:before{content:"\f13a"}.fa-html5:before{content:"\f13b"}.fa-css3:before{content:"\f13c"}.fa-anchor:before{content:"\f13d"}.fa-unlock-alt:before{content:"\f13e"}.fa-bullseye:before{content:"\f140"}.fa-ellipsis-h:before{content:"\f141"}.fa-ellipsis-v:before{content:"\f142"}.fa-rss-square:before{content:"\f143"}.fa-play-circle:before{content:"\f144"}.fa-ticket:before{content:"\f145"}.fa-minus-square:before{content:"\f146"}.fa-minus-square-o:before{content:"\f147"}.fa-level-up:before{content:"\f148"}.fa-level-down:before{content:"\f149"}.fa-check-square:before{content:"\f14a"}.fa-pencil-square:before{content:"\f14b"}.fa-external-link-square:before{content:"\f14c"}.fa-share-square:before{content:"\f14d"}.fa-compass:before{content:"\f14e"}.fa-toggle-down:before,.fa-caret-square-o-down:before{content:"\f150"}.fa-toggle-up:before,.fa-caret-square-o-up:before{content:"\f151"}.fa-toggle-right:before,.fa-caret-square-o-right:before{content:"\f152"}.fa-euro:before,.fa-eur:before{content:"\f153"}.fa-gbp:before{content:"\f154"}.fa-dollar:before,.fa-usd:before{content:"\f155"}.fa-rupee:before,.fa-inr:before{content:"\f156"}.fa-cny:before,.fa-rmb:before,.fa-yen:before,.fa-jpy:before{content:"\f157"}.fa-ruble:before,.fa-rouble:before,.fa-rub:before{content:"\f158"}.fa-won:before,.fa-krw:before{content:"\f159"}.fa-bitcoin:before,.fa-btc:before{content:"\f15a"}.fa-file:before{content:"\f15b"}.fa-file-text:before{content:"\f15c"}.fa-sort-alpha-asc:before{content:"\f15d"}.fa-sort-alpha-desc:before{content:"\f15e"}.fa-sort-amount-asc:before{content:"\f160"}.fa-sort-amount-desc:before{content:"\f161"}.fa-sort-numeric-asc:before{content:"\f162"}.fa-sort-numeric-desc:before{content:"\f163"}.fa-thumbs-up:before{content:"\f164"}.fa-thumbs-down:before{content:"\f165"}.fa-youtube-square:before{content:"\f166"}.fa-youtube:before{content:"\f167"}.fa-xing:before{content:"\f168"}.fa-xing-square:before{content:"\f169"}.fa-youtube-play:before{content:"\f16a"}.fa-dropbox:before{content:"\f16b"}.fa-stack-overflow:before{content:"\f16c"}.fa-instagram:before{content:"\f16d"}.fa-flickr:before{content:"\f16e"}.fa-adn:before{content:"\f170"}.fa-bitbucket:before{content:"\f171"}.fa-bitbucket-square:before{content:"\f172"}.fa-tumblr:before{content:"\f173"}.fa-tumblr-square:before{content:"\f174"}.fa-long-arrow-down:before{content:"\f175"}.fa-long-arrow-up:before{content:"\f176"}.fa-long-arrow-left:before{content:"\f177"}.fa-long-arrow-right:before{content:"\f178"}.fa-apple:before{content:"\f179"}.fa-windows:before{content:"\f17a"}.fa-android:before{content:"\f17b"}.fa-linux:before{content:"\f17c"}.fa-dribbble:before{content:"\f17d"}.fa-skype:before{content:"\f17e"}.fa-foursquare:before{content:"\f180"}.fa-trello:before{content:"\f181"}.fa-female:before{content:"\f182"}.fa-male:before{content:"\f183"}.fa-gittip:before,.fa-gratipay:before{content:"\f184"}.fa-sun-o:before{content:"\f185"}.fa-moon-o:before{content:"\f186"}.fa-archive:before{content:"\f187"}.fa-bug:before{content:"\f188"}.fa-vk:before{content:"\f189"}.fa-weibo:before{content:"\f18a"}.fa-renren:before{content:"\f18b"}.fa-pagelines:before{content:"\f18c"}.fa-stack-exchange:before{content:"\f18d"}.fa-arrow-circle-o-right:before{content:"\f18e"}.fa-arrow-circle-o-left:before{content:"\f190"}.fa-toggle-left:before,.fa-caret-square-o-left:before{content:"\f191"}.fa-dot-circle-o:before{content:"\f192"}.fa-wheelchair:before{content:"\f193"}.fa-vimeo-square:before{content:"\f194"}.fa-turkish-lira:before,.fa-try:before{content:"\f195"}.fa-plus-square-o:before{content:"\f196"}.fa-space-shuttle:before{content:"\f197"}.fa-slack:before{content:"\f198"}.fa-envelope-square:before{content:"\f199"}.fa-wordpress:before{content:"\f19a"}.fa-openid:before{content:"\f19b"}.fa-institution:before,.fa-bank:before,.fa-university:before{content:"\f19c"}.fa-mortar-board:before,.fa-graduation-cap:before{content:"\f19d"}.fa-yahoo:before{content:"\f19e"}.fa-google:before{content:"\f1a0"}.fa-reddit:before{content:"\f1a1"}.fa-reddit-square:before{content:"\f1a2"}.fa-stumbleupon-circle:before{content:"\f1a3"}.fa-stumbleupon:before{content:"\f1a4"}.fa-delicious:before{content:"\f1a5"}.fa-digg:before{content:"\f1a6"}.fa-pied-piper:before{content:"\f1a7"}.fa-pied-piper-alt:before{content:"\f1a8"}.fa-drupal:before{content:"\f1a9"}.fa-joomla:before{content:"\f1aa"}.fa-language:before{content:"\f1ab"}.fa-fax:before{content:"\f1ac"}.fa-building:before{content:"\f1ad"}.fa-child:before{content:"\f1ae"}.fa-paw:before{content:"\f1b0"}.fa-spoon:before{content:"\f1b1"}.fa-cube:before{content:"\f1b2"}.fa-cubes:before{content:"\f1b3"}.fa-behance:before{content:"\f1b4"}.fa-behance-square:before{content:"\f1b5"}.fa-steam:before{content:"\f1b6"}.fa-steam-square:before{content:"\f1b7"}.fa-recycle:before{content:"\f1b8"}.fa-automobile:before,.fa-car:before{content:"\f1b9"}.fa-cab:before,.fa-taxi:before{content:"\f1ba"}.fa-tree:before{content:"\f1bb"}.fa-spotify:before{content:"\f1bc"}.fa-deviantart:before{content:"\f1bd"}.fa-soundcloud:before{content:"\f1be"}.fa-database:before{content:"\f1c0"}.fa-file-pdf-o:before{content:"\f1c1"}.fa-file-word-o:before{content:"\f1c2"}.fa-file-excel-o:before{content:"\f1c3"}.fa-file-powerpoint-o:before{content:"\f1c4"}.fa-file-photo-o:before,.fa-file-picture-o:before,.fa-file-image-o:before{content:"\f1c5"}.fa-file-zip-o:before,.fa-file-archive-o:before{content:"\f1c6"}.fa-file-sound-o:before,.fa-file-audio-o:before{content:"\f1c7"}.fa-file-movie-o:before,.fa-file-video-o:before{content:"\f1c8"}.fa-file-code-o:before{content:"\f1c9"}.fa-vine:before{content:"\f1ca"}.fa-codepen:before{content:"\f1cb"}.fa-jsfiddle:before{content:"\f1cc"}.fa-life-bouy:before,.fa-life-buoy:before,.fa-life-saver:before,.fa-support:before,.fa-life-ring:before{content:"\f1cd"}.fa-circle-o-notch:before{content:"\f1ce"}.fa-ra:before,.fa-rebel:before{content:"\f1d0"}.fa-ge:before,.fa-empire:before{content:"\f1d1"}.fa-git-square:before{content:"\f1d2"}.fa-git:before{content:"\f1d3"}.fa-hacker-news:before{content:"\f1d4"}.fa-tencent-weibo:before{content:"\f1d5"}.fa-qq:before{content:"\f1d6"}.fa-wechat:before,.fa-weixin:before{content:"\f1d7"}.fa-send:before,.fa-paper-plane:before{content:"\f1d8"}.fa-send-o:before,.fa-paper-plane-o:before{content:"\f1d9"}.fa-history:before{content:"\f1da"}.fa-genderless:before,.fa-circle-thin:before{content:"\f1db"}.fa-header:before{content:"\f1dc"}.fa-paragraph:before{content:"\f1dd"}.fa-sliders:before{content:"\f1de"}.fa-share-alt:before{content:"\f1e0"}.fa-share-alt-square:before{content:"\f1e1"}.fa-bomb:before{content:"\f1e2"}.fa-soccer-ball-o:before,.fa-futbol-o:before{content:"\f1e3"}.fa-tty:before{content:"\f1e4"}.fa-binoculars:before{content:"\f1e5"}.fa-plug:before{content:"\f1e6"}.fa-slideshare:before{content:"\f1e7"}.fa-twitch:before{content:"\f1e8"}.fa-yelp:before{content:"\f1e9"}.fa-newspaper-o:before{content:"\f1ea"}.fa-wifi:before{content:"\f1eb"}.fa-calculator:before{content:"\f1ec"}.fa-paypal:before{content:"\f1ed"}.fa-google-wallet:before{content:"\f1ee"}.fa-cc-visa:before{content:"\f1f0"}.fa-cc-mastercard:before{content:"\f1f1"}.fa-cc-discover:before{content:"\f1f2"}.fa-cc-amex:before{content:"\f1f3"}.fa-cc-paypal:before{content:"\f1f4"}.fa-cc-stripe:before{content:"\f1f5"}.fa-bell-slash:before{content:"\f1f6"}.fa-bell-slash-o:before{content:"\f1f7"}.fa-trash:before{content:"\f1f8"}.fa-copyright:before{content:"\f1f9"}.fa-at:before{content:"\f1fa"}.fa-eyedropper:before{content:"\f1fb"}.fa-paint-brush:before{content:"\f1fc"}.fa-birthday-cake:before{content:"\f1fd"}.fa-area-chart:before{content:"\f1fe"}.fa-pie-chart:before{content:"\f200"}.fa-line-chart:before{content:"\f201"}.fa-lastfm:before{content:"\f202"}.fa-lastfm-square:before{content:"\f203"}.fa-toggle-off:before{content:"\f204"}.fa-toggle-on:before{content:"\f205"}.fa-bicycle:before{content:"\f206"}.fa-bus:before{content:"\f207"}.fa-ioxhost:before{content:"\f208"}.fa-angellist:before{content:"\f209"}.fa-cc:before{content:"\f20a"}.fa-shekel:before,.fa-sheqel:before,.fa-ils:before{content:"\f20b"}.fa-meanpath:before{content:"\f20c"}.fa-buysellads:before{content:"\f20d"}.fa-connectdevelop:before{content:"\f20e"}.fa-dashcube:before{content:"\f210"}.fa-forumbee:before{content:"\f211"}.fa-leanpub:before{content:"\f212"}.fa-sellsy:before{content:"\f213"}.fa-shirtsinbulk:before{content:"\f214"}.fa-simplybuilt:before{content:"\f215"}.fa-skyatlas:before{content:"\f216"}.fa-cart-plus:before{content:"\f217"}.fa-cart-arrow-down:before{content:"\f218"}.fa-diamond:before{content:"\f219"}.fa-ship:before{content:"\f21a"}.fa-user-secret:before{content:"\f21b"}.fa-motorcycle:before{content:"\f21c"}.fa-street-view:before{content:"\f21d"}.fa-heartbeat:before{content:"\f21e"}.fa-venus:before{content:"\f221"}.fa-mars:before{content:"\f222"}.fa-mercury:before{content:"\f223"}.fa-transgender:before{content:"\f224"}.fa-transgender-alt:before{content:"\f225"}.fa-venus-double:before{content:"\f226"}.fa-mars-double:before{content:"\f227"}.fa-venus-mars:before{content:"\f228"}.fa-mars-stroke:before{content:"\f229"}.fa-mars-stroke-v:before{content:"\f22a"}.fa-mars-stroke-h:before{content:"\f22b"}.fa-neuter:before{content:"\f22c"}.fa-facebook-official:before{content:"\f230"}.fa-pinterest-p:before{content:"\f231"}.fa-whatsapp:before{content:"\f232"}.fa-server:before{content:"\f233"}.fa-user-plus:before{content:"\f234"}.fa-user-times:before{content:"\f235"}.fa-hotel:before,.fa-bed:before{content:"\f236"}.fa-viacoin:before{content:"\f237"}.fa-train:before{content:"\f238"}.fa-subway:before{content:"\f239"}.fa-medium:before{content:"\f23a"}
 /*!
 * FullCalendar v2.3.1 Stylesheet
 * Docs & License: http://fullcalendar.io/
 * (c) 2015 Adam Shaw
 */


.fc {
	direction: ltr;
	text-align: left;
}

.fc-rtl {
	text-align: right;
}

body .fc { /* extra precedence to overcome jqui */
	font-size: 1em;
}


/* Colors
--------------------------------------------------------------------------------------------------*/

.fc-unthemed th,
.fc-unthemed td,
.fc-unthemed thead,
.fc-unthemed tbody,
.fc-unthemed .fc-divider,
.fc-unthemed .fc-row,
.fc-unthemed .fc-popover {
	border-color: #ddd;
}

.fc-unthemed .fc-popover {
	background-color: #fff;
}

.fc-unthemed .fc-divider,
.fc-unthemed .fc-popover .fc-header {
	background: #eee;
}

.fc-unthemed .fc-popover .fc-header .fc-close {
	color: #666;
}

.fc-unthemed .fc-today {
	background: #fcf8e3;
}

.fc-highlight { /* when user is selecting cells */
	background: #bce8f1;
	opacity: .3;
	filter: alpha(opacity=30); /* for IE */
}

.fc-bgevent { /* default look for background events */
	background: rgb(143, 223, 130);
	opacity: .3;
	filter: alpha(opacity=30); /* for IE */
}

.fc-nonbusiness { /* default look for non-business-hours areas */
	/* will inherit .fc-bgevent's styles */
	background: #d7d7d7;
}


/* Icons (inline elements with styled text that mock arrow icons)
--------------------------------------------------------------------------------------------------*/

.fc-icon {
	display: inline-block;
	width: 1em;
	height: 1em;
	line-height: 1em;
	font-size: 1em;
	text-align: center;
	overflow: hidden;
	font-family: "Courier New", Courier, monospace;
}

/*
Acceptable font-family overrides for individual icons:
	"Arial", sans-serif
	"Times New Roman", serif

NOTE: use percentage font sizes or else old IE chokes
*/

.fc-icon:after {
	position: relative;
	margin: 0 -1em; /* ensures character will be centered, regardless of width */
}

.fc-icon-left-single-arrow:after {
	content: "\02039";
	font-weight: bold;
	font-size: 200%;
	top: -7%;
	left: 3%;
}

.fc-icon-right-single-arrow:after {
	content: "\0203A";
	font-weight: bold;
	font-size: 200%;
	top: -7%;
	left: -3%;
}

.fc-icon-left-double-arrow:after {
	content: "\000AB";
	font-size: 160%;
	top: -7%;
}

.fc-icon-right-double-arrow:after {
	content: "\000BB";
	font-size: 160%;
	top: -7%;
}

.fc-icon-left-triangle:after {
	content: "\25C4";
	font-size: 125%;
	top: 3%;
	left: -2%;
}

.fc-icon-right-triangle:after {
	content: "\25BA";
	font-size: 125%;
	top: 3%;
	left: 2%;
}

.fc-icon-down-triangle:after {
	content: "\25BC";
	font-size: 125%;
	top: 2%;
}

.fc-icon-x:after {
	content: "\000D7";
	font-size: 200%;
	top: 6%;
}


/* Buttons (styled <button> tags, normalized to work cross-browser)
--------------------------------------------------------------------------------------------------*/

.fc button {
	/* force height to include the border and padding */
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;

	/* dimensions */
	margin: 0;
	height: 2.1em;
	padding: 0 .6em;

	/* text & cursor */
	font-size: 1em; /* normalize */
	white-space: nowrap;
	cursor: pointer;
}

/* Firefox has an annoying inner border */
.fc button::-moz-focus-inner { margin: 0; padding: 0; }
	
.fc-state-default { /* non-theme */
	border: 1px solid;
}

.fc-state-default.fc-corner-left { /* non-theme */
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.fc-state-default.fc-corner-right { /* non-theme */
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

/* icons in buttons */

.fc button .fc-icon { /* non-theme */
	position: relative;
	top: -0.05em; /* seems to be a good adjustment across browsers */
	margin: 0 .2em;
	vertical-align: middle;
}
	
/*
  button states
  borrowed from twitter bootstrap (http://twitter.github.com/bootstrap/)
*/

.fc-state-default {
	background-color: #f5f5f5;
	background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
	background-repeat: repeat-x;
	border-color: #e6e6e6 #e6e6e6 #bfbfbf;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	color: #333;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
}

.fc-state-hover,
.fc-state-down,
.fc-state-active,
.fc-state-disabled {
	color: #333333;
	background-color: #e6e6e6;
}

.fc-state-hover {
	color: #333333;
	text-decoration: none;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	   -moz-transition: background-position 0.1s linear;
	     -o-transition: background-position 0.1s linear;
	        transition: background-position 0.1s linear;
}

.fc-state-down,
.fc-state-active {
	background-color: #cccccc;
	background-image: none;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
}

.fc-state-disabled {
	cursor: default;
	background-image: none;
	opacity: 0.65;
	filter: alpha(opacity=65);
	box-shadow: none;
}


/* Buttons Groups
--------------------------------------------------------------------------------------------------*/

.fc-button-group {
	display: inline-block;
}

/*
every button that is not first in a button group should scootch over one pixel and cover the
previous button's border...
*/

.fc .fc-button-group > * { /* extra precedence b/c buttons have margin set to zero */
	float: left;
	margin: 0 0 0 -1px;
}

.fc .fc-button-group > :first-child { /* same */
	margin-left: 0;
}


/* Popover
--------------------------------------------------------------------------------------------------*/

.fc-popover {
	position: absolute;
	box-shadow: 0 2px 6px rgba(0,0,0,.15);
}

.fc-popover .fc-header { /* TODO: be more consistent with fc-head/fc-body */
	padding: 2px 4px;
}

.fc-popover .fc-header .fc-title {
	margin: 0 2px;
}

.fc-popover .fc-header .fc-close {
	cursor: pointer;
}

.fc-ltr .fc-popover .fc-header .fc-title,
.fc-rtl .fc-popover .fc-header .fc-close {
	float: left;
}

.fc-rtl .fc-popover .fc-header .fc-title,
.fc-ltr .fc-popover .fc-header .fc-close {
	float: right;
}

/* unthemed */

.fc-unthemed .fc-popover {
	border-width: 1px;
	border-style: solid;
}

.fc-unthemed .fc-popover .fc-header .fc-close {
	font-size: .9em;
	margin-top: 2px;
}

/* jqui themed */

.fc-popover > .ui-widget-header + .ui-widget-content {
	border-top: 0; /* where they meet, let the header have the border */
}


/* Misc Reusable Components
--------------------------------------------------------------------------------------------------*/

.fc-divider {
	border-style: solid;
	border-width: 1px;
}

hr.fc-divider {
	height: 0;
	margin: 0;
	padding: 0 0 2px; /* height is unreliable across browsers, so use padding */
	border-width: 1px 0;
}

.fc-clear {
	clear: both;
}

.fc-bg,
.fc-bgevent-skeleton,
.fc-highlight-skeleton,
.fc-helper-skeleton {
	/* these element should always cling to top-left/right corners */
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
}

.fc-bg {
	bottom: 0; /* strech bg to bottom edge */
}

.fc-bg table {
	height: 100%; /* strech bg to bottom edge */
}


/* Tables
--------------------------------------------------------------------------------------------------*/

.fc table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 1em; /* normalize cross-browser */
}

.fc th {
	text-align: center;
}

.fc th,
.fc td {
	border-style: solid;
	border-width: 1px;
	padding: 0;
	vertical-align: top;
}

.fc td.fc-today {
	border-style: double; /* overcome neighboring borders */
}


/* Fake Table Rows
--------------------------------------------------------------------------------------------------*/

.fc .fc-row { /* extra precedence to overcome themes w/ .ui-widget-content forcing a 1px border */
	/* no visible border by default. but make available if need be (scrollbar width compensation) */
	border-style: solid;
	border-width: 0;
}

.fc-row table {
	/* don't put left/right border on anything within a fake row.
	   the outer tbody will worry about this */
	border-left: 0 hidden transparent;
	border-right: 0 hidden transparent;

	/* no bottom borders on rows */
	border-bottom: 0 hidden transparent; 
}

.fc-row:first-child table {
	border-top: 0 hidden transparent; /* no top border on first row */
}


/* Day Row (used within the header and the DayGrid)
--------------------------------------------------------------------------------------------------*/

.fc-row {
	position: relative;
}

.fc-row .fc-bg {
	z-index: 1;
}

/* highlighting cells & background event skeleton */

.fc-row .fc-bgevent-skeleton,
.fc-row .fc-highlight-skeleton {
	bottom: 0; /* stretch skeleton to bottom of row */
}

.fc-row .fc-bgevent-skeleton table,
.fc-row .fc-highlight-skeleton table {
	height: 100%; /* stretch skeleton to bottom of row */
}

.fc-row .fc-highlight-skeleton td,
.fc-row .fc-bgevent-skeleton td {
	border-color: transparent;
}

.fc-row .fc-bgevent-skeleton {
	z-index: 2;

}

.fc-row .fc-highlight-skeleton {
	z-index: 3;
}

/*
row content (which contains day/week numbers and events) as well as "helper" (which contains
temporary rendered events).
*/

.fc-row .fc-content-skeleton {
	position: relative;
	z-index: 4;
	padding-bottom: 2px; /* matches the space above the events */
}

.fc-row .fc-helper-skeleton {
	z-index: 5;
}

.fc-row .fc-content-skeleton td,
.fc-row .fc-helper-skeleton td {
	/* see-through to the background below */
	background: none; /* in case <td>s are globally styled */
	border-color: transparent;

	/* don't put a border between events and/or the day number */
	border-bottom: 0;
}

.fc-row .fc-content-skeleton tbody td, /* cells with events inside (so NOT the day number cell) */
.fc-row .fc-helper-skeleton tbody td {
	/* don't put a border between event cells */
	border-top: 0;
}


/* Scrolling Container
--------------------------------------------------------------------------------------------------*/
@media only screen and (max-width : 515px) 
{
	.fc-scroller { /* this class goes on elements for guaranteed vertical scrollbars */
		overflow-y: scroll;
		overflow-x: hidden;
	}
}

.fc-scroller > * { /* we expect an immediate inner element */
	position: relative; /* re-scope all positions */
	width: 100%; /* hack to force re-sizing this inner element when scrollbars appear/disappear */
	overflow: hidden; /* don't let negative margins or absolute positioning create further scroll */
}


/* Global Event Styles
--------------------------------------------------------------------------------------------------*/

.fc-event {
	position: relative; /* for resize handle and other inner positioning */
	display: block; /* make the <a> tag block */
	font-size: .85em;
	line-height: 1.3;
	border-radius: 3px;
	border: 1px solid #3a87ad; /* default BORDER color */
	background-color: #3a87ad; /* default BACKGROUND color */
	font-weight: normal; /* undo jqui's ui-widget-header bold */
}

/* overpower some of bootstrap's and jqui's styles on <a> tags */
.fc-event,
.fc-event:hover,
.ui-widget .fc-event {
	color: #fff; /* default TEXT color */
	text-decoration: none; /* if <a> has an href */
}

.fc-event[href],
.fc-event.fc-draggable {
	cursor: pointer; /* give events with links and draggable events a hand mouse pointer */
}

.fc-not-allowed, /* causes a "warning" cursor. applied on body */
.fc-not-allowed .fc-event { /* to override an event's custom cursor */
	cursor: not-allowed;
}

.fc-event .fc-bg { /* the generic .fc-bg already does position */
	z-index: 1;
	background: #fff;
	opacity: .25;
	filter: alpha(opacity=25); /* for IE */
}

.fc-event .fc-content {
	position: relative;
	z-index: 2;
}

.fc-event .fc-resizer {
	position: absolute;
	z-index: 3;
}


/* Horizontal Events
--------------------------------------------------------------------------------------------------*/

/* events that are continuing to/from another week. kill rounded corners and butt up against edge */

.fc-ltr .fc-h-event.fc-not-start,
.fc-rtl .fc-h-event.fc-not-end {
	margin-left: 0;
	border-left-width: 0;
	padding-left: 1px; /* replace the border with padding */
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.fc-ltr .fc-h-event.fc-not-end,
.fc-rtl .fc-h-event.fc-not-start {
	margin-right: 0;
	border-right-width: 0;
	padding-right: 1px; /* replace the border with padding */
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

/* resizer */

.fc-h-event .fc-resizer { /* positioned it to overcome the event's borders */
	top: -1px;
	bottom: -1px;
	left: -1px;
	right: -1px;
	width: 5px;
}

/* left resizer  */
.fc-ltr .fc-h-event .fc-start-resizer,
.fc-ltr .fc-h-event .fc-start-resizer:before,
.fc-ltr .fc-h-event .fc-start-resizer:after,
.fc-rtl .fc-h-event .fc-end-resizer,
.fc-rtl .fc-h-event .fc-end-resizer:before,
.fc-rtl .fc-h-event .fc-end-resizer:after {
	right: auto; /* ignore the right and only use the left */
	cursor: w-resize;
}

/* right resizer */
.fc-ltr .fc-h-event .fc-end-resizer,
.fc-ltr .fc-h-event .fc-end-resizer:before,
.fc-ltr .fc-h-event .fc-end-resizer:after,
.fc-rtl .fc-h-event .fc-start-resizer,
.fc-rtl .fc-h-event .fc-start-resizer:before,
.fc-rtl .fc-h-event .fc-start-resizer:after {
	left: auto; /* ignore the left and only use the right */
	cursor: e-resize;
}


/* DayGrid events
----------------------------------------------------------------------------------------------------
We use the full "fc-day-grid-event" class instead of using descendants because the event won't
be a descendant of the grid when it is being dragged.
*/

.fc-day-grid-event {
	margin: 1px 2px 0; /* spacing between events and edges */
	padding: 0 1px;
}


.fc-day-grid-event .fc-content { /* force events to be one-line tall */
	white-space: nowrap;
	overflow: hidden;
}

.fc-day-grid-event .fc-time {
	font-weight: bold;
}

.fc-day-grid-event .fc-resizer { /* enlarge the default hit area */
	left: -3px;
	right: -3px;
	width: 7px;
}


/* Event Limiting
--------------------------------------------------------------------------------------------------*/

/* "more" link that represents hidden events */

a.fc-more {
	margin: 1px 3px;
	font-size: .85em;
	cursor: pointer;
	text-decoration: none;
}

a.fc-more:hover {
	text-decoration: underline;
}

.fc-limited { /* rows and cells that are hidden because of a "more" link */
	display: none;
}

/* popover that appears when "more" link is clicked */

.fc-day-grid .fc-row {
	z-index: 1; /* make the "more" popover one higher than this */
}

.fc-more-popover {
	z-index: 2;
	width: 220px;
}

.fc-more-popover .fc-event-container {
	padding: 10px;
}

/* Toolbar
--------------------------------------------------------------------------------------------------*/

.fc-toolbar {
	text-align: center;
	margin-bottom: 1em;
}

.fc-toolbar .fc-left {
	float: left;
}

.fc-toolbar .fc-right {
	float: right;
}

.fc-toolbar .fc-center {
	display: inline-block;
}

/* the things within each left/right/center section */
.fc .fc-toolbar > * > * { /* extra precedence to override button border margins */
	float: left;
	margin-left: .75em;
}

/* the first thing within each left/center/right section */
.fc .fc-toolbar > * > :first-child { /* extra precedence to override button border margins */
	margin-left: 0;
}
	
/* title text */

.fc-toolbar h2 {
	margin: 0;
}

/* button layering (for border precedence) */

.fc-toolbar button {
	position: relative;
}

.fc-toolbar .fc-state-hover,
.fc-toolbar .ui-state-hover {
	z-index: 2;
}
	
.fc-toolbar .fc-state-down {
	z-index: 3;
}

.fc-toolbar .fc-state-active,
.fc-toolbar .ui-state-active {
	z-index: 4;
}

.fc-toolbar button:focus {
	z-index: 5;
}


/* View Structure
--------------------------------------------------------------------------------------------------*/

/* undo twitter bootstrap's box-sizing rules. normalizes positioning techniques */
/* don't do this for the toolbar because we'll want bootstrap to style those buttons as some pt */
.fc-view-container *,
.fc-view-container *:before,
.fc-view-container *:after {
	-webkit-box-sizing: content-box;
	   -moz-box-sizing: content-box;
	        box-sizing: content-box;
}

.fc-view, /* scope positioning and z-index's for everything within the view */
.fc-view > table { /* so dragged elements can be above the view's main element */
	position: relative;
	z-index: 1;
}

/* BasicView
--------------------------------------------------------------------------------------------------*/

/* day row structure */

.fc-basicWeek-view .fc-content-skeleton,
.fc-basicDay-view .fc-content-skeleton {
	/* we are sure there are no day numbers in these views, so... */
	padding-top: 1px; /* add a pixel to make sure there are 2px padding above events */
	padding-bottom: 1em; /* ensure a space at bottom of cell for user selecting/clicking */
}

.fc-basic-view .fc-body .fc-row {
	min-height: 4em; /* ensure that all rows are at least this tall */
}

/* a "rigid" row will take up a constant amount of height because content-skeleton is absolute */

.fc-row.fc-rigid {
	overflow: hidden;
}

.fc-row.fc-rigid .fc-content-skeleton {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
}

/* week and day number styling */

.fc-basic-view .fc-week-number,
.fc-basic-view .fc-day-number {
	padding: 0 2px;
}

.fc-basic-view td.fc-week-number span,
.fc-basic-view td.fc-day-number {
	padding-top: 2px;
	padding-bottom: 2px;
}

.fc-basic-view .fc-week-number {
	text-align: center;
}

.fc-basic-view .fc-week-number span {
	/* work around the way we do column resizing and ensure a minimum width */
	display: inline-block;
	min-width: 1.25em;
}

.fc-ltr .fc-basic-view .fc-day-number {
	text-align: right;
}

.fc-rtl .fc-basic-view .fc-day-number {
	text-align: left;
}

.fc-day-number.fc-other-month {
	opacity: 0.3;
	filter: alpha(opacity=30); /* for IE */
	/* opacity with small font can sometimes look too faded
	   might want to set the 'color' property instead
	   making day-numbers bold also fixes the problem */
}

/* AgendaView all-day area
--------------------------------------------------------------------------------------------------*/

.fc-agenda-view .fc-day-grid {
	position: relative;
	z-index: 2; /* so the "more.." popover will be over the time grid */
}

.fc-agenda-view .fc-day-grid .fc-row {
	min-height: 3em; /* all-day section will never get shorter than this */
}

.fc-agenda-view .fc-day-grid .fc-row .fc-content-skeleton {
	padding-top: 1px; /* add a pixel to make sure there are 2px padding above events */
	padding-bottom: 1em; /* give space underneath events for clicking/selecting days */
}


/* TimeGrid axis running down the side (for both the all-day area and the slot area)
--------------------------------------------------------------------------------------------------*/

.fc .fc-axis { /* .fc to overcome default cell styles */
	vertical-align: middle;
	padding: 0 4px;
	white-space: nowrap;
}

.fc-ltr .fc-axis {
	text-align: right;
}

.fc-rtl .fc-axis {
	text-align: left;
}

.ui-widget td.fc-axis {
	font-weight: normal; /* overcome jqui theme making it bold */
}


/* TimeGrid Structure
--------------------------------------------------------------------------------------------------*/

.fc-time-grid-container, /* so scroll container's z-index is below all-day */
.fc-time-grid { /* so slats/bg/content/etc positions get scoped within here */
	position: relative;
	z-index: 1;
}

.fc-time-grid {
	min-height: 100%; /* so if height setting is 'auto', .fc-bg stretches to fill height */
}

.fc-time-grid table { /* don't put outer borders on slats/bg/content/etc */
	border: 0 hidden transparent;
}

.fc-time-grid > .fc-bg {
	z-index: 1;
}

.fc-time-grid .fc-slats,
.fc-time-grid > hr { /* the <hr> AgendaView injects when grid is shorter than scroller */
	position: relative;
	z-index: 2;
}

.fc-time-grid .fc-bgevent-skeleton,
.fc-time-grid .fc-content-skeleton {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
}

.fc-time-grid .fc-bgevent-skeleton {
	z-index: 3;
}

.fc-time-grid .fc-highlight-skeleton {
	z-index: 4;
}

.fc-time-grid .fc-content-skeleton {
	z-index: 5;
}

.fc-time-grid .fc-helper-skeleton {
	z-index: 6;
}


/* TimeGrid Slats (lines that run horizontally)
--------------------------------------------------------------------------------------------------*/

.fc-time-grid .fc-slats td {
	height: 1.5em;
	border-bottom: 0; /* each cell is responsible for its top border */
}

.fc-time-grid .fc-slats .fc-minor td {
	border-top-style: dotted;
}

.fc-time-grid .fc-slats .ui-widget-content { /* for jqui theme */
	background: none; /* see through to fc-bg */
}


/* TimeGrid Highlighting Slots
--------------------------------------------------------------------------------------------------*/

.fc-time-grid .fc-highlight-container { /* a div within a cell within the fc-highlight-skeleton */
	position: relative; /* scopes the left/right of the fc-highlight to be in the column */
}

.fc-time-grid .fc-highlight {
	position: absolute;
	left: 0;
	right: 0;
	/* top and bottom will be in by JS */
}


/* TimeGrid Event Containment
--------------------------------------------------------------------------------------------------*/

.fc-time-grid .fc-event-container, /* a div within a cell within the fc-content-skeleton */
.fc-time-grid .fc-bgevent-container { /* a div within a cell within the fc-bgevent-skeleton */
	position: relative;
}

.fc-ltr .fc-time-grid .fc-event-container { /* space on the sides of events for LTR (default) */
	margin: 0 2.5% 0 2px;
}

.fc-rtl .fc-time-grid .fc-event-container { /* space on the sides of events for RTL */
	margin: 0 2px 0 2.5%;
}

.fc-time-grid .fc-event,
.fc-time-grid .fc-bgevent {
	position: absolute;
	z-index: 1; /* scope inner z-index's */
}

.fc-time-grid .fc-bgevent {
	/* background events always span full width */
	left: 0;
	right: 0;
}


/* Generic Vertical Event
--------------------------------------------------------------------------------------------------*/

.fc-v-event.fc-not-start { /* events that are continuing from another day */
	/* replace space made by the top border with padding */
	border-top-width: 0;
	padding-top: 1px;

	/* remove top rounded corners */
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.fc-v-event.fc-not-end {
	/* replace space made by the top border with padding */
	border-bottom-width: 0;
	padding-bottom: 1px;

	/* remove bottom rounded corners */
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}


/* TimeGrid Event Styling
----------------------------------------------------------------------------------------------------
We use the full "fc-time-grid-event" class instead of using descendants because the event won't
be a descendant of the grid when it is being dragged.
*/

.fc-time-grid-event {
	overflow: hidden; /* don't let the bg flow over rounded corners */
}

.fc-time-grid-event .fc-time,
.fc-time-grid-event .fc-title {
	padding: 0 1px;
}

.fc-time-grid-event .fc-time {
	font-size: .85em;
	white-space: nowrap;
}

/* short mode, where time and title are on the same line */

.fc-time-grid-event.fc-short .fc-content {
	/* don't wrap to second line (now that contents will be inline) */
	white-space: nowrap;
}

.fc-time-grid-event.fc-short .fc-time,
.fc-time-grid-event.fc-short .fc-title {
	/* put the time and title on the same line */
	display: inline-block;
	vertical-align: top;
}

.fc-time-grid-event.fc-short .fc-time span {
	display: none; /* don't display the full time text... */
}

.fc-time-grid-event.fc-short .fc-time:before {
	content: attr(data-start); /* ...instead, display only the start time */
}

.fc-time-grid-event.fc-short .fc-time:after {
	content: "\000A0-\000A0"; /* seperate with a dash, wrapped in nbsp's */
}

.fc-time-grid-event.fc-short .fc-title {
	font-size: .85em; /* make the title text the same size as the time */
	padding: 0; /* undo padding from above */
}

/* resizer */

.fc-time-grid-event .fc-resizer {
	left: 0;
	right: 0;
	bottom: 0;
	height: 8px;
	overflow: hidden;
	line-height: 8px;
	font-size: 11px;
	font-family: monospace;
	text-align: center;
	cursor: s-resize;
}

.fc-time-grid-event .fc-resizer:after {
	content: "=";
}
 /* Extra Small Devices, Phones */ 

@media only screen and (max-width : 920px) 
{
	.show-inovice
	{
		padding: 6px 0px;
	}
	#days
	{
		    padding: 0px 0px!important;
	}
	.modal-backdrop.in 
	{		
		opacity: 0;
	}
	.hospital_left span.title {
	  display: none;
	}
	
	.hospital-management-content .col-sm-2.nopadding.hospital_left {   
    width: 70px;
    
	}
	.hospital-management-content .page-inner {
	    margin-left: 70px;
	   
	}
	.hospital_left ul li a {float: left;width:100%;}
	
	
/***************************** Tooltip *************************************/
/*.left-tooltip{
    display: inline;
    position: relative;
	float:right;
}
.left-tooltip:hover::after {
  background: rgba(0, 0, 0, 0.8) none repeat scroll 0 0;
  border-radius: 5px;
  bottom: -30px;
  color: #ffffff;
  content: attr(data-tooltip);
  left: 20%;
  padding: 5px 15px;
  position: absolute;
  width: auto;
  z-index: 98;
}
.left-tooltip:hover:before{
    border: solid;
    border-color: #333 transparent;
    border-width: 6px 6px 0 6px;
    bottom: 20px;
    content: "";
    left: 50%;
    position: absolute;
    z-index: 99;
}
*/
}
@media only screen and (max-width : 768px) {
	
	.checkbox
	{
		padding-left:15px;
	}
	/* .col-sm-1
	{
		width: 11.333333%;
	} */
	.show-inovice
	{
		padding: 6px 2px;
	}
	select 
	{
		
		font-size: 12px!important;
	}
	input[type=radio] 
	{
		margin: 0px 0 0;
		
	}	
	.radio-inline input[type=radio]
	{
		margin-left: -28px;
	}
	.radio input[type=radio]
	{
		margin-left: -28px;
	}
	.modal-backdrop.in 
	{		
		opacity: 0;
	}
	.modal
	{
		padding-top: 75px;
	}
	.checkbox input[type=checkbox]
	{
		margin-left: -34px;
	}
	.right_side .panel.info-box .panel-body {
  background-position: right 0;
}
.overlay-content {
  left: 15%;
  width: 96%;
}
}
@media only screen and (max-width : 1204px) {

.mainpage .navbar h3 span {
	  display: none;
	}

	}
@media only screen and (max-width : 600px) {
	.modal-backdrop.in 
	{		
		opacity: 0;
	}
	/*.mainpage .navbar h3 span {
	  display: none;
	}*/
	.right_side .panel.info-box .panel-body {
  background-position: right 0;
}
}
@media only screen and (max-width : 480px) {
	input[type=checkbox], input[type=radio]
	 {
		margin: 0px 0px 0px;
	 } 
	.col-md-8.col-sm-8.col-xs-6 {
	  width: 20%;
	}
	.nav.navbar-right.col-md-4.col-sm-4.col-xs-6 {
	  width: 79%;
	}
	.right_side .col-xs-6 {
	  width: 100%;
	}
	#main-wrapper .col-xs-6 {
	  width: 100%;
	}
	.info-box .panel-body {
	  background-position: right center !important;
	}
	#calendar .fc-toolbar .fc-left,
	#calendar .fc-toolbar .fc-right,
	#calendar .fc-toolbar .fc-center
	{float:left;width: 100%;padding-bottom:10px;}
	.table .btn-primary{width: 100%;margin-bottom:5px;}
	.period_box {
	  position: relative;
	  white-space: normal;
	}
	
	.team .team-member{width:100%;}
	/* option
	{

		padding: 0px 0px 0px;
	} */
	.modal-backdrop.in 
	{		
		opacity: 0;
	}
	.user-profile 
	{
		margin-top: 75px;
	}
	.col-md-1.update_dp
	{
		margin: 10px 0 0 96px;
	}
}
@media only screen and (max-width : 380px) 
{
	.col-md-1.update_dp
	{
		margin: 10px 0 0 58px;
	}
}
/*appointment Modules responsive css */
@media only screen and (max-width : 991px) 
{
	.appointment_col_md_12
	{
		float: left;
		width: 100%;
	}
}

@media screen and (max-width: 782px)
{
	.time:checked:before 
	{
		width: 6px!important;
		height: 6px!important;
	}
}
@media only screen and (max-width : 480px) 
{
	.col_xs_3_css
	{
		width: 33%;
		padding-right: 10px;
		padding-left: 10px;
	}
	.col_xs_4_css
	{
		width: 50%;
		padding-right: 10px;
		padding-left: 10px;
	}
}
@media only screen and (max-width : 390px) 
{
	.col_xs_3_css
	{
		padding-right: 5px;
		padding-left: 5px;
	}
	.col_xs_4_css
	{
		padding-right: 5px;
		padding-left: 5px;
	}
	.time_font_size
	{
		font-size: 11px!important;
	}
	
}

/* .panel-body.patient {
background: rgba(0, 0, 0, 0) url("../images/Patient.png") no-repeat scroll right center;
}
.panel-body.doctor{
	
	 background:url("../images/Doctor.png") no-repeat scroll right center;
	
}
.panel-body.nurse{
	
 	background:url("../images/Nurse.png") no-repeat scroll right center;
	
	
}
.panel-body.accountant{
	
 background:url("../images/Accountant.png") no-repeat scroll 55% 0;

}
.panel-body.receptionist {
    background: rgba(0, 0, 0, 0) url("../images/Receptionist.png") no-repeat scroll right bottom / 100% auto;
}
.panel-body.pharmacist{
	
	 background:url("../images/Pharmacist.png");
 background-repeat: no-repeat;
    background-position: right center;
  
    background-width: 100% auto; 
    
}
.panel-body.laboratorist{
	
	 background:url("../images/Laboratorist.png");
 background-repeat: no-repeat; 
    background-position: 55% 0;
  
    background-width: 100% auto;
} */

.info-box .info-box-icon i {
    float: right;
    font-size: 70px !important;
}

.button-possition  input ,button{
    margin-top: 22px;
}
 .panel-body h2 {
    margin-bottom: 10px !important;
    margin-top: 20px !important;
	font-weight: 400 !important;
}

#add-another_item{margin-left: 17%;}
#revove_item{margin-left: 1%;}
.marginbottom{ 
	float: left;
    margin-bottom: 10px;
    width: 100%;}
.print-button {padding-top:10px;
margin-bottom: 10px;
}
table.dataTable thead th, table.dataTable thead td{padding:10px 10px;}
/**  Fronted CSS*/
/**   Menu icone***/

.icone {
  float: left;
  height: 20px !important;
  /* line-height: 0px; */
  margin-right: 5px;
  overflow: hidden;
  width: 25px !important;
  text-align: center;
}
.hospital-management-content .container-fluid.mainpage {
 /* position: fixed; */
 position:absolute;
  width: 100%;
    z-index: 5;
}
.hospital-management-content .col-sm-2.nopadding.hospital_left { 
  width: 15%;
  height: 100%;
   margin-top: 70px;
   float:left;
  
}
.hospital-management-content .page-inner {
  margin-left: 15%;
   margin-top: 70px;
}
 .info-box .panel-body img{
 
transition: all 0.3s ease 0s;
}
 .page-inner .col-lg-2 a .info-box:hover .panel-body img
{
    transform: scale(1.2);
}  
img.dashboard_background {
  float: left;
  width: 100%;
}
.info-box .info-box-stats {
  position: absolute;
  left: 8%;
  top: 15%;
  z-index:2;
}
.info-box .panel-body {
  padding: 0 !important;
}
.info-box .patient .info-box-stats p {
  color: #22baa0;
  font-size: 34px; 
}
.info-box .patient .info-box-stats span.info-box-title {
  color: #22baa0; 
}
.info-box .doctor .info-box-stats p {
  color: #12AFCB;
  font-size: 34px; 
}
.info-box .doctor .info-box-stats span.info-box-title {
  color: #12AFCB; 
}
.info-box .nurse .info-box-stats p {
  color: #6A5FAC;
  font-size: 34px; 
}
.info-box .nurse .info-box-stats span.info-box-title {
  color: #6A5FAC; 
}
.info-box .accountant .info-box-stats p {
  color: #F25656;
  font-size: 34px; 
}
.info-box .accountant .info-box-stats span.info-box-title {
  color: #F25656; 
}
.info-box .invoice .info-box-stats p {
  color: #F25656;
  font-size: 34px; 
}
.info-box .invoice .info-box-stats span.info-box-title {
  color: #F25656; 
}
.info-box .receptionist .info-box-stats p {
  color: #4E5E6A;
  font-size: 34px; 
}
.info-box .receptionist .info-box-stats span.info-box-title {
  color: #4E5E6A; 
}
.info-box .pharmacist .info-box-stats p {
  color: #3B5998;
  font-size: 34px; 
}
.info-box .pharmacist .info-box-stats span.info-box-title {
  color: #3B5998; 
}
.info-box .laboratorist .info-box-stats p {
  color: #380000;
  font-size: 34px; 
}
.info-box .laboratorist .info-box-stats span.info-box-title {
  color: #380000; 
}

.info-box .invoice .info-box-stats p {
  color: #660033;
  font-size: 34px; 
}
.info-box .invoice .info-box-stats span.info-box-title {
  color: #660033;
}

/* 
.info-box .invoice {
  background: rgba(0, 0, 0, 0) url("../images/invoice.png") no-repeat scroll right center;
}
.info-box .medicine   {

  background:url("../images/medicine.png");
 background-repeat: no-repeat; 
    background-position: 55% 0;
}
.info-box .operation_report  {
  
   background:url("../images/report.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .setting  {
 
  background:url("../images/setting-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .birthreport {
    background:url("../images/birth-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .deathreport  {
   background:url("../images/death-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .treatment  {
 
  background:url("../images/tretment-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .prescription  {
 
  background:url("../images/preseription-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .assignbed  {
 
  background:url("../images/assign-bed-image.png");
 background-repeat: no-repeat; 
    background-position: right 0;
}
.info-box .diagnosis  {
 
  background:url("../images/diagnosis-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .bloodbank  {
 
  background:url("../images/blood-bank-image.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .appointment  {
 
    background:url("../images/appointment-image.png") no-repeat scroll 55% 0;
}
.info-box .operation-list  {
 
  background:url("../images/operation-report.png");
 background-repeat: no-repeat; 
    background-position: right center;
}
.info-box .eventnotice  {
 
  background:url("../images/notice-event-image.png");
 background-repeat: no-repeat; 
    background-position: 55% 0;
}
.info-box .message  {
 
  
  background:url("../images/message.png");
 background-repeat: no-repeat; 
    background-position: 92% 0;
} */
.info-box .medicine .info-box-stats p {
  color: #CC0066;
  font-size: 34px; 
}

.info-box .medicine .info-box-stats span.info-box-title {
  color: #CC0066;
}

.info-box .operation_report .info-box-stats p {
  color: #330033;
  font-size: 34px; 
}

.info-box .operation_report .info-box-stats span.info-box-title {
  color: #330033;
}

.info-box .birthreport .info-box-stats p {
  color: #666633;
  font-size: 34px; 
}

.info-box .birthreport .info-box-stats span.info-box-title {
  color: #666633;
}

.info-box .deathreport .info-box-stats p {
  color: #CC9900;
  font-size: 34px; 
}

.info-box .deathreport .info-box-stats span.info-box-title {
  color: #CC9900;
}
.info-box .setting .info-box-stats p {
  color: #999933;
  font-size: 34px; 
}

.info-box .setting .info-box-stats span.info-box-title {
  color: #999933;
}
.info-box .treatment .info-box-stats p {
  color: #003333;
  font-size: 34px; 
}

.info-box .treatment .info-box-stats span.info-box-title {
  color: #003333;
}
.info-box .prescription .info-box-stats p {
  color: #0099FF;
  font-size: 34px; 
}

.info-box .prescription .info-box-stats span.info-box-title {
  color: #0099FF;
}
.info-box .assignbed .info-box-stats p {
  color: #996600;
  font-size: 34px; 
}

.info-box .assignbed .info-box-stats span.info-box-title {
  color: #996600;
}
.info-box .diagnosis .info-box-stats p {
  color: #330033;
  font-size: 34px; 
}

.info-box .diagnosis .info-box-stats span.info-box-title {
  color: #330033;
}
.info-box .bloodbank .info-box-stats p {
  color: #990000;
  font-size: 34px; 
}

.info-box .bloodbank .info-box-stats span.info-box-title {
  color: #990000;
}
.info-box .appointment .info-box-stats p {
  color: #FF9966;
  font-size: 34px; 
}

.info-box .appointment .info-box-stats span.info-box-title {
  color: #FF9966;
}
.info-box .eventnotice .info-box-stats p {
  color: #009933;
  font-size: 34px; 
}

.info-box .eventnotice .info-box-stats span.info-box-title {
  color: #009933;
}

.info-box .message .info-box-stats p {
  color: #0066FF;
  font-size: 34px; 
}

.info-box .message .info-box-stats span.info-box-title {
  color: #0066FF;
}



.info-box .operation-list   .info-box-stats span.info-box-title {
  color: #003333;
}
.info-box .operation-list .info-box-stats p {
  color: #003333;
  font-size: 34px; 
}

.nav-tab,.nav-tabs a {
    background: none repeat scroll 0 0 #f1f4f9;
}
.nav-tab.nav-tab-active {
    background: none repeat scroll 0 0 #fff;
}
.mainpage .navbar-right {
 
  margin-right: 0px;
}
.mainpage .navbar-right .dropdown{float:right;}
table.fontend-border td,
table.fontend-border th{
	padding:0px !important;
}


ul.panel_tabs li{padding-left:10px;}
ul.panel_tabs a {
  padding: 5px;
}
ul.panel_tabs a:focus,ul.panel_tabs a:hover {
  background: #fff !important;
 
}
ul.panel_tabs a {
  /* color: red !important; */
  font-size: 15px;
  font-weight: 700;
}

/*********** Hospital CSS ********************/
.table-responsive {
  padding-top : 10px;
}
table a.btn {
  margin-bottom: 5px;
}
blockquote.diagnosis-report {
    font-size: 12.5px;
}
.calendar-event > p {
    float: left;
    width: 100%;
}
.profile_data hr {
    margin-bottom: 0;
}
.panel-body.prescription_popprint_content {
  margin: 25px auto;
  width: 82%;
}
.overlay-content .prescription_pop_content
{
  height: 500px;
  overflow: auto;
}
.hmsg_message_none {
    display: none;
}
.hmsg_message_block {
    display: block;
}
.audit_button {
  float: right;
  margin-bottom: 10px;
  margin-top: 10px;
}
.aduit_log_file {
  float: left;
  height: 700px;
  overflow: scroll;
  width: 100%;
}
#access_right_form .menu-label {
  font-weight: bold;
  line-height: 36px;
}
#access_right_form .row {
  border-bottom: 1px solid hsl(0, 0%, 87%);
  padding-bottom: 10px;
  padding-top: 10px;
}
.row_bottom {
  padding-bottom: 10px;
  padding-top: 10px;
}
/*-------wordpress 4.4 compitable----------------*/
.nav-side-menu .toggle-btn, .nav-side-menu .brand {
  display: none;
}
.left_section2{float:left;}
.nav-tab {
  position: relative;
  top: 1px;
}
h1.nav-tab-wrapper, h2.nav-tab-wrapper, h3.nav-tab-wrapper {
  border-bottom: 1px solid hsl(0, 0%, 80%);
  padding-bottom: 0;
  padding-left: 10px;
}
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
.col-md-1.update_dp {
  margin: 10px 0 0 60px;
}
.profile_picture {
  float: left;
  height: auto;
  width: 100%;
}
.message-options.pull-right.reply-message-btn {
  margin-top: 35px;
}
/*-----botstrap datepicker css in model--------------*/
.dropdown-menu.datepicker {
	    z-index: 9999;
		margin-top: -20px;
}
.hospital-management-content .dropdown-menu.datepicker {
	    z-index: 9999;
		margin-top: 0px !important;
}
/* --- invoice transaction css */
#th_width
{
	min-width: 120px;
}
#th_width_amount
{
	min-width: 160px;
}
#th_delete
{
	min-width: 50px;
}
/* --- invoice transaction css */
#patient_transaction tbody
{
	float:left;
	max-height:234px;
	overflow-y:scroll;
}
.patient_transaction_div
{
	width: 100%;
    overflow-x: auto;
}
/* --- Appointment module css */

.span_appointment
{
	border: 1px solid #000;
	padding: 0;
}
.span_appointment_value
{
	padding: 5px;
	border-bottom: 1px solid #000;
	text-align: center;
	background: #f2f2f2;
}
.span_appointment_selected
{
	text-align: center;
	padding: 0;
}
.span_appointment_selectedvalue
{
	float: left;
	width: 100%;
	padding: 0px;
}
/*appointment Modules css */
.appointment_padding_border
{
	padding:15px;
	border-top: 1px solid #ddd;
}
.removeselect>.time
{
	margin: 0px 0 0!important;
	height: 21px!important;
	width:21px!important;
}
.time:checked:before
{
    margin: 6px!important;
}	
.align_time
{
	vertical-align: middle!important;
}
#chktime
{
    margin: 5px 0 0!important;
}
/*upload_document_text_align */
.upload_document_text_align
{
    text-align: center!important;
}body.stop-scrolling {
  height: 100%;
  overflow: hidden; }

.sweet-overlay {
  background-color: black;
  /* IE8 */
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)";
  /* IE8 */
  background-color: rgba(0, 0, 0, 0.4);
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  display: none;
  z-index: 10000; }

.sweet-alert {
  background-color: white;
  font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  width: 478px;
  padding: 17px;
  border-radius: 5px;
  text-align: center;
  position: fixed;
  left: 50%;
  top: 50%;
  margin-left: -256px;
  margin-top: -200px;
  overflow: hidden;
  display: none;
  z-index: 99999; }
  @media all and (max-width: 540px) {
    .sweet-alert {
      width: auto;
      margin-left: 0;
      margin-right: 0;
      left: 15px;
      right: 15px; } }
  .sweet-alert h2 {
    color: #575757;
    font-size: 30px;
    text-align: center;
    font-weight: 600;
    text-transform: none;
    position: relative;
    margin: 25px 0;
    padding: 0;
    line-height: 40px;
    display: block; }
  .sweet-alert p {
    color: #797979;
    font-size: 16px;
    text-align: center;
    font-weight: 300;
    position: relative;
    text-align: inherit;
    float: none;
    margin: 0;
    padding: 0;
    line-height: normal; }
  .sweet-alert fieldset {
    border: none;
    position: relative; }
  .sweet-alert .sa-error-container {
    background-color: #f1f1f1;
    margin-left: -17px;
    margin-right: -17px;
    overflow: hidden;
    padding: 0 10px;
    max-height: 0;
    webkit-transition: padding 0.15s, max-height 0.15s;
    transition: padding 0.15s, max-height 0.15s; }
    .sweet-alert .sa-error-container.show {
      padding: 10px 0;
      max-height: 100px;
      webkit-transition: padding 0.2s, max-height 0.2s;
      transition: padding 0.25s, max-height 0.25s; }
    .sweet-alert .sa-error-container .icon {
      display: inline-block;
      width: 24px;
      height: 24px;
      border-radius: 50%;
      background-color: #ea7d7d;
      color: white;
      line-height: 24px;
      text-align: center;
      margin-right: 3px; }
    .sweet-alert .sa-error-container p {
      display: inline-block; }
  .sweet-alert .sa-input-error {
    position: absolute;
    top: 29px;
    right: 26px;
    width: 20px;
    height: 20px;
    opacity: 0;
    -webkit-transform: scale(0.5);
    transform: scale(0.5);
    -webkit-transform-origin: 50% 50%;
    transform-origin: 50% 50%;
    -webkit-transition: all 0.1s;
    transition: all 0.1s; }
    .sweet-alert .sa-input-error::before, .sweet-alert .sa-input-error::after {
      content: "";
      width: 20px;
      height: 6px;
      background-color: #f06e57;
      border-radius: 3px;
      position: absolute;
      top: 50%;
      margin-top: -4px;
      left: 50%;
      margin-left: -9px; }
    .sweet-alert .sa-input-error::before {
      -webkit-transform: rotate(-45deg);
      transform: rotate(-45deg); }
    .sweet-alert .sa-input-error::after {
      -webkit-transform: rotate(45deg);
      transform: rotate(45deg); }
    .sweet-alert .sa-input-error.show {
      opacity: 1;
      -webkit-transform: scale(1);
      transform: scale(1); }
  .sweet-alert input {
    width: 100%;
    box-sizing: border-box;
    border-radius: 3px;
    border: 1px solid #d7d7d7;
    height: 43px;
    margin-top: 10px;
    margin-bottom: 17px;
    font-size: 18px;
    box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.06);
    padding: 0 12px;
    display: none;
    -webkit-transition: all 0.3s;
    transition: all 0.3s; }
    .sweet-alert input:focus {
      outline: none;
      box-shadow: 0px 0px 3px #c4e6f5;
      border: 1px solid #b4dbed; }
      .sweet-alert input:focus::-moz-placeholder {
        transition: opacity 0.3s 0.03s ease;
        opacity: 0.5; }
      .sweet-alert input:focus:-ms-input-placeholder {
        transition: opacity 0.3s 0.03s ease;
        opacity: 0.5; }
      .sweet-alert input:focus::-webkit-input-placeholder {
        transition: opacity 0.3s 0.03s ease;
        opacity: 0.5; }
    .sweet-alert input::-moz-placeholder {
      color: #bdbdbd; }
    .sweet-alert input::-ms-clear {
      display: none; }
    .sweet-alert input:-ms-input-placeholder {
      color: #bdbdbd; }
    .sweet-alert input::-webkit-input-placeholder {
      color: #bdbdbd; }
  .sweet-alert.show-input input {
    display: block; }
  .sweet-alert .sa-confirm-button-container {
    display: inline-block;
    position: relative; }
  .sweet-alert .la-ball-fall {
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -27px;
    margin-top: 4px;
    opacity: 0;
    visibility: hidden; }
  .sweet-alert button {
    background-color: #8CD4F5;
    color: white;
    border: none;
    box-shadow: none;
    font-size: 17px;
    font-weight: 500;
    -webkit-border-radius: 4px;
    border-radius: 5px;
    padding: 10px 32px;
    margin: 26px 5px 0 5px;
    cursor: pointer; }
    .sweet-alert button:focus {
      outline: none;
      box-shadow: 0 0 2px rgba(128, 179, 235, 0.5), inset 0 0 0 1px rgba(0, 0, 0, 0.05); }
    .sweet-alert button:hover {
      background-color: #7ecff4; }
    .sweet-alert button:active {
      background-color: #5dc2f1; }
    .sweet-alert button.cancel {
      background-color: #C1C1C1; }
      .sweet-alert button.cancel:hover {
        background-color: #b9b9b9; }
      .sweet-alert button.cancel:active {
        background-color: #a8a8a8; }
      .sweet-alert button.cancel:focus {
        box-shadow: rgba(197, 205, 211, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.0470588) 0px 0px 0px 1px inset !important; }
    .sweet-alert button[disabled] {
      opacity: .6;
      cursor: default; }
    .sweet-alert button.confirm[disabled] {
      color: transparent; }
      .sweet-alert button.confirm[disabled] ~ .la-ball-fall {
        opacity: 1;
        visibility: visible;
        transition-delay: 0s; }
    .sweet-alert button::-moz-focus-inner {
      border: 0; }
  .sweet-alert[data-has-cancel-button=false] button {
    box-shadow: none !important; }
  .sweet-alert[data-has-confirm-button=false][data-has-cancel-button=false] {
    padding-bottom: 40px; }
  .sweet-alert .sa-icon {
    width: 80px;
    height: 80px;
    border: 4px solid gray;
    -webkit-border-radius: 40px;
    border-radius: 40px;
    border-radius: 50%;
    margin: 20px auto;
    padding: 0;
    position: relative;
    box-sizing: content-box; }
    .sweet-alert .sa-icon.sa-error {
      border-color: #F27474; }
      .sweet-alert .sa-icon.sa-error .sa-x-mark {
        position: relative;
        display: block; }
      .sweet-alert .sa-icon.sa-error .sa-line {
        position: absolute;
        height: 5px;
        width: 47px;
        background-color: #F27474;
        display: block;
        top: 37px;
        border-radius: 2px; }
        .sweet-alert .sa-icon.sa-error .sa-line.sa-left {
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
          left: 17px; }
        .sweet-alert .sa-icon.sa-error .sa-line.sa-right {
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
          right: 16px; }
    .sweet-alert .sa-icon.sa-warning {
      border-color: #F8BB86; }
      .sweet-alert .sa-icon.sa-warning .sa-body {
        position: absolute;
        width: 5px;
        height: 47px;
        left: 50%;
        top: 10px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        margin-left: -2px;
        background-color: #F8BB86; }
      .sweet-alert .sa-icon.sa-warning .sa-dot {
        position: absolute;
        width: 7px;
        height: 7px;
        -webkit-border-radius: 50%;
        border-radius: 50%;
        margin-left: -3px;
        left: 50%;
        bottom: 10px;
        background-color: #F8BB86; }
    .sweet-alert .sa-icon.sa-info {
      border-color: #C9DAE1; }
      .sweet-alert .sa-icon.sa-info::before {
        content: "";
        position: absolute;
        width: 5px;
        height: 29px;
        left: 50%;
        bottom: 17px;
        border-radius: 2px;
        margin-left: -2px;
        background-color: #C9DAE1; }
      .sweet-alert .sa-icon.sa-info::after {
        content: "";
        position: absolute;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        margin-left: -3px;
        top: 19px;
        background-color: #C9DAE1;
        left: 50%; }
    .sweet-alert .sa-icon.sa-success {
      border-color: #A5DC86; }
      .sweet-alert .sa-icon.sa-success::before, .sweet-alert .sa-icon.sa-success::after {
        content: '';
        -webkit-border-radius: 40px;
        border-radius: 40px;
        border-radius: 50%;
        position: absolute;
        width: 60px;
        height: 120px;
        background: white;
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg); }
      .sweet-alert .sa-icon.sa-success::before {
        -webkit-border-radius: 120px 0 0 120px;
        border-radius: 120px 0 0 120px;
        top: -7px;
        left: -33px;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
        -webkit-transform-origin: 60px 60px;
        transform-origin: 60px 60px; }
      .sweet-alert .sa-icon.sa-success::after {
        -webkit-border-radius: 0 120px 120px 0;
        border-radius: 0 120px 120px 0;
        top: -11px;
        left: 30px;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
        -webkit-transform-origin: 0px 60px;
        transform-origin: 0px 60px; }
      .sweet-alert .sa-icon.sa-success .sa-placeholder {
        width: 80px;
        height: 80px;
        border: 4px solid rgba(165, 220, 134, 0.2);
        -webkit-border-radius: 40px;
        border-radius: 40px;
        border-radius: 50%;
        box-sizing: content-box;
        position: absolute;
        left: -4px;
        top: -4px;
        z-index: 2; }
      .sweet-alert .sa-icon.sa-success .sa-fix {
        width: 5px;
        height: 90px;
        background-color: white;
        position: absolute;
        left: 28px;
        top: 8px;
        z-index: 1;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg); }
      .sweet-alert .sa-icon.sa-success .sa-line {
        height: 5px;
        background-color: #A5DC86;
        display: block;
        border-radius: 2px;
        position: absolute;
        z-index: 2; }
        .sweet-alert .sa-icon.sa-success .sa-line.sa-tip {
          width: 25px;
          left: 14px;
          top: 46px;
          -webkit-transform: rotate(45deg);
          transform: rotate(45deg); }
        .sweet-alert .sa-icon.sa-success .sa-line.sa-long {
          width: 47px;
          right: 8px;
          top: 38px;
          -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg); }
    .sweet-alert .sa-icon.sa-custom {
      background-size: contain;
      border-radius: 0;
      border: none;
      background-position: center center;
      background-repeat: no-repeat; }

/*
 * Animations
 */
@-webkit-keyframes showSweetAlert {
  0% {
    transform: scale(0.7);
    -webkit-transform: scale(0.7); }
  45% {
    transform: scale(1.05);
    -webkit-transform: scale(1.05); }
  80% {
    transform: scale(0.95);
    -webkit-transform: scale(0.95); }
  100% {
    transform: scale(1);
    -webkit-transform: scale(1); } }

@keyframes showSweetAlert {
  0% {
    transform: scale(0.7);
    -webkit-transform: scale(0.7); }
  45% {
    transform: scale(1.05);
    -webkit-transform: scale(1.05); }
  80% {
    transform: scale(0.95);
    -webkit-transform: scale(0.95); }
  100% {
    transform: scale(1);
    -webkit-transform: scale(1); } }

@-webkit-keyframes hideSweetAlert {
  0% {
    transform: scale(1);
    -webkit-transform: scale(1); }
  100% {
    transform: scale(0.5);
    -webkit-transform: scale(0.5); } }

@keyframes hideSweetAlert {
  0% {
    transform: scale(1);
    -webkit-transform: scale(1); }
  100% {
    transform: scale(0.5);
    -webkit-transform: scale(0.5); } }

@-webkit-keyframes slideFromTop {
  0% {
    top: 0%; }
  100% {
    top: 50%; } }

@keyframes slideFromTop {
  0% {
    top: 0%; }
  100% {
    top: 50%; } }

@-webkit-keyframes slideToTop {
  0% {
    top: 50%; }
  100% {
    top: 0%; } }

@keyframes slideToTop {
  0% {
    top: 50%; }
  100% {
    top: 0%; } }

@-webkit-keyframes slideFromBottom {
  0% {
    top: 70%; }
  100% {
    top: 50%; } }

@keyframes slideFromBottom {
  0% {
    top: 70%; }
  100% {
    top: 50%; } }

@-webkit-keyframes slideToBottom {
  0% {
    top: 50%; }
  100% {
    top: 70%; } }

@keyframes slideToBottom {
  0% {
    top: 50%; }
  100% {
    top: 70%; } }

.showSweetAlert[data-animation=pop] {
  -webkit-animation: showSweetAlert 0.3s;
  animation: showSweetAlert 0.3s; }

.showSweetAlert[data-animation=none] {
  -webkit-animation: none;
  animation: none; }

.showSweetAlert[data-animation=slide-from-top] {
  -webkit-animation: slideFromTop 0.3s;
  animation: slideFromTop 0.3s; }

.showSweetAlert[data-animation=slide-from-bottom] {
  -webkit-animation: slideFromBottom 0.3s;
  animation: slideFromBottom 0.3s; }

.hideSweetAlert[data-animation=pop] {
  -webkit-animation: hideSweetAlert 0.2s;
  animation: hideSweetAlert 0.2s; }

.hideSweetAlert[data-animation=none] {
  -webkit-animation: none;
  animation: none; }

.hideSweetAlert[data-animation=slide-from-top] {
  -webkit-animation: slideToTop 0.4s;
  animation: slideToTop 0.4s; }

.hideSweetAlert[data-animation=slide-from-bottom] {
  -webkit-animation: slideToBottom 0.3s;
  animation: slideToBottom 0.3s; }

@-webkit-keyframes animateSuccessTip {
  0% {
    width: 0;
    left: 1px;
    top: 19px; }
  54% {
    width: 0;
    left: 1px;
    top: 19px; }
  70% {
    width: 50px;
    left: -8px;
    top: 37px; }
  84% {
    width: 17px;
    left: 21px;
    top: 48px; }
  100% {
    width: 25px;
    left: 14px;
    top: 45px; } }

@keyframes animateSuccessTip {
  0% {
    width: 0;
    left: 1px;
    top: 19px; }
  54% {
    width: 0;
    left: 1px;
    top: 19px; }
  70% {
    width: 50px;
    left: -8px;
    top: 37px; }
  84% {
    width: 17px;
    left: 21px;
    top: 48px; }
  100% {
    width: 25px;
    left: 14px;
    top: 45px; } }

@-webkit-keyframes animateSuccessLong {
  0% {
    width: 0;
    right: 46px;
    top: 54px; }
  65% {
    width: 0;
    right: 46px;
    top: 54px; }
  84% {
    width: 55px;
    right: 0px;
    top: 35px; }
  100% {
    width: 47px;
    right: 8px;
    top: 38px; } }

@keyframes animateSuccessLong {
  0% {
    width: 0;
    right: 46px;
    top: 54px; }
  65% {
    width: 0;
    right: 46px;
    top: 54px; }
  84% {
    width: 55px;
    right: 0px;
    top: 35px; }
  100% {
    width: 47px;
    right: 8px;
    top: 38px; } }

@-webkit-keyframes rotatePlaceholder {
  0% {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg); }
  5% {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg); }
  12% {
    transform: rotate(-405deg);
    -webkit-transform: rotate(-405deg); }
  100% {
    transform: rotate(-405deg);
    -webkit-transform: rotate(-405deg); } }

@keyframes rotatePlaceholder {
  0% {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg); }
  5% {
    transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg); }
  12% {
    transform: rotate(-405deg);
    -webkit-transform: rotate(-405deg); }
  100% {
    transform: rotate(-405deg);
    -webkit-transform: rotate(-405deg); } }

.animateSuccessTip {
  -webkit-animation: animateSuccessTip 0.75s;
  animation: animateSuccessTip 0.75s; }

.animateSuccessLong {
  -webkit-animation: animateSuccessLong 0.75s;
  animation: animateSuccessLong 0.75s; }

.sa-icon.sa-success.animate::after {
  -webkit-animation: rotatePlaceholder 4.25s ease-in;
  animation: rotatePlaceholder 4.25s ease-in; }

@-webkit-keyframes animateErrorIcon {
  0% {
    transform: rotateX(100deg);
    -webkit-transform: rotateX(100deg);
    opacity: 0; }
  100% {
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    opacity: 1; } }

@keyframes animateErrorIcon {
  0% {
    transform: rotateX(100deg);
    -webkit-transform: rotateX(100deg);
    opacity: 0; }
  100% {
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    opacity: 1; } }

.animateErrorIcon {
  -webkit-animation: animateErrorIcon 0.5s;
  animation: animateErrorIcon 0.5s; }

@-webkit-keyframes animateXMark {
  0% {
    transform: scale(0.4);
    -webkit-transform: scale(0.4);
    margin-top: 26px;
    opacity: 0; }
  50% {
    transform: scale(0.4);
    -webkit-transform: scale(0.4);
    margin-top: 26px;
    opacity: 0; }
  80% {
    transform: scale(1.15);
    -webkit-transform: scale(1.15);
    margin-top: -6px; }
  100% {
    transform: scale(1);
    -webkit-transform: scale(1);
    margin-top: 0;
    opacity: 1; } }

@keyframes animateXMark {
  0% {
    transform: scale(0.4);
    -webkit-transform: scale(0.4);
    margin-top: 26px;
    opacity: 0; }
  50% {
    transform: scale(0.4);
    -webkit-transform: scale(0.4);
    margin-top: 26px;
    opacity: 0; }
  80% {
    transform: scale(1.15);
    -webkit-transform: scale(1.15);
    margin-top: -6px; }
  100% {
    transform: scale(1);
    -webkit-transform: scale(1);
    margin-top: 0;
    opacity: 1; } }

.animateXMark {
  -webkit-animation: animateXMark 0.5s;
  animation: animateXMark 0.5s; }

@-webkit-keyframes pulseWarning {
  0% {
    border-color: #F8D486; }
  100% {
    border-color: #F8BB86; } }

@keyframes pulseWarning {
  0% {
    border-color: #F8D486; }
  100% {
    border-color: #F8BB86; } }

.pulseWarning {
  -webkit-animation: pulseWarning 0.75s infinite alternate;
  animation: pulseWarning 0.75s infinite alternate; }

@-webkit-keyframes pulseWarningIns {
  0% {
    background-color: #F8D486; }
  100% {
    background-color: #F8BB86; } }

@keyframes pulseWarningIns {
  0% {
    background-color: #F8D486; }
  100% {
    background-color: #F8BB86; } }

.pulseWarningIns {
  -webkit-animation: pulseWarningIns 0.75s infinite alternate;
  animation: pulseWarningIns 0.75s infinite alternate; }

@-webkit-keyframes rotate-loading {
  0% {
    transform: rotate(0deg); }
  100% {
    transform: rotate(360deg); } }

@keyframes rotate-loading {
  0% {
    transform: rotate(0deg); }
  100% {
    transform: rotate(360deg); } }

/* Internet Explorer 9 has some special quirks that are fixed here */
/* The icons are not animated. */
/* This file is automatically merged into sweet-alert.min.js through Gulp */
/* Error icon */
.sweet-alert .sa-icon.sa-error .sa-line.sa-left {
  -ms-transform: rotate(45deg) \9; }

.sweet-alert .sa-icon.sa-error .sa-line.sa-right {
  -ms-transform: rotate(-45deg) \9; }

/* Success icon */
.sweet-alert .sa-icon.sa-success {
  border-color: transparent\9; }

.sweet-alert .sa-icon.sa-success .sa-line.sa-tip {
  -ms-transform: rotate(45deg) \9; }

.sweet-alert .sa-icon.sa-success .sa-line.sa-long {
  -ms-transform: rotate(-45deg) \9; }

/*!
 * Load Awesome v1.1.0 (http://github.danielcardoso.net/load-awesome/)
 * Copyright 2015 Daniel Cardoso <@DanielCardoso>
 * Licensed under MIT
 */
.la-ball-fall,
.la-ball-fall > div {
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box; }

.la-ball-fall {
  display: block;
  font-size: 0;
  color: #fff; }

.la-ball-fall.la-dark {
  color: #333; }

.la-ball-fall > div {
  display: inline-block;
  float: none;
  background-color: currentColor;
  border: 0 solid currentColor; }

.la-ball-fall {
  width: 54px;
  height: 18px; }

.la-ball-fall > div {
  width: 10px;
  height: 10px;
  margin: 4px;
  border-radius: 100%;
  opacity: 0;
  -webkit-animation: ball-fall 1s ease-in-out infinite;
  -moz-animation: ball-fall 1s ease-in-out infinite;
  -o-animation: ball-fall 1s ease-in-out infinite;
  animation: ball-fall 1s ease-in-out infinite; }

.la-ball-fall > div:nth-child(1) {
  -webkit-animation-delay: -200ms;
  -moz-animation-delay: -200ms;
  -o-animation-delay: -200ms;
  animation-delay: -200ms; }

.la-ball-fall > div:nth-child(2) {
  -webkit-animation-delay: -100ms;
  -moz-animation-delay: -100ms;
  -o-animation-delay: -100ms;
  animation-delay: -100ms; }

.la-ball-fall > div:nth-child(3) {
  -webkit-animation-delay: 0ms;
  -moz-animation-delay: 0ms;
  -o-animation-delay: 0ms;
  animation-delay: 0ms; }

.la-ball-fall.la-sm {
  width: 26px;
  height: 8px; }

.la-ball-fall.la-sm > div {
  width: 4px;
  height: 4px;
  margin: 2px; }

.la-ball-fall.la-2x {
  width: 108px;
  height: 36px; }

.la-ball-fall.la-2x > div {
  width: 20px;
  height: 20px;
  margin: 8px; }

.la-ball-fall.la-3x {
  width: 162px;
  height: 54px; }

.la-ball-fall.la-3x > div {
  width: 30px;
  height: 30px;
  margin: 12px; }

/*
 * Animation
 */
@-webkit-keyframes ball-fall {
  0% {
    opacity: 0;
    -webkit-transform: translateY(-145%);
    transform: translateY(-145%); }
  10% {
    opacity: .5; }
  20% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0); }
  80% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0); }
  90% {
    opacity: .5; }
  100% {
    opacity: 0;
    -webkit-transform: translateY(145%);
    transform: translateY(145%); } }

@-moz-keyframes ball-fall {
  0% {
    opacity: 0;
    -moz-transform: translateY(-145%);
    transform: translateY(-145%); }
  10% {
    opacity: .5; }
  20% {
    opacity: 1;
    -moz-transform: translateY(0);
    transform: translateY(0); }
  80% {
    opacity: 1;
    -moz-transform: translateY(0);
    transform: translateY(0); }
  90% {
    opacity: .5; }
  100% {
    opacity: 0;
    -moz-transform: translateY(145%);
    transform: translateY(145%); } }

@-o-keyframes ball-fall {
  0% {
    opacity: 0;
    -o-transform: translateY(-145%);
    transform: translateY(-145%); }
  10% {
    opacity: .5; }
  20% {
    opacity: 1;
    -o-transform: translateY(0);
    transform: translateY(0); }
  80% {
    opacity: 1;
    -o-transform: translateY(0);
    transform: translateY(0); }
  90% {
    opacity: .5; }
  100% {
    opacity: 0;
    -o-transform: translateY(145%);
    transform: translateY(145%); } }

@keyframes ball-fall {
  0% {
    opacity: 0;
    -webkit-transform: translateY(-145%);
    -moz-transform: translateY(-145%);
    -o-transform: translateY(-145%);
    transform: translateY(-145%); }
  10% {
    opacity: .5; }
  20% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
    -o-transform: translateY(0);
    transform: translateY(0); }
  80% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
    -o-transform: translateY(0);
    transform: translateY(0); }
  90% {
    opacity: .5; }
  100% {
    opacity: 0;
    -webkit-transform: translateY(145%);
    -moz-transform: translateY(145%);
    -o-transform: translateY(145%);
    transform: translateY(145%); } }

.ti_tx,
.mi_tx,
.mer_tx {
	width: 100%;
	text-align: center;
	margin: 10px 0;
}

.time,
.mins,
.meridian {
	width: 60px;
	float: left;
	margin: 0 10px;
	font-size: 20px;
	color: #2d2e2e;
	font-family: arial;
	font-weight: 700;
}

.timepicker_prev,
.timepicker_next {
	cursor: pointer;
	padding: 18px;
	width: 28%;
	border: 1px solid #ccc;
	margin: auto;
	background: url(../images/arrow.png) no-repeat;
	border-radius: 5px;
}

.timepicker_prev:hover,
.timepicker_next:hover {
	background-color: #ccc;
}

.timepicker_next {
	background-position: 50% 150%;
}

.timepicker_prev {
	background-position: 50% -50%;
}

.time_pick {
	position: relative;
}

.timepicker_wrap {
	padding: 10px;
	border-radius: 5px;
	z-index: 998;
	display: none;
	box-shadow: 2px 2px 5px 0 rgba(50,50,50,0.35);
	background: #f6f6f6;
	border: 1px solid #ccc;
	float: left;
	position: absolute;
	top: 27px;
	left: 0;
	width: 185px;
}

.arrow_top {
	position: absolute;
	top: -10px;
	left: 20px;
	background: url(../images/top_arr.png) no-repeat;
	width: 18px;
	height: 10px;
	z-index: 999;
}
input.timepicki-input {
	background: none repeat scroll 0 0 #FFFFFF;
    	border: 1px solid #CCCCCC;
    	border-radius: 5px 5px 5px 5px;
    	float: none;
    	margin: 0;
    	text-align: center;
    	width: 70%;
}
a.reset_time {
	float: left;
	margin-top: 5px;
	color: #000;
}.page-content {
    background: #34425A;
}

.navbar .logo-box {
    background: #fff;
}

.navbar .logo-box a {
    color: #5f5f5f;
}

.sidebar {
    background: #34425A;
}

.sidebar-header {
    background: #34425A;
}

.sidebar-profile span small {
    color: #899dc1;
}

.menu {
    background: #34425A;
}

.menu.accordion-menu a {
    color: #899dc1;
}

.menu.accordion-menu > li > a:hover {
	background: #2b384e;
    color: #fff;
}

.menu.accordion-menu > li.active > a,
.menu.accordion-menu > li.active.open > a {
	background: #2b384e;
    color: #fff;
}

.small-sidebar:not(.page-sidebar-fixed) .accordion-menu li.droplink:hover > a,
.horizontal-bar .accordion-menu > li.droplink:hover > a,
.menu.accordion-menu ul,
.menu.accordion-menu li.open > a,
.hover-menu .accordion-menu > li.droplink:hover > a {
    background: #2B384E;
    color: #fff;
}

.menu.accordion-menu ul li a:hover,
.menu.accordion-menu ul li.active a {
	background: #34425A;
    color: #fff;
}

.menu.accordion-menu ul li a {
    color: #899dc1;
}
.ullist {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 15%;
    background-color: #2c3542;
    height: 100%;
    overflow: auto;
}

.title{
color: white;
padding: 8px;
}
.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}
ol, ul {
    margin-top: 0;
}
* {
    box-sizing: border-box;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.info-box .panel-body img {
    transition: all 0.3s ease 0s;
}


li a:hover:not(.active) {
    background-color: #777777;
}

.navbar-right> li >a:hover {
	
}   
</style>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body style=" background-color :#f1f4f9;font-family: 'Open Sans',sans-serif;">
<c:forEach items="${sessionScope.hospitaldata }" var="q" end="0">
    <div class="navbar" style="padding-right: 14px;  background-color: white;     height: 69px;" >
		<div class="col-md-3 col-sm-2 col-xs-4">
			<h3>
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40" style="    margin-top: -8px;"> <span style="font-size:22px ">Hospital
					Management System</span>
			</h3>
		</div>
		<ul class="nav navbar-right col-md-9 col-sm-10 col-xs-8">
			<li class="dropdown"style="margin-left: 80%;">
				<a style="background-color: white;     height: 49px;" data-toggle="dropdown" class="dropdown-toggle " href="javascript:;">
						<img src="images/<%=session.getAttribute("hospitalimage")%>" height="40px" width="40px" class="img-circle" style="margin-top: -15px;" >								
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
<div>
	<ul class="nav nav-pills nav-stacked ullist" style="margin-top: -19px; height: 1695px; width: 217px;">
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
		
		<li><a href="" class="left-tooltip" data-tooltip="Inpatient" title="Inpatient">
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
		<li><a href="" class="left-tooltip" data-tooltip="Prescription" title="Prescription">
		<span class="icone"> <img src="ing/Prescription-logo.png"></span><span class="title">Prescription</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Assign Bed-Nurse" title="Assign Bed-Nurse">
		<span class="icone"> <img src="ing/Assign-Bed-logo.png"></span><span class="title">Assign Bed-Nurse</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Operation List" title="Operation List">
		<span class="icone"> <img src="ing/Operation-List-logo.png"></span><span class="title">Operation List</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Diagnosis" title="Diagnosis">
		<span class="icone"> <img src="ing/Diagnosis-Report-logo.png"></span><span class="title">Diagnosis</span></a></li>
		<li><a href="<%=request.getContextPath()%>/BloodManage?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Blood Bank" title="Blood Bank">
		<span class="icone"> <img src="ing/Blood-Bank-logo.png"></span><span class="title">Blood Bank</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Appointment" title="Appointment">
		<span class="icone"> <img src="ing/Appointment-logo.png"></span><span class="title">Appointment</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Invoice" title="Invoice">
		<span class="icone"> <img src="ing/payment-logo.png"></span><span class="title">Invoice</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Event" title="Event">
		<span class="icone"> <img src="ing/notice-logo.png"></span><span class="title">Event</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Message" title="Message">
		<span class="icone"> <img src="ing/message-logo.png"></span><span class="title">Message</span></a></li>
		<li><a href="<%=request.getContextPath()%>/Ambulance?flag=insert&id=${q.id }" class="left-tooltip" data-tooltip="Ambulance" title="Ambulance">
		<span class="icone"> <img src="ing/Ambulance-logo.png"></span><span class="title">Ambulance</span></a></li><li><a href="" class="left-tooltip" data-tooltip="instrument" title="instrument">
		<span class="icone"> <img src="ing/Instrument-logo.png"></span><span class="title">Instrument</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Report" title="Report">
		<span class="icone"> <img src="ing/Report-logo.png"></span><span class="title">Report</span></a></li><li><a href="" class="left-tooltip" data-tooltip="Account" title="Account">
		<span class="icone"> <img src="ing/account-logo.png"></span><span class="title">Account</span></a></li>
	</ul>

<div style="margin-top: 221.5%;">
</div>
	<div style="margin-left:15%;padding:1px 16px; margin-top: -332%;">
	<div class="row right_side " style="padding-right: 14px;"><!-- start dashboard content div-->
								<!---start new dashboard------>
				<div class="row">	
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">			
					<a href="">			
						<div class="panel info-box panel-white">
							<div class="panel-body patient">
								<div class="info-box-stats">
									<p class="counter">249</p>
									
									<span class="info-box-title">Patient</span>
								</div>
								<img src="ing/patient.png" class="dashboard_background">
								
							</div>
						</div>
					</a></div><a href="">	
					
					</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">			
					</a><a href="<%=request.getContextPath()%>/Doctor?flag=insert&id=${q.id }">			
						<div class="panel info-box panel-white">
							<div class="panel-body doctor">
								<div class="info-box-stats">
									<p class="counter">3</p>
									<span class="info-box-title">Doctor</span>
								</div>
								<img src="ing/doctor.png" class="dashboard_background">
								
							</div>
						</div>
					</a></div><a href="">
						
					</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">
					</a><a href="<%=request.getContextPath()%>/Nurse?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body nurse">
								<div class="info-box-stats">
									<p class="counter">3</p>
									<span class="info-box-title">Nurse</span>
								</div>
								<img src="ing/nurse.png" class="dashboard_background">
								
							</div>
						</div>
					</a></div><a href="">
					
					</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">
					</a><a href="<%=request.getContextPath()%>/SupportStaff?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body receptionist">
								<div class="info-box-stats">
									<p class="counter">5</p>
									
									<span class="info-box-title">Support Staff</span>
								</div>
								<img src="ing/support-staft.png" class="dashboard_background">
							</div>
						</div>
					</a></div><a href="">
					
					
					</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">
					</a><a href="">	
						<div class="panel info-box panel-white">
							<div class="panel-body message">
								<div class="info-box-stats">
									<p class="counter">2</p>
									
									<span class="info-box-title">Message</span>
								</div>
								<img src="ing/message.png" class="dashboard_background">
								
							</div>
						</div>
					</a>
					</div>
					
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="">	
						<div class="panel info-box panel-white">
							<div class="panel-body setting">
								<div class="info-box-stats">
									<p class="counter"> &nbsp;</p>
									<span class="info-box-title">Setting</span>
								</div>
								<img src="ing/setting-image.png" class="dashboard_background">
							</div>
						</div>
						</a>
					</div>
						
										<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="">
						<div class="panel info-box panel-white">
							<div class="panel-body appointment">
								<div class="info-box-stats">
									<p class="counter">144</p>
									<span class="info-box-title">Appointment</span>
								</div>
								<img src="ing/appointment-image.png" class="dashboard_background">
							</div>
						</div>
					</a>
					</div>					
										<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="">
						<div class="panel info-box panel-white">
							<div class="panel-body prescription">
								<div class="info-box-stats">
									<p class="counter">354</p>
									
									<span class="info-box-title">Prescription</span>
								</div>
								 <img src="ing/preseription-image.png" class="dashboard_background"> 
								
							</div>
						</div>
						</a>
					</div>
										<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="">
						<div class="panel info-box panel-white">
							<div class="panel-body assignbed">
								<div class="info-box-stats">
									<p class="counter">21</p>
									
									<span class="info-box-title">Assign <br> Bed/Nurse</span>
								</div>
								 <img src="ing/assign-bed-image.png" class="dashboard_background">   
								
							</div>
						</div>
					</a>
					</div>
										<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="<%=request.getContextPath()%>/TreatmentUpdate?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body treatment">
								<div class="info-box-stats">
									<p class="counter">67</p>
									
									<span class="info-box-title">Treatment</span>
								</div>
								  <img src="ing/tretment-image.png" class="dashboard_background">
							</div>
						</div>
						</a>
					</div>
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
						<a href="">
							<div class="panel info-box panel-white">
								<div class="panel-body eventnotice">
									<div class="info-box-stats">
										<p class="counter">
										5</p>
										
										<span class="info-box-title">Events/ <br> Notice</span>
									</div>
									<img src="ing/notice-event-image.png" class="dashboard_background">									
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
						<a href="<%=request.getContextPath()%>/Laboratory?flag=insert&id=${q.id }">
							<div class="panel info-box panel-white">
								<div class="panel-body operation_report">
									<div class="info-box-stats">
										<p class="counter">&nbsp;</p>
										
										<span class="info-box-title">Report</span>
									</div>
									<img src="ing/report.png" class="dashboard_background">
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="<%=request.getContextPath()%>/Pharmacist?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body pharmacist">
								<div class="info-box-stats">
									<p class="counter">5</p>
									
									<span class="info-box-title">Pharmacist</span>
								</div>
								<img src="ing/pharmacist.png" class="dashboard_background">
							</div>
						</div>
					</a></div>
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
						</a><a href="<%=request.getContextPath()%>/Medicine?flag=insert&id=${q.id }">
							<div class="panel info-box panel-white">
								<div class="panel-body medicine">
									<div class="info-box-stats">
										<p class="counter">43</p>
										<span class="info-box-title">Medicine</span>
									</div>
									<img src="ing/medicine.png" class="dashboard_background"> 
								</div>
							</div>
							</a>
						</div>
					<a href="">
										</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">
					</a><a href="<%=request.getContextPath()%>/Laboratory?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body laboratorist">
								<div class="info-box-stats">
									<p class="counter">4</p>
									
									<span class="info-box-title">Laboratory <br> Staff</span>
								</div>
								<img src="ing/laboratorist.png" class="dashboard_background">
							</div>
						</div>
					</a></div><a href="">
											</a><div class="col-lg-2 col-md-2 col-xs-6 col-sm-3"><a href="">
						</a><a href="">
							<div class="panel info-box panel-white">
								<div class="panel-body diagnosis">
									<div class="info-box-stats">
										<p class="counter">115</p>
										
										<span class="info-box-title">Diagnosis <br> Report</span>
									</div>
									<img src="ing/diagnosis-image.png" class="dashboard_background">
									
								</div>
							</div>
						</a>
						</div>
										<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="<%=request.getContextPath()%>/AccountantStaff?flag=insert&id=${q.id }">
						<div class="panel info-box panel-white">
							<div class="panel-body accountant">
								<div class="info-box-stats">
									<p class="counter">5</p>
									<span class="info-box-title">Accountant</span>
								</div>
								 <img src="ing/accountant.png" class="dashboard_background">
								
							</div>
						</div>
						</a>
					</div>
					<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
					<a href="">
						<div class="panel info-box panel-white">
							<div class="panel-body invoice">
								<div class="info-box-stats">
									<p class="counter">5</p>
									<span class="info-box-title">Invoice</span>
								</div>
								 <img src="ing/invoice.png" class="dashboard_background">
							</div>
						</div>
						</a>
					</div>
									</div>
				<div class="row dashboard_panel_heading_border">
					<div class="col-md-6 no-paddingR">
						<!--  Start Prescription Box -->
													<div class="panel panel-white event priscription">
								<div class="panel-heading ">					
								<img src="ing/Prescription-logo.png">
									<h3 class="panel-title">Prescription</h3>						
								</div>
								<div class="panel-body">
									<div class="events">
										 								
												<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewpriscription show_task_event" id="359" model="Prescription Details">  Patient Name : 
													Himanshu Patel													</p>
													<p class="remainder_date_pr"> 2020-09-14 </p>
													<p class="remainder_title_pr viewpriscription"> Description	 : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae laoreet eros. Fusce rhoncus urna ut egestas facilisis. Proin nulla augue, temp</p>
												</div>	
																			
												<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewpriscription show_task_event" id="358" model="Prescription Details">  Patient Name : 
													A Kuddus													</p>
													<p class="remainder_date_pr"> 2020-09-14 </p>
													<p class="remainder_title_pr viewpriscription"> Description	 : Paciente llega a centro con dolor en el culo, se visualiza lo que a priori parece un hamster en la cavidad anal</p>
												</div>	
																			
												<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewpriscription show_task_event" id="357" model="Prescription Details">  Patient Name : 
													A Kuddus													</p>
													<p class="remainder_date_pr"> 2020-09-14 </p>
													<p class="remainder_title_pr viewpriscription"> Description	 : dolor de nariz</p>
												</div>	
												
									</div>                       
								</div>
							</div>
												<!-- End Prescription Box -->
								
						<!--  Start Operation Box -->
													<div class="panel panel-white event operation">
								<div class="panel-heading ">
								<img src="ing/Operation-List-logo.png">
								<h3 class="panel-title">Operation</h3>						
								</div>
								<div class="panel-body">
									<div class="events">
																						<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewoperation show_task_event" id="17" model="Operation Details">	Patient Name : koly kamrunnaher</p>
													<p class="remainder_date_pr"> 2020-04-12 	</p>
													
													<p class="remainder_title_pr  viewoperation"> Operation Name: brain operationnn</p>
												</div>	
																							<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewoperation show_task_event" id="16" model="Operation Details">	Patient Name : uu ui</p>
													<p class="remainder_date_pr"> 2020-02-20 	</p>
													
													<p class="remainder_title_pr  viewoperation"> Operation Name: brain operationnn</p>
												</div>	
																							<div class="calendar-event"> 
													<p class="remainder_title_pr Bold viewoperation show_task_event" id="15" model="Operation Details">	Patient Name : Abhijit Borgohain</p>
													<p class="remainder_date_pr"> 2020-02-27 	</p>
													
													<p class="remainder_title_pr  viewoperation"> Operation Name: Brain Surgery1</p>
												</div>	
													
									</div>                       
								</div>
							</div>
												<!-- End Operation Box -->
						
						<!-- start calendar Box -->
						<div class="panel panel-white">
						   <div class="panel-heading" style="margin-bottom: 15px;">
										<img src="ing/notice-logo.png">
										<h3 class="panel-title">Calendar</h3>			
									</div>
							<div class="panel-body">
								<div id="calendar" class="fc fc-ltr fc-unthemed"><div class="fc-toolbar"><div class="fc-left"><div class="fc-button-group"><button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left"><span class="fc-icon fc-icon-left-single-arrow"></span></button><button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right"><span class="fc-icon fc-icon-right-single-arrow"></span></button></div><button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled" disabled="disabled">today</button></div><div class="fc-right"><div class="fc-button-group"><button type="button" class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button><button type="button" class="fc-agendaWeek-button fc-button fc-state-default">week</button><button type="button" class="fc-agendaDay-button fc-button fc-state-default fc-corner-right">day</button></div></div><div class="fc-center"><h2>September 2020</h2></div><div class="fc-clear"></div></div><div class="fc-view-container" style=""><div class="fc-view fc-month-view fc-basic-view" style=""><table><thead class="fc-head"><tr><td class="fc-widget-header"><div class="fc-row fc-widget-header"><table><thead><tr><th class="fc-day-header fc-widget-header fc-sun">Sun</th><th class="fc-day-header fc-widget-header fc-mon">Mon</th><th class="fc-day-header fc-widget-header fc-tue">Tue</th><th class="fc-day-header fc-widget-header fc-wed">Wed</th><th class="fc-day-header fc-widget-header fc-thu">Thu</th><th class="fc-day-header fc-widget-header fc-fri">Fri</th><th class="fc-day-header fc-widget-header fc-sat">Sat</th></tr></thead></table></div></td></tr></thead><tbody class="fc-body"><tr><td class="fc-widget-content"><div class="fc-day-grid-container" style=""><div class="fc-day-grid"><div class="fc-row fc-week fc-widget-content" style="height: 68px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-other-month fc-past" data-date="2020-08-30"></td><td class="fc-day fc-widget-content fc-mon fc-other-month fc-past" data-date="2020-08-31"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2020-09-01"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2020-09-02"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2020-09-03"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2020-09-04"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2020-09-05"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-other-month fc-past" data-date="2020-08-30">30</td><td class="fc-day-number fc-mon fc-other-month fc-past" data-date="2020-08-31">31</td><td class="fc-day-number fc-tue fc-past" data-date="2020-09-01">1</td><td class="fc-day-number fc-wed fc-past" data-date="2020-09-02">2</td><td class="fc-day-number fc-thu fc-past" data-date="2020-09-03">3</td><td class="fc-day-number fc-fri fc-past" data-date="2020-09-04">4</td><td class="fc-day-number fc-sat fc-past" data-date="2020-09-05">5</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style="height: 68px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2020-09-06"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2020-09-07"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2020-09-08"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2020-09-09"></td><td class="fc-day fc-widget-content fc-thu fc-past" data-date="2020-09-10"></td><td class="fc-day fc-widget-content fc-fri fc-past" data-date="2020-09-11"></td><td class="fc-day fc-widget-content fc-sat fc-past" data-date="2020-09-12"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-past" data-date="2020-09-06">6</td><td class="fc-day-number fc-mon fc-past" data-date="2020-09-07">7</td><td class="fc-day-number fc-tue fc-past" data-date="2020-09-08">8</td><td class="fc-day-number fc-wed fc-past" data-date="2020-09-09">9</td><td class="fc-day-number fc-thu fc-past" data-date="2020-09-10">10</td><td class="fc-day-number fc-fri fc-past" data-date="2020-09-11">11</td><td class="fc-day-number fc-sat fc-past" data-date="2020-09-12">12</td></tr></thead><tbody><tr><td></td><td></td><td></td><td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end"><div class="fc-content"><span class="fc-time">10:15AM</span> <span class="fc-title">Detail :Fernando Therrien   :Himanshu Patel(P970919), </span></div></a></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style="height: 68px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-past" data-date="2020-09-13"></td><td class="fc-day fc-widget-content fc-mon fc-past" data-date="2020-09-14"></td><td class="fc-day fc-widget-content fc-tue fc-past" data-date="2020-09-15"></td><td class="fc-day fc-widget-content fc-wed fc-past" data-date="2020-09-16"></td><td class="fc-day fc-widget-content fc-thu fc-today fc-state-highlight" data-date="2020-09-17"></td><td class="fc-day fc-widget-content fc-fri fc-future" data-date="2020-09-18"></td><td class="fc-day fc-widget-content fc-sat fc-future" data-date="2020-09-19"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-past" data-date="2020-09-13">13</td><td class="fc-day-number fc-mon fc-past" data-date="2020-09-14">14</td><td class="fc-day-number fc-tue fc-past" data-date="2020-09-15">15</td><td class="fc-day-number fc-wed fc-past" data-date="2020-09-16">16</td><td class="fc-day-number fc-thu fc-today fc-state-highlight" data-date="2020-09-17">17</td><td class="fc-day-number fc-fri fc-future" data-date="2020-09-18">18</td><td class="fc-day-number fc-sat fc-future" data-date="2020-09-19">19</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style="height: 68px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-future" data-date="2020-09-20"></td><td class="fc-day fc-widget-content fc-mon fc-future" data-date="2020-09-21"></td><td class="fc-day fc-widget-content fc-tue fc-future" data-date="2020-09-22"></td><td class="fc-day fc-widget-content fc-wed fc-future" data-date="2020-09-23"></td><td class="fc-day fc-widget-content fc-thu fc-future" data-date="2020-09-24"></td><td class="fc-day fc-widget-content fc-fri fc-future" data-date="2020-09-25"></td><td class="fc-day fc-widget-content fc-sat fc-future" data-date="2020-09-26"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-future" data-date="2020-09-20">20</td><td class="fc-day-number fc-mon fc-future" data-date="2020-09-21">21</td><td class="fc-day-number fc-tue fc-future" data-date="2020-09-22">22</td><td class="fc-day-number fc-wed fc-future" data-date="2020-09-23">23</td><td class="fc-day-number fc-thu fc-future" data-date="2020-09-24">24</td><td class="fc-day-number fc-fri fc-future" data-date="2020-09-25">25</td><td class="fc-day-number fc-sat fc-future" data-date="2020-09-26">26</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style="height: 68px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-future" data-date="2020-09-27"></td><td class="fc-day fc-widget-content fc-mon fc-future" data-date="2020-09-28"></td><td class="fc-day fc-widget-content fc-tue fc-future" data-date="2020-09-29"></td><td class="fc-day fc-widget-content fc-wed fc-future" data-date="2020-09-30"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-future" data-date="2020-10-01"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-future" data-date="2020-10-02"></td><td class="fc-day fc-widget-content fc-sat fc-other-month fc-future" data-date="2020-10-03"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-future" data-date="2020-09-27">27</td><td class="fc-day-number fc-mon fc-future" data-date="2020-09-28">28</td><td class="fc-day-number fc-tue fc-future" data-date="2020-09-29">29</td><td class="fc-day-number fc-wed fc-future" data-date="2020-09-30">30</td><td class="fc-day-number fc-thu fc-other-month fc-future" data-date="2020-10-01">1</td><td class="fc-day-number fc-fri fc-other-month fc-future" data-date="2020-10-02">2</td><td class="fc-day-number fc-sat fc-other-month fc-future" data-date="2020-10-03">3</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div><div class="fc-row fc-week fc-widget-content" style="height: 73px;"><div class="fc-bg"><table><tbody><tr><td class="fc-day fc-widget-content fc-sun fc-other-month fc-future" data-date="2020-10-04"></td><td class="fc-day fc-widget-content fc-mon fc-other-month fc-future" data-date="2020-10-05"></td><td class="fc-day fc-widget-content fc-tue fc-other-month fc-future" data-date="2020-10-06"></td><td class="fc-day fc-widget-content fc-wed fc-other-month fc-future" data-date="2020-10-07"></td><td class="fc-day fc-widget-content fc-thu fc-other-month fc-future" data-date="2020-10-08"></td><td class="fc-day fc-widget-content fc-fri fc-other-month fc-future" data-date="2020-10-09"></td><td class="fc-day fc-widget-content fc-sat fc-other-month fc-future" data-date="2020-10-10"></td></tr></tbody></table></div><div class="fc-content-skeleton"><table><thead><tr><td class="fc-day-number fc-sun fc-other-month fc-future" data-date="2020-10-04">4</td><td class="fc-day-number fc-mon fc-other-month fc-future" data-date="2020-10-05">5</td><td class="fc-day-number fc-tue fc-other-month fc-future" data-date="2020-10-06">6</td><td class="fc-day-number fc-wed fc-other-month fc-future" data-date="2020-10-07">7</td><td class="fc-day-number fc-thu fc-other-month fc-future" data-date="2020-10-08">8</td><td class="fc-day-number fc-fri fc-other-month fc-future" data-date="2020-10-09">9</td><td class="fc-day-number fc-sat fc-other-month fc-future" data-date="2020-10-10">10</td></tr></thead><tbody><tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr></tbody></table></div></div></div></div></td></tr></tbody></table></div></div></div>
							</div>
						</div>	
						<!-- end calendar Box -->							
					 </div>	
					<div class="col-md-6">	
						<!-- Start Appointment Box -->	
													<div class="panel panel-white Appoinment">
								<div class="panel-heading">
									<img src="ing/Appointment-logo.png">
									<h3 class="panel-title">Appointment</h3>	
										
								</div>
								<div class="panel-body">
									<div class="events">
																			
											<div class="calendar-event"> 
												<p class="remainder_title Bold save1 show_task_event" id="176" model="Appointment Details">
												Patient Name : Himanshu Patel  </p>
												<p class="remainder_date" style="width: 160px;background-position: 85px;">
												2020-09-09		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:15AM												</p>
											</div>	
																				
											<div class="calendar-event"> 
												<p class="remainder_title Bold save1 show_task_event" id="173" model="Appointment Details">
												Patient Name : koly kamrunnaher  </p>
												<p class="remainder_date" style="width: 160px;background-position: 85px;">
												2020-07-25		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:45AM												</p>
											</div>	
																				
											<div class="calendar-event"> 
												<p class="remainder_title Bold save1 show_task_event" id="172" model="Appointment Details">
												Patient Name : Miha Demo  </p>
												<p class="remainder_date" style="width: 160px;background-position: 85px;">
												2020-07-25		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:30AM												</p>
											</div>	
																				</div>					
								</div>
							</div>
							
						<!--  End Appoinment box -->
						 
						<!--  Start assigned bed Box -->
													<div class="panel panel-white event assignbed">
								<div class="panel-heading">
								<img src="ing/Assign-Bed-logo.png">
								<h3 class="panel-title">Assigned Bed</h3>						
								</div>
								<div class="panel-body">
									<div class="events">
																			
												<div class="calendar-event"> 
													<p class="remainder_title Bold viewbedlist show_task_event" id="21" model="Assigned Bed Details"> Patient Name : 	  
														gar gar													</p>
													<p class="remainder_date">	2020-02-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-02-20 </p>
												</div>		
																				
												<div class="calendar-event"> 
													<p class="remainder_title Bold viewbedlist show_task_event" id="16" model="Assigned Bed Details"> Patient Name : 	  
														uu ui													</p>
													<p class="remainder_date">	2019-11-18 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-11-19 </p>
												</div>		
																				
												<div class="calendar-event"> 
													<p class="remainder_title Bold viewbedlist show_task_event" id="15" model="Assigned Bed Details"> Patient Name : 	  
														king hytrd													</p>
													<p class="remainder_date">	2019-11-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-11-28 </p>
												</div>		
												
									</div>                       
								</div>
							</div>
												<!-- End assigned bed Box -->
						<!--  Start Event Box -->
													<div class="panel panel-white event">
								<div class="panel-heading ">
								<img src="ing/Appointment-logo.png">
								<h3 class="panel-title">Events</h3>						
								</div>					
								<div class="panel-body">
									<div class="events">	
																						<div class="calendar-event">
														<p class="remainder_title Bold viewdetail show_task_event" id="309" model="Event Details">
															zxvdvhvy														</p>									
														<p class="remainder_date">
															2020-01-15 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-22														</p>
														<p class="remainder_title viewdetail">	
															sdjvhfhvbjhcbvvefuybaovhsbgsvdhv zdyvbsjdvygdzvbsdzn vbVBIDvbSD cabhvbayuuvh aguvahvjhvfgavaiceqvfugvashbcgoegvfab														</p>
													</div>
																									<div class="calendar-event">
														<p class="remainder_title Bold viewdetail show_task_event" id="308" model="Event Details">
															Hello all this event for														</p>									
														<p class="remainder_date">
															2020-01-20 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-22														</p>
														<p class="remainder_title viewdetail">	
															hekbvuuvyzvcoryriizkujrzdhyepgyhobhayuhldybhkobzcgasobdvhknzxgeubhbzvyelxeivaigiafylvdcvudvsyhjzbvhdcvdtfjozhevpdffobryvtktoTboPUrevbbhbyauefh														</p>
													</div>
																									<div class="calendar-event">
														<p class="remainder_title Bold viewdetail show_task_event" id="307" model="Event Details">
															XYZ														</p>									
														<p class="remainder_date">
															2020-01-16 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-01-18														</p>
														<p class="remainder_title viewdetail">	
															basbfhvudfgvashvdfhsdvcasucvasvvhuahschxibciahuhbchgvashdbahbihvhgvgvjZIxvashbiua														</p>
													</div>
																					</div>                       
								</div>
							</div>						
							<!-- End Event Box -->
							<!--  Start Notice box -->
							<div class="panel panel-white nt">
								<div class="panel-heading">
								<img src="ing/notice1.png">
								<h3 class="panel-title">Notice</h3>						
								</div>
								<div class="panel-body">
									<div class="events">
																
										<div class="calendar-event"> 
											<p class="remainder_title Bold viewdetail show_task_event" id="478" model="Notice Details">	
												notice test	
											</p>
											<p class="remainder_date">	2020-07-07 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-07-30</p>
											<p class="remainder_title viewdetail">hhhhhhhhhhkkkkkkkkkkkkkkk</p>
										</div>	
															
										<div class="calendar-event"> 
											<p class="remainder_title Bold viewdetail show_task_event" id="456" model="Notice Details">	
												corona	
											</p>
											<p class="remainder_date">	2020-07-03 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2020-07-15</p>
											<p class="remainder_title viewdetail">hhhhhhhhhhhhhhhh</p>
										</div>	
									</div>
								</div>
							</div>
												<!--  End Notice box -->
					</div>
				</div>
				<!---End new dashboard------>
			</div>
</div>

</div>
</c:forEach> 
</body>
</html>