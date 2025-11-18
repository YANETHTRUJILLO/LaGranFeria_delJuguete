<?php
// Incluir el archivo de conexión
include('../conexion.php');

header('Content-Type: application/json');

try {
    // Consulta SQL para obtener los colores únicos
    $query = "SELECT DISTINCT color FROM producto";

    // Preparar la consulta
    $stmt = $conn->prepare($query);

    if (!$stmt) {
        echo json_encode(["error" => "Error al preparar la consulta"]);
        exit;
    }

    // Ejecutar
    $stmt->execute();

    // Obtener resultados
    $result = $stmt->get_result();
    $colores = [];

    while ($row = $result->fetch_assoc()) {
        $colores[] = $row;
    }

    // Enviar respuesta
    echo json_encode($colores);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
