<?php
// Verificar si se han enviado los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Obtener los valores del formulario
    $direccion = $_POST['direccion'];
    $celular = $_POST['celular'];

    // Sanitizar datos
    $direccion = htmlspecialchars($direccion);
    $celular = htmlspecialchars($celular);

    // Incluir conexión
    include 'conexion.php';

    // Iniciar sesion
    session_start();
    if (!isset($_SESSION['cdusu'])) {
        die("Error: No se encontró el ID de usuario en la sesión.");
    }

    $cdusu = $_SESSION['cdusu'];

    // Consulta SQL usando mysqli
    $sql = "UPDATE pedido SET dirpedusu = ?, celusuped = ? WHERE cdped = ?";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Error en prepare: " . $conn->error);
    }

    // Bind
    $stmt->bind_param("ssi", $direccion, $celular, $cdusu);

    // Ejecutar
    if ($stmt->execute()) {
        echo "Información actualizada correctamente en la base de datos";
    } else {
        echo "Error al actualizar la información: " . $stmt->error;
    }
}
?>
