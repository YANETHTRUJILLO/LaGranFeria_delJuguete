<?php
include('../conexion.php');

$respuesta = new stdClass();
$datos = array();

// Consulta
$sql = "SELECT * FROM producto WHERE estado = 1";
$result = $conn->query($sql);

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $obj = new stdClass();
        $obj->cdpro = $row['cdpro'];
        $obj->nopro = $row['nopro'];
        $obj->despro = $row['despro'];
        $obj->costpro = $row['costpro'];
        $obj->rutimg = $row['rutimg'];
        $obj->stock = isset($row['stock']) ? $row['stock'] : 0;
        $obj->descrip = isset($row['descrip']) ? $row['descrip'] : "";
        $datos[] = $obj;
    }
} else {
    // DEBUG de error SQL
    file_put_contents("debug_sql_obtener_productos.txt", $conn->error);
}

$respuesta->datos = $datos;

// Enviar JSON
header('Content-Type: application/json');
echo json_encode($respuesta);

$conn->close();
?>
