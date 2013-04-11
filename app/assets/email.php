<?php
$to = "it@tricksgym.com";
$subject = "Website Email Submission";
$email_address = $_REQUEST['email'] ;
$message = $_REQUEST['email'] ;
$headers = "From: $email_address";
if (filter_var($email_address, FILTER_VALIDATE_EMAIL)) 
	{
 		// The email address is valid
		echo '<META HTTP-EQUIV="Refresh" Content="0; URL=thankyou.html">';   
		exit;  
	}
else 
	{
  		print "The e-mail address you input was not valid, please go back and try again."; 
		<script>alert('Something went wrong!');</script>
	}

?>