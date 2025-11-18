<?php
session_start();
include_once('../conexion.php');

// Verificar si llegó cdped
if (isset($_POST['cdped'])) {

    $cdped = $_POST['cdped'];

    // 1️⃣ — Obtener cdpro y cantidad antes de borrar
    $stmt = $conn->prepare("SELECT cdpro, cantidad FROM pedido WHERE cdped = ?");
    if (!$stmt) {
        echo json_encode(['success' => false, 'error' => $conn->error]);
        exit;
    }

    $stmt->bind_param("i", $cdped);
    $stmt->execute();
    $result = $stmt->get_result();
    $pedido = $result->fetch_assoc();

    if (!$pedido) {
        echo json_encode(['success' => false, 'error' => 'Pedido no encontrado']);
        exit;
    }

    $cdpro = $pedido['cdpro'];
    $cantidad = $pedido['cantidad'];
    $stmt->close();

    // 2️⃣ — Restaurar stock
    $update = $conn->prepare("UPDATE producto SET stock = stock + ? WHERE cdpro = ?");
    if (!$update) {
        echo json_encode(['success' => false, 'error' => $conn->error]);
        exit;
    }

    $update->bind_param("ii", $cantidad, $cdpro);
    $update->execute();
    $update->close();

    // 3️⃣ — Eliminar el pedido
    $delete = $conn->prepare("DELETE FROM pedido WHERE cdped = ?");
    if (!$delete) {
        echo json_encode(['success' => false, 'error' => $conn->error]);
        exit;
    }

    $delete->bind_param("i", $cdped);
    $delete->execute();

    $eliminado = $delete->affected_rows > 0;
    $delete->close();

    echo json_encode(['success' => $eliminado]);

} else {
    echo json_encode(['success' => false, 'error' => 'No se recibió cdped']);
}
?>
