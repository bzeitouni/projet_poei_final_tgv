<?php

$servername = "db";
$username = "webapp";
$password = "Bond@007";
$dbname = "tgv";


$link = mysql_connect($servername , $username, $password);
if (!$link) {
    die('Impossible de se connecter : ' . mysql_error());
}

// Rendre la base de donn�es foo, la base courante
$db_selected = mysql_select_db($dbname, $link);
if (!$db_selected) {
    die ('Impossible de s�lectionner la base de donn�es : ' . mysql_error());
}

?>