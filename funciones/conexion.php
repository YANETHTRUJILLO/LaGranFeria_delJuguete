<?php
$host = 'db'; // servicio mysql del docker-compose
$user = 'root';
$password = 'root';
$database = 'la_gran_feria';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Error al conectar con la base de datos: " . $conn->connect_error);
}
?>
