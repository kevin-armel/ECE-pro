<?php
session_start();
    include 'connexion.php'; 
   
    if(isset($_POST['formconnexion']))
    {
        
        //$passC = htmlspecialchars($_POST['passC']);
        $mailC = htmlspecialchars($_POST['mailC']);
        $passC = sha1($_POST['passC']);
        if(filter_var($mailC, FILTER_VALIDATE_EMAIL)){
            $existuser = $bdd->prepare("SELECT * FROM utilisateur WHERE mailUser= ? AND mdpUser= ?");
            $existuser->execute(array($mailC, $passC));
            $nbruser = $existuser->rowCount();
            if($nbruser == 1){
                $userconnect = new utilisateur();
                $userconnect->chargerInfosUser($mailC);
                header("Location: accueil.php?cle=".$_SESSION['id']);
                //echo 'oui';
            }else{
                //echo 'non';
            }
        } 
    }
    
    if(isset($_POST['forminscription']))
    {
        
        $nom = htmlspecialchars($_POST['nameI']);
        $prenom = htmlspecialchars($_POST['prenomI']);
        $mail = htmlspecialchars($_POST['mailI']);
        $pass = sha1($_POST['passI']);
        if(filter_var($mail, FILTER_VALIDATE_EMAIL)){
            $existmail = $bdd->prepare("SELECT * FROM utilisateur WHERE mailUser= ?");
            $existmail->execute(array($mail));
            $nbrmail = $existmail->rowCount();
            if($nbrmail == 0){
                $actuelUser = new utilisateur();
                if($actuelUser->insertUser($nom, $prenom,$mail,$pass)){
                    //header('Location: accueil.php');
                    echo 'yes';
                }else{
                    echo 'no';
                    //header('Location: index.php');
                }
                    
            }else{
                $erreur = "Utilisateur dejà existant !";
                }
        } else {
                $erreur = "Certains champs ne sont pas correctement remplis";
            }
    }
    
    
    if(isset($_POST['lienlogout']))
    {
        unset($_SESSION['id']);
        unset($_SESSION['nom']);
        unset($_SESSION['prenom']);
        unset($_SESSION['mail']);
        unset($_SESSION['pseudo']);
        session_abort();
    }

?>