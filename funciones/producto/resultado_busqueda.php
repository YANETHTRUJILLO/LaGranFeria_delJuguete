<?php
include('../conexion.php');

$respuesta = new stdClass();
$datos = array();

// Recibir texto desde POST o GET (evita errores)
$text = "";
if (isset($_POST['text'])) {
    $text = $_POST['text'];
} elseif (isset($_GET['busqueda'])) {
    $text = $_GET['busqueda'];
}

// DEBUG (ver si llega texto)
file_put_contents("debug.txt", "Texto recibido: " . $text);

// Consulta
$sql = "SELECT * FROM producto WHERE estado = 1 AND nopro LIKE '%$text%'";
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
        $datos[] = $obj;
    }
} else {
    file_put_contents("debug_sql_error.txt", $conn->error);
}

$respuesta->datos = $datos;

// Devolver JSON
header('Content-Type: application/json');
echo json_encode($respuesta);
?>
