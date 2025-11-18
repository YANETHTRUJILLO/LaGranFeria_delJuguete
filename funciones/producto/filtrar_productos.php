<?php
include('../conexion.php');

$marca = $_POST['marca'] ?? '';
$color = $_POST['color'] ?? '';

// Base de la consulta
$sql = "SELECT * FROM producto WHERE estado = 1";

// Agregar filtros dinámicamente
$conditions = [];

if (!empty($marca)) {
    $conditions[] = "marca = ?";
}
if (!empty($color)) {
    $conditions[] = "color = ?";
}

// Si hay condiciones, se agregan a la consulta
if (!empty($conditions)) {
    $sql .= " AND " . implode(" AND ", $conditions);
}

$stmt = $conn->prepare($sql);

// Vincular parámetros dinámicamente
$params = [];
$types = "";

if (!empty($marca)) {
    $types .= "s";
    $params[] = $marca;
}
if (!empty($color)) {
    $types .= "s";
    $params[] = $color;
}

// Si hay parámetros, se bindéan
if (!empty($params)) {
    $stmt->bind_param($types, ...$params);
}

$stmt->execute();
$result = $stmt->get_result();

$productosFiltrados = [];

while ($row = $result->fetch_assoc()) {
    $producto = new stdClass();
    $producto->cdpro = $row['cdpro'];
    $producto->nopro = $row['nopro'];
    $producto->despro = $row['despro'];
    $producto->costpro = $row['costpro'];
    $producto->rutimg = $row['rutimg'];
    $producto->stock = $row['stock'];
    $productosFiltrados[] = $producto;
}

header('Content-Type: application/json');
echo json_encode($productosFiltrados);

$stmt->close();
$conn->close();
?>
