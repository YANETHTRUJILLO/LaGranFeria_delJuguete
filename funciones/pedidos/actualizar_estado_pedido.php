<?php
// actualizar_estado_pedido.php

include_once('../conexion.php');

$respuesta = ['success' => false];

// Verificar si se ha enviado el estado del pedido
if (isset($_POST['estado'])) {
    $nuevoEstado = $_POST['estado'];

    // Validar estado
    if ($nuevoEstado === 'Pendiente de Pago') {

        $valorEstado = 2; // Código en BD

        // Consulta SQL
        $sql = "UPDATE pedido SET estado = ?";

        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            $respuesta['error'] = "Error al preparar la consulta: " . $conn->error;
            echo json_encode($respuesta);
            exit;
        }

        // Enlace de parámetros
        $stmt->bind_param("i", $valorEstado);

        if ($stmt->execute()) {
            $respuesta['success'] = true;
        } else {
            $respuesta['error'] = "Error al ejecutar la consulta: " . $stmt->error;
        }

        $stmt->close();

    } else {
        $respuesta['error'] = "Estado no válido";
    }
} else {
    $respuesta['error'] = "No se recibió el estado";
}

echo json_encode($respuesta);

$conn->close();
?>
