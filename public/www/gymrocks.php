<?php

$to = "it@tricksgym.com";
$subject = "Gymnastics Rocks";
$email = $_REQUEST['email'] ;
$fname = $_REQUEST['fname'] ;
$lname = $_REQUEST['lname'] ;
$gname = $_REQUEST['gname'] ;
$gym = $_REQUEST['gym'] ;
$phone = $_REQUEST['phone'] ;
$message = "First Name: " . $_REQUEST['fname'] . " Last Name: " . $_REQUEST['lname'] . " Gymnast Name: " . $_REQUEST['gname'] . " Gym: " . $_REQUEST['gym'] . " Phone Number: " . $_REQUEST['phone'] . " Email: " . $_REQUEST['email'] . " Graphic Number: " . $_REQUEST['graph'] . " Message: " . $_REQUEST['message'];
$message2 = $_REQUEST['message'] ;
$headers = "From: $email";
$sent = mail($to, $subject, $message, $headers) ;
if($sent)
{
   echo '<META HTTP-EQUIV="Refresh" Content="0; URL=payment.html">';    
   exit;  
}
else
{print "We encountered an error sending your mail"; }

?>