<?php
include('conexion.php');

// Obtener datos del formulario de registro
$nomusu = $_POST['nomusu'];
$apeusu = $_POST['apeusu'];
$emailusu = $_POST['emailusu'];
$passusu = $_POST['passusu'];

// Verificar si el correo electrónico ya está registrado
$sql_check_email = "SELECT * FROM usuario WHERE emailusu = ?";
$stmt_check_email = $conn->prepare($sql_check_email);
$stmt_check_email->bind_param("s", $emailusu);
$stmt_check_email->execute();
$result = $stmt_check_email->get_result();

if ($result->num_rows > 0) {
    // El correo electrónico ya está registrado
    header('Location: ../login.php?e=2');
    exit;
}

// Insertar usuario nuevo
$sql_insert = "INSERT INTO usuario (nomusu, apeusu, emailusu, passusu) VALUES (?, ?, ?, ?)";
$stmt_insert = $conn->prepare($sql_insert);
$stmt_insert->bind_param("ssss", $nomusu, $apeusu, $emailusu, $passusu);

if ($stmt_insert->execute()) {
    header('Location: ../login.php');
} else {
    header('Location: ../login.php?e=1');
}

?>
