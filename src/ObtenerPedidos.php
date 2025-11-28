<?php
namespace App;

use PDO;

class ObtenerPedidos {

    public static function obtener($conn){
        $sql = "SELECT *, ped.estado estadoped FROM pedido ped
                INNER JOIN producto pro ON ped.cdpro=pro.cdpro
                WHERE ped.estado = 1";

        $stmt = $conn->prepare($sql);
        $stmt->execute();

        $datos = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $datos[] = [
                "cdped" => $row['cdped'],
                "cdpro" => $row['cdpro'],
                "nopro" => utf8_encode($row['nopro']),
                "costpro" => $row['costpro'],
                "rutimg" => $row['rutimg'],
                "fchped" => $row['fchped'],
                "dirpedusu" => utf8_encode($row['dirpedusu']),
                "celusuped" => $row['celusuped'],
                "estado" => EstadoUtils::estado2texto($row['estadoped']),
                "cantidad" => $row['cantidad'],
                "sub_total" => $row['sub_total']
            ];
        }

        return $datos;
    }
}
