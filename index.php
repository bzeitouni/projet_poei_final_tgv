<?php

include "params.php";

Print "Bienvenue sur le site de la SNCF !";
Print  "</BR>";
echo  "Voici la liste des train TGV disponibles: </BR>";

// C'est la meilleur façon d'exécuter une requête SQL
// Pour plus d'exemples, voir mysql_real_escape_string()
$sql = "SELECT T.idtrain,G1.nomgare AS nomgaredepart,G2.nomgare AS nomgarearrivee,T.heuredepart,T.heurearrivee,TIMEDIFF(T.heurearrivee,T.heuredepart) AS duree\n"
. "FROM TGV T\n"
. "JOIN Gare G1 ON T.idgaredepart=G1.idgare\n"
. "JOIN Gare G2 ON T.idgarearrivee=G2.idgare\n"
. "ORDER BY `T`.`heuredepart`  ASC";

$result = $conn->query($sql);

echo "
<style>
    
table,
td {
    border: 1px solid #333;
}
    
thead,
tfoot {
    background-color: #333;
    color: #fff;
}
    
</style>";

echo "<table>
    <thead>
        <tr>
            <th colspan=\"6\">Tableau d'Affichage</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Numero de TGV</td>
            <td>Gare de Depart</td>
            <td>Gare d'Arrivee</td>
            <td>Date de Depart</td>
            <td>Date d'Arrivee</td>
            <td>Duree</td>
        </tr>";
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        
        echo "<td>".$row['idtrain']."</td>";
        echo "<td>".$row['nomgaredepart']."</td>";
        echo "<td>".$row['nomgarearrivee']."</td>";
        echo "<td>".$row['heuredepart']."</td>";
        echo "<td>".$row['heureearrivee']."</td>";
        echo "<td>".$row['duree']."</td>";
        echo "</tr>";
    }
} else {
    echo "0 results";
}
$conn->close();

echo "</tbody>
</table>";

echo  "A bientot sur nos lignes!</BR>";
echo  "La team SNCF.</BR>";

?>