<!DOCTYPE html>
<?php
 session_start();?>
<html lang="fr">

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
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
	</div>
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
                                    <li><a href="accueil.php">Accueil</a></li> <!-- id=home -->
                                    <li><a href="reseau.php">Mon Réseau</a></li>
                                    <li><a href="messagerie.php">Messagerie</a></li>
                                    <li><a href="notification.php">Notifications</a></li>
                                    <li><a href="emploi.php">Emploi</a></li>
                                    <li><a href="presentation.php"><?php if(isset($_SESSION['id'])) {echo $_SESSION['prenom'];}else{echo'Inconnu';} ?></a></li>
                                    <li><a href="#" id="lienlogout" class="btn btn-blue">Déconnexion</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header id="intro">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
							<h3 class="light white">Rester connecter.</h3>
                                                        <img class="light white" src="img/ecole.png"/><br/>
							<h1 class="white typed">L'ECE Paris là où tout devient possible.</h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section id="team" class="section gray-bg">
            <div class="container">
                <div class="row title text-center">
                    <h2 class="margin-top">Mon Réseau</h2>
                    <h3 class="light muted">Développer votre réseau selon votre carrière</h3>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="team text-center">
                            <div class="cover" style="background:url('img/team/team-cover1.jpg'); background-size:cover;">
                                <div class="overlay text-center">
                                    <h4 class="white">son grade</h4>
                                </div>
                            </div>
                            <img src="img/team/team3.jpg" alt="Team Image" class="avatar">
                            <div class="title">
                                    <h4>Son nom et prenom</h4>
                                    <h5 class="muted regular">ses competences</h5>
                            </div>
                            <button data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill">Se connecter</button>
                        </div>
                    </div>
                </div>
            </div>
	</section>

	<footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 text-center-mobile">
                        <h3 class="white">Je développe mon réseau en fonction de mon projet.</h3>
                        <h5 class="light regular light-white">Partager ce que vous avez de plus beaux, et recever ce que vous n'expérez jamais recevoir.</h5>
                    </div>

                </div>
                <div class="row bottom-footer text-center-mobile">
                    <div class="col-sm-10">
                            <p>&copy; 2015 All Rights Reserved. Powered by <a href="http://www.phir.co/">PHIr</a> exclusively for <a href="http://tympanus.net/codrops/">Codrops</a></p>
                    </div>
                </div>
            </div>
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/typewriter.js"></script>
	<script src="js/jquery.onepagenav.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
