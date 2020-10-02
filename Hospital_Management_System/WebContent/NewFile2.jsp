<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$('[data-toggle="popover"]').popover({
    container: "body",
    sanitize: false,
    content: function () {
        return $("#choose-user-popover-content").html();
    }
}).on('shown.bs.popover', function () {
    $('#ExecutorSNPSearchStr').focus();
});

$(document).ready(function(){
	 $("body").on("click", ".close-btn-cat", function()
			   {	
				 $( ".category_list" ).empty();
				 $('#exampleModal').hide(); 
			  });  

$('#ss').on('submit' , function(event){
	    event.preventDefault();
	    var form = $('#ss')[0];
	    console.log(form);
	    var data = new FormData(form);
	    console.log(data);
	    $(".modal_fade").prop("disabled", true);
	    $.ajax({
	        type: "POST",
	        url: "Nurse",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function(response ,textStatus , jqXHR ){
	        	console.log(response);
	        	var obj = JSON.parse(response);
	        	if(obj[0].nurseupdate == "true"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Recored Add Successsfully");
	        		$("#insert_form")[0].reset();
	        	}
	        	else if(obj[0].nurseemail == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id , Please try again");
	        	}
	        	
	        	else if(obj[0].nurseemailinvalid == "false"){
	        		$('#message1').show();
	        		$('#message2').show();
	        		$('#message3').show();
	        		$('#messagepass').text("Email Id was not coreact ,  Please try again");
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
});
</script>
  <style type="text/css">
  	
  </style>
  </head>
  <body>
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="margin-top: 140px">
           <div class="overlay-content">
		<div class="modal-content">
			<div class="category_list">	<div class="modal-header"> <a href="#" class="close-btn-cat badge badge-danger pull-right">X</a>
  		<h4 id="myLargeModalLabel" class="modal-title">Medicine Category</h4>
	</div>
	<hr>
	<div class="panel panel-white">
  	    <div class="category_listbox">
  	        <div class="table-responsive" style="min-height: 100%;">			
			    <form name="report_typ_form" action="" method="post" class="form-horizontal" id="report_typ_form">
  	            <table class="table">			
								    <thead>
						<tr>							
							<th>Medicine Category</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody><tr id="cat-396"><td>Agua Inyectable</td><td id="396"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="396">X</a></td></tr><tr id="cat-536"><td>Agua Oxigenada</td><td id="536"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="536">X</a></td></tr><tr id="cat-397"><td>Agua Oxigenada</td><td id="397"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="397">X</a></td></tr><tr id="cat-223"><td>ANTIINFLAMATORIOS</td><td id="223"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="223">X</a></td></tr><tr id="cat-489"><td>antipsicotico</td><td id="489"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="489">X</a></td></tr><tr id="cat-53"><td>auto test</td><td id="53"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="53">X</a></td></tr><tr id="cat-54"><td>cate</td><td id="54"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="54">X</a></td></tr><tr id="cat-337"><td>depression</td><td id="337"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="337">X</a></td></tr><tr id="cat-354"><td>drami</td><td id="354"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="354">X</a></td></tr><tr id="cat-485"><td>generico</td><td id="485"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="485">X</a></td></tr><tr id="cat-486"><td>generico2</td><td id="486"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="486">X</a></td></tr><tr id="cat-113"><td>Injection</td><td id="113"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="113">X</a></td></tr><tr id="cat-422"><td>kenya254</td><td id="422"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="422">X</a></td></tr><tr id="cat-304"><td>new medicine</td><td id="304"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="304">X</a></td></tr><tr id="cat-284"><td>OILI</td><td id="284"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="284">X</a></td></tr><tr id="cat-268"><td>Paracitamol</td><td id="268"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="268">X</a></td></tr><tr id="cat-421"><td>sdfgdrhrjd</td><td id="421"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="421">X</a></td></tr><tr id="cat-276"><td>So Cuu</td><td id="276"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="276">X</a></td></tr><tr id="cat-295"><td>Syrup</td><td id="295"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="295">X</a></td></tr><tr id="cat-389"><td>Tab</td><td id="389"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="389">X</a></td></tr><tr id="cat-149"><td>tab</td><td id="149"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="149">X</a></td></tr><tr id="cat-130"><td>tablet</td><td id="130"><a class="btn-delete-cat badge badge-delete" model="medicine" href="#" id="130">X</a></td></tr>                </tbody></table>
				</form>
  	        </div>
  	    </div>
		<form name="medicinecat_form" action="" method="post" class="form-horizontal" id="medicinecat_form">
  	 	<div class="form-group">
			<label class="col-sm-4 control-label" for="medicine_name">Category Name<span class="require-field">*</span></label>
			<div class="col-sm-4 margin_bottom_5px">
				<input id="medicine_name" class="validate[required,custom[popup_category_validation]] form-control text-input" maxlength="50" type="text" value="" name="category_name">
			</div>
			<div class="col-sm-4">
				<input type="button" value="Add" name="save_category" class="btn btn-success" model="medicine" id="btn-add-cat">
			</div>
		</div>
  	</form>
		
	  
  	</div>
	</div>    
		</div>
    </div>
            </div>
        </div>
    </div>
<div class="container">
    <div class="row">
        <div class="col mt-5">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
deparment
            </button>
        </div>
    </div>
</div>

</body>
</html>