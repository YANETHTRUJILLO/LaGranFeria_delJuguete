<?php
session_start();
$respuesta = new stdClass();

include_once('../conexion.php'); 

// Obtener el código de usuario (aunque aquí no se usa)
$cdusu = $_SESSION['cdusu'] ?? null;

// Actualizar todos los pedidos con estado = 1 → estado = 2
$sql = "UPDATE pedido SET estado = 2 WHERE estado = 1";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    $respuesta->state = false;
    $respuesta->detail = "Error en la consulta: " . $conn->error;
} else {
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        $respuesta->state = true;
        $respuesta->detail = "Pedido procesado con éxito";
    } else {
        $respuesta->state = false;
        $respuesta->detail = "No se pudo procesar el pedido o no había pedidos pendientes";
    }

    $stmt->close();
}

header('Content-Type: application/json');
echo json_encode($respuesta);
?>
