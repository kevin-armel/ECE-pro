<?php

$dsn = "mysql:host=localhost;dbname=ece-pro";
$username = "root";
$password = "";

$bdd = new PDO($dsn, $username, $password);

$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);