<?php
//1: Error de conexión
//2: Email inválido
//3: Contraseña incorrecta

include('conexion.php');

// Obtener email del formulario
$emailusu = $_POST['emailusu'];
$passusu  = $_POST['passusu'];

// Consulta con mysqli usando prepared statements
$sql = "SELECT * FROM usuario WHERE emailusu = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    header('Location: ../login.php?e=1'); // error de conexión
    exit();
}

$stmt->bind_param("s", $emailusu);
$stmt->execute();

$result = $stmt->get_result();

// Verificar si existe el usuario
if ($result->num_rows === 0) {
    header('Location: ../login.php?e=2'); // email inválido
    exit();
}

$row = $result->fetch_assoc();

// Verificar contraseña
if ($row['passusu'] !== $passusu) {
    header('Location: ../login.php?e=3'); // contraseña incorrecta
    exit();
}

// Sesión OK
session_start();
$_SESSION['cdusu'] = $row['cdusu'];
$_SESSION['emailusu'] = $row['emailusu'];
$_SESSION['nomusu'] = $row['nomusu'];

// Redirigir a inicio
header('Location: ../');
exit();

?>
