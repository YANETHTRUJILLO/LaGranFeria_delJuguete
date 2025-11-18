<?php
session_start();
$respuesta = new stdClass();

if (!isset($_SESSION['cdusu'])) {
    $respuesta->state = false;
    $respuesta->detail = "No está logueado";
    $respuesta->inicio_sesion = true;
} else {

    include_once('../conexion.php');

    $cdusu = $_SESSION['cdusu'];
    $cdpro = $_POST['cdpro'];
    $cantidad = $_POST['cantidad'];

    // Iniciar transacción
    $conn->begin_transaction();

    try {

        // Obtener stock con bloqueo
        $sql = "SELECT stock FROM producto WHERE cdpro = ? FOR UPDATE";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $cdpro);
        $stmt->execute();
        $stmt->bind_result($stock_actual);
        $stmt->fetch();
        $stmt->close();

        // Verificar stock
        if ($stock_actual >= $cantidad) {

            // Nuevo stock
            $nuevo_stock = $stock_actual - $cantidad;

            // Actualizar stock
            $sql = "UPDATE producto SET stock = ? WHERE cdpro = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $nuevo_stock, $cdpro);
            $stmt->execute();
            $stmt->close();

            // Insertar pedido
            $sql = "INSERT INTO pedido (cdusu, cdpro, cantidad, fchped, estado, dirpedusu, celusuped)
                    VALUES (?, ?, ?, CURRENT_TIMESTAMP, 1, '', '')";

            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iii", $cdusu, $cdpro, $cantidad);

            if ($stmt->execute()) {
                $conn->commit();
                $respuesta->state = true;
                $respuesta->detail = "Producto agregado";
            } else {
                $conn->rollback();
                $respuesta->state = false;
                $respuesta->detail = "No se pudo agregar el producto. Intente más tarde";
            }

            $stmt->close();

        } else {
            $conn->rollback();
            $respuesta->state = false;
            $respuesta->detail = "La cantidad seleccionada supera el stock disponible";
        }

    } catch (Exception $e) {
        $conn->rollback();
        $respuesta->state = false;
        $respuesta->detail = "Error al realizar la compra: " . $e->getMessage();
    }

    $conn->close();
}

header('Content-Type: application/json');
echo json_encode($respuesta);
?>
