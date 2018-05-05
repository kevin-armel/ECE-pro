<?php
session_start();
require './connexion.php';
$d= array();

if(!isset($_POST["action"])){
    $d['erreur'] = 'Erreur fatal';
}else{
    extract($_POST);
    $d["erreur"] = "dedans";
    /**
     * Action: addMessage
     *  ajout de message dans la base de donnee des messages
     */
    if($_POST["action"]=="addMessage"){
        debug_print_backtrace();
        $message= mysqli_escape_string($message);
        /*$sql = $bdd->prepare("INSERT INTO messageriemessagerie`(idUser, fileMessage, destinataireMessage, contenuMessage, receptionMessage, dateEmessage, dateRmessage, idGroupe) VALUES (?,?,?,?,?,now(),?,?)");
        if($sql->execute(array($_SESSION['id'], NULL, $_SESSION['iduserdest'], $message, 0, NULL, NULL))){
            $d["erreur"] = "ajout";
            
        }*/
    }
}

echo json_encode($d);

?>