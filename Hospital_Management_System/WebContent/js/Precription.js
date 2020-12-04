$(document).ready(function(){
	$('#out_patient_insert_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#report_insert_form')[0];
        var data = new FormData(form);
        $("#out_patient_insert_form").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Report",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
				alert("hello");
            	$("#out_patient_insert_form").prop("disabled", false);
            	var count=0;
        		var obj = JSON.parse(response);
        		$('.report_data').children('tr').remove();
        		$.each(obj, function(index) {
        			count++;
        			var html = '';
        			html += '<tr id=' + count + '>';
        			html += '<td>' + obj[index].reportname + '</td>';
        			html += '<td>' + obj[index].amount + '</td>';
        			html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
        			html += '<td><button type="button" class="btn-delete-cat badge badge-delete" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">x</button></td>';
        			html += '<td><button type="button" class="btn-edit-cat badge badge-edit" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '"><i class="fas fa-edit" aria-hidden="true"></button></td></tr>';
        			$('.report_data').append(html);
        		});
           		$("#report_insert_form")[0].reset();
            },
            error: function (e) {
                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#insertreport").prop("disabled", false);
            }
        });
    });
	
	$('#systomes_insert_form').on('submit' , function(event){
        event.preventDefault();
        var form = $('#report_insert_form')[0];
        var data = new FormData(form);
		console.log(form);
        $("#btn-insert-symptoms").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "Symptoms",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function(response){
            	$("#btn-insert-symptoms").prop("disabled", false);
            	var count=0;
        		var obj = JSON.parse(response);
        		$('.report_data').children('tr').remove();
        		$.each(obj, function(index) {
        			count++;
        			var html = '';
        			html += '<tr id=' + count + '>';
        			html += '<td>' + obj[index].reportname + '</td>';
        			html += '<td>' + obj[index].amount + '</td>';
        			html += '<td style="word-break: break-all;">' + obj[index].description + '</td>';
        			html += '<td><button type="button" class="btn-delete-cat badge badge-delete" data-edit_id="' + count + '" id="EventdId' + count + '"value="' + obj[index].id + '">x</button></td>';
        			html += '<td><button type="button" class="btn-edit-cat badge badge-edit" data-delete_id="' + count + '" id="EventId' + count + '" value="' + obj[index].id + '"><i class="fas fa-edit" aria-hidden="true"></button></td></tr>';
        			$('.report_data').append(html);
        		});
           		$("#systomes_insert_form")[0].reset();
            },
            error: function (e) {
                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btn-insert-symptoms").prop("disabled", false);
            }
        });
    });
});