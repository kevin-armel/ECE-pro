<!DOCTYPE html>
<?php
session_start(); 
    require_once 'connexion.php'; 
    
?>

<html lang="fr">
<head>
	<meta charset="UTF-8">
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
                    <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Menu</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                            </button>
                        <a class="navbar-brand" href="index.php"><img src="img/logo.png" data-active-url="img/logo-active.png" alt="ECE Professionnel"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right main-nav">
                            <li><a data-toggle="modal" data-target="#modal2" class="btn btn-blue">Connexion</a></li>
                            <li><a data-toggle="modal" data-target="#modal1" class="btn btn-blue">Inscription</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
    </nav>
    <header id="home">
        <div class="container">
            <div class="table">
                <div class="header-text">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h3 class="light white">Restez connecter!</h3>
                            <img class="light white" src="img/ecole.png"/><br/>
                            <h1 class="white typed">L'ECE Paris là où tout devient possible.</h1>
                            <span class="typed-cursor">_</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section>
            <div class="cut cut-top"></div>
    </section>


    <section class="section section-padded blue-bg">
            <div class="container">
                    <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                    <div class="owl-twitter owl-carousel">
                                            <div class="item text-center">
                                                    <i class="icon fa fa-twitter"></i>
                                                    <h4 class="white light">L’ECE Paris est une école d’ingénieurs généraliste.</h4>
                                                    <h4 class="light-white light"> L'ECE est située dans le 15ᵉ arrondissement de Paris et dans le 7ᵉ arrondissement de Lyon.</h4>
                                            </div>
                                            <div class="item text-center">
                                                    <i class="icon fa fa-twitter"></i>
                                                    <h4 class="white light">To enjoy the glow of good health, you must exercise.</h4>
                                                    <h4 class="light-white light">#health #training #exercise</h4>
                                            </div>
                                            <div class="item text-center">
                                                    <i class="icon fa fa-twitter"></i>
                                                    <h4 class="white light">To enjoy the glow of good health, you must exercise.</h4>
                                                    <h4 class="light-white light">#health #training #exercise</h4>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
    </section>

    <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                    <div class="modal-content modal-popup">
                        <a class="close-link close"><i class="icon_close_alt2"></i></a>
                        <h3 meth class="white">Connexion</h3>
                        <input name="mailC" id="mailC" value="" type="email" class="form-control form-white" placeholder="e-mail"><br/><br/>
                        <input name="passC" id="passC" type="password" class="form-control form-white" placeholder="mots de passe">
                        <button type="button" id="formconnexion" name="formconnexion" class="btn btn-submit">S'identifier</button>
                        <!--<input value="S'identifier" name="formconnexion" type="submit" class="btn btn-submit" />-->
                        <span id="informationc"><?php if(isset($erreur)){
                    echo '<em><i>Message: </i></em><font color="red">' .$erreur. "</font>";
                    } ?></span>
                    </div>
            </div>
    </div>

    <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-popup">
                <a class="close-link"><i class="icon_close_alt2"></i></a>
                <h3 class="white">Inscription</h3>
                <input name="prenomI" id="prenomI" value="<?php if(isset($prenom)) { echo $prenom;} ?>" type="text" class="form-control form-white" placeholder="Prénom"><br/><br/>
                <input name="nameI" id="nameI" value="<?php if(isset($prenom)) { echo $prenom;} ?>" type="text" class="form-control form-white" placeholder="Nom"><br/><br/>
                <input name="mailI" id="mailI" value="<?php if(isset($prenom)) { echo $prenom;} ?>" type="email" class="form-control form-white" placeholder="votre mail"><br/><br/>
                <input name="passI" id="passI" type="password" class="form-control form-white" placeholder="mot de passe"><br/><br/>
                <input name="passIconf" id="passIconf" type="password" class="form-control form-white" placeholder="Confirmer le mot de passe">
                <!--<input value="S'inscrire" name="forminscription" type="submit" class="btn btn-submit" />-->
                <button type="button" id="forminscription"  name="forminscription" class="btn btn-submit">S'inscrire</button>
                <span id="informationi"><?php if(isset($erreur)){
                    echo '<em><i>Message: </i></em><font color="red">' .$erreur. "</font>";
                    } ?></span>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 text-center-mobile">
                    <h3 class="white">Pour plus d'informations, vous rapprocher de la scolarité!</h3>
                    <h5 class="light regular light-white">Ou remplisser le formulaire de contact.</h5>
                    <a href="#" class="btn btn-blue ripple trial-button">Start Free Trial</a>
                </div>
                <div class="col-sm-6 text-center-mobile">
                    <h3 class="white">Horaires d'ouverture <span class="open-blink"></span></h3>
                    <div class="row opening-hours">
                        <div class="col-sm-6 text-center-mobile">
                            <h5 class="light-white light">Lundi - Vendredi</h5>
                            <h3 class="regular white">8:00 - 17:00</h3>
                        </div>
                        <div class="col-sm-6 text-center-mobile">
                            <h5 class="light-white light">Samedi - Dimanche</h5>
                            <h3 class="regular white">10:00 - 14:00</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row bottom-footer text-center-mobile">
                <div class="col-sm-8">
                    <p>&copy; 2015 All Rights Reserved. Powered by <a href="http://www.phir.co/">PHIr</a> exclusively for <a href="http://tympanus.net/codrops/">Codrops</a></p>
                </div>
                <div class="col-sm-4 text-right text-center-mobile">
                    <ul class="social-footer">
                        <li><a href="https://www.facebook.com/ECE.Paris" target="_blanck" ><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://www.linkedin.com/school/ece-paris/" target="_blanck" ><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="https://plus.google.com/u/0/101882693187144496156" target="_blanck" ><i class="fa fa-google-plus"></i></a></li>
                    </ul>
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
        <script> 
    $(document).ready(function(){
        $('#formconnexion').click(function(){
             //alert("connecté");
            var emailc = $('#mailC').val();
            var passc = $('#passC').val();
            
            if((emailc != '') && (passc != '')){
                $.ajax({
                    url: "action.php",
                    method: "POST",
                    cache: false,
                    data: {emailc:emailc, passc:passc},
                    success:function(data){
                        //alert(emailc+' /' + data);
                        console.log(data);
                        if(data == ''){
                           alert("connecté");
                            //document.location.href("accueil.php");
                        }else{
                            //location.reload();
                        }
                    }
                });
            }
            
        });
        
        $('#forminscription').click(function (){
            var emaili = $('#mailI').val();
            var passi = $('#passI').val();
            var prenomi = $('#prenomI').val();
            var nomi = $('#nomI').val();
            var passiconf = $('#passIconf').val();
            if(passi!='' && prenomi!='' && nomi!=''){
                if(passi == passiconf){
                $.ajax({
                         url: "action.php",
                         method: "POST",
                         data: {emaili:emaili, passi:passi, prenomi:prenomi, nomi:nomi},
                         success:function(data){
                             alert("Mauvaise entrée");/*if(data == 'no'){
                                 alert("Mauvaise entrée");
                             }else
                                 alert('ok');//document.location.href("./accueil.php")*/
                         }
                     });
                 }else alert("Les mots de passe sont différents");
            }
        });
        
        
        
    });
        </script>
        
</body>

</html>
