<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>
<head><title>Webserver test page</title>
<style>
th { text-align: left; }

table, th, td {
  border: 2px solid grey;
  border-collapse: collapse;
}

th, td {
  padding: 0.2em;
}
</style>
</head>

<body>
<h1>Webserver test page.</h1>
<body>
	<div id="main">
	<h1>Papers Database</h1>
	<div id="websiteuserinput">
	<h2>Add new papers to the database using the form below.</h2>
	<hr/>
	<form action="" method="post">
	<label>Paper Code:</label>
	<input type="text" name="code" id="code" required="required" placeholder="Enter paper code here"/><br /><br />
	<label>Paper Name:</label>
	<input type="text" name="name" id="name" required="required" placeholder="Enter paper name here"/><br/><br />

	<input type="submit" value=" Submit " name="submit"/><br />
	</form>
	</div>

<?php
if(isset($_POST["submit"])){ 
  $db_host   = '192.168.56.12';
  $db_name   = 'fvision';
  $db_user   = 'webuser';
  $db_passwd = 'insecure_db_pw';
  

$pdo_dsn = "mysql:host=$db_host;dbname=$db_name";

$pdo = new PDO($pdo_dsn, $db_user, $db_passwd);

$sql = "INSERT INTO papers (code , name)
VALUES ('".$_POST["code"]."','".$_POST["name"]."')";



</body>
</html>
