<?php
// Incluir el archivo de conexión
include('../conexion.php');

header('Content-Type: application/json');

try {
    // Consulta SQL para obtener las marcas únicas
    $query = "SELECT DISTINCT marca FROM producto";

    // Preparar la consulta
    $stmt = $conn->prepare($query);

    if (!$stmt) {
        echo json_encode(["error" => "Error al preparar la consulta"]);
        exit;
    }

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener resultados
    $result = $stmt->get_result();
    $marcas = [];

    while ($row = $result->fetch_assoc()) {
        $marcas[] = $row;
    }

    // Enviar los resultados como respuesta JSON
    echo json_encode($marcas);

    $stmt->close();
    $conn->close();

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
