<?php


/**
 * Description of Database
 *
 */
class Database {
    
    private $bdd;


    public function __construct($username, $password, $data_base='ece-pro') {
        $dsn = "mysql:host=localhost;dbname="+ $data_base;
        

        $this->bdd = new PDO($dsn, $username, $password);

        $this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->bdd->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
    }

    public function query($statment, $parameters){
        $req = $this->bdd->prepare($statment);
        $req->execute($parameters);
        
        return $req;
    }
}
