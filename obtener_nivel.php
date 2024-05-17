<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.html");
    exit();
}

$id = $_SESSION['usuario_id'];

include "conexion.php";

$sql = "SELECT nivel FROM nivel_control WHERE id = $id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $nivel = intval($row['nivel']);
    $nivelDescripcion = "";

    if ($nivel == 255) {
        $nivelDescripcion = "Alto";
    } elseif ($nivel == 128) {
        $nivelDescripcion = "Medio";
    } elseif ($nivel == 64) {
        $nivelDescripcion = "Bajo";
    } else {
        $nivelDescripcion = "Desconocido";
    }

    echo json_encode([
        "nivel" => $nivel,
        "descripcion" => $nivelDescripcion
    ]);
} else {
    echo json_encode([
        "error" => "No se encontró el nivel para el usuario especificado"
    ]);
}

$conn->close();
?>
