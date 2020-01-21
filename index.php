<?php

include "params.php";

// C'est la meilleur façon d'exécuter une requête SQL
// Pour plus d'exemples, voir mysql_real_escape_string()
$query = "SELECT T.idtrain,G1.nomgare AS nomgaredepart,G2.nomgare AS nomgarearrivee,T.heuredepart,T.heurearrivee,TIMEDIFF(T.heurearrivee,T.heuredepart) AS duree\n"
. "FROM TGV T\n"
. "JOIN Gare G1 ON T.idgaredepart=G1.idgare\n"
. "JOIN Gare G2 ON T.idgarearrivee=G2.idgare\n"
. "ORDER BY `T`.`heuredepart`  ASC";

// Exécution de la requête
$result = mysql_query($query);

// Vérification du résultat
// Ceci montre la requête envoyée à MySQL ainsi que l'erreur. Utile pour déboguer.
if (!$result) {
    $message  = 'Requête invalide : ' . mysql_error() . "\n";
    $message .= 'Requête complète : ' . $query;
    die($message);
}

// Utilisation du résultat
// Tenter d'affichager $result ne vous donnera pas d'informations contenues dans la ressource
// Une des fonctions MySQL de résultat doit être utilisée
// Voir aussi mysql_result(), mysql_fetch_array(), mysql_fetch_row(), etc.

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
            <th colspan=\"5\">The table header</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Numéro de TGV</td>
            <td>Gare de Départ</td>
            <td>Gare d'Arrivée</td>
            <td>Date de Départ</td>
            <td>Date d'Arrivée</td>
            <td>Durée</td>
        </tr>";

while ($row = mysql_fetch_assoc($result)) {
    echo "<tr>";
    
    echo "<td>".$row['idtrain']."</td>";
    echo "<td>".$row['nomgaredepart']."</td>";
    echo "<td>".$row['nomgarearrivee']."</td>";
    echo "<td>".$row['heuredepart']."</td>";
    echo "<td>".$row['heureearrivee']."</td>";
    echo "<td>".$row['duree']."</td>";
    echo "</tr>";
}


echo "</tbody>
</table>";

// Libération des ressources associées au jeu de résultats
// Ceci est effectué automatiquement à la fin du script
mysql_free_result($result);
?>