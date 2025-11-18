<?php
// actualizar_subtotal_pedido.php

include('conexion.php');

// Validar datos recibidos
$cdped = $_POST['cdped'] ?? null;
$sub_total = $_POST['sub_total'] ?? null;

if (!$cdped || !$sub_total) {
    http_response_code(400);
    echo "Faltan parámetros";
    exit;
}

// Preparar consulta
$sql = "UPDATE pedido SET sub_total = ? WHERE cdped = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    http_response_code(500);
    echo "Error al preparar la consulta: " . $conn->error;
    exit;
}

// Bind de parámetros
$stmt->bind_param("di", $sub_total, $cdped); 
// d = double (sub_total), i = int (cdped)

// Ejecutar
if ($stmt->execute()) {
    http_response_code(200);
} else {
    http_response_code(500);
    echo "Error al actualizar el subtotal: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
