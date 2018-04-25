<!doctype html>
<html lang="en">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<?php
/**
 * Created by PhpStorm.
 * User: super
 * Date: 4/21/2018
 * Time: 5:59 PM
 */

$user = 'SuperNinjaFat';
$password = 'root';
$db = 'inventory';
$host = 'localhost';
$port = 3306;

$link = mysqli_init();
$success = mysqli_real_connect(
    $link,
    $host,
    $user,
    $password,
    $db,
    $port
);

?>
<head>
    <link rel="stylesheet" type="text/css" href="home.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<div class="container"> <!-- This is going to push everything to the center -->
	<div class="card-header">
		<h1 class="display-1`">Steveaul</h1>
		<h3 class="font-weight-light lead">twitter clone</h3>
		<a class="badge badge-light" href="/signup.php">Signup</a>
	</div>


	<!--PASTED CODE FROM PAUL's JAVASCRIPT IFRAME CONCEPT-->
	<p>Click the Login tab to toggle its respective window. You can also close it.</p>

	<a id="logintab" class="tab">Login</a>
	<div id="mydiv">
		<header>
			<div id="mydivheader">Login<span id="mydivclose" class="close">&times;</span></div>
		</header>
		<iframe id="myFrame" src="login.php" style="height:380px;width:100%"></iframe>
	</div>


	<script>
		var closebtns = document.getElementsByClassName("close");
		var i;
		var frameVar = document.getElementById("myFrame");
		var text_to_change = document.getElementById("mydivheader").childNodes[0];
		for (i = 0; i < closebtns.length; i++) {
			closebtns[i].addEventListener("click", function() {
				this.parentElement.parentElement.parentElement.style.display = 'none';
			});
		}

		//for "Login":
		var loginvar = document.getElementById("logintab");
		var loginbox = document.getElementById("mydivheader");
		loginvar.addEventListener("click", function() {
			loginbox.parentElement.parentElement.style.display = loginbox.parentElement.parentElement.style.display === 'block' ? 'none' : 'block';
			var text_to_change = document.getElementById("mydivheader").childNodes[0];
			text_to_change.nodeValue = document.getElementById("logintab").innerHTML;
		});
	</script>
	<nav class="navbar bg-light"><span class="navbar-brand mb-0 h1">Timeline:</span></nav>
	<div class="container-fluid" id="message-feed">
	<!--    EXAMPLE CARD-->
		<div class="card">
			<div class="card-body">
				<div id="messagename" class="card-title">SuperNinjaFat</div>
				<a href="#" class="badge badge-primary">Original Tweet (From: STEVEN)</a>
				<p>I like pie</p>
				<p>I like icecream</p>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<div id="messagename" class="card-title">SuperNinjaFat</div>
				<p>I like icecream</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
