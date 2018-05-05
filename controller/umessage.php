<?php

/**
 * Description of umessage
 *
 * les messages de l'utilisateur
 */
class umessage {
    
    private $idMessage;
    private $idUser;
    private $fileMessage;
    private $destinataireMessage;
    private $contenuMessage;
    private $receptionMessage;
    private $dateEmessage;
    private $dateRmessage;
    private $idGroupe;
    
    public function inserMessage($idUser, $fileMessage, $destinataireMessage, $contenuMessage, $receptionMessage, $idGroupe){
        $isInsert = false;
        $sql = $bdd->prepare("INSERT INTO messageriemessagerie`(idUser, fileMessage, $destinataireMessage, contenuMessage, receptionMessage, dateEmessage, dateRmessage, idGroupe) VALUES (?,?,?,?,?,now(),?,?)");
        if($sql->execute(array($idUser, $fileMessage, $destinataireMessage, $contenuMessage, 0, NULL, NULL))){
           
          $isInsert = true;
        }else{
            $isInsert = false;
        }
        return $isInsert;
    }
            
    
    function getIdMessage() {
        return $this->idMessage;
    }

    function getIdUser() {
        return $this->idUser;
    }

    function getFileMessage() {
        return $this->fileMessage;
    }

    function getDestinataireMessage() {
        return $this->destinataireMessage;
    }

    function getContenuMessage() {
        return $this->contenuMessage;
    }

    function getReceptionMessage() {
        return $this->receptionMessage;
    }

    function getDateEmessage() {
        return $this->dateEmessage;
    }

    function getDateRmessage() {
        return $this->dateRmessage;
    }

    function getIdGroupe() {
        return $this->idGroupe;
    }

    function setFileMessage($fileMessage) {
        $this->fileMessage = $fileMessage;
    }

    function setDestinataireMessage($destinataireMessage) {
        $this->destinataireMessage = $destinataireMessage;
    }

    function setContenuMessage($contenuMessage) {
        $this->contenuMessage = $contenuMessage;
    }

    function setReceptionMessage($receptionMessage) {
        $this->receptionMessage = $receptionMessage;
    }

    function setDateEmessage($dateEmessage) {
        $this->dateEmessage = $dateEmessage;
    }

    function setDateRmessage($dateRmessage) {
        $this->dateRmessage = $dateRmessage;
    }
}
