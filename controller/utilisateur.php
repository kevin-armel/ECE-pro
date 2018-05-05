<?php
require_once '../connexion.php';
/**
 * Description of utilisateur
 *
 * class utilisateur
 */
class utilisateur {
    private $idUser;
    private $nomUser;
    private $prenomUser;
    private $grade_user;
    private $mailUser;
    private $competenceUser;
    private $adresseUser;
    private $roleUser;
    private $mdpUser;
    private $avatarUser;
    private $projetUser;
    private $activerUser;
    
    public function __construct() {
        
    }
    
    public function chargerInfosUser($mail){
        $use = $bdd->prepare("SELECT * FROM utilisateur WHERE mailUser= ?");
        $use->execute(array($mail));

        while ($infosuser = $use->fetch()){
            $this->idUser = $infosuser['idUser'];
            $this->nomUser = $infosuser['nomUser'];
            $this->prenomUser = $infosuser['prenomUser'];
            $this->mailUser = $infosuser['mailUser'];
            $this->projetUser = $infosuser['projetUser'];
            $this->grade_user = $infosuser['grade_user'];
            $this->competenceUser = $infosuser['competenceUser'];
            $this->adresseUser = $infosuser['adresseUser'];
            $this->roleUser = $infosuser['roleUser'];
            $this->activerUser = $infosuser['activerUser'];
            $this->avatarUser = $infosuser['avatarUser'];
            
            $_SESSION['id'] = $this->getIdUser();
            $_SESSION['nom'] = $this->getNomUser();
            $_SESSION['prenom'] = $this->getPrenomUser();
            $_SESSION['mail'] = $this->getMailUser();
        }
        
    }

    public function insertUser($nom, $prenom, $mail, $mdp) {
        $isInsert = false;
        $mdp = sha1($mdp);
        $requette =$bdd->prepare("INSERT INTO utilisateur(nomUser, prenomUser, grade_user, mailUser, competenceUser, adresseUser, roleUser, mdpUser, avatarUser, projetUser, activerUser) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"); 
        if($requette->execute(array($nom, $prenom, NULL, $mail, NULL, NULL, 'ROLE_ADMIN', $mdp, NULL, NULL, 0))){
            $this->chargerInfosUser($mail);
            
        
            $isInsert = true;
        }else{
            $isInsert = false;
        }
        return $isInsert;
    }
    
    
    function getIdUser() {
        return $this->idUser;
    }

    function getNomUser() {
        return $this->nomUser;
    }

    function getPrenomUser() {
        return $this->prenomUser;
    }

    function getGrade_user() {
        return $this->grade_user;
    }

    function getMailUser() {
        return $this->mailUser;
    }

    function getCompetenceUser() {
        return $this->competenceUser;
    }

    function getAdresseUser() {
        return $this->adresseUser;
    }

    function getRoleUser() {
        return $this->roleUser;
    }

    function getMdpUser() {
        return $this->mdpUser;
    }

    function getAvatarUser() {
        return $this->avatarUser;
    }

    function getProjetUser() {
        return $this->projetUser;
    }

    function getActiverUser() {
        return $this->activerUser;
    }

    function setIdUser($idUser) {
        $this->idUser = $idUser;
    }

    function setNomUser($nomUser) {
        $this->nomUser = $nomUser;
    }

    function setPrenomUser($prenomUser) {
        $this->prenomUser = $prenomUser;
    }

    function setGrade_user($grade_user) {
        $this->grade_user = $grade_user;
    }

    function setMailUser($mailUser) {
        $this->mailUser = $mailUser;
    }

    function setCompetenceUser($competenceUser) {
        $this->competenceUser = $competenceUser;
    }

    function setAdresseUser($adresseUser) {
        $this->adresseUser = $adresseUser;
    }

    function setRoleUser($roleUser) {
        $this->roleUser = $roleUser;
    }

    function setMdpUser($mdpUser) {
        $this->mdpUser = $mdpUser;
    }

    function setAvatarUser($avatarUser) {
        $this->avatarUser = $avatarUser;
    }

    function setProjetUser($projetUser) {
        $this->projetUser = $projetUser;
    }

    function setActiverUser($activerUser) {
        $this->activerUser = $activerUser;
    }


    
}
