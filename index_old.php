<?php
$servername = "db";
$username = "webapp";
$password = "Bond@007";
$dbname = "tgv";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

Print "Bienvenue sur le site de la SNCF !";
Print  "</BR>";
echo  "Voici la liste des train TGV disponibles: </BR>";

$sql = "SELECT T.idtrain,G1.nomgare AS nomgaredepart,G2.nomgare AS nomgarearrivee,T.heuredepart,T.heurearrivee,TIMEDIFF(T.heurearrivee,T.heuredepart) AS duree\n"  
. "FROM TGV T\n"     
. "JOIN Gare G1 ON T.idgaredepart=G1.idgare\n"           
. "JOIN Gare G2 ON T.idgarearrivee=G2.idgare\n"              
. "ORDER BY `T`.`heuredepart`  ASC";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
	// output data of each row
	while($row = $result->fetch_assoc()) {
    	echo "Train TGV Numéro n° " . $row["idtrain"]
    	." - Gare de Départ: " . $row["nomgaredepart"]."\t" 
    	." - Gare d'Arrivée: " . $row["nomgarearrivee"]."\t" 
    	." - Date de Départ: " . $row["heuredepart"]."\t"
        ." - Date d'Arrivée: " . $row["heureearrivee"]."\t" 
        ." - Durée: " . $row["duree"]. "<br>";
	}
} else {
	echo "0 results";
}
$conn->close();

echo  "A bientot sur nos lignes.\nLa team SNCF</BR>";
?>