<?php
include('../conexion.php');

$respuesta = new stdClass();

function estado2texto($id) {
    switch ($id) {
        case '1': return 'Por procesar';
        case '2': return 'Por pagar';
        default:  return 'Estado desconocido';
    }
}

$datos = array();

$sql = "SELECT ped.*, ped.estado AS estadoped, pro.nopro, pro.costpro, pro.rutimg
        FROM pedido ped
        INNER JOIN producto pro ON ped.cdpro = pro.cdpro
        WHERE ped.estado = 1";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Error al preparar consulta: " . $conn->error);
}

$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $obj = new stdClass();
    
    $obj->cdped      = $row['cdped'];
    $obj->cdpro      = $row['cdpro'];
    $obj->nopro      = utf8_encode($row['nopro']);
    $obj->costpro    = $row['costpro'];
    $obj->rutimg     = $row['rutimg'];
    $obj->fchped     = $row['fchped'];
    $obj->dirpedusu  = utf8_encode($row['dirpedusu']);
    $obj->celusuped  = $row['celusuped'];
    $obj->estado     = estado2texto($row['estadoped']);
    $obj->cantidad   = $row['cantidad'];
    $obj->sub_total  = $row['sub_total'];

    $datos[] = $obj;
}

$respuesta->datos = $datos;

$stmt->close();
$conn->close();

header('Content-Type: application/json');
echo json_encode($respuesta);
