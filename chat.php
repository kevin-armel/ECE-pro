<?php
session_start();
include './connexion.php';
$_SESSION['id'] = 1;
$stmt = $bdd->prepare("SELECT * FROM utilisateur where idUser = ?");
if ($stmt->execute(array($_SESSION['id']))) {
  while ($row = $stmt->fetch()) {
    $_SESSION['nom'] = $row['nomUser'];
    $_SESSION['prenom'] = $row['prenomUser'];
    $_SESSION['mail'] = $row['mailUser'];
  }
}

$nom = $_SESSION['nom'];
$prenom = $_SESSION['prenom'];

$_SESSION['pseudo'] = $prenom. ' ' .$nom ;
?>

<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>chat</title>
        <script src="js/jquery-1.11.1.min.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/ionicons.css" rel="stylesheet" />
        <link href="css/font-awesome.css" rel="stylesheet" />
        <!--<link href="assets/js/source/jquery.fancybox.css" rel="stylesheet" />-->
        <link href="css/animations.min.css" rel="stylesheet" />
        <link href="css/style-blue.css" rel="stylesheet" />
        <link href="css/owl.css" rel="stylesheet" />
        <link href="css/buttonLoader.css" rel="stylesheet"/>
        <!--<link rel="stylesheet" href="font-awesome.min.css">
        <script src="js/jquery.buttonLoader.js"></script>

        
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/typewriter.js"></script>
        <script src="js/jquery.onepagenav.js"></script>
        <script src="js/main.js"></script>-->
        <script src="js/chat.js"></script>
    </head>
    <body data-spy="scroll" data-target="#menu-section">
        <div class="navbar navbar-inverse navbar-fixed-top scroll-me" id="menu-section" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">ECE-Pro</a>
                </div>
                <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                <li><a href="#home">HOME</a></li>
                <li><a href="#services">SERVICES</a></li>
                <li><a href="#pricing">PRICING</a></li>
                <li><a href="#work">WORK</a></li>
                <li><a href="#team">TEAM</a></li>
                <li><a href="#grid">GRID</a></li>
                <li><a href="#contact">CONTACT</a></li>
                </ul>
                </div>
            </div>
        </div>
        <div id="conteneur">
            <h2><?php echo "Speudo:" .$_SESSION['pseudo']; ?></h2>
            <div id="chat">
                <?php
                    $stmt1 = $bdd->prepare("SELECT DISTINCT * FROM messagerie WHERE idUser= ? OR destinataireMessage=? ORDER BY dateEmessage ASC LIMIT 10");
                    if ($stmt1->execute(array($_SESSION['id'], $_SESSION['id']))) {
                        while ($data = $stmt1->fetch()) {
                            $idusersender = $data['destinataireMessage'];
                            if($idusersender != $_SESSION['id']){
                                $_SESSION['iduserdest'] = $idusersender;
                                $stmt2 = $bdd->prepare("SELECT * FROM utilisateur where idUser = ?");
                                if ($stmt2->execute(array($idusersender))) {
                                    while ($row = $stmt2->fetch()) {
                                    $nomusersender = $row['nomUser'];
                                    $prenomusersender = $row['prenomUser'];
                                    }
                                    $pseudousersender = $prenomusersender.' '.$nomusersender;
                                }
                            }else {$pseudousersender = $_SESSION['pseudo'];}
                                
                             if($_SESSION['id']==$data['destinataireMessage']){?>
                             <p style="text-align: right; background-color: red"><strong><?php echo $pseudousersender; ?>: </strong> <span><?php echo htmlentities($data['contenuMessage']); ?></span></p>
                             <?php } if($_SESSION['id']==$data['idUser']){?>
                             <p style="text-align: left; background-color: green"><strong><?php echo $pseudousersender; ?>: </strong> <span><?php echo htmlentities($data['contenuMessage']); ?></span></p>
                             
                            <?php
                             }
                                
                            }
                            
                        }
                ?>
            </div>
            <div id="chatform" style="position: fixed; bottom: 0; width: 100%;">
                <form method="POST" action="#">
                    <div style="margin-right:110px;">
                        <textarea name="message" style="width: 100%; color: black;" placeholder="Ecriver votre message"></textarea>
                    </div>
                    <div style="position: absolute; top: 12px; right: 0;">
                        <input type="submit" class="btn btn-success has-spinner" value="Envoyer"/>
                    </div>
                </form>
            </div>
        </div>
        
    </body>
</html>