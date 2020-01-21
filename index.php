<?php

include "params.php";

// C'est la meilleur fa�on d'ex�cuter une requ�te SQL
// Pour plus d'exemples, voir mysql_real_escape_string()
$query = "SELECT T.idtrain,G1.nomgare AS nomgaredepart,G2.nomgare AS nomgarearrivee,T.heuredepart,T.heurearrivee,TIMEDIFF(T.heurearrivee,T.heuredepart) AS duree\n"
. "FROM TGV T\n"
. "JOIN Gare G1 ON T.idgaredepart=G1.idgare\n"
. "JOIN Gare G2 ON T.idgarearrivee=G2.idgare\n"
. "ORDER BY `T`.`heuredepart`  ASC";

// Ex�cution de la requ�te
$result = mysql_query($query);

// V�rification du r�sultat
// Ceci montre la requ�te envoy�e � MySQL ainsi que l'erreur. Utile pour d�boguer.
if (!$result) {
    $message  = 'Requ�te invalide : ' . mysql_error() . "\n";
    $message .= 'Requ�te compl�te : ' . $query;
    die($message);
}

// Utilisation du r�sultat
// Tenter d'affichager $result ne vous donnera pas d'informations contenues dans la ressource
// Une des fonctions MySQL de r�sultat doit �tre utilis�e
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
            <td>Num�ro de TGV</td>
            <td>Gare de D�part</td>
            <td>Gare d'Arriv�e</td>
            <td>Date de D�part</td>
            <td>Date d'Arriv�e</td>
            <td>Dur�e</td>
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

// Lib�ration des ressources associ�es au jeu de r�sultats
// Ceci est effectu� automatiquement � la fin du script
mysql_free_result($result);
?>