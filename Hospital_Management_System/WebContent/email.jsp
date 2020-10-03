<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row right_side message"><!-- start dashboard content div-->
<noscript><meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php"></noscript> 

<div class="row mailbox-header"><!-- START MAIL BOX HEADER DIV-->
								
	<div class="col-md-2">
			
			<a class="btn btn-success btn-block" href="?dashboard=user&amp;page=message&amp;tab=compose">Compose</a>
			
	</div>
	<div class="col-md-6">
		<h2>
		Inbox			
		</h2>
	</div>
   
</div><!-- END MAIL BOX HEADER DIV-->
 <div class="col-md-2">
	<ul class="list-unstyled mailbox-nav">
		<li class="active">
		<a href="?dashboard=user&amp;page=message&amp;tab=inbox"><i class="fa fa-inbox"></i> Inbox<span class="badge badge-success pull-right">2</span></a></li>
		<li><a href="?dashboard=user&amp;page=message&amp;tab=sentbox"><i class="fa fa-sign-out"></i>Sent</a></li>                                
	</ul>
</div>
 <div class="col-md-10">
 <div class="mailbox-content"><!-- START MAIL BOX CONTENT DIV -->
	<div class="table-responsive"><!-- START TABE RESPONSIVE DIV -->
		<table class="table">
			<thead>
				<tr>
					<th class="text-right" colspan="5">
						 					</th>
				</tr>
			</thead>
			<tbody>
			<tr>				
				<th class="hidden-xs">
					<span>Message For</span>
				</th>
				<th>Subject</th>
				 <th>
					  Description				</th>
				 <th>
					  Date				</th>
			</tr>
			</tbody>
		</table>
	 </div><!-- END TABLE RESPONSIVE DIV -->
 </div><!-- END MAIL BOX CONTENT DIV --> </div></div>
</body>
</html>