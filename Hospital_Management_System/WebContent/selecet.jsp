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
			
		
		</h2>
	</div>
   
</div><!-- END MAIL BOX HEADER DIV-->
 <div class="col-md-2">
	<ul class="list-unstyled mailbox-nav">
		<li>
		<a href="?dashboard=user&amp;page=message&amp;tab=inbox"><i class="fa fa-inbox"></i> Inbox<span class="badge badge-success pull-right">2</span></a></li>
		<li><a href="?dashboard=user&amp;page=message&amp;tab=sentbox"><i class="fa fa-sign-out"></i>Sent</a></li>                                
	</ul>
</div>
 <div class="col-md-10">
 <script>
jQuery(document).ready(function()
{
  jQuery("span.timeago").timeago();
});
</script>
	<noscript><meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php"></noscript> 
<div class="mailbox-content"><!-- START MAIL BOX CONTENT DIV -->
 	<div class="message-header">
		<h3><span>Subject :</span>  Core Java</h3>
        <p class="message-date">2020-09-21</p>
	</div>
	<div class="message-sender">  <!-- START MESSAGE SENDER DIV -->                              
    	<p>From: Joanna Christopher<span>&lt;abc@gmail.com&gt;</span><br> To: Fernando Therrien <span>&lt;marcosjuniiorx@gmail.com.pt&gt;</span>
					</p>
    </div>
	<input type="hidden" id="_wpnonce" name="_wpnonce" value="e798635997"><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=message&amp;tab=view_message&amp;from=inbox&amp;id=2208">    <div class="message-content"><!-- START MESSAGE CONTENT DIV -->
		<p>jsapdsadddddd</p>
					<div class="message-options pull-right">
			<a class="btn btn-default" href="?dashboard=user&amp;page=message&amp;tab=view_message&amp;id=2208	&amp;from=inbox&amp;delete=1" onclick="return confirm('Are you sure you want to delete this record?');"><i class="fa fa-trash m-r-xs"></i>Delete</a> 
		</div>
		   </div>
    	 <form name="message-replay" method="post" id="message-replay"><!-- START MESSAGE REPLY FORM -->
		<input type="hidden" name="message_id" value="531">
		<input type="hidden" name="user_id" value="2">
		<input type="hidden" name="receiver_id" value="36">
	    <div class="message-content"><!-- START MESSAGE CONTENT DIV -->
		 <div class="col-sm-8">
			<textarea name="replay_message_body" maxlength="150" id="replay_message_body" class="form-control validate[required,custom[address_description_validation]] text-input"></textarea>
			
		   </div>
		   <div class="message-options pull-right reply-message-btn">
				<button type="submit" name="replay_message" class="btn btn-default"><i class="fa fa-reply m-r-xs"></i>Reply</button>
			
		   </div>
		</div><!-- END MESSAGE CONTENT DIV -->
	</form><!-- END MESSAGE REPLY FORM-->
 </div><!-- END MAIL BOX CONTENT DIV -->
 </div></div>
</body>
</html>