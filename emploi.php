<?
session_start()

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ECE Professionel</title>
	<link rel="apple-touch-icon" sizes="57x57" href="img/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="img/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="img/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="img/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="img/favicons/manifest.json">
	<link rel="shortcut icon" href="img/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<!-- Normalize -->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="css/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="fonts/eleganticons/et-icons.css">
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="css/cardio.css">
</head>

<body>
	
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="img/logo.png" data-active-url="img/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					                <li><a href="index.php"class="btn btn-blue">Accueil</a></li> <!-- id=home -->
                                    <li><a href="reseau.php"class="btn btn-blue">Mon Réseau</a></li>
                                    <li><a href="messagerie.php"class="btn btn-blue">Messagerie</a></li>
                                    <li><a href="notification.php"class="btn btn-blue">Notifications</a></li>
                                    <li><a href="emploi.php"class="btn btn-blue">Emploi</a></li>
                                    <li><a href="presentation.php"class="btn btn-blue">Moi</a></li>
					<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign Up</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>	
	    <section id="team" class="section section-padded blue-bg">
		
		<div class="row title text-center">
			    <h2 class="margin-bottom">Votre offre</h2> 
	    </div>	
		
		<div class="row-md-12">
				

				<div class="col-md-12">
					<div class="team text-center">
						
						<img src="img/team/team3.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4> <?while ($donnees = $reponse->fetch()){echo $donnees['intituleEmploi'] }$reponse->closeCursor();?><h4>
							<h5 class="muted regular"><?while ($donnees = $reponse->fetch()){echo $donnees['referenceEmploi']; }$reponse->closeCursor();?></h5>
							<!-- ici on mets toutes les donnees propres a l'emploi -->
						</div>
						
					</div>
				</div>
		</div>
		
<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Conctat our support team!</h3>
					<h5 class="light regular light-white">Any Help?</h5>
					<a href="#" class="btn btn-blue ripple trial-button">Support</a>
				</div>
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Opening Hours <span class="open-blink"></span></h3>
					<div class="row opening-hours">
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Mon - Fri</h5>
							<h3 class="regular white">9:00 - 22:00</h3>
						</div>
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Sat - Sun</h5>
							<h3 class="regular white">10:00 - 18:00</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row bottom-footer text-center-mobile">
				<div class="col-sm-8">
					<p>&copy; 2018 All Rights Reserved. Powered by <a href="http://www.ece.fr/">ECE</a> </p>
				</div>
				<div class="col-sm-4 text-right text-center-mobile">
					<ul class="social-footer">
						<li><a href="http://www.facebook.com/pages/Codrops/159107397912"><i class="fa fa-facebook"></i></a></li>
						<li><a href="http://www.twitter.com/codrops"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://plus.google.com/101095823814290637419"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	</body>